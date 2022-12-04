within BusinessSimulation.Converters.Logical;

block NoneTrue "Logical 'none true'"
  extends Interfaces.PartialConverters.BooleanMISO;
equation
  y = Functions.noneTrueQ(u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Boolean output <strong>y</strong> is <code>true</code>, if none of the&nbsp;Boolean elements of the input vector <strong>u</strong> are <code>true</code>, and <code>false</code> otherwise.</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {190, 52, 178}, extent = {{-57.18, -12}, {57.18, 12}}, textString = "NoneTrue", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end NoneTrue;
