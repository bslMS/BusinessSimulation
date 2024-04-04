within BusinessSimulation.Stocks;

model Conveyor "Conveyor delay (aka pipeline ~) with variable delay time"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.{small, zero, inf, INF};
  extends Icons.Conveyor;
  extends Icons.DiscreteStockLabel;
  extends Interfaces.Basics.GenericStock_Special(hasStockInfoOutput = false, init = modelSettings.init);
  Interfaces.Connectors.RealInput u(quantity = "Time") if not hasConstantDelayTime "Delay time input (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter OutputType initialValue(min = 0) = 0 "Initial load";
  parameter Time delayTime(min = 0, max = maxDelayTime) = 1 "Constant delay time (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter Time maxDelayTime(min = 0) = 10 "Maximum delay time (to restrict memory usage)" annotation(Evaluate = true);
  parameter Time samplingPeriod(min = small, max = modelSettings.dt) = modelSettings.samplingPeriod "Sampling period for discrete behavior (should be smaller than dt/2)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean hasConstantDelayTime = true "= true, if the delay time is to be given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasExogenousHistory = false "=true, if the outflow-profile for the initial load is to be given by an external lookup function" annotation(Evaluate = true, Dialog(enable = false, group = "Structural Parameters"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (clippedDelayTime.strict)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  parameter Integer n = integer(ceil(maxDelayTime / samplingPeriod)) "Array dimensions for storing the loaded material" annotation(Evaluate = true, Dialog(tab = "Initialization", enable = false));
  // discrete vars
  discrete Rate[n] conveyor "Storage boxes for the incoming rates";
  discrete OutputType load(start = initialValue) "Sum of material in the conveyor" annotation(Dialog(enable = false, tab = "Initialization"));
  discrete Rate carry "Material that is leaving the conveyor prematurely due to decreases in delay time";
  discrete Time actDelayTime "Actual delay time";
  discrete Rate currentInflowRate "Rate of flow at current time";
  discrete Rate rateToStore "Average rate to store in the conveyor";
  discrete Rate outflowRate "Rate of outflow from the conveyor";
  discrete Integer i_start "Index of the first box corresponding to the actual delay time";
  discrete Integer shiftIndex "Positive or negative index difference due to changes in delay time";
  // components
  Converters.ConstantConverterTime parDelayTime(value = delayTime) if hasConstantDelayTime "Constant delay time" annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Clip clippedDelayTime(minValue = modelSettings.dt, maxValue = maxDelayTime, strict = strict) "Valid delay time to use" annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.DynamicStockInfo dynamicStockInfo if hasStockInfoOutput "Report infos for StockInfoPort" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  // properly initialize discrete vars with fixed = false
  pre(inflow.stopInflow) = false;
  pre(inflow.stopOutflow) = true;
initial algorithm
  // initialize the conveyor
  conveyor := zeros(n);
  currentInflowRate := inflow.rate;
  actDelayTime := clippedDelayTime.y;
  // determine the initial load
  if init == InitializationOptions.FixedValue then
    load := initialValue;
  elseif init == InitializationOptions.SteadyState then
    // use Little's Law
    load := actDelayTime * currentInflowRate;
  end if;
  // calculate the start index for storing the initial rates (may be larger than n, if delay time is zero)
  i_start := n - integer(ceil(actDelayTime / samplingPeriod)) + 1;
  rateToStore := if actDelayTime > 0 then load / (n - i_start + 1) / samplingPeriod else load / samplingPeriod;
  // as in the PureDelay the last package goes out immediately so one box less needed for storing
  for i in i_start + 1:n loop
    if not hasExogenousHistory then
      // constant value
      conveyor[i] := rateToStore;
    else
      /*
      use initial load profile in future versions
      conveyor[i] := initialLoad.y[i] / samplingPeriod;
      */
      conveyor[i] := rateToStore;
    end if;
  end for;
  // if the delay time is zero then the currentInflowRate should be added to the outflowRate
  outflowRate := rateToStore;
  if i_start > n then
    outflowRate := outflowRate + currentInflowRate;
  else
    // store inflowRate
    conveyor[i_start] := currentInflowRate;
  end if;
  shiftIndex := 0;
  carry := 0;
algorithm
  // series of events starting at modelStartTime + samplingPeriod then every samplingPeriod
  when sample(modelSettings.modelStartTime + samplingPeriod, samplingPeriod) then
    // get current values
    actDelayTime := clippedDelayTime.y;
    currentInflowRate := inflow.rate;
    //  set rateToStore in order to have equations balance out
    rateToStore := 0;
    // check for a change in delay time
    i_start := n - integer(ceil(actDelayTime / samplingPeriod)) + 1;
    shiftIndex := i_start - pre(i_start);
    // shift conveyor +1 for sampling time having passed and and additional +shiftIndex for chane of delay time
    (conveyor, carry) := Functions.shiftList(conveyor, shiftIndex + 1);
    outflowRate := carry;
    // load must count current outflow rate
    load := (sum(conveyor) + outflowRate) * samplingPeriod;
    // put inflowRate on the conveyor belt
    if i_start > n then
      outflowRate := outflowRate + currentInflowRate;
    else
      conveyor[i_start] := conveyor[i_start] + currentInflowRate;
      // conveyor[i_start] should be zero
    end if;
  end when;
equation
  // textual equations
  inflow.stopInflow = false;
  inflow.stopOutflow = true;
  inflow.stock = load;
  outflow.data = outflowRate;
  // report current load
  y = inflow.stock;
  y1 = inflow.stock;
  y2 = inflow.stock;
  // connect equations
  connect(u, clippedDelayTime.u) annotation(Line(visible = true, origin = {-116.5, 60}, points = {{-28.5, 0}, {28.5, 0}}, color = {1, 37, 163}));
  connect(parDelayTime.y, clippedDelayTime.u) annotation(Line(visible = true, origin = {-100.75, 50}, points = {{-13.25, -10}, {0.75, -10}, {0.75, 10}, {12.75, 10}}, color = {1, 37, 163}));
  connect(inflow, dynamicStockInfo.inPort) annotation(Line(visible = true, origin = {-83, 0}, points = {{-77, 0}, {77, 0}}, color = {128, 0, 128}));
  connect(dynamicStockInfo.outPort, outflow) annotation(Line(visible = true, origin = {83, 0}, points = {{-77, 0}, {77, 0}}, color = {128, 0, 128}));
  connect(dynamicStockInfo.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {64, -24.8}, points = {{-64, 30.8}, {-64, 39.8}, {16, 39.8}, {16, -55.2}, {86, -55.2}}, color = {128, 0, 128}));
  connect(y2, dynamicStockInfo.levelInfo) annotation(Line(visible = true, origin = {80, -37.772}, points = {{80, -12.228}, {80, -12.228}, {-80, -12.228}, {-80, 31.772}}, color = {1, 37, 163}));
  connect(clippedDelayTime.y, dynamicStockInfo.residenceTimeInfo) annotation(Line(visible = true, origin = {-28.4, 14.8}, points = {{-43.6, 45.2}, {-11.6, 45.2}, {-11.6, -34.8}, {33.4, -34.8}, {33.4, -20.8}}, color = {1, 37, 163}));
  // assert equations
  assert(samplingPeriod < modelSettings.dt, "Sampling period should be significantly smaller than dt", level = AssertionLevel.warning);
  assert(samplingPeriod > small, "Sampling period must be greater than zero", level = AssertionLevel.error);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>Conveyor</em> (aka <em>pipeline</em> <em>delay</em>) bevhaves as one would expect a conveyor belt to work: What <em>flows</em> <em>into</em> the Conveyor will <em>flow out</em> after a period given by  <code>delayTime</code> or the variable input <code>u</code> has passed. The order of outflow will preserve the order of inflow, i.e., when the delay time increases or decreases during the simulation, then it will affect everything that is currently \"loaded\" on the conveyor in the same way. Therefore, material&nbsp;might come out at the same time as material that had entered before, but it can never <em>overtake</em> older entries (this would be possible in a <em>PureDelay</em>).</p>
<h4>Implementation</h4>
<p>The <em>Conveyor</em>&nbsp; will work at <em>discrete</em> time intervals:</p>
<pre>when sample(modelSettings.modelStartTime + samplingPeriod, samplingPeriod) then
  // load new material onto conveyor, move loaded material, unload material
end when;
</pre>
<p>The values for the in- and outflows and the load will be kept constant between events.</p>
<h4>Notes</h4>
<ul>
<li>All <em>inflows</em> have to go to the <code>inflow</code> port of the <em>Conveyor</em>.</li><br>
<li>Since the <em>outflow</em> will be controlled by the <em>Conveyor</em>, →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.OutflowDynamicStock\"><code>OutflowDynamicStock</code></a>&nbsp;or →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\"><code>SplitOutflowDynamicStock</code></a>&nbsp;have to be connected to the <code>outflow</code> port.</li><br>
<li>Using more than one <em>outflow</em> (e.g., →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\"><code>SplitOutflowDynamicStock</code></a>) can be used to model <em>leaking</em>.</li><br>
<ul>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:
<ul>
<li><em>FixedValue</em> (default) will initialize the stock according to value given by the parameter <code>initialValue</code>.</li><br>
<li><em>SteadyState</em> will use Little's Law to determine the equilibrium start value as <code>inflow.rate * delayTime</code></li><br>
<li><em>Free</em> tells the solver that it is free in solving the initial value problem using <em>initialValue</em> as <code>startValue</code>.</li>
</ul>
</ul>
<li>The <em>Conveyor</em> behaves exactly like the <em>PureDelay </em>or the <em>SimpleConveyor</em>&nbsp;when there is a constant delay time; the <em>Conveyor</em> stock can deal with variable delay times and will preserve order of entry.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Stocks.SimpleConveyor\">SimpleConveyor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.PureDelay\">PureDelay</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayFixed\">DelayFixed</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayInformation\">DelayInformation</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 140}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Conveyor;
