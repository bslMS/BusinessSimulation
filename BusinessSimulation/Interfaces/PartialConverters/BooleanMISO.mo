within BusinessSimulation.Interfaces.PartialConverters;

partial block BooleanMISO "Converter with single input and single output"
  extends BooleanSO;
  Connectors.BooleanMultiInput u[nin] "Input" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  parameter Integer nin(min = 1) = 2 "Number of Boolean input signals" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.BooleanSO\">BooleanSO </a>class with a Boolean output and a Boolean multi input connector.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BooleanMISO;
