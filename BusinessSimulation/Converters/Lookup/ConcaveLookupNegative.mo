within BusinessSimulation.Converters.Lookup;

block ConcaveLookupNegative "Concave Lookup with negative slope; fixpoints are (0,y0) and (1,0)"
  extends Interfaces.PartialConverters.SISO_Conversion;
  parameter Real s(min = 1, max = 50) = 1 "Slope parameter (1 <= slope <= 50)";
  parameter Real y0(min = 0) = 1 "Value of y when input is zero or less (intercept)";
  parameter Boolean strict = true "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
equation
  assert(s >= 1, "Slope parameter should not be less than 1", level = AssertionLevel.warning);
  assert(y0 >= 0, "Intercept should not be negative", level = AssertionLevel.warning);
  if strict then
    y_c = noEvent(if u_c <= 0 then y0 elseif u_c < 1 then y0 * (1 - u_c ^ s) else 0);
  else
    y_c = if u_c <= 0 then y0 elseif u_c < 1 then y0 * (1 - u_c ^ s) else 0;
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong><em>y</em></strong> is derived using the formula:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConcaveLookupNegative/Formula.svg\" alt=\"y = y0 * (1 - u^s)\"></p>
<p>The function will go through the point (0,y0) and the output will be 0 for <strong><em>u</em></strong>&nbsp;&ge;&nbsp;1 and <em>y0</em> for <strong>u</strong>&nbsp;&le;&nbsp;0. The input <strong><em>u </em></strong>should thus be in the range [0,1]. The following graph shows plots for the function for different slopes:</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the Lookup-Function for Different Slopes (y0 = 1)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConcaveLookupNegative/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.ConcaveLookupPositive\">ConcaveLookupPositive</a>, <a href=\"modelica://BusinessSimulation.Converters.Lookup.ConvexLookupNegative\">ConvexLookupNegative</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Lookup.ConvexLookupPositive\">ConvexLookupPositive</a></p></html>", revisions = "<html><ul>
<li>Modified in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {10.816, -30}, points = {{-46.394, 0}, {32.732, 0}, {13.662, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-35.548, 9.209}, rotation = -270, points = {{-39.209, 0}, {18.362, 0}, {20.847, 0}}, color = {128, 128, 128}, thickness = 1), Text(visible = true, origin = {7.341, -37.537}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-43.292, 4.265}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {4, -6.714}, rotation = -180, points = {{-16, 23.286}, {6.446, -3.219}, {38.948, -6.714}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Ellipse(visible = true, origin = {19.097, -30}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Text(visible = true, origin = {30, 0}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "(1,0)", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConcaveLookupNegative;
