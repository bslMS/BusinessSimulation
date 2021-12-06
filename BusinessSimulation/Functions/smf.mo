within BusinessSimulation.Functions;

function smf "S-shaped membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Foot of the function (i.e., f(a) = 0)";
  input Real b "Shoulder of the function (i.e., f(b) = 1)";
  output Real y "Degree of membership";
protected
  Real midpoint = (a + b) / 2;
algorithm
  y := if x <= a then 0 elseif a < x and x <= midpoint then 2 * ((x - a) / (b - a)) ^ 2
   elseif midpoint < x and x <= b then 1 - 2 * ((x - b) / (b - a)) ^ 2 else 1;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>S-shaped</em> function given the real input <strong>x</strong> and the parameters <em>foot</em> <code>a</code> and <em>shoulder</em> <code>b</code> of the function.</p>
<h4>Implementation</h4>
<br>
<pre>  y := if x <= a then 0
    elseif a < x and x <= midpoint then 2 * ( (x-a)/(b-a) )^2
    elseif midpoint < x and x <= b then 1 - 2 * ( (x-b)/(b-a) )^2
    else 1;</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>smf</strong>(x, a, b);</code></p>
<h4>Examples</h4>
<pre><br>Functions.smf( 5, a=2, b=8); // 0.5
Functions.smf( 1, a=2, b=8); // 0.0
Functions.smf( 9, a=2, b=8); // 1.0<br>
</pre>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.evalmf\">evalmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end smf;
