within BusinessSimulation.Functions;

function rampmf "Bounded ramp membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Lower bound";
  input Real b "Upper bound";
  output Real y "Degree of membership";
algorithm
  y := max(min((x - a) / (b - a), 1), 0);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The function returns the degree of membership using a <em>bounded ramp</em> function given the real input <strong>x</strong> and the parameters <em>lower bound</em> <code>a</code> and <em>upper bound</em> <code>b</code>.</p>
<p>The ramp will usually ramp up from 0 to 1, but if lower bound and upper bound are switched (i.e., <code>a > b</code>), then the ramp will be ramp downwards from 1 to 0.</p>
<h4>Implementation</h4>
<br>
<pre>y := max(min((x - a) / (b - a), 1), 0);</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>rampmf</strong>(x, a, b);</code></p>
<h4>Examples</h4>
<pre><br>Functions.rampmf( 5, a=2, b=8); // 0.5
Functions.rampmf( 1, a=2, b=8); // 0.0
Functions.rampmf( 9, a=2, b=8); // 1.0<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end rampmf;
