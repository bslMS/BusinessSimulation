within BusinessSimulation.Interfaces.PartialConverters;

partial block MISO "Converter with multiple inputs and a single output"
  extends SO;
  parameter Integer nin(min = 2) = 2 "Number of input signals" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Connectors.RealMultiInput u[nin] "Input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.BaseConverter\">BaseConverter</a> class with a vector of <code>nin</code> Real input connectors and one Real output connector.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MISO;
