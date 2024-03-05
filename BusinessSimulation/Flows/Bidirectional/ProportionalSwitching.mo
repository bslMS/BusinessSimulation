within BusinessSimulation.Flows.Bidirectional;

model ProportionalSwitching "Rate of exchange is proportional to amount in stocks"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialFlows.BidirectionalFlow;
  Interfaces.Connectors.RealInput u "Fractional rate input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Boolean useAbsoluteLevels = true "= true, if the stock levels are to be taken als absolute values otherweise a negative amount in a stock may reverse the direction of flow" annotation(Dialog(group = "Structural Parameters"));
protected
  Real levelA = if not useAbsoluteLevels then portA.stock else abs(portA.stock) "Level-information for the stock A";
  Real levelB = if not useAbsoluteLevels then portB.stock else abs(portB.stock) "Level-information for the stock B";
equation
  A_rate = if u >= 0 then levelA * u else levelB * u;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p><em>ProportionalSwitching</em> models the exchange of \"mass\" (conserved matter or information) between two stocks as a bi-directional flow. The rate of flow will be <em>proportional</em> to the amount in the connected levels times the<em> fractional rate of flow</em> given by the input <em>u</em>:</p>
<table>
<tbody>
<tr>
<td><strong>input u</strong></td>
<td><strong>direction of flow (for positive levels)</strong></td>
<td>
<p><strong>rate of flow</strong></p>
</td>
</tr>
<tr>
<td>u &ge;&nbsp;0</td>
<td>flow from A to B</td>
<td>
<p><code>stockA.y &sdot;&nbsp;u</code></p>
</td>
</tr>
<tr>
<td>u &lt;= 0</td>
<td>flow from B to A</td>
<td>
<p><code>stockB.y &sdot;&nbsp;|u|</code></p>
</td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>Depending on the structural parameter <code>useAbsoluteLevels</code> the direction of flow may be reversed by negative amounts in the connected stocks, which is possible, if the stocks are <em>information levels</em> (material stocks by definition cannot become negative).</li><br>
<li>If <em>material stocks</em> are connected to the ProportionalSwitching element, then <code>useAbsoluteLevels</code> may be set to false as the amount in the stocks cannot become negative.</li><br>
<li>If <em>information levels</em> are connected via the ProportionalSwitching component, then the intended behavior has to be carefully chosen.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Bidirectional.Switching\">Switching</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {59.583, 14.198}, rotation = 5.306, points = {{32.722, -10.515}, {16.1, 26.782}, {-20.02, 35.205}, {-43.929, 11.895}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Text(visible = true, origin = {2.544, -76.372}, textColor = {0, 0, 128}, extent = {{-80.456, -12}, {80.456, 12}}, textString = "fractional rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "PROP Switching", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-60.264, -14.352}, rotation = 5.306, points = {{-32.722, 10.515}, {-16.1, -26.782}, {20.02, -35.205}, {44.243, -12.981}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {4, -26.505}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {-15.474, -23.17}, rotation = -35, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}}), Polygon(visible = true, origin = {16.162, 24.036}, rotation = -35, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, -9}, {5, 5}, {-5, 5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ProportionalSwitching;
