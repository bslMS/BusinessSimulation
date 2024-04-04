within BusinessSimulation.CausalLoop;

block Performance "Evaluation of a stock on a [0,1] scale"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import MFT = BusinessSimulation.Types.MembershipFunctionTypes;
  extends BusinessSimulation.Interfaces.PartialCLD.Performance;
  parameter Ratio a "Parameter to control shape of membership function" annotation(Dialog(enable = true));
  parameter Ratio b = unspecified "Parameter to control shape of membership function" annotation(Dialog(enable = not (mft == MFT.sigmoidal or mft == MFT.gaussian)));
  parameter Ratio c = unspecified "Parameter to control shape of membership function" annotation(Dialog(enable = not (mft == MFT.ramp or mft == MFT.sshaped)));
  parameter Ratio d = unspecified "Parameter to control shape of membership function" annotation(Dialog(enable = mft == MFT.trapezoidal or mft == MFT.pishaped or mft == MFT.psigmoidal));
  parameter MFT mft = MFT.ramp "Membership function type to use" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean invertResult = false "= true, if the degree of membership is to be inverted (i.e., y = 1 - mf(u))" annotation(Dialog(group = "Structural Parameters"));
protected
  Converters.Lookup.PerformanceIndicator performanceIndicator(a = a, b = b, c = c, d = d, mft = mft, invertResult = invertResult) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Boolean b_enabled = not (mft == MFT.sigmoidal or mft == MFT.gaussian) annotation(Evaluate = true, Dialog(enable = false, tab = "Initialization"));
  parameter Boolean c_enabled = not (mft == MFT.ramp or mft == MFT.sshaped) annotation(Evaluate = true, Dialog(enable = false, tab = "Initialization"));
  parameter Boolean d_enabled = mft == MFT.trapezoidal or mft == MFT.pishaped or mft == MFT.psigmoidal annotation(Evaluate = true, Dialog(enable = false, tab = "Initialization"));
equation
  connect(normalizedStock.y, performanceIndicator.u) annotation(Line(visible = true, origin = {-30, 0}, points = {{-22, 0}, {22, 0}}, color = {1, 37, 163}));
  connect(performanceIndicator.y, y) annotation(Line(visible = true, origin = {85.043, 0}, points = {{-77.043, 0}, {77.043, 0}}, color = {1, 37, 163}));
  assert(not b_enabled or b < inf, "The parameter b should be specified");
  assert(not c_enabled or c < inf, "The parameter c should be specified");
  assert(not d_enabled or d < inf, "The parameter d should be specified");
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the dimensionless <em>degree of membership</em> to the set of \"good performances\" or \"good outcomes\" according to a chosen type of membership function. Using the PerformanceIndicator allows to quickly grasp how a system is currently performing with regard to some criterion with a value of 1 indicating <em>best possible performance</em> and a value of 0 indicating <em>worst possible (and possbily unsustainable) performance</em>.</p>
<p>The following grid displays all available membership function types without inversion (<code>invertResults = false</code>):</p>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Membership Functions</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/PerformanceIndicator/Grid.svg\" alt=\"Grid.svg\"></td>
</tr>
</tbody>
</table>
</p>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Parameters</caption>
<tbody>
<tr>
<th>Membership Function Type</th>
<th>a</th>
<th>b</th>
<th>c</th>
<th>d</th>
</tr>
<tr>
<td>ramp</td>
<td>foot</td>
<td>shoulder</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>triangular</td>
<td>left foot</td>
<td>center</td>
<td>right foot</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>trapezoidal</td>
<td>left foot</td>

<td>left shoulder</td>
<td>right shoulder</td>
<td>right foot</td>
</tr>
<tr>
<td>sshaped</td>
<td>foot</td>
<td>shoulder</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>sigmoidal</td>
<td>steepness of transition area</td>
<td>&nbsp;</td>
<td>center of transition area</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>pishaped</td>
<td>left foot</td>
<td>left shoulder</td>
<td>right shoulder</td>
<td>right foot</td>
</tr>
<tr>
<td>psigmoidal</td>
<td>steepness of left transition</td>
<td>center of left transition area</td>
<td>steepness of right transition</td>
<td>center of right transition area</td>
</tr>
<tr>
<td>gaussian</td>
<td>half width at half maximum</td>
<td>&nbsp;</td>
<td>center of curve (maximum)</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>bell</td>
<td>width of core</td>
<td>steepness</td>
<td>center of core</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
</p>
<p>When inversion is turned on (<code>invertResult = true</code>) the result obtained from the membership function as specified will be subtracted from 1. Thus the ramp shown above can be made to ramp down from left to right with <code>a</code> being the shoulder and <code>b</code> the foot by inverting the results.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/Performance/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<ul>
<li>The amount in the connected stock (<code>stockInfoInput</code>) will be normalized by divison either by a constant <code>referenceValue (default = 1)</code> or by the exogenous input <strong>u</strong> (<code>hasConstantReference = false</code>).</li><br>
<li>Using a polarity (<code>+,-,±</code>) it is possible to indicate the basic relation between the amount in the stock and its performance value (e.g., <code>+</code> indicating a <em>\"more-is-better\"</em> type of evaluation.</li>
<ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.Lookup.PerformanceIndicator\">PerformanceIndicator</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), defaultComponentName = "o");
end Performance;
