within BusinessSimulation.Functions;

function sigmf "Sigmoidal membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Shape parameter controlling the width of s-shaped transition area (higher values → steeper transition)";
  input Real c "Center of the s-shaped transition area";
  output Real y "Degree of membership";
algorithm
  y := 1 / (1 + exp(-a * (x - c)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>sigmoid function</em> function given the real input <strong>x</strong> and the parameters <em>shape parameter to control width of transition area</em> <code>a</code> and <em>center of transition area</em> <code>c</code>.</p>
<p>The sigmoid function will increase from 0 to 1 for positive values of <code>a</code>, while negative values will give rise to a z-shaped transition.</p>
<h4>Implementation</h4>
<br>
<pre>y := 1 / (1 + exp(-a * (x - c)));</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>sigmf</strong>(x, a, c);</code></p>
<h4>Examples</h4>
<pre><br>Functions.sigmf( 4, a=2, c=4); // 0.5
Functions.sigmf( 2, a=2, c=4); // 0.0179862..
Functions.sigmf( 6, a=2, c=4); // 0.98201379..<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end sigmf;
