within BusinessSimulation.Converters.Logical;

block ConstantConverterBoolean "A constant boolean value is turned into a constant signal"
  extends Icons.ConstantConverter;
  Interfaces.Connectors.BooleanOutput y "Signal with constant boolean value" annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -1440)));
  parameter Boolean value "= true, if output should be consistently true";
equation
  y = value;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The boolean output <strong>y</strong> is equal to the boolean parameter <code>value</code> during a simulation.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.ConstantConverter\">ConstantConverter</a></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 50}, textColor = {190, 52, 178}, extent = {{-100, -6}, {100, 6}}, textString = "%value", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-20, -20}, {20, 20}}), Line(visible = true, origin = {0, -0.205}, rotation = -810, points = {{-30, 0}, {30, 0}}, color = {0, 0, 128}, thickness = 5), Text(visible = true, origin = {-50, 0}, textColor = {128, 0, 128}, extent = {{-44.917, -32.251}, {44.917, 32.251}}, textString = "%value", fontSize = 30, fontName = "Arial"), Text(visible = true, origin = {0, -56.852}, textColor = {128, 0, 128}, extent = {{-141.113, -29.508}, {141.113, 29.508}}, textString = "%name", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConstantConverterBoolean;
