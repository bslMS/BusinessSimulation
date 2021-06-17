within BusinessSimulation.Functions;

function psigmf "Product of two sigmoidal membership functions"
  import BusinessSimulation.Functions.sigmf;
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Shape parameter controlling the width of s-shaped transition area (higher values → steeper transition)";
  input Real b "Center of s-shaped transition area";
  input Real c "Shape parameter controlling the width of z-shaped transition area (higher values → steeper transition)";
  input Real d "Center of z-shaped transition area";
  output Real y "Degree of membership";
algorithm
  y := sigmf(x, a = a, c = b) * sigmf(x, a = -c, c = d);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using the product of two <em>sigmoidal</em> functions given the real input <strong>x</strong> and the parameters <em>shape parameter for the s-shaped transition area</em> <code>a</code>, <em>center of the s-shaped transition area</em> <code>b</code>, <em>shape parameter of the z-shaped transition area</em> <code>c</code>, and <em>center of the z-shaped transition area</em> <code>d</code> of the function.</p>
<h4>Implementation</h4>
<br>
<pre> y := sigmf(x, a = a, c = b) * sigmf(x, a = -c, c = d);</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>psigmf</strong>(x, a, b, c, d);</code></p>
<h4>Examples</h4>
<pre><br>
Functions.psigmf(   8, a=2, b=3, c=5, d=8); // 0.4999773..
Functions.psigmf( 6.9, a=2, b=3, c=5, d=8); // 0.9955219..
Functions.psigmf(   3, a=2, b=3, c=5, d=8); // 0.4999999..
Functions.psigmf(  10, a=2, b=3, c=5, d=8); // 4.53978e-05
<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end psigmf;
