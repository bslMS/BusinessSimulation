within BusinessSimulation.Functions;

function gaussmf "Gaussian membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Half width at half maximum (HWHM)";
  input Real c "Mean value";
  output Real y "Degree of membership";
protected
  // sigma = a/ sqrt(log(4))
  Real sigma = a / 1.177410022515474691;
algorithm
  y := exp(-(x - c) ^ 2 / (2 * sigma ^ 2));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>Gaussian</em> function given the real input <strong>x</strong> and the parameters <em>half width at half maximum</em> <code>a</code> and <em>mean</em> <code>c</code>.</p>
<h4>Implementation</h4>
<br>
<pre>sigma = a / 1.177410022515474691;
y := exp(-(x - c) ^ 2 / (2 * sigma ^ 2));</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>gaussmf</strong>(x, a, c);</code></p>
<h4>Examples</h4>
<pre><br>Functions.gaussmf( 5, a=2, c=5); // 1.0
Functions.gaussmf( 3, a=2, c=5); // 0.5
Functions.gaussmf( 7, a=2, c=5); // 0.5<br>
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
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end gaussmf;
