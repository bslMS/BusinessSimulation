within BusinessSimulation.CausalLoop;

model SplitFlow "Splitting a flow into n flows"
  import BusinessSimulation.Units.*;
  Interfaces.Connectors.StockPort portA annotation(Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.FlowMultiPort[nout] portB annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiOutput[nout] y(each quantity = "Rate", each unit = "1/s") if hasRateOutput "Output of current rate of flow" annotation(Placement(visible = true, transformation(origin = {152.067, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Interfaces.Connectors.RealInput u if hasFactor "Factor input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
  parameter Real[:] splitFactors = {1, 1} "Split factors";
  parameter Integer nout = size(splitFactors, 1) "Number of outflows the inflow is split into" annotation(Evaluate = true, Dialog(enable = false, tab = "Initialization"));
  parameter Boolean hasFactor = false "= true, if coefficients are to be multiplied with input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasRateOutput = false "= true, if the rate is reported via real output connectors" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean isSplit = true "= true, if the input given is assumed to be weights (adding up to one) splitting the flow" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Interfaces.Connectors.RealInput one = 1.0 if not hasFactor "Default factor" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -720), iconTransformation(origin = {-42, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  MoleculesOfStructure.Transceivers.SplitFlow splitFlow(nout = nout, isSplit = isSplit) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.ConstantConverter parSplitFactors(value = splitFactors) annotation(Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.ScalarMultiplication actualSplitFactors(nin = nout, redeclare type OutputType = Rate) annotation(Placement(visible = true, transformation(origin = {-50, 35}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(portA, splitFlow.stockPort) annotation(Line(visible = true, origin = {-80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(splitFlow.flowPort, portB) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(parSplitFactors.y, actualSplitFactors.u1) annotation(Line(visible = true, origin = {-80.509, 30.019}, points = {{-13.491, -0.019}, {-4.491, -0.019}, {-4.491, 0.019}, {22.472, 0.019}}, color = {1, 37, 163}));
  connect(one, actualSplitFactors.u2) annotation(Line(visible = true, origin = {-116.013, 39.975}, points = {{-28.987, 0.025}, {-28.987, -0.013}, {57.975, -0.013}}, color = {0, 0, 128}));
  connect(u, actualSplitFactors.u2) annotation(Line(visible = true, origin = {-100.759, 49.981}, points = {{-44.241, 10.019}, {0.759, 10.019}, {0.759, -10.019}, {42.722, -10.019}}, color = {0, 0, 128}));
  connect(actualSplitFactors.y, splitFlow.u) annotation(Line(visible = true, origin = {-17.5, 26.667}, points = {{-25, 8.333}, {12.5, 8.333}, {12.5, -16.667}}, color = {1, 37, 163}));
  connect(splitFlow.y, y) annotation(Line(visible = true, origin = {54.022, 30.133}, points = {{-49.022, -19.733}, {-49.022, 9.867}, {98.045, 9.867}}, color = {1, 37, 163}));
  /* flow */
  annotation(defaultComponentName = "f", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Using →<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Transceivers.SplitFlow\"><code>SplitFlow</code></a> this component allows to split a flow connected to the stock port <code>portA</code> into <em>nout</em> outflows (<code>portB[nout]</code>); <code>nout</code> is implicitly determined by the length of the vector of split factors <code>splitFactors[:]</code> (parameters). The vecotor of split factors  is multiplied either with the scalar 1 (<code>hasFactor = false</code>) or an exogenous scalar <strong>u</strong> (<code>hasFactor = true</code>). Upon setting <code>hasRateOutput = true</code> the component will report the current rates of flow via a vector output connector (<code>y[nout]</code>).</p>
<h4>Notes</h4>
<ul>
<li>If <code>isSplit = true</code> negative factors are set to zero and the vector of factors is normalized to add up to one.</li><br>
</ul>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {38.72, 0}, rotation = -90, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-10, -7.744}, {10, -7.744}, {0, 1.28}}), Text(visible = true, origin = {0, 25}, textColor = {0, 0, 128}, extent = {{-50, -6}, {50, 6}}, textString = "%splitFactors", fontName = "Lato"), Line(visible = true, origin = {-20, 0}, points = {{-30, 0}, {15, 0}, {15, 0}}, color = {0, 128, 0}, thickness = 1), Line(visible = true, origin = {25, 0}, points = {{-20, 0}, {10, 0}, {10, 0}}, color = {0, 128, 0}, thickness = 1), Text(visible = true, textColor = {0, 128, 0}, extent = {{-12.421, -7.676}, {12.421, 7.676}}, textString = "//", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SplitFlow;
