within BusinessSimulation.Converters.Vector;

block DotProduct "Dot product of two vectors of equal length"
  extends Interfaces.PartialConverters.SO;
  parameter Integer nin(min = 2) = 2 "Elements in the input vectors (length)" annotation(Dialog(group = "Structural Parameters"));
  Interfaces.Connectors.RealMultiInput[nin] u1 "Input vector 1" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80.378, 50.378}, extent = {{-10.378, -10.378}, {10.378, 10.378}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput[nin] u2 "Input vector 2" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80.378, -50.378}, extent = {{-10.378, -10.378}, {10.378, 10.378}}, rotation = 0)));
  Times times(nin = nin) annotation(Placement(visible = true, transformation(origin = {-27.609, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Total total(nin = nin) annotation(Placement(visible = true, transformation(origin = {27.609, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u1, times.u1) annotation(Line(visible = true, origin = {-76.412, 22.519}, points = {{-68.588, 17.481}, {16.412, 17.481}, {16.412, -17.481}, {40.841, -17.557}}, color = {0, 0, 127}));
  connect(u2, times.u2) annotation(Line(visible = true, origin = {-76.412, -22.519}, points = {{-68.588, -17.481}, {16.412, -17.481}, {16.412, 17.481}, {40.841, 17.481}}, color = {0, 0, 127}));
  connect(times.y, total.u) annotation(Line(visible = true, origin = {-0.006, 0}, points = {{-20.24, 0}, {20.24, 0}}, color = {0, 0, 127}));
  connect(y, total.y) annotation(Line(visible = true, origin = {97.486, 0}, points = {{62.514, 0}, {-62.514, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the <em>dot product</em> of the input vectors <strong>u1</strong> and <strong>u2</strong> which have the same length <code>nin</code>.</p>
<p>The dot product is defined as follows:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/DotProduct/Formula.svg\" alt=\"y = sum_{i=1}^{nin} u1[i]*u2[i]\"></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "Dot", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DotProduct;
