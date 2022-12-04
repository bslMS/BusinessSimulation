within BusinessSimulation.Stocks;

model SimpleConveyor "Conveyor (aka pipeline delay) with constant delay time and no leakage"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.{small,zero,inf,INF};
  extends Icons.Conveyor;
  extends Interfaces.Basics.GenericStock_Special(hasStockInfoOutput = false, init = modelSettings.init);
  parameter OutputType initialValue(min = 0) = 0 "Initial load";
  parameter Time delayTime(min = 0) = 1 "Time of residence in the stock";
protected
  outer ModelSettings modelSettings;
  parameter Time clippedDelayTime = max(modelSettings.dt, delayTime) "Delay time should not be less than dt" annotation(Dialog(tab = "Initialization", enable = false));
  parameter Rate initialFlow(fixed = false) "Constant initial outflow" annotation(Dialog(tab = "Initialization", enable = false));
  Real x(start = initialValue, min = 0) "Initial load" annotation(Dialog(tab = "Initialization", enable = false));
  Real delayedFlow "Shifted inflow";
  Sensors.DynamicStockInfo dynamicStockInfo if hasStockInfoOutput "Generate stock information data" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime reportedDelayTime(value = clippedDelayTime) annotation(Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
initial equation
  // initialize the stock by finding a valid initial value, by using a given initialValue, or by trying to find a steady state solution
  if init == InitializationOptions.FixedValue then
    x = initialValue;
  elseif init == InitializationOptions.SteadyState then
    x = clippedDelayTime * inflow.rate;
    // use Little's law
  end if;
  initialFlow = x / clippedDelayTime;
  // properly initialize discrete vars with fixed = false
  // inflow to stock is restricted to inflow port
  pre(inflow.stopInflow) = false;
  pre(inflow.stopOutflow) = true;
equation
  delayedFlow = delay(inflow.rate, clippedDelayTime);
  // conveyor will signal outflow rate at its outflow-side
  outflow.data = if time - modelSettings.modelStartTime < clippedDelayTime then initialFlow else delayedFlow;
  // set the inflow.stock value
  inflow.stock = x;
  // the stock equations determine the current load x
  der(x) = inflow.rate + outflow.rate;
  // inflow to stock is restricted to inflow port
  inflow.stopInflow = false;
  inflow.stopOutflow = true;
  // report current value of stock via output connectors
  y = inflow.stock "Current load";
  y1 = inflow.stock "Current load";
  y2 = inflow.stock "Current load";
  // connect equations
  connect(inflow, dynamicStockInfo.inPort) annotation(Line(visible = true, origin = {-83, 0}, points = {{-77, 0}, {77, 0}}, color = {128, 0, 128}));
  connect(dynamicStockInfo.outPort, outflow) annotation(Line(visible = true, origin = {83, 0}, points = {{-77, 0}, {77, 0}}, color = {128, 0, 128}));
  connect(dynamicStockInfo.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {64, -24.8}, points = {{-64, 30.8}, {-64, 39.8}, {16, 39.8}, {16, -55.2}, {96, -55.2}}, color = {128, 0, 128}));
  connect(dynamicStockInfo.levelInfo, y2) annotation(Line(visible = true, origin = {53.333, -35.333}, points = {{-53.333, 29.333}, {-53.333, -14.667}, {106.667, -14.667}}, color = {1, 37, 163}));
  connect(reportedDelayTime.y, dynamicStockInfo.residenceTimeInfo) annotation(Line(visible = true, origin = {18.333, -22}, points = {{26.667, -8}, {-13.333, -8}, {-13.333, 16}}, color = {1, 37, 163}));
  // assert statements
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>SimpleConveyor</em> (aka <em>pipeline</em> <em>delay</em>) bevhaves as one would expect a conveyor belt to work: &nbsp;What <em>flows</em> <em>into</em> the SimpleConveyor will <em>flow out</em> after a period given by the parameter  <code>delayTime</code> has elapsed. The <code>delayTime</code> will be <em>clipped</em>, so that it can never be smaller than the global parameter <code>modelSettings.dt</code>.</p>
<h4>Implementation</h4>
<p>The <em>Conveyor</em> internally uses Modelica's <code>delay()</code> function with a constant time of delay to delay the rate of inflow.</p>
<h4>Notes</h4>
<ul>
<li>All <em>inflows</em> have to go to the <code>inflow</code> port of the <em>Conveyor</em>—no draining is allowed via this port.</li><br>
<li>Since the <em>outflow</em> will be controlled by the <em>Conveyor</em>, →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.OutflowDynamicStock\"><code>OutflowDynamicStock</code></a>&nbsp;or →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\"><code>SplitOutflowDynamicStock</code></a>&nbsp;have to be connected to the <code>outflow</code> port.</li><br>
<li>Using more than one <em>outflow</em> (e.g., <code>SplitOutflowDynamicStock</code>) can be used to model <em>leaking</em>.</li><br>
<li>During the interval <code>[modelSettings.modelStartTime, delayTime]</code> the <em>outflow</em> will simply be the initial value for the stock divided by the delay time.</li>
</ul>
<ul>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:
<ul>
<li><em>FixedValue</em> (default) will initialize the stock according to value given by the parameter <code>initialValue</code>.</li><br>
<li><em>SteadyState</em> will use Little's Law to determine the equilibrium start value as <code>inflow.rate * delayTime</code></li><br>
<li><em>Free</em> tells the solver that it is free in solving the initial value problem using <em>initialValue</em> as <code>startValue</code>.</li>
</ul>
</ul>
<ul>
<li>The <em>Conveyor</em> behaves exactly like the <em>PureDelay</em>&nbsp;or the <em>Conveyor</em> when the delay time is constant; the main difference is the absence of time events introduced by the discrete nature of the <em>PureDelay</em>&nbsp;or <em>Conveyor </em>stocks.</li><br>
<li>The <em>Conveyor</em> stock can additionally deal with variable delay times, but is discrete in nature (i.e., it uses time events).</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Stocks.Conveyor\">Conveyor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.PureDelay\">PureDelay</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayFixed\">DelayFixed</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayInformation\">DelayInformation</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {240.961, -10}, fillColor = {255, 255, 255}, extent = {{-0.961, -0}, {0.961, 0}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SimpleConveyor;
