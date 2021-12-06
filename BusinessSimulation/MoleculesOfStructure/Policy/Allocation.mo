within BusinessSimulation.MoleculesOfStructure.Policy;

block Allocation "Allocate an available amount according to priorities and capacity restrictions"
  import PP = BusinessSimulation.Types.PriorityProfiles;
  import BusinessSimulation.Functions.allocatedAmounts;
  extends Interfaces.PartialConverters.Policy_MO;
  Interfaces.Connectors.RealInput u "Available amount to be allocated" annotation(Placement(visible = true, transformation(origin = {-145, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealMultiInput u_p[nout](each min = 0) "Priorities for allocation (i.e., utilities)" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput u_w[nout](each min = 0) "Widths for priority profiles (i.e., priority distribution functions)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput u_c[nout](each min = 0) "Constraints for allocated amounts (i.e., maximum capacity/saturation level)" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Types.PriorityProfiles pp = PP.uniform "Priority distribution to be used for allocation" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Real totalCap = sum(u_c) "The sum of all elements in the vector u_c";
  Real clearing(start = 10) "The clearing priority";
equation
  // find clearing priority
  0 = u - sum(allocatedAmounts(x = clearing, vecA = u_p, vecC = u_c, vecW = u_w, pp = pp));
  y = if u <= 0 then zeros(nout) elseif u >= totalCap then u_c else allocatedAmounts(x = clearing, vecA = u_p, vecC = u_c, vecW = u_w, pp = pp);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output vector <strong>y</strong> gives an <em>allocation</em> of the single input <strong>u</strong>, which may be a <em>rate</em> or simply an <em>available amount</em> of entities. The allocation is done according to the <em>priorities</em> associated with the repicients (e.g., suppliers or buyers) and their individual <em>capacities</em>, so that even the most attractive recipient will never get more than the maximum amount offered or demanded.</p>
<h4>Notes</h4>
<ul>
<li>While a proportional split according to some weights as in <code>SplitProportionally</code> often suffices to allocate a resource (e.g., a single supply to some buyers or a single demand to some suppliers), the case is more complicated when <em>capacities</em> need to be considered as well.</li><br>
<li>Using priority distributions (→<a href=\"modelica://BusinessSimulation.Functions.allocateUniform\"><code>allocateUniform</code></a>, <a href=\"modelica://BusinessSimulation.Functions.allocateTriangular\"><code>allocateTriangular</code></a>, <a href=\"modelica://BusinessSimulation.Functions.allocateNormal\"><code>allocateNormal</code></a>, <a href=\"modelica://BusinessSimulation.Functions.allocateExtremeValue\"><code>allocateExtremeValue</code></a>) cenetered around the priority score of each recipient, the solver will start from +&infin; moving to the left until the sum under the priority curves multiplied times the capacity matches the demand.</li><br>
<li>The allocated amount to each recipient is thus a fraction of the priority distribution times the available capacity.</li><br>
<li>The <code>width</code> is more or less equivalent to the <em>span</em> of the priority distributions and controls whether priority distributions for recipients with similar priority scores will <em>overlap</em> or not. If the width is such, that two priority distributions will not overlap, then the more attrative recipient will receive everything available until the capacity is filled before the less attractive recipient recieves anything.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.Allocation_Brent\">Allocation_Brent</a>,
<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.SplitProportionally\">SplitProportionally</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Allocation", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end Allocation;
