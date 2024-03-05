within BusinessSimulation.Converters;

block Power "Exponentiation of input"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_exponent if not hasConstantExponent "The exponent for the exponentiation (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  parameter Real exponent = 1 "Constant exponent for the exponentiation (default)" annotation(Dialog(enable = hasConstantExponent));
  parameter Boolean hasConstantExponent = true "= true, if the exponent is a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  PassThrough actExponent "Exponent to use" annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter constExponent(value = exponent) if hasConstantExponent "Constant exponent" annotation(Placement(visible = true, transformation(origin = {-112.614, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  // connect equations to avoid referencing conditional component
  connect(u_exponent, actExponent.u) annotation(Line(visible = true, origin = {-93.25, 20}, points = {{-51.75, 20}, {13.25, 20}, {13.25, 20}, {25.25, 20}}, color = {0, 0, 128}));
  connect(constExponent.y, actExponent.u) annotation(Line(visible = true, origin = {-83.654, 52.5}, points = {{-22.961, 12.5}, {3.654, 12.5}, {3.654, -12.5}, {15.654, -12.5}}, color = {1, 37, 163}));
  // equation for the output
  y = u ^ actExponent.y;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the <em>exponentiationen</em> of base <strong>u</strong> to either a constant power <code>exponent</code> or a variable power <code>u_exponent</code> (<code>actExponent.y</code> will reflect this choice).</p>
<pre>y = u ^ actExponent.y</pre>
</html>", revisions = "<html>
<ul>
<li>Added <code>PassThrough actExponent</code> to avoid referencing conditional component in v2.2, which is illegal in Modelica.</li><br>
<li>Fixed missing conditionality for <code>constExponent</code> in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "POWER", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Power;
