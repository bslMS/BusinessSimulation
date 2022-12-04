within BusinessSimulation.Converters.Logical;

block Boole "Yields 1, if u is true and 0 if it is false"
  extends Interfaces.PartialConverters.BooleanSIRealSO;
algorithm
  y := Functions.boole(u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The real output <strong>y</strong> will be 1 if the boolean input <strong>u</strong> is <code>true</code> and 0 if it is <code>false</code>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Logical.NotZero\">NotZero</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "BOOLE", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Boole;
