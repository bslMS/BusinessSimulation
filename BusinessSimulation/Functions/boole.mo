within BusinessSimulation.Functions;

function boole "Returns 1.0 if input is true, and 0.0 otherwise"
  extends BusinessSimulation.Icons.Function;
  input Boolean u "Boolean input";
  output Real y "Real output";
algorithm
  y := if noEvent(u == true) then 1. else 0.;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns 1.0 if the Boolean input <strong>u</strong>&nbsp;is <code>true</code>&nbsp;and 0.0 in all other cases.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>boole</strong>(u)</code></p>
<h4>Examples</h4>
<br>
<pre>Functions.boole(true);   // 1.0<br>Functions.boole(false);   // 0.0<br><br></pre>
&nbsp;</html>", revisions = "<html>
<ul>
<li>Added <code>Inline = true</code> in v2.1.0.</li>
</ul>
<html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end boole;
