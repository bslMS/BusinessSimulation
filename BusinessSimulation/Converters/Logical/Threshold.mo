within BusinessSimulation.Converters.Logical;

block Threshold "True, if u is greater than the given threshold"
  extends Interfaces.PartialConverters.SIBooleanSO;
  parameter Real threshold = 0.5 "Threshold to determine true or false";
equation
  y = u > threshold;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The boolean output <strong>y</strong> is <code>true</code>, if the real&nbsp;input&nbsp;<strong>u</strong>&nbsp;is <em>greather than</em> <code>threshold</code>, and <code>false</code>&nbsp;otherwise.&nbsp;</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Logical.NotZero\">NotZero</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Logical.Boole\">Boole</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {9, 0}, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "THLD", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-30, 0}, textColor = {190, 52, 178}, extent = {{-36.812, -20}, {36.812, 20}}, textString = ">", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -30}, textColor = {0, 0, 128}, extent = {{-31.111, -6}, {31.111, 6}}, textString = "%threshold", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Threshold;
