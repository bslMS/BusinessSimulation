within BusinessSimulation.Functions;

encapsulated function allocateExtremeValue "Allocate a scarce resoure using an extreme value priority distribution"
  import ICON = BusinessSimulation.Icons.Function;
  extends ICON;
  input Real x "Clearing attractiveness";
  input Real a "Attractiveness of recipient";
  input Real w "Width of distribution (i.e., defining a highest density region with probability of 0.997)";
  output Real y "Fraction of total capacity or demand allocated to the recipient";
algorithm
  y := if w <= 0.0 then 0.0 else 1.0 - exp(-exp(8.12447 * (a - x) / w));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the <em>fraction of capacity or demand</em> that matches the allocated amount of a scarce resource given the clearing attractiveness <code>x</code>, the attractiveness <code>a</code> (e.g., utility), and the width <code>w</code> of an extreme value distribution function that describes the priority profile for the recipient.</p>
<p>The parameter <code>w</code> defines a highest density interval (HDI) with a probability of about 0.997 (i.e., the equivalent of a 6&sigma; HDI for a normal probability distribution) that is located around the location parameter <code>a</code>, which in this case denotes the location of the <em>mode</em> of the extreme value distribution. The interval boundaries shown in the graph below are only approximations, but they are close enough for application purposes.</p>
<br>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the allocateExtremeValue Function (Distribution Shown Scaled for Clarity)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Functions/allocateExtremeValue/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Syntax</h4>
<br>
<pre>Functions.<strong>allocateExtremeValue</strong>(x, a, w);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
Functions.allocateExtremeValue(4.25, 5, 3); // 0.9995..
Functions.allocateExtremeValue(5.00, 5, 3); // 0.6321..
Functions.allocateExtremeValue(7.25, 5, 3); // 0.0022..
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.allocateUniform\">allocateUniform</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateTriangular\">allocateTriangular</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateNormal\">allocateNormal</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end allocateExtremeValue;
