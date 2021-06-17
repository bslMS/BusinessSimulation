within BusinessSimulation.Converters.Logical;

block And "Logical 'and'"
  extends Interfaces.PartialConverters.BooleanSI2SO;
equation
  y = u1 and u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Boolean output <strong>y</strong> is <code>true</code>, if both Boolean inputs <strong>u1</strong> <em>and</em> <strong>u2</strong> are <code>true</code>, and <code>false</code> else.&nbsp;</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {190, 52, 178}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "AND", fontName = "Lato Blak", textStyle = {TextStyle.Bold})}));
end And;
