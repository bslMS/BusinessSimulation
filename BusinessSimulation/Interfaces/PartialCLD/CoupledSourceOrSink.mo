within BusinessSimulation.Interfaces.PartialCLD;

encapsulated partial model CoupledSourceOrSink "Source or sink process driven by stock info output"
  import BusinessSimulation.Types.Reals;
  import BusinessSimulation.Sensors.AbsoluteSensor;
  import BusinessSimulation.Converters.{ConstantConverter,Product_2};
  import BusinessSimulation.Interfaces.Connectors.RealInput;
  import BusinessSimulation.Interfaces.PartialCLD.StockInfoToFlow;
  replaceable type InputType = Reals "Type choice for coefficient";
  extends StockInfoToFlow;
  RealInput u if hasFactor "Input of factor with regard to coffeficient" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  parameter InputType coefficient = 1 "Constant coefficient";
  parameter Boolean hasFactor = false "= true, if coefficient is to be multiplied with input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  ConstantConverter parCoefficient(value = coefficient) "Constant coefficient (optional)" annotation(Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Product_2 actualCoefficient annotation(Placement(visible = true, transformation(origin = {-62.949, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealInput one = 1.0 if not hasFactor "Default factor" annotation(Placement(visible = true, transformation(origin = {-100, 75}, extent = {{10, -10}, {-10, 10}}, rotation = 540), iconTransformation(origin = {-42, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  AbsoluteSensor absoluteSensor1 annotation(Placement(visible = true, transformation(origin = {-120, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(stockInfoInput, absoluteSensor1.u_stockInfo) annotation(Line(visible = true, origin = {-134.5, -0}, points = {{-10.5, 0}, {10.5, -0}}, color = {128, 0, 128}));
  connect(parCoefficient.y, actualCoefficient.u2) annotation(Line(visible = true, origin = {-92.475, 30}, points = {{-21.525, 0}, {21.526, 0}}, color = {1, 37, 163}));
  connect(u, actualCoefficient.u1) annotation(Line(visible = true, origin = {-96.487, 50}, points = {{-48.513, 10}, {11.487, 10}, {11.487, -10}, {25.538, -10}}, color = {0, 0, 128}));
  connect(one, actualCoefficient.u1) annotation(Line(visible = true, origin = {-77.737, 54.141}, points = {{-22.263, 20.859}, {-7.263, 20.859}, {-7.263, -14.141}, {6.788, -14.141}}, color = {0, 0, 128}));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This class extends →<a href=\"modelica://BusinessSimulation.Interfaces.PartialCLD.StockInfoToFlow\"><code>StockInfoToFlow</code></a> and adds components to enable flexible definitions of <em>source or sink</em> classes.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Interfaces/PartialCLD/CoupledSourceOrSink/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-45, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%coefficient", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end CoupledSourceOrSink;
