within BusinessSimulation.Functions;

function notZeroQ "Yields true if input is different from zero"
  extends BusinessSimulation.Icons.Function;
  input Real x "Real input";
  output Boolean y "Boolean output";
algorithm
  y := x <> 0;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns <code>false</code> if the real input <strong>x</strong> is zero and <code>true</code> in all other cases.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>notZeroQ</strong>(x)</code></p>
<h4>Examples</h4>
<br>
<pre><strong>import</strong> BusinessSimulation.Constants.small;<br>Functions.notZeroQ(0.0);   // false<br>Functions.notZeroQ(1.2);   // true<br>Functions.notZeroQ(-5);    // true<br>Functions.notZeroQ(small); // true</pre>
<br>
<h4>Notes</h4>
<p>This functions is somewhat like an \"inverse\" Boole.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Logical.Boole\">Boole</a></p></html>", revisions = "<html>
<ul>
<li>Added <code>Inline = true</code> in v2.1.0.</li>
</ul>
<html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end notZeroQ;
