within BusinessSimulation.Functions;

encapsulated function allocatedAmounts "Allocate a scarce resoure using priority profiles given by distributions"
  import PP = BusinessSimulation.Types.PriorityProfiles;
  import ICON = BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.{allocateUniform,allocateTriangular,allocateNormal,allocateExtremeValue};
  extends ICON;
  input Real x "Clearing attractiveness";
  input Real[:] vecA "Vector of attractiveness (i.e., priority) scores for recipients";
  input Real[size(vecA, 1)] vecC "Vector of supply capacities or demand saturation levels";
  input Real[size(vecA, 1)] vecW "Vector of width parameters for priority distributions";
  input PP pp = PP.uniform "Priority distribution to be used for allocation";
  output Real[size(vecA, 1)] y "Allocated amounts";
protected
  Integer n = size(vecA, 1) "Number of recipients (i.e., length of vecA)";
  Real[n] vecAllocFrac "Vector of fractions allocated";
algorithm
  vecAllocFrac := if pp == PP.triangular then array(allocateTriangular(x, vecA[i], vecW[i]) for i in 1:n) elseif pp == PP.normal then array(allocateNormal(x, vecA[i], vecW[i]) for i in 1:n)
   elseif pp == PP.extremeValue then array(allocateExtremeValue(x, vecA[i], vecW[i]) for i in 1:n) else array(allocateUniform(x, vecA[i], vecW[i]) for i in 1:n);
  y := vecAllocFrac .* vecC;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function returns the <em>allocated amounts</em> of a scarce resource given the clearing attractiveness <code>x</code>, the vector of attractiveness scores <code>vecA</code> (i.e., utilities/priorities), the vector of available capacities or demand saturation levels <code>vecC</code>, the vector of widths <code>vecW</code>, and the type of priority distribution used for allocation <code>pp</code> (<code>default = PriorityProfiles.uniform</code>).</p>
<h4>Syntax</h4>
<br>
<pre>
Functions.<strong>allocatedAmounts</strong>(x, vecA, vecC, vecW, pp);
Functions.<strong>allocatedAmounts</strong>(x, vecA, vecC, vecW);
</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
Functions.allocatedAmounts( 6.5, {10, 6}, {10, 20}, {2,2},PriorityProfiles.uniform      ); // { 10.0, 5.0 }
Functions.allocatedAmounts( 6.5, {10, 6}, {10, 20}, {2,2},PriorityProfiles.triangular   ); // { 10.0, 2.5 }
Functions.allocatedAmounts( 6.5, {10, 6}, {10, 20}, {2,2},PriorityProfiles.normal       ); // { 10.0, 1.3361.. }
Functions.allocatedAmounts( 6.5, {10, 6}, {10, 20}, {2,2},PriorityProfiles.extremeValue ); // { 10.0, 2.4589.. }
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.allocateUniform\">allocateUniform</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateTriangular\">allocateTriangular</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateNormal\">allocateNormal</a>,
<a href=\"modelica://BusinessSimulation.Functions.allocateExtremeValue\">allocateExtremeValue</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end allocatedAmounts;
