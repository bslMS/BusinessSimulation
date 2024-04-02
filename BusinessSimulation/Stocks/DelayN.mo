within BusinessSimulation.Stocks;

model DelayN "Material delay of n-th Order"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.{small, zero, inf, INF};
  extends Icons.DelayN;
  extends Interfaces.Basics.GenericStock_Special(hasStockInfoOutput = false, init = modelSettings.init);
  Interfaces.Connectors.RealInput u(quantity = "Time", unit = "s") if not hasConstantDelayTime "Delay time input (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{10, 10}, {-10, -10}}, rotation = -270)));
  parameter Integer n(min = 1) = 3 "Order of the exponential delay" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter OutputType initialValue(min = 0) = 0 "Initial stock";
  parameter Time delayTime(min = small) = 1 "Constant time of delay (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter Boolean hasConstantDelayTime = true "= true, if DelayTime is to be set by a constant parameter" annotation(Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  OutputType x(min = 0) "Total material in the stock";
  OutputType[n] x_hidden(each start = initialValue / n) "Hidden (internal) stocks" annotation(Dialog(enable = false, tab = "Initialization"));
  Time stageDelayTime "Delay-time for the transition from internal stock_i to internal stock_i+1";
  Sensors.DynamicStockInfo dynamicStockInfo if hasStockInfoOutput "Generate information for StockInfoOutput" annotation(Placement(visible = true, transformation(origin = {-0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parDelayTime(value = delayTime) if hasConstantDelayTime "Constant delay time (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ClipProcessTime actualDelayTime "Delay time" annotation(Placement(visible = true, transformation(origin = {-68.47, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  // set up in steady state or use fixed value
  if init == InitializationOptions.FixedValue then
    x_hidden = fill(initialValue/n, n);
  elseif init == InitializationOptions.SteadyState then
    // make use of Little's Law
    x_hidden = fill(inflow.rate * (actualDelayTime.y / n), n);
  end if;
  // properly initialize discrete vars with fixed = false
  // inflow to stock is restricted to inflow port; no draining allowed
  pre(inflow.stopInflow) = false;
  pre(inflow.stopOutflow) = true;
equation
  stageDelayTime = actualDelayTime.y / n;
  // equations for the n hidden 'in-transit' stocks
  der(x_hidden[1]) = inflow.rate - x_hidden[1] / stageDelayTime;
  for i in 2:n loop
    der(x_hidden[i]) = (x_hidden[i - 1] - x_hidden[i]) / stageDelayTime;
  end for;
  // total material in transit
  x = sum(x_hidden);
  // DelayN will signal outflow rate at its outflow-side via SpecialFlowPort
  outflow.data = x_hidden[end] / stageDelayTime;
  // set the inflow.stock value
  inflow.stock = x;
  // inflow to stock is restricted to inflow port; no draining allowed
  inflow.stopInflow = false;
  inflow.stopOutflow = true;
  // report current value of stock via output connectors
  y = inflow.stock;
  y1 = inflow.stock;
  y2 = inflow.stock;
  // connect equations for StockInformationPort (conditional)
  connect(inflow, dynamicStockInfo.inPort) annotation(Line(visible = true, origin = {-83, 0}, points = {{-77, 0}, {77, 0}}, color = {128, 0, 128}));
  connect(dynamicStockInfo.outPort, outflow) annotation(Line(visible = true, origin = {83, 0}, points = {{-77, 0}, {77, 0}}, color = {128, 0, 128}));
  connect(y2, dynamicStockInfo.levelInfo) annotation(Line(visible = true, origin = {53.333, -35.333}, points = {{106.667, -14.667}, {-53.333, -14.667}, {-53.333, 29.333}}, color = {1, 37, 163}));
  connect(parDelayTime.y, actualDelayTime.u) annotation(Line(visible = true, origin = {-92.618, 35}, points = {{-11.382, -5}, {-2.382, -5}, {-2.382, 5}, {16.148, 5}}, color = {1, 37, 163}));
  connect(actualDelayTime.y, dynamicStockInfo.residenceTimeInfo) annotation(Line(visible = true, origin = {-21.118, 6.8}, points = {{-39.99, 33.2}, {-6.123, 33.2}, {-6.123, -26.8}, {26.118, -26.8}, {26.118, -12.8}}, color = {1, 37, 163}));
  connect(dynamicStockInfo.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {56, -24.8}, points = {{-56, 30.8}, {-56, 39.8}, {4, 39.8}, {4, -55.2}, {94, -55.2}}, color = {128, 0, 128}));
  connect(u, actualDelayTime.u) annotation(Line(visible = true, origin = {-110.735, 40}, points = {{-34.265, 0}, {34.265, 0}}, color = {1, 37, 163}));
  // assert
  assert(n > 0, "Order of the delay must be at least 1");
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>DelayN</em> is a &rarr;<a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\">MaterialStock</a>&nbsp;with inherent <em>dynamic behavior</em> that will result in a delay&mdash;which may have a <em>constant</em> (<code>delayTime</code>) or a <em>variable</em> delay time (<code>u</code>). Internally a material delay of order <code>n</code> is made up of a sequence of <code>n</code> first-order delays (&rarr;<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Decay\">Decay </a>) each having a delay time of <code>delayTime/n</code>.</p>
<p>To better grasp the behavior of a <em>DelayN</em>, it helps to be aware of the fact, that given a single pulse input (e.g., a Dirac delta function) as <em>inflow</em> to a DelayN with constant delay time, its <em>outflow</em> will correspond to an <em>Exponential distribution</em> for <code>n = 1</code> and more generally to an <em>Erlang distribution</em> of order <em>k = n</em> for <code>n &ge; 1</code>. In other words, the <em>time of residence</em> within the stock is distributed according to an Erlang distribution with the mean residence time corresponding to the delay time and a diminishing variance as <code>n</code> increases—in the limit, as <code>n</code> approaches infinity, the DelayN will be equivalent to the &rarr;<a href=\"modelica://BusinessSimulation.Stocks.PureDelay\">PureDelay</a> (aka <em>pipeline delay</em>). For more detail, see Sterman [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">3</a>, Chapter 11].</p>
<h4>Notes</h4>
<ul>
<li>The DelayN can only be filled (not drained) via its <code>inflow</code> stock port.</li>
</ul>
<ul>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br><br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial value for all <em>n</em> hidden states as <code>initialValue/n</code>.</li><br>
<li><em>SteadyState</em> will use Little's Law to determine the equilibrium start value for all <em>n</em> hidden states as <code>inflow.rate * delayTime / n</code></li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free in solving the initial value problem using the <em>FixedValue</em> solutions as <code>startValue</code>.</li>
</ul>
</ul>
<ul>
<li>There is an optional &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutput </a>connector.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\">MaterialStock</a>, <a href=\"modelica://BusinessSimulation.Stocks.PureDelay\">PureDelay</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay\">Converters.DiscreteDelay</a></p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {62.999, 75}, textColor = {255, 0, 0}, extent = {{-24.503, -12}, {24.503, 12}}, textString = "%n", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {255, 0, 0}, extent = {{-50, -12}, {50, 12}}, textString = "Delay", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DelayN;
