within BusinessSimulation.MoleculesOfStructure.Policy;

encapsulated block Allocation_Brent "Allocate an available amount according to priorities and capacity restrictions"
  import PP = BusinessSimulation.Types.PriorityProfiles;
  import BusinessSimulation.Functions.allocatedAmounts;
  import Modelica.Math.Nonlinear.solveOneNonlinearEquation;
  import BusinessSimulation.Functions.UtilityFunctions.findClearAttrac;
  import BusinessSimulation.Constants.eps;
  import BusinessSimulation.Interfaces.Connectors.{RealInput,RealMultiInput};
  import ICON = BusinessSimulation.Interfaces.PartialConverters.Policy_MO;
  extends ICON;
  RealInput u "Available amount to be allocated" annotation(Placement(visible = true, transformation(origin = {-145, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  RealMultiInput u_p[nout](each min = 0) "Priorities for allocation (i.e., utilities)" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealMultiInput u_w[nout](each min = 0) "Widths for priority profiles (i.e., priority distribution functions)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealMultiInput u_c[nout](each min = 0) "Constraints for allocated amounts (i.e., maximum capacity/saturation level)" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter PP pp = PP.uniform "Priority distribution to be used for allocation" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real tolerance = 100 * eps "Tolerance for Brent algorithm" annotation(Dialog(tab = "Advanced"));
protected
  Real totalCap = sum(u_c) "The sum of all elements in the vector u_c";
  Real clearing "The clearing priority";
  Real w_max = max(u_w) "Maximum element in vecW";
  Real u_min "Lower bound for finding cA";
  Real u_max "Upper bound for finding cA";
equation
  u_min = -w_max;
  u_max = max(u_p) + w_max;
  // find clearing priority
  clearing = solveOneNonlinearEquation(function findClearAttrac(amount = u, vecA = u_p, vecC = u_c, vecW = u_w, pp = pp), u_min = u_min, u_max = u_max, tolerance = tolerance);
  y = if u <= 0 then zeros(nout) elseif u >= totalCap then u_c else allocatedAmounts(x = clearing, vecA = u_p, vecC = u_c, vecW = u_w, pp = pp);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output vector <strong>y</strong> gives an <em>allocation</em> of the single input <strong>u</strong>, which may be a <em>rate</em> or simply an <em>available amount</em> of entities. The allocation is done according to the  <em>priorities</em> associated with the repicients (e.g., suppliers or buyers) and their individual <em>capacities</em>, so that even the most attractive recipient will never get more than the maximum amount offered or demanded.</p>
<h4>Notes</h4>
<p>
<Code>Allocation_Brent</code> has the same functionality as <code>Allocation</code>, but while the latter uses the DAE solver, the former uses <a href=\"modelica://Modelica.Math.Nonlinear.solveOneNonlinearEquation\">Modelica.Math.Nonlinear.solveOneNonlinearEquation</a> to find the allocated amounts. The class has not been tested thoroughly, yet, and is added <strong>[EXPERIMENTALLY]</strong> here.
</p> 
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.Allocation\">Allocation</a>,
<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.SplitProportionally\">SplitProportionally</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced [EXPERIMENTALLY] in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Allocation", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end Allocation_Brent;
