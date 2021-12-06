within BusinessSimulation.Converters.Lookup;

block SShapedPositive "Symmettric S-shaped curve with positive slope around origin (0,0)"
  extends Interfaces.PartialConverters.SISO_Conversion;
  parameter Real upperBound(min = 0) = 1 "Upper asymptote (upperBound > 0)";
  parameter Real s(min = 1) = 2 "Slope controls gradient of curve (s > 1)";
equation
  y_c = upperBound * (s ^ u_c - 1) / (s ^ u_c + 1);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <code>SShapedPositive</code> lookup-function is a point symmetric, s-shaped growth function with respect to the origin (0,0) that has a positive slope. The curve has two parameters: An <code>upperBound</code> (lowerBound = -<code>upperBound</code>) and a <em>slope</em> <code>s</code> which is given as a positive number.</p>
<p>The output <strong>y</strong> is obtained by the following formula:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/SShapedPositive/Formula.svg\" alt=\"y = upperBound * (s^u - 1)/(s^u +1)\"></p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph of the Lookup-Function for Different Slopes (<code>upperBound</code> = 1)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Lookup/SShapedPositive/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.SShapedNegative\">SShapedNegative</a></p></html>", revisions = "<html><ul>
<li>Modified in v2.0.0.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, rotation = -270, points = {{50, 0}, {-50, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, rotation = -540, points = {{50, 0}, {-50, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {16.063, -15.61}, points = {{18.186, 32.823}, {-9.408, 32.823}, {-23.387, -7.757}, {-51.346, -7.757}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Ellipse(visible = true, origin = {0.097, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Text(visible = true, origin = {41.079, -8}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-8.921, 48}, textColor = {128, 128, 128}, extent = {{-18.921, -12}, {18.921, 12}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SShapedPositive;
