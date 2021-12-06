within BusinessSimulation.Converters;

block PolynomialFunction "Transform the input according to a polynomial function with given coefficients"
  extends Interfaces.PartialConverters.SISO;
  parameter Real a[:] = {0, 1} "Vector of coefficients (a_0, a_1, ..., a_n)";
protected
  parameter Integer n(min = 0) = size(a, 1) - 1 "Degree of the polynomial function";
equation
  y = Functions.polynomialFunction(a = a, x = u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <code>PolynomialFunction</code> converter transforms the input signal <strong>u</strong> according to a polynomial function of degree&nbsp;<em>n</em>:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/PolynomialFunction/Formula.svg\" alt=\"y = a_0 + a_1*u^1 + a_2*u^2 + ... + a_n*u^n\"></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-60, -12}, {60, 12}}, textString = "P(u)", fontName = "Lato Black", textStyle = {TextStyle.Italic, TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PolynomialFunction;
