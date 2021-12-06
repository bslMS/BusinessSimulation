within BusinessSimulation.Interfaces.PartialCLD;

partial model RealInputToFlow "Partial model with real input and flow port"
  extends FlowPort;
  Connectors.RealInput u annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This class has a single input connector and a single flow port with two output connectors (optional).</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-127.351, -48.828}, points = {{123.5, 48.828}, {23.5, 48.828}}, color = {0, 0, 128}, thickness = 2)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end RealInputToFlow;
