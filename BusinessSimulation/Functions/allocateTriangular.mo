within BusinessSimulation.Functions;

encapsulated function allocateTriangular "Allocate a scarce resoure using a triangular priority distribution"
  import ICON = BusinessSimulation.Icons.Function;
  extends ICON;
  input Real x "Clearing attractiveness";
  input Real a "Attractiveness of recipient";
  input Real w "Width of distribution (i.e., span of the triangular distribution)";
  output Real y "Fraction of total capacity or demand allocated to the recipient";
protected
  Real lb = a - w / 2.0;
  Real ub = a + w / 2.0;
  Real w2 = w ^ 2;
algorithm
  y := if w <= 0.0 then 0.0 elseif lb <= x and x <= a then 1.0 - 2.0 * (x - lb) ^ 2 / w2
   elseif a < x and x <= ub then 2.0 * (ub - x) ^ 2 / w2
   elseif x > ub then 0.0 else 1.0;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the <em>fraction of capacity or demand</em> that matches the allocated amount of a scarce resource given the clearing attractiveness <code>c</code>, the attractiveness <code>a</code> (e.g., utility), and the width <code>w</code> of a triangular distribution function that describes the priority profile for the recipient.</p>
<br>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the allocateTriangular Function (Distribution Shown Scaled for Clarity)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Functions/allocateTriangular/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Syntax</h4>
<br>
<pre>Functions.<strong>allocateTriangular</strong>(c, a, w);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
Functions.allocateTriangular(3.5, 5, 3); // 1.0
Functions.allocateTriangular(5.0, 5, 3); // 0.5
Functions.allocateTriangular(6.5, 5, 3); // 0.0
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.allocateUniform\">allocateUniform</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateNormal\">allocateNormal</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateExtremeValue\">allocateExtremeValue</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end allocateTriangular;
