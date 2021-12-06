within BusinessSimulation.Converters.Lookup;

block ConvexLookupPositive "Convex Lookup with positive slope; usually with fixpoint (0,y0) and fixpoint (1,1)"
  extends Interfaces.PartialConverters.SISO_Conversion;
  parameter Real s(min = 1) = 1 "Slope parameter (s>1)";
  parameter Real y0(min = 0, max = 1) = 0 "Value of y when input is zero or less";
equation
  assert(s > 1, "Slope should be greater than 1", level = AssertionLevel.warning);
  assert(y0 >= 0 and y0 <= 1, "Intercept should be within the closed unit interval [0,1]", level = AssertionLevel.warning);
  y_c = smooth(1, if noEvent(u_c <= 0) then y0 else y0 + (1 - y0) * u_c ^ s);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong><em>y</em></strong> is derived using the formula:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConvexLookupPositive/Formula.svg\" alt=\"y=y0 + (1-y0)*u^s\"></p>
<p>The function will go through the point (1,1) and the output will be <em>y0</em> for <em>u</em>&nbsp;&le;&nbsp;0.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the Lookup-Function for Different Slopes (y0&nbsp;=&nbsp;0)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConvexLookupPositive/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li><code>y0</code> (intercept) should be within the interval [0,1).</li><br>
<li><code>s</code> (slope) should be greater than 1.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.ConvexLookupNegative\">ConvexLookupNegative</a>, <a href=\"modelica://BusinessSimulation.Converters.Lookup.ConcaveLookupPositive\">ConcaveLookupPositive</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Lookup.ConcaveLookupNegative\">ConcaveLookupNegative</a></p></html>", revisions = "<html><ul>
<li>Modified in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {10.816, -30}, points = {{-46.394, 0}, {32.732, 0}, {13.662, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-35.548, 9.209}, rotation = -270, points = {{-39.209, 0}, {18.362, 0}, {20.847, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-6.931, 6}, points = {{-27.931, -35}, {15.901, -25}, {37.931, 22.286}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Text(visible = true, origin = {7.341, -37.537}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-43.292, 4.265}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConvexLookupPositive;
