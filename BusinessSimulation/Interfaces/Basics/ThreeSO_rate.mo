within BusinessSimulation.Interfaces.Basics;

partial class ThreeSO_rate "Generic information output for flow elements"
  extends OutputTypeChoice_Rate;
  RealOutput y "Rate information" annotation(Placement(visible = true, transformation(origin = {160, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -1350)));
  RealOutput y1 "Rate information" annotation(Placement(visible = true, transformation(origin = {160, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  RealOutput y2 "Rate information" annotation(Placement(visible = true, transformation(origin = {160, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-105, -50}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model that has three Real output connectors (<code>unit = \"1/s\"</code>). It is typically used by flow components to report the current rate of flow.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ThreeSO_rate;
