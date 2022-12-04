within BusinessSimulation.Converters;

block Gain "Input is multiplied by constant parameter"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
  parameter BaseType c "Gain factor (constant multiplier)";
  replaceable type BaseType = Unspecified constrainedby Unspecified "Type for constant parameter" annotation(choicesAllMatching = true);
equation
  y = u * c;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is obtained by multiplying the input <strong>u</strong> with a constant gain factor <strong>c</strong>:</p>
<pre>y = c * u;</pre>
<br>
<h4>Revision History</h4>
<ul>
<li>Replaceable type for constant introduced in v2.0.0</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {5, -30}, textColor = {64, 64, 64}, extent = {{-55, -6}, {45, 6}}, textString = "%c", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, textColor = {0, 0, 128}, extent = {{-99.005, -12}, {99.005, 12}}, textString = "GAIN", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Gain;
