within BusinessSimulation.Functions;

encapsulated function allocateNormal "Allocate a scarce resoure using a normal priority distribution"
  import ICON = BusinessSimulation.Icons.Function;
  import Modelica.Math.Special.erf;
  extends ICON;
  input Real x "Clearing attractiveness";
  input Real a "Attractiveness of recipient";
  input Real w "Width of distribution (i.e., six times the standard deviation)";
  output Real y "Fraction of total capacity or demand allocated to the recipient";
algorithm
  y := if w <= 0.0 then 0.0 else 0.5 * (1.0 + erf(3.0 * sqrt(2) * (a - x) / w));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the <em>fraction of capacity or demand</em> that matches the allocated amount of a scarce resource given the clearing attractiveness <code>x</code>, the attractiveness <code>a</code> (e.g., utility), and the width <code>w = 6&sigma;</code> of a normal distribution function that describes the priority profile for the recipient.</p>
<br>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the allocateNormal Function (Distribution Shown Scaled for Clarity)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Functions/allocateNormal/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Syntax</h4>
<br>
<pre>Functions.<strong>allocateNormal</strong>(x, a, w);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
Functions.allocateNormal(3.5, 5, 3); // 1.0
Functions.allocateNormal(5.0, 5, 3); // 0.5
Functions.allocateNormal(6.5, 5, 3); // 0.0
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.allocateUniform\">allocateUniform</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateTriangular\">allocateTriangular</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateExtremeValue\">allocateExtremeValue</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end allocateNormal;
