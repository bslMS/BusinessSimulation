within BusinessSimulation.Converters;

block ConstantConverter "A constant value is turned into a constant signal"
  import BusinessSimulation.Units.*;
  extends Icons.ConstantConverter;
  extends Interfaces.Basics.OutputTypeChoice;
  RealOutput y "Constant output signal" annotation(Placement(visible = true, transformation(origin = {161.795, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType value "Value of constant output";
equation
  y = value;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The parameter <code>value</code> is used to set the continous output <strong>y </strong>making it a <em>constant-valued signal</em>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.ConstantConverterRate\">ConstantConverterRate</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">ConstantConverterTime</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Logical.ConstantConverterBoolean\">ConstantConverterBoolean</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 60}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-20, -20}, {20, 20}}), Line(visible = true, origin = {0, -0.205}, rotation = -810, points = {{-30, 0}, {30, 0}}, color = {0, 0, 128}, thickness = 5), Text(visible = true, origin = {-50, 0}, textColor = {128, 0, 128}, extent = {{-44.917, -32.251}, {44.917, 32.251}}, textString = "%value", fontSize = 30, fontName = "Arial"), Text(visible = true, origin = {0, -56.852}, textColor = {128, 0, 128}, extent = {{-141.113, -29.508}, {141.113, 29.508}}, textString = "%name", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConstantConverter;
