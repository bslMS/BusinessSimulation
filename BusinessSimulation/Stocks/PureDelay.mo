within BusinessSimulation.Stocks;

model PureDelay "Delay the flow of material for a fixed (but variable) delay time"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.{small,zero,inf,INF};
  extends Icons.DelayN;
  extends Icons.DiscreteStockLabel;
  extends Interfaces.Basics.GenericStock_Special(hasStockInfoOutput = false, init = modelSettings.init);
  Interfaces.Connectors.RealInput u(quantity = "Time") if not hasConstantDelayTime "Delay time input (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter OutputType initialValue(min = 0) = 0 "Initial load";
  parameter Time delayTime(min = 0, max = maxDelayTime) = 1 "Constant delay time (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter Time maxDelayTime(min = 0) = 10 "Maximum delay time (to restrict memory usage)" annotation(Evaluate = true);
  parameter Time samplingPeriod(min = small, max = modelSettings.dt) = modelSettings.samplingPeriod "Sampling period for discrete behavior (should be smaller than dt/2)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean hasConstantDelayTime = true "= true, if the delay time is to be given by a constant parameter" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasExogenousHistory = false "=true, if the outflow-profile for the initial load is to be given by an external lookup function" annotation(Evaluate = true, Dialog(enable = false, group = "Structural Parameters"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (clippedDelayTime.strict)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  parameter Integer n = integer(ceil(maxDelayTime / samplingPeriod)) "Array dimensions for storage of loaded material" annotation(Dialog(tab = "Initialization", enable = false));
  // discrete vars
  discrete Rate[n] storage "Storage compartments for incoming rates";
  discrete OutputType load(start = initialValue) "Sum of material in the storage" annotation(Dialog(tab = "Initialization", enable = false));
  discrete Time actDelayTime "Actual delay time";
  discrete Rate currentInflowRate "Rate of flow at current time";
  discrete Rate rateToStore "The average rate to store in the storage";
  discrete Rate outflowRate "Rate of outflow from the storage";
  discrete Integer i_store "Index where to store flow rate";
  // converters
  Converters.Clip clippedDelayTime(minValue = modelSettings.dt, maxValue = maxDelayTime, strict = strict) "Current delay time" annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parDelayTime(value = delayTime) if hasConstantDelayTime "Constant delay time (optional)" annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.DynamicStockInfo dynamicStockInfo1 if hasStockInfoOutput annotation(Placement(visible = true, transformation(origin = {-0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  // properly initialize discrete vars with fixed = false
  pre(inflow.stopInflow) = false;
  pre(inflow.stopOutflow) = true;
initial algorithm
  storage := zeros(n);
  currentInflowRate := inflow.rate;
  // set actDelayTime to clipped actual delay time
  actDelayTime := clippedDelayTime.y;
  // determine the initial load
  if init == InitializationOptions.FixedValue then
    load := initialValue;
  elseif init == InitializationOptions.SteadyState then
    // use Little's Law
    load := actDelayTime * currentInflowRate;
  end if;
  // calculate index for storing actual rate and store historical rate (equally distributed load is assumed)
  i_store := n - integer(ceil(actDelayTime / samplingPeriod)) + 1;
  // start-index matching the initial delay time
  rateToStore := if actDelayTime > 0 then load / (n - i_store + 1) / samplingPeriod else load / samplingPeriod;
  // one compartment less is needed, as the last package will immediately go out again
  for i in i_store + 1:n loop
    storage[i] := rateToStore;
  end for;
  // the last package is to flow out
  outflowRate := rateToStore;
  // if the index is larger than n then there is no delay for the currentInflow
  if i_store > n then
    outflowRate := outflowRate + currentInflowRate;
  else
    // store inflow rate
    storage[i_store] := storage[i_store] + currentInflowRate;
  end if;
algorithm
  // series of events starting at modelStartTime + samplingPeriod and then every samplingPeriod
  when sample(modelSettings.modelStartTime + samplingPeriod, samplingPeriod) then
    // get current values
    currentInflowRate := inflow.rate;
    rateToStore := currentInflowRate;
    actDelayTime := clippedDelayTime.y;
    // shift storage
    outflowRate := storage[end];
    storage[2:end] := storage[1:end - 1];
    storage[1] := 0;
    // load should count the current rate
    load := (sum(storage) + outflowRate) * samplingPeriod;
    // calculate storage-index
    i_store := n + 1 - integer(ceil(actDelayTime / samplingPeriod));
    if i_store > n then
      outflowRate := outflowRate + rateToStore;
    else
      // store rate
      storage[i_store] := storage[i_store] + rateToStore;
    end if;
  end when;
equation
  // connect equations
  connect(u, clippedDelayTime.u) annotation(Line(visible = true, origin = {-116.5, 60}, points = {{-28.5, 0}, {28.5, 0}}, color = {1, 37, 163}));
  connect(parDelayTime.y, clippedDelayTime.u) annotation(Line(visible = true, origin = {-99.899, 50}, points = {{-14.101, -10}, {-0.101, -10}, {-0.101, 10}, {11.899, 10}}, color = {1, 37, 163}));
  connect(dynamicStockInfo1.outPort, outflow) annotation(Line(visible = true, origin = {83, 0}, points = {{-77, 0}, {77, -0}}, color = {128, 0, 128}));
  connect(dynamicStockInfo1.inPort, inflow) annotation(Line(visible = true, origin = {-83, 0}, points = {{77, 0}, {-77, -0}}, color = {128, 0, 128}));
  connect(y2, dynamicStockInfo1.levelInfo) annotation(Line(visible = true, origin = {80, -34}, points = {{80, -16}, {80, -6}, {-80, -6}, {-80, 28}}, color = {1, 37, 163}));
  connect(dynamicStockInfo1.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {48, -24.8}, points = {{-48, 30.8}, {-48, 39.8}, {-8, 39.8}, {-8, -55.2}, {102, -55.2}}, color = {128, 0, 128}));
  connect(clippedDelayTime.y, dynamicStockInfo1.residenceTimeInfo) annotation(Line(visible = true, origin = {-36.4, 14.8}, points = {{-35.6, 45.2}, {-23.6, 45.2}, {-23.6, -34.8}, {41.4, -34.8}, {41.4, -20.8}}, color = {1, 37, 163}));
  // textual equations
  inflow.stopInflow = false;
  inflow.stopOutflow = true;
  outflow.data = outflowRate;
  inflow.stock = load;
  // report current load
  y = inflow.stock;
  y1 = inflow.stock;
  y2 = inflow.stock;
  // assert statements
  assert(samplingPeriod > small, "Sampling period must be larger than zero");
  assert(samplingPeriod < modelSettings.dt, "Sampling period should be significantly smaller than det", level = AssertionLevel.warning);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>At any given time, the <em>inflow</em> to the <em>PureDelay</em> is delayed by an exact amount of time given either by the parameter <code>delayTime</code> or the continuous&nbsp;input <code>u</code>. Changes in the delay time will only affect the current or later inflow, i.e., whatever is already in the process of being delayed will not be affected.</p>
<h4>Implementation</h4>
<p>The <em>PureDelay</em>&nbsp; will work at <em>discrete</em> time intervals:</p>
<pre>when sample(modelSettings.modelStartTime + samplingPeriod, samplingPeriod) then
  // load new material into the stock, move loaded material, unload material
end when;
</pre>
<p>The values for the in- and outflows and the load will be kept constant between events.</p>
<h4>Notes</h4>
<ul>
<li>All <em>inflows</em> have to go to the <code>inflow</code> port of the <em>PureDelay</em>.</li><br>
<li>Since the <em>outflow</em> will be controlled by the <em>PureDelay</em>, →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.OutflowDynamicStock\"><code>OutflowDynamicStock</code></a>&nbsp;or →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\"><code>SplitOutflowDynamicStock</code></a>&nbsp;have to be connected to the <code>outflow</code> port.</li><br>
<li>Using more than one <em>outflow</em> (e.g., →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\"><code>SplitOutflowDynamicStock</code></a>) can be used to model <em>leaking</em>.</li><br>
<ul>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:
<ul>
<li><em>FixedValue</em> (default) will initialize the stock according to value given by the parameter <code>initialValue</code>.</li><br>
<li><em>SteadyState</em> will use Little's Law to determine the equilibrium start value as <code>inflow.rate * delayTime</code></li><br>
<li><em>Free</em> tells the solver that it is free in solving the initial value problem using <em>initialValue</em> as <code>startValue</code>.</li>
</ul>
</ul>
<li>Units that enter the stock later than other units can \"overtake\" these units and actually flow out earlier, should the time of delay decrease after those earlier entries. If that behavior is not wanted, then a <code>Conveyor</code> should be used, which will preserve order of entry (units can at best leave at the same time, but not earlier than units, that have already entered the stock).</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Stocks.SimpleConveyor\">SimpleConveyor</a>, <a href=\"modelica://BusinessSimulation.Stocks.Conveyor\">Conveyor</a>, <a href=\"modelica://BusinessSimulation.Stocks.DelayN\">DelayN</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayFixed\">DelayFixed</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayInformation\">DelayInformation</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {255, 0, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Pure Delay", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PureDelay;
