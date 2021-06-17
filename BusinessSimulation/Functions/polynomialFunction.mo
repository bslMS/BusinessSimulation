within BusinessSimulation.Functions;

function polynomialFunction "Polynomial function of degree n"
  extends BusinessSimulation.Icons.Function;
  input Real x "Independent variable";
  input Real a[:] "Vector of coefficients";
  output Real y "Value of the polynomial equation";
protected
  Integer i;
  constant Integer n = size(a, 1);
algorithm
  y := 0;
  for i in 1:n loop
    y := y + a[i] * x ^ (i - 1);
  end for;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the value of the n-th degree polynomial given the real input <strong>x</strong> and the real vector of coefficients <code><strong>a</strong>[:] = {a_0, a_1, ..., a_n}</code> where the degree of the polynomial is <code>n = size(a,1) - 1</code>.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>polynomialFunction</strong>(x,a);</code></p>
<h4>Examples</h4>
<pre><br>Functions.polynomialFunction( 2, { 0,0,1}); // 4.0<br>Functions.polynomialFunction( 2, {-6,1,1}); // 0.0<br><br></pre>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.PolynomialFunction\">PolynomialFunction</a></p></html>", revisions = ""));
end polynomialFunction;
