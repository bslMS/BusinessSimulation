within BusinessSimulation.Functions;

encapsulated function allocateUniform "Allocate a scarce resoure using a uniform priority distribution"
  import ICON = BusinessSimulation.Icons.Function;
  extends ICON;
  input Real c "Clearing attractiveness";
  input Real a "Attractiveness of recipient";
  input Real w "Width of distribution (i.e., span of the uniform distribution)";
  output Real y "Fraction of total capacity or demand allocated to the recipient";
protected
  Real twoA = 2. * a;
  Real twoC = 2. * c;
algorithm
  y := if w <= 0.0 then 0.0 elseif twoA > w + twoC then 1.0
   elseif twoA <= w + twoC and twoA + w >= twoC then (twoA + w - twoC) / (2.0 * w) else 0.0;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the <em>fraction of capacity or demand</em> that matches the allocated amount of a scarce resource given the clearing attractiveness <code>c</code>, the attractiveness <code>a</code> (e.g., utility), and the width <code>w</code> of a uniform distribution function that describes the priority profile for the recipient.</p>
<br>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the allocateUniform Function (Distribution Shown Scaled for Clarity)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Functions/allocateUniform/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Syntax</h4>
<br>
<pre>Functions.<strong>allocateUniform</strong>(c, a, w);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
Functions.allocateUnifom(3.5, 5, 3); // 1.0
Functions.allocateUnifom(5.0, 5, 3); // 0.5
Functions.allocateUnifom(6.5, 5, 3); // 0.0
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.allocateTriangular\">allocateTriangular</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateNormal\">allocateNormal</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateExtremeValue\">allocateExtremeValue</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end allocateUniform;
