within BusinessSimulation.Interfaces.Basics;

partial model GenericSourceOrSink "SinkOrSource template with one flow port"
  extends ThreeSO_rate;
  Connectors.FlowPort massPort "Inflow to or outflow from connected stock" annotation(Placement(visible = true, transformation(origin = {148.334, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model with three Real output connectors and a single &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort </a>connector. This is the base class for SourcesOrSinks components.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GenericSourceOrSink;
