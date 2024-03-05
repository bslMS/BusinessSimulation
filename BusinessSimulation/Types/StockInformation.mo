within BusinessSimulation.Types;

record StockInformation "Record of information that can be collectecd from a stock"
  import BusinessSimulation.Units.{Time, Rate};
  Real infoLevel "Current Level of stock";
  Real infoInflow(min = 0) "Current rate of inflow";
  Real infoOutflow(min = 0) "Current rate of outflow";
  Real infoNetFlow(min = 0) "Net-rate of flow";
  Time infoMeanResidenceTime "Mean time of residence for elements in the stock (-1 indicates infinite time for zero outflow)";
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>A <em>record</em> of stock-related information. It groups that following variables:</p>
<table>
<tbody>
<tr>
<td><strong>Variable (Type)</strong></td>
<td>
<p><strong>Description</strong></p>
</td>
</tr>
<tr>
<td>infoLevel (Real)</td>
<td>
<p>Current amount in the stock or level</p>
</td>
</tr>
<tr>
<td>infoInflow (Rate)</td>
<td>
<p>Current rate of <em>total inflow</em> into stock</p>
</td>
</tr>
<tr>
<td>infoOutflow (Rate)</td>
<td>
<p>Current rate of <em>total outflow</em> from the stock</p>
</td>
</tr>
<tr>
<td>infoNetFlow (Rate)</td>
<td>
<p>Current <em>net-rate of flow</em> (&gt; 0 inflow, &lt; 0 outflow)</p>
</td>
</tr>
<tr>
<td>infoMeanResidenceTime (Time)&nbsp;</td>
<td>
<p>Current average&nbsp;<em>time of residence</em> for elements in the stock (if there is no outflow, -1 is to be reported)</p>
</td>
</tr>
</tbody>
</table>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.2, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, pattern = LinePattern.None, extent = {{-100, -100}, {100, 100}})}));
end StockInformation;
