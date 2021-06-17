within BusinessSimulation.Interfaces.PartialConverters;

partial block SIBooleanSO "Generic converter with real input and boolean output"
  extends BooleanSO;
  Connectors.RealInput u "Input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.BooleanSO\">BooleanSO </a>with a Real input and a Boolean output converter.</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SIBooleanSO;
