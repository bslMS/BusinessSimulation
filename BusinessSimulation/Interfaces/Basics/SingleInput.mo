within BusinessSimulation.Interfaces.Basics;

partial model SingleInput "Single Input to Stock, Flow, or Source/Sink component"
  input Connectors.RealInput u "Input signal" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{10, 10}, {-10, -10}}, rotation = -270)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model with a single Real input connector <code>u</code>. This class is typically used by Stock, Flow or SourcesOrSinks components to allow for an unnamed input connector in a standard position.</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -105}, {150, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SingleInput;
