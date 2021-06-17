within BusinessSimulation.Functions;

function trapmf "Trapezoidal membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Lower bound for the support (i.e. f(a) = 0)";
  input Real b "Lower bound for the core (i.e. f(b) = 1)";
  input Real c "Upper bound for the core (i.e. f(c) = 1)";
  input Real d "Upper bound for the support(i.e. f(d) = 0)";
  output Real y "Degree of membership";
algorithm
  y := max(min(1, min((x - a) / (b - a), (d - x) / (d - c))), 0);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>trapezoidal</em> function given the real input <strong>x</strong> and the parameters <em>lower bound of the support</em> <code>a</code>, the <em>lower bound of the core</em> <code>b</code>, the <em>upper bound of the core</em> <code>c</code>, and the <em>upper bound of the support</em> <code>d</code>.</p>
<h4>Implementation</h4>
<br>
<pre>y := max( min( 1, min( (x - a)/(b - a), (d - x)/(d - c)) ), 0 );</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>trapmf</strong>(x, a, b, c, d);</code></p>
<h4>Examples</h4>
<pre><br>Functions.trapmf( 5, a=2, b=4, c=6, d=8); // 1.0
Functions.trapmf( 2, a=2, b=4, c=6, d=8); // 0.0
Functions.trapmf( 9, a=2, b=4, c=6, d=8); // 0.0
Functions.trapmf( 7, a=2, b=4, c=6, d=8); // 0.5<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end trapmf;
