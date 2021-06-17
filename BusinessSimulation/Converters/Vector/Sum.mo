within BusinessSimulation.Converters.Vector;

block Sum "Add two vectors of equal length"
  extends Interfaces.Basics.BaseConverter;
  Interfaces.Connectors.RealMultiInput u1[nin] "Input vector 1" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput u2[nin] "Input vector 2" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealMultiOutput y[nin] "Output with same dimension as inputs" annotation(Placement(visible = true, transformation(origin = {153.198, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {74.167, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer nin(min = 2) = 2 "Length of input and output vectors" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
equation
  y = u1 + u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output vector <strong>y</strong> is the<em> sum</em> of the input vectors <strong>u1</strong> and <strong>u2</strong>, which need to have length <code>nin:</code></p>
<p><code><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/Sum/Formula.svg\" alt=\"y_i = u1[i] + u2[i]\"></code></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, rotation = -225, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0), Line(visible = true, rotation = -315, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Sum;
