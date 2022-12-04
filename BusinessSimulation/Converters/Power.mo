within BusinessSimulation.Converters;

block Power "Exponentiation of input"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_exponent if not hasConstantExponent "The exponent for the exponentiation (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  parameter Real exponent = 1 "Constant exponent for the exponentiation (optional)" annotation(Dialog(enable = hasConstantExponent));
  parameter Boolean hasConstantExponent = true "= true, if the exponent is a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
equation
  y = if hasConstantExponent then u ^ exponent else u ^ u_exponent;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the <em>exponentiationen</em> of base <strong>u</strong> to either a constant power <code>exponent</code> or a variable power <code>u_exponent.</code></p>
<pre>y = u ^ exponent</pre>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "POWER", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Power;
