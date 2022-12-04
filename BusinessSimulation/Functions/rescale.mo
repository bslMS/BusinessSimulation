within BusinessSimulation.Functions;

function rescale "Rescale values from one range to another"
  extends BusinessSimulation.Icons.Function;
  input Real x "Value to be transformed";
  input Real x_range[2] "Original range [min,max] given as a list";
  input Real y_range[2] = {0, 1} "Rescaled range [y_min, y_max] given as a list (default = {0,1})";
  output Real y "Rescaled value to run from y_min to y_max over the range min to max";
protected
  Real x_min = x_range[1];
  Real x_max = x_range[2];
  Real y_min = y_range[1];
  Real y_max = y_range[2];
algorithm
  y := y_min + (x - x_min) * (y_max - y_min) / (x_max - x_min) annotation(Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function will <em>rescale</em> the input to run from range <code>y_min</code> to <code>y_max</code> over the range <code>min</code> to <code>max</code>.</p>
<h4>Syntax</h4>
<br>
<pre>Function.<strong>rescale</strong>(x, {x_min, x_max});&nbsp;                // {y_min, y_max} by default assumed to be {0,1}<br>Function.<strong>rescale</strong>(x, {min, max}, {y_min, y_max});&nbsp;</pre>
<h4>Examples</h4>
<br>
<pre>Function.rescale(5, {0, 10});                 // 0.5<br>Function.rescale(5, {0, 10}, {10, 20});       // 15.</pre>
<h4>Notes</h4>
<p>This function is closely modeled to <a href=\"https://reference.wolfram.com/language/ref/Rescale.html\"><code>Rescale</code> </a>in the Wolfram Languag<em>e</em>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.rescaleVector\">Functions.rescaleVector</a></p></html>", revisions = "<html>
<ul>
<li>Added <code>Inline = true</code> in v2.1.0.</li>
</ul>
<html>"));
end rescale;
