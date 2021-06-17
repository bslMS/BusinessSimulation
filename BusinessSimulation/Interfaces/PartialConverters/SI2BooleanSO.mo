within BusinessSimulation.Interfaces.PartialConverters;

partial block SI2BooleanSO "Converter with two real inputs and boolean output"
  extends BooleanSO;
  Connectors.RealInput u1 "Input 1" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Connectors.RealInput u2 "Input 2" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.BooleanSO\">BooleanSO </a>with two Real input converters and a single Boolean output converter.</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SI2BooleanSO;
