within BusinessSimulation.Converters.Lookup;

block ConcaveLookupPositive "Concave Lookup with positive slope; fixpoints are (0,y0) and (1,1)"
  extends Interfaces.PartialConverters.SISO;
  parameter Real s(min = 0, max = 1) = 0.5 "Slope parameter (0< slope <= 1)";
  parameter Real y0(min = 0, max = 1) = 0 "Value of y when input is zero or less (intercept)";
equation
  assert(y0 >= 0 and y0 <= 1, "Intercept should be within the closed unit interval [0,1]", level = AssertionLevel.warning);
  assert(s > 0 and s <= 1, "Slope should be within the interval (0,1]", level = AssertionLevel.warning);
  y = if noEvent(u <= 0) then y0 else y0 + (1 - y0) * u ^ s;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong><em>y</em></strong> is derived using the formula:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConcaveLookupPositive/Formula.svg\" alt=\"y = y0 + (1 - y0) * u^s\"></p>
<p>The function will go through the points (1,1) and (0,<em>y0</em>). The output will be <em>y0</em> for <em>u</em>&nbsp;&le;&nbsp;0.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the Lookup-Function for Different Slopes (y0&nbsp;=&nbsp;0)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConcaveLookupPositive/Graph.svg\" alt=\"Graph.png\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li><code>y0</code> (intercept) should be within the interval [0,1).</li><br>
<li><code>s</code> (slope) should be within the interval (0,1].</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.ConcaveLookupNegative\">ConcaveLookupNegative</a>, <a href=\"modelica://BusinessSimulation.Converters.Lookup.ConvexLookupPositive\">ConvexLookupPositive</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Lookup.ConvexLookupNegative\">ConvexLookupNegative</a></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {10.816, -30}, points = {{-46.394, 0}, {32.732, 0}, {13.662, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-35.548, 9.209}, rotation = -270, points = {{-39.209, 0}, {18.362, 0}, {20.847, 0}}, color = {128, 128, 128}, thickness = 1), Text(visible = true, origin = {7.341, -37.537}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-43.292, 4.265}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {4, -6.714}, rotation = -180, points = {{-35, -17.714}, {15, -2.472}, {37.931, 22.286}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Line(visible = true, origin = {-16.901, -11.709}, points = {{-18.396, 1.709}, {-2.099, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Line(visible = true, origin = {-16.686, -42.099}, rotation = -90, points = {{-32.099, 1.709}, {-14.975, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Ellipse(visible = true, origin = {-14.903, -10}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Ellipse(visible = true, origin = {-35, -10}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-14.903, -30}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Text(visible = true, origin = {-8.921, 18}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "(1,1)", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConcaveLookupPositive;
