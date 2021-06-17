within BusinessSimulation.Interfaces.PartialConverters;

partial block MO "Converter with multiple outputs"
  extends Basics.BaseConverter;
  RealMultiOutput[nout] y "Vector of output signals" annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer nout(min = 2) = 2 "Number of output signals" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.BaseConverter\">BaseConverter</a> class with a vector of <code>nout</code> Real output connectors.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MO;
