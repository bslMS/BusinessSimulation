within BusinessSimulation.Converters.Logical;

block NotZero "True, if u is not zero"
  import BusinessSimulation.Constants.eps;
  extends Interfaces.PartialConverters.SIBooleanSO;
  parameter Real tolerance = eps "Threshold for zero equivalence, i.e., max tolerated absolute deviation";
equation
  y = abs(u) > tolerance;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The boolean output <strong>y</strong> is <code>true</code>, if the real&nbsp;input&nbsp;<strong>u</strong>&nbsp;is <em>not equal to zero</em>, and <code>false</code> else.&nbsp;</p>
<h4>Notes</h4>
<p>If the inputs are restricted to either 0 or 1, then <em>NotZero</em> can be seen as an <em>inverse Boole</em>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Logical.Boole\">Boole</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Logical.Threshold\">Threshold</a></p>
</html>", revisions = "<html><ul>
<li>Updated in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 12.5}, textColor = {0, 0, 128}, extent = {{-59, -12}, {59, 12}}, textString = "NOT", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -12.5}, textColor = {0, 0, 128}, extent = {{-59, -12}, {59, 12}}, textString = "ZERO", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end NotZero;
