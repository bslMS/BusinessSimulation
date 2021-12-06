within BusinessSimulation.Converters.Lookup;

block JanoschekNegative "Janoschek's (S-shaped) growth curve with negative slope"
  extends Interfaces.PartialConverters.SISO_Conversion;
  parameter Real upperBound = 2 "Upper asymptote for u <= 0 (upperBound > lowerBound)";
  parameter Real lowerBound = 0 "Lower asymptote for u -> infinity";
  parameter Real growthRate(min = 0) = 2 "Determines the gradient of the curve";
  parameter Real x_ref(min = 0) = 1 "x-value for point of inflection(>0)";
  parameter Real y_ref = 1 "y-value for point of inflection(lowerBound < y_ref < upperBound)";
  parameter Boolean strict = true "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
protected
  Real k;
equation
  assert(lowerBound < upperBound, "lowerBound must be smaller than upperBound");
  assert(y_ref > lowerBound and y_ref < upperBound, "y_ref needs to be between lowerBound and upperBound");
  assert(x_ref > 0, "x_ref needs to be greater than zero");
  // parameter k is determined by the constraint: f(x_ref) = y_ref
  // for negative sloping curve upperBound and lowerBound simply need to be switched
  k = x_ref ^ (-growthRate) * log(((-upperBound) + lowerBound) / (lowerBound - y_ref));
  if strict then
    y_c = noEvent(if u_c <= 0 then upperBound else Functions.janoschek(x = u_c, l = lowerBound, b = upperBound, k = k, d = growthRate));
  else
    y_c = if u_c <= 0 then upperBound else Functions.janoschek(x = u_c, l = lowerBound, b = upperBound, k = k, d = growthRate);
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This negative sloping Janoschek-Growth-Curve is simply a modification of the positive version. For more detail see <a href=\"modelica://BusinessSimulation.Converters.Lookup.JanoschekPositive\">JanoschekPositive</a>.</p>
<p>The function is given by the following equation:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/JanoschekNegative/Formula.svg\" alt=\"y = l - (l-beta) * Exp(-k x^delta)\"></p>
<p>Where <strong><em>l</em></strong> is the <strong>lower bound</strong>,&nbsp;<em><strong>&beta;</strong>&nbsp;</em>is the <strong>upper bound</strong>, and&nbsp;<strong><em>&delta;</em></strong> is a parameter that determines the <strong>rate of growth </strong>(e.g., steepness of the curve). Given the <strong>point of inflection</strong> (<code>x_ref,y_ref</code>) the parameter <em><strong>k</strong>&nbsp;</em>can be obtained in closed form, which is made use of in this implementation.</p>
<p>The following animation shows a growth curve with the following parameters:</p>
<table>
<tbody>
<tr>
<th>Parameter</th>
<th>Value</th>
</tr>
<tr>
<td><code>upperBound</code></td>
<td>
<p style=\"text-align: center;\">2</p>
</td>
</tr>
<tr>
<td><code>lowerBound</code></td>
<td>
<p style=\"text-align: center;\">0.1</p>
</td>
</tr>
<tr>
<td><code>(x_ref, y_ref)</code></td>
<td>
<p style=\"text-align: center;\">(1,1)</p>
</td>
</tr>
<tr>
<td><code>growthRate</code></td>
<td>
<p style=\"text-align: center;\">1, ... ,10</p>
</td>
</tr>
</tbody>
</table>
<p><br><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/JanoschekNegative/AnimatedGraph.gif\" alt=\"AnimatedGraph.gif\"></p>
<h4>Notes</h4>
<ul>
<li>The <code>lowerBound</code> must be smaller than the <code>upperBound</code>. Also <code>y_ref</code> needs to be in the range [<code>lowerBound, upperBound</code>], while <code>x_ref</code> has to be a positive number larger than zero.</li><br>
<li>By default (<code>strict = true</code>) the component will not generate events.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.JanoschekPositive\">JanoschekPositive</a></p></html>", revisions = "<html><ul>
<li>Modified in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-60, -60}, {60, 60}}), Line(visible = true, origin = {11.515, -18.173}, points = {{-46.394, 0}, {32.732, 0}, {13.662, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-30, 12.704}, rotation = -270, points = {{-39.209, 0}, {18.362, 0}, {20.847, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-16.063, -6.873}, points = {{-13.937, 32.823}, {9.408, 32.823}, {23.387, -7.757}, {51.346, -7.757}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Line(visible = true, origin = {2.099, -1.709}, points = {{-32.099, 1.709}, {-2.099, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Line(visible = true, origin = {0.314, -32.099}, rotation = -90, points = {{-32.099, 1.709}, {-14.975, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Ellipse(visible = true, origin = {2.097, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Ellipse(visible = true, origin = {-29.903, 0}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {2.097, -18}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Text(visible = true, origin = {7.341, -37.537}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-43.292, 4.265}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end JanoschekNegative;
