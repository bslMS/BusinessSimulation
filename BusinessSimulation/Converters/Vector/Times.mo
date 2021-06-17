within BusinessSimulation.Converters.Vector;

block Times "Elementwise multiplication of two vectors of the same length"
  extends Interfaces.Basics.BaseConverter;
  Interfaces.Connectors.RealMultiInput[nin] u1 "Input vector 1" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-79.622, 49.622}, extent = {{-10.378, -10.378}, {10.378, 10.378}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput[nin] u2 "Input vector 2" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-79.622, -50.378}, extent = {{-10.378, -10.378}, {10.378, 10.378}}, rotation = 0)));
  RealMultiOutput[nin] y "Output vector of the same length as inputs" annotation(Placement(visible = true, transformation(origin = {150, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {75, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer nin(min = 2) = 2 "Length of input and output vectors" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
equation
  y = u1 .* u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output vector <strong>y</strong> is obtained by <em>elementwise multiplication</em> of the input vectors <strong>u1</strong> and <strong>u2</strong>, which need to have the same length nin:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/images/Converters/Vector/Times/Formula.svg\" alt=\"y_i = u1[i] * u2[i]\"></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0), Line(visible = true, rotation = -270, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Times;
