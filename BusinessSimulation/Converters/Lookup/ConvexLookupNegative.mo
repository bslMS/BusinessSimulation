within BusinessSimulation.Converters.Lookup;

block ConvexLookupNegative "Convex Lookup with negative slope usually defined for the range [0,∞) passing through the fixpoint (1,1)"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO_Conversion;
  parameter Real y0(min = 1) = 2 "Value of y (intercept) when input is zero or less (y0>1)";
  parameter Boolean strict = true "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
equation
  assert(y0 > 1, "Intercept should be greater than 1", level = AssertionLevel.warning);
  if strict then
    y_c = noEvent(if u_c <= 0 then y0 else y0 ^ (1 - u_c));
  else
    y_c = if u_c <= 0 then y0 else y0 ^ (1 - u_c);
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong><em>y</em></strong> is derived using the formula:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConvexLookupNegative/Formula.svg\" alt=\"y=y0^(1-u)\"></p>
<p>The function will go through the point (1,1) and (0,<em>y0</em>). The output will be <em>y0</em> for <strong><em>u</em></strong>&nbsp;&le;&nbsp;0. The following graph shows plots for the function for different values of <em>y0</em>:</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the Lookup-Function for Different Values of y0</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/ConvexLookupNegative/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li><code>y0</code> (intercept) should be greater than 1.</li><br>
<li>By default (<code>strict = true</code>) the component will not generate events.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.ConvexLookupPositive\">ConvexLookupPositive</a>, <a href=\"modelica://BusinessSimulation.Converters.Lookup.ConcaveLookupNegative\">ConcaveLookupNegative</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Lookup.ConcaveLookupPositive\">ConcaveLookupPositive</a></p></html>", revisions = "<html><ul>
<li>Modified in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {10.816, -30}, points = {{-46.394, 0}, {32.732, 0}, {13.662, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-35.548, 9.209}, rotation = -270, points = {{-39.209, 0}, {18.362, 0}, {20.847, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {16, 10.357}, points = {{27.931, -35}, {-31.224, -28.273}, {-50.578, 13.643}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Text(visible = true, origin = {7.341, -37.537}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "u", fontName = "Lato"), Text(visible = true, origin = {-43.292, 4.265}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-16.901, -11.709}, points = {{-18.396, 1.709}, {-2.099, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Line(visible = true, origin = {-16.686, -42.099}, rotation = -90, points = {{-32.099, 1.709}, {-14.975, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Ellipse(visible = true, origin = {-14.903, -10}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Ellipse(visible = true, origin = {-35, -10}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-14.903, -30}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Text(visible = true, origin = {10, 8}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "(1,1)", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConvexLookupNegative;
