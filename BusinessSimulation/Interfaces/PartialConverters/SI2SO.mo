within BusinessSimulation.Interfaces.PartialConverters;

partial block SI2SO "Converter with two inputs and a single output"
  extends SO;
  Connectors.RealInput u1 "Input 1" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Connectors.RealInput u2 "Input 2" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.SO\">SO</a> partial converter class with one Real output connector and two Real input connectors.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SI2SO;
