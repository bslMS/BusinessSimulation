within BusinessSimulation.Functions;

function pimf "Pi-shaped membership function"
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input Real a "Foot of the s-shaped part(lower bound of the support)";
  input Real b "Shoulder of the s-haped part (lower bound of the core)";
  input Real c "Shoulder of the z-shaped part (upper bound of the core)";
  input Real d "Foot of the z-shaped part (upper bound of the support)";
  output Real y "Degree of membership";
protected
  Real midpointS = (a + b) / 2;
  Real midpointZ = (c + d) / 2;
algorithm
  y := if x <= a then 0 elseif a < x and x <= midpointS then 2 * ((x - a) / (b - a)) ^ 2
   elseif midpointS < x and x <= b then 1 - 2 * ((x - b) / (b - a)) ^ 2
   elseif b < x and x <= c then 1
   elseif c < x and x <= midpointZ then 1 - 2 * ((x - c) / (d - c)) ^ 2
   elseif midpointZ < x and x <= d then 2 * ((x - d) / (d - c)) ^ 2 else 1;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the degree of membership using a <em>Pi-shaped</em> function given the real input <strong>x</strong> and the parameters <em>foot of the s-shaped part</em> <code>a</code>, <em>shoulder of the s-shaped part</em> <code>b</code>, <em>shoulder of the z-shaped part</em> <code>c</code>, and <em>foot of the z-shaped part</em> <code>d</code> of the function.</p>
<h4>Implementation</h4>
<br>
<pre>  y := if x <= a then 0 
    elseif a < x and x <= midpointS then 2 * ((x - a) / (b - a)) ^ 2
    elseif midpointS < x and x <= b then 1 - 2 * ((x - b) / (b - a)) ^ 2
    elseif b < x and x <= c then 1
    elseif c < x and x <= midpointZ then 1 - 2 * ((x - c) / (d - c)) ^ 2
    elseif midpointZ < x and x <= d then 2 * ((x - d) / (d - c)) ^ 2
    else 1;</pre>
<br>
<h4>Syntax</h4>
<p><code>Functions.<strong>pimf</strong>(x, a, b, c, d);</code></p>
<h4>Examples</h4>
<pre><br>Functions.pimf(   5, a=1, b=4, c=5, d=10); // 1.0
Functions.pimf( 2.5, a=1, b=4, c=5, d=10); // 0.5
Functions.pimf(   1, a=1, b=4, c=5, d=10); // 0.0
Functions.pimf( 7.5, a=1, b=4, c=5, d=10); // 0.5
Functions.pimf(  10, a=1, b=4, c=5, d=10); // 0.0
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
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end pimf;
