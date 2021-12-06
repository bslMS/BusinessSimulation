within BusinessSimulation.Functions;

function trimf "Triangular membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Lower bound (i.e., f(a) = 0)";
  input Real b "Peak (i.e., f(b) = 1)";
  input Real c "Upper bound (i.e., f(c) = 0)";
  output Real y "Degree of membership";
algorithm
  y := max(min((x - a) / (b - a), (c - x) / (c - b)), 0);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>triangular</em> function given the real input <strong>x</strong> and the parameters <em>lower bound of the support</em> <code>a</code>, the <em>upper bound of the support</em> <code>c</code> and the <em>peak or core value</em> <code>b</code>.</p>
<h4>Implementation</h4>
<br>
<pre>y := max(min((x - a) / (b - a), (c - x) / (c - b)), 0);</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>trimf</strong>(x, a, b, c);</code></p>
<h4>Examples</h4>
<pre><br>Functions.trimf( 5, a=2, b=5, c=8); // 1.0
Functions.trimf( 1, a=2, b=5, c=8); // 0.0
Functions.trimf( 9, a=2, b=5, c=8); // 0.0<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end trimf;
