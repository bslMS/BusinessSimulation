within BusinessSimulation.Converters;

block PolynomialFunctionDivisor "Input is divided by polynomial function of lambda"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.PartialConverters.SO;
  Interfaces.Connectors.RealInput u "Input to be normalized" annotation(Placement(visible = true, transformation(origin = {-145, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_lambda if not hasConstantArgument "Input argument of polynomial function" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  parameter Real lambda = 0 "Argument of the polynomial function (e.g., taxrate, markup)" annotation(Dialog(enable = hasConstantArgument));
  parameter Real a[:] = {1, 1} "Vector of coefficients for the polynomial function (a_0, a_1, ..., a_n)";
  parameter OutputType YIDZ = inf "Output, if denominator (polynomial function) is zero (default = inf)";
  parameter Boolean hasConstantArgument = false "= true, if the argument of the polynomial function is a constant value" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Division_Guarded scaledInput(redeclare replaceable type OutputType = OutputType, outputIfZero = YIDZ) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter parReference(value = lambda) if hasConstantArgument "Constant reference value (optional)" annotation(Placement(visible = true, transformation(origin = {-120, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PolynomialFunction polynomial(a = a) "Polynomial function of input" annotation(Placement(visible = true, transformation(origin = {-60, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(parReference.y, polynomial.u) annotation(Line(visible = true, origin = {-91, -5}, points = {{-23, 0}, {23, 0}}, color = {1, 37, 163}));
  connect(u_lambda, polynomial.u) annotation(Line(visible = true, origin = {-93.25, -22.5}, points = {{-51.75, -17.5}, {13.25, -17.5}, {13.25, 17.5}, {25.25, 17.5}}, color = {0, 0, 128}));
  connect(u, scaledInput.u1) annotation(Line(visible = true, origin = {-76.5, 5}, points = {{-68.5, -0}, {68.5, 0}}, color = {0, 0, 128}));
  connect(polynomial.y, scaledInput.u2) annotation(Line(visible = true, origin = {-30, -5}, points = {{-22, 0}, {22, 0}}, color = {1, 37, 163}));
  connect(scaledInput.y, y) annotation(Line(visible = true, origin = {84.134, 0}, points = {{-76.134, 0}, {76.134, -0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is obtained by <em>division</em> of the input <strong>u</strong> by a <a href=\"modelica://BusinessSimulation.Converters.PolynomialFunction\">→<em>polynomial function</em></a> of an argument (<code>u_lamdba</code> or <code>lambda</code>). The division is <em>guarded</em> against division by zero.</p>
<h4>Examples</h4>
<br>
<ul>
<li>The EBIT may be obtained using <code>u = EBITAT, lambda = taxrate, a = {1, -1}</code>.</li><br>
<li>In markup pricing, the <em>COGS</em> may be obtained using <code>u = sales price, lambda = markup, a = {1, 1}</code>.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.Division_Guarded\">Division_Guarded</a>, 
<a href=\"modelica://BusinessSimulation.Converters.PolynomialFunctionFactor\">PolynomialFunctionFactor</a>
</p>
<h4>Revision history</h4>
<ul>
<li>Introduced in version 2.0.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {20, 0}, textColor = {0, 0, 128}, extent = {{-60, -12}, {60, 12}}, textString = "P(λ)", fontName = "Lato", textStyle = {TextStyle.Italic, TextStyle.Bold}), Text(visible = true, origin = {-17.009, 0}, textColor = {0, 0, 128}, extent = {{-60, -12}, {60, 12}}, textString = "· 1 /", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PolynomialFunctionDivisor;
