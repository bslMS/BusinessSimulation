within BusinessSimulation.Converters.Vector;

block ScalarMultiplication "Multiplication of a vector with a scalar"
  import BusinessSimulation.Units.*;
  extends Interfaces.Basics.BaseConverter;
  parameter Integer nin(min = 2) = 2 "Length of input vector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Interfaces.Connectors.RealMultiInput[nin] u1 "Input vector of length nin" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80.378, 49.622}, extent = {{-10.378, -10.378}, {10.378, 10.378}}, rotation = 0)));
  Interfaces.Connectors.RealInput u2 "Input of scalar value" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80.378, -49.622}, extent = {{-10.378, -10.378}, {10.378, 10.378}}, rotation = 0)));
  RealMultiOutput y[nin] "Output vector" annotation(Placement(visible = true, transformation(origin = {150, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {75, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y = u1 * u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output vector <strong>y</strong> is obtained by <em>multiplying</em> the input vector <strong>u1</strong> with the scalar input <strong>u2</strong>:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/ScalarMultiplication/Formula.svg\" alt=\"y_i = u2 * u1[i]\"></p>
<p>The vectors <strong>y</strong> and <strong>u1</strong> will have the same length <code>nin</code>.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0), Line(visible = true, rotation = -270, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ScalarMultiplication;
