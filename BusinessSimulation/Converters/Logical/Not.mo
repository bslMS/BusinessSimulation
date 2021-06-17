within BusinessSimulation.Converters.Logical;

block Not "Logical 'not'"
  extends Interfaces.PartialConverters.BooleanSISO;
equation
  y = not u;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The boolean output <strong>y</strong> is <code>true</code>, if the Boolean input&nbsp;<strong>u</strong>&nbsp;is <code>false</code>, and false otherwise.&nbsp;</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {190, 52, 178}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "NOT", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end Not;
