within BusinessSimulation.Converters.Lookup;

block PerformanceIndicator "Indicator function using fuzzy membership functions"
  import BusinessSimulation.Types.MembershipFunctionTypes;
  import BusinessSimulation.Units.Amount;
  extends Interfaces.PartialConverters.SISO_Conversion(redeclare final type OutputType = Units.Dimensionless);
  parameter Amount a "Parameter to control shape of membership function" annotation(Dialog(enable = true));
  parameter Amount b "Parameter to control shape of membership function" annotation(Dialog(enable = not (mft == MembershipFunctionTypes.sigmoidal or mft == MembershipFunctionTypes.gaussian)));
  parameter Amount c "Parameter to control shape of membership function" annotation(Dialog(enable = not (mft == MembershipFunctionTypes.ramp or mft == MembershipFunctionTypes.sshaped)));
  parameter Amount d "Parameter to control shape of membership function" annotation(Dialog(enable = mft == MembershipFunctionTypes.trapezoidal or mft == MembershipFunctionTypes.pishaped or mft == MembershipFunctionTypes.psigmoidal));
  parameter MembershipFunctionTypes mft = MembershipFunctionTypes.ramp "Membership function type to use" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean invertResult = false "= true, if the degree of membership is to be inverted (i.e., y = 1 - mf(u))" annotation(Dialog(group = "Structural Parameters"));
equation
  y_c = if invertResult then 1 - Functions.evalmf(u_c, mft, a = a, b = b, c = c, d = d) else Functions.evalmf(u_c, mft, a = a, b = b, c = c, d = d);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the dimensionless <em>degree of membership</em> to the set of \"good performances\" or \"good outcomes\" according to a chosen type of membership function. Using the PerformanceIndicator allows to quickly grasp how a system is currently performing with regard to some criteria: a value of 1 indicates <em>best possible performance</em>, while a value of 0 indicates <em>unsustainable performance</em>.</p>
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
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>, <a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>, <a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>, <a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>, <a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>, <a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>, <a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>, <a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>, <a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a></p>
</html>", revisions = "<html><ul>
<li>Modified in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-11.686, -22.099}, rotation = -90, points = {{-44.186, 1.686}, {-14.975, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Line(visible = true, origin = {-8.485, -8.173}, points = {{-46.394, 0}, {32.732, 0}, {13.662, 0}}, color = {128, 128, 128}, thickness = 1), Text(visible = true, origin = {0, -30}, textColor = {0, 0, 128}, extent = {{-36.812, -12}, {36.812, 12}}, textString = "PI", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Line(visible = true, points = {{-7.669, 20}, {18.252, 20}, {23.387, -7.757}, {51.346, -7.757}}, color = {0, 0, 128}, thickness = 3), Ellipse(visible = true, origin = {-9.903, -8}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Text(visible = true, origin = {40, 20}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "1", fontName = "Lato"), Line(visible = true, origin = {-47.217, 12.243}, points = {{-7.669, -20}, {18.252, -20}, {27.217, 7.757}, {51.346, 7.757}}, color = {0, 0, 128}, thickness = 3), Ellipse(visible = true, origin = {-10, 20}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Text(visible = true, origin = {-40, -20}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "0", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PerformanceIndicator;
