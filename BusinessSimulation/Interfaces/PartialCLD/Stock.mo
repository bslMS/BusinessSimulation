within BusinessSimulation.Interfaces.PartialCLD;

partial model Stock "Partial stock forCLD+ modeling"
  import BusinessSimulation.Types.Reals;
  extends Basics.OutputTypeChoice;
  Connectors.StockPort stockPort annotation(Placement(visible = true, transformation(origin = {-150, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.StockInfoOutput stockInfoOutput annotation(Placement(visible = true, transformation(origin = {151.921, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  parameter OutputType initialValue = 1 "Initial value";
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial class for reservoir classes with a single <code>StockPort</code> and a single <code>StockInoOutput</code>.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {160, -52}, textColor = {64, 64, 64}, extent = {{-150, -12}, {150, 12}}, textString = "%name", fontName = "Lato", horizontalAlignment = TextAlignment.Left), Rectangle(visible = true, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-30, -30}, {30, 30}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Stock;
