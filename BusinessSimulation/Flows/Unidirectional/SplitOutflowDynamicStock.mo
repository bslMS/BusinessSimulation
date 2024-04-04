within BusinessSimulation.Flows.Unidirectional;

model SplitOutflowDynamicStock "The outflow from a dynamic stock is split into n outflows proportional to the weights given"
  import BusinessSimulation.Units.*;
  extends Interfaces.Basics.OutputTypeChoice_Rate;
  extends Icons.Outflow;
  Interfaces.Connectors.FlowPort_Special portA "Special port (stock sets rate of flow)" annotation(Placement(visible = true, transformation(origin = {-148.5, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.FlowMultiPort portB[n] "Flow port" annotation(Placement(visible = true, transformation(origin = {148.5, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput[n] u if not hasConstantWeights "Split fractions (or weights) for the outflow" annotation(Placement(visible = true, transformation(origin = {-145, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  RealMultiOutput[n] y "Rate information" annotation(Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -1350)));
  RealMultiOutput[n] y1 "Rate information" annotation(Placement(visible = true, transformation(origin = {150, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -1440)));
  RealMultiOutput[n] y2 "Rate information" annotation(Placement(visible = true, transformation(origin = {150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-105, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 1440)));
  parameter Real weights[n] = ones(n) "Vector of weights according to which the total outflow is split proportionally" annotation(Dialog(enable = hasConstantWeights));
  parameter Integer n(min = 2) = 2 "Number of flows to split the outflow into" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantWeights = false "If true then the weights are given by the continuous input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean shiftInputs = false "= true, if all weights are to be shifted to prevent negative values, otherwise negative values are simply set to zero (fractions.shiftInputs)";
protected
  MoleculesOfStructure.Transceivers.SplitFlow splitFlow(final nout = n, final shiftInputs = shiftInputs, final isSplit = true) annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OutflowDynamicStock flowingOut "Outflow from a dynamic stock" annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter parWeights[n](final value = weights) if hasConstantWeights "Constant weights (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(portA, flowingOut.portA) annotation(Line(visible = true, origin = {-124.25, 0}, points = {{-24.25, 0}, {24.25, 0}}, color = {255, 0, 0}));
  connect(flowingOut.portB, splitFlow.stockPort) annotation(Line(visible = true, origin = {-70, 0}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(splitFlow.flowPort, portB) annotation(Line(visible = true, origin = {54.25, 0}, points = {{-94.25, 0}, {94.25, 0}}, color = {128, 0, 128}));
  connect(parWeights.y, splitFlow.u) annotation(Line(visible = true, origin = {-71.333, 36.667}, points = {{-32.667, 13.333}, {16.333, 13.333}, {16.333, -26.667}}, color = {1, 37, 163}));
  connect(splitFlow.y, y) annotation(Line(visible = true, origin = {19.333, 23.467}, points = {{-64.333, -13.067}, {-64.333, 6.533}, {130.667, 6.533}}, color = {1, 37, 163}));
  connect(u, splitFlow.u) annotation(Line(visible = true, origin = {-85, 56.667}, points = {{-60, 23.333}, {30, 23.333}, {30, -46.667}}, color = {1, 37, 163}));
  connect(splitFlow.y, y1) annotation(Line(visible = true, origin = {19.333, 43.467}, points = {{-64.333, -33.067}, {-64.333, 16.533}, {130.667, 16.533}}, color = {1, 37, 163}));
  connect(splitFlow.y, y2) annotation(Line(visible = true, origin = {3.6, -5.92}, points = {{-48.6, 16.32}, {-48.6, 25.92}, {-23.6, 25.92}, {-23.6, -34.08}, {146.4, -34.08}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>SplitOutflowDynamicStock</em>&nbsp;is used to model the outflow from a stock with inherent dynamic behavior(e.g., a conveyor or a higher-order delay). In these cases, the stock will set the rate of flow and \"signal\" it via its &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort_Special\">StockPort_Special</a>.</p>
<p>The total outflow is split proportionally according to given&nbsp;<em>weights</em> either given as a vector of parameters or as a vector of inputs&nbsp;<strong>u</strong>.</p>
<h4>Notes</h4>
<p>The proportional split is done using fractions derived from the weights as described for the converter&nbsp;&rarr;<a href=\"modelica://BusinessSimulation.Converters.Vector.ProportionalSplitFactors\">ProportionalSplitFactors</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Unidirectional.OutflowDynamicStock\">OutflowDynamicStock</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -80}, extent = {{-93.103, -12}, {93.103, 12}}, textString = "n = %n", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {88.18, -57.325}, textColor = {0, 128, 0}, extent = {{-13.452, -10}, {13.452, 10}}, textString = "i"), Text(visible = true, origin = {-13.511, -24.505}, textColor = {128, 128, 128}, extent = {{-60.234, -10}, {60.234, 10}}, textString = "outflow to B       weight", fontName = "Lato"), Text(visible = true, origin = {1.563, -23.731}, textColor = {128, 128, 128}, extent = {{-7.437, -10}, {7.437, 10}}, textString = "µ", fontName = "Symbol"), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Split Outflow", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-6.548, -30}, textColor = {128, 128, 128}, extent = {{-13.452, -5}, {13.452, 5}}, textString = "i", fontName = "Lato"), Text(visible = true, origin = {50, -30}, textColor = {128, 128, 128}, extent = {{-13.452, -5}, {13.452, 5}}, textString = "i", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SplitOutflowDynamicStock;
