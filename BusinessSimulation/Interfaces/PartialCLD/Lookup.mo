within BusinessSimulation.Interfaces.PartialCLD;

partial block Lookup "Partial lookup for causal loop diagramming"
  extends Interfaces.Basics.OutputTypeChoice;
  Connectors.StockInfoInput stockInfoInput if hasStockInfoInput annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealInput u_ref if not hasConstantReference "Reference value for stock" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  RealOutput y "Output of output type" annotation(Placement(visible = true, transformation(origin = {162.085, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable type ReferenceType = Unspecified constrainedby Unspecified "Type choice for the reference value" annotation(choicesAllMatching = true);
  parameter String pol = "±" "Polarity" annotation(choices(choice = "+", choice = "–", choice = "±"));
  parameter ReferenceType referenceValue(min = 0) = 1 "Constant reference value to normalize input" annotation(Dialog(enable = hasConstantReference));
  parameter Boolean hasConstantReference = true "= true, if the reference value is given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasStockInfoInput = true "= true, if the input is given by the input connector u instead of stockInfoInput" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Connectors.RealInput u if not hasStockInfoInput "Input for lookup (optional)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
protected
  Converters.DmnlInput normalizedStock(hasConstantReference = hasConstantReference, referenceValue = referenceValue) annotation(Placement(visible = true, transformation(origin = {-60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.AbsoluteSensor absoluteSensor if hasStockInfoInput annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(stockInfoInput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-124.5, 0}, points = {{-20.5, 0}, {20.5, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor.stock, normalizedStock.u) annotation(Line(visible = true, origin = {-81, 2.476}, points = {{-15, 2.475}, {1, 2.475}, {1, -2.476}, {13, -2.476}}, color = {1, 37, 163}));
  connect(u_ref, normalizedStock.u_reference) annotation(Line(visible = true, origin = {-88.333, 29.333}, points = {{-56.667, 10.667}, {28.333, 10.667}, {28.333, -21.333}}, color = {0, 0, 128}));
  assert(referenceValue > 0, "The reference value for normalization needs to be larger than zero");
  connect(u, normalizedStock.u) annotation(Line(visible = true, origin = {-93.25, -20}, points = {{-51.75, -20}, {13.25, -20}, {13.25, 20}, {25.25, 20}}, color = {0, 0, 128}));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial class to be used for <em>extensions</em> within <em>lookup</em> classes.</p>
<p>The input can be given using a <code>StockInfoInput</code> connector (in which case the stock value will be used) or using the input <stong>u</strong> depending upon the structural parameter <code>hasStockInfoInput</code>.</p>
<p>The input will be <em>normalized</em>(→<a href=\"modelica://BusinessSimulation.Converters.DmnlInput\"><code>DmnlInput</code></a>) using either the parameter <code>referenceValue</code> (default = 1) or the optional input <strong>u_ref</strong>.
<h4>Notes</h4>
<p>The normalization will return zero if the reference value given (parameter or input connector) is zero.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Interfaces/PartialCLD/Lookup/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%pol", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Lookup;
