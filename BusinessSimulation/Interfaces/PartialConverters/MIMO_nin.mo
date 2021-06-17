within BusinessSimulation.Interfaces.PartialConverters;

partial block MIMO_nin "Converter with multiple inputs and outputs of dimensions nin"
  extends Basics.BaseConverter;
  Connectors.RealMultiInput u[nin] "Input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  RealMultiOutput[nin] y annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer nin(min = 2) = 2 "Number of input and output signals" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block with multiple Real input and output connectors each of which have&nbsp;<code>nin</code>&nbsp;elements.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MIMO_nin;
