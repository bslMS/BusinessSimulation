within BusinessSimulation.Interfaces.Basics;

partial model GenericFlow "Flow Template with two FlowPorts"
  Connectors.FlowPort portA "Flow from/to Stock A" annotation(Placement(visible = true, transformation(origin = {-148.334, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.FlowPort portB "Flow to/from Stock B" annotation(Placement(visible = true, transformation(origin = {148.464, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model class with two &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a> connectors.</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GenericFlow;
