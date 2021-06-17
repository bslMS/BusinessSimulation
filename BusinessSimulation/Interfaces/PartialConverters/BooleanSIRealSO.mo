within BusinessSimulation.Interfaces.PartialConverters;

partial block BooleanSIRealSO "Converter with single boolean input and single real output"
  extends SO;
  Connectors.BooleanInput u "Input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.SO\">SO </a>class with a Real output and a Boolean input connector.</p></html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BooleanSIRealSO;
