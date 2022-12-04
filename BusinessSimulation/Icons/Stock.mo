within BusinessSimulation.Icons;

partial class Stock "General Icon for stocks"
  extends ComponentName;
  annotation(Documentation(revisions = "<html>
<ul>
<li>Since all stock classes will show their initial Value in the icon, the display of <code>%initialValue</code> was added here in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-100, -100}, {100, 100}}), Text(visible = true, origin = {0, -80}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%initialValue", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Stock;
