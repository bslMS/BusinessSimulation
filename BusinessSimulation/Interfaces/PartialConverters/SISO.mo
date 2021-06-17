within BusinessSimulation.Interfaces.PartialConverters;

partial block SISO "Converter with single input and single output"
  extends SO;
  Connectors.RealInput u "Input" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p>Partial block extending the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.SO\">SO</a> partial converter class with one Real output connector and a single Real input connector.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SISO;
