within BusinessSimulation.Functions;

function gbellmf "Generalized bell-shaped membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Width of core (i.e., the interval for which the function gives 1)";
  input Real b "Shape parameter (larger values → steeper transition";
  input Real c "Center of membership function";
  output Real y "Degree of membership";
algorithm
  y := 1 / (1 + abs((x - c) / a) ^ (2 * b));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>generalized bell-shaped</em> function given the real input <strong>x</strong> and the parameters <em>width of core</em> <code>a</code>, <em>shape parameter</em> <code>b</code>, and the <em>center value</em> <code>c</code>.</p>
<h4>Implementation</h4>
<br>
<pre>y := 1 / (1 + abs((x - c) / a) ^ (2 * b));</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>gbellmf</strong>(x, a, b, c);</code></p>
<h4>Examples</h4>
<pre><br>Functions.gbellmf( 6, a=2, b=4, c=6); // 1.0
Functions.gbellmf( 4, a=2, b=4, c=6); // 0.5
Functions.gbellmf( 8, a=2, b=4, c=6); // 0.5<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
</p></html>"));
end gbellmf;
