within BusinessSimulation.Interfaces.Connectors;

connector StockPort_Special "Used to represent a dynamic stock that will set the rate of the connected flow"
  import BusinessSimulation.Units.Rate;
  Real data "Rate of flow to be observed by connected flow element";
  flow Rate rate "Flow that affect the stock";
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {-5, 5}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-55, -55}, {55, 55}}), Text(visible = true, origin = {0, 90}, textColor = {128, 128, 128}, extent = {{-100, -12}, {100, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>StockPort_Special&nbsp;</em>is typically used for a <em>dynamic stock</em>, e.g. a stock with some kind of internal behavior (e.g. a higher-order delay, a conveyor or an oven). While usually the rate of flow is determined by flow elements, here the real variable <code>data</code> is most often used to signal the value of flow to the flow element, as the rate of flow is determined by the stock - not the flow - in that case.</p>
<p>It has the following connectors:</p>
<table style=\"height: 174px;\" width=\"624\">
<tbody>
<tr><th style=\"text-align: left;\">CONNECTOR</th><th style=\"text-align: left;\">TYPE</th><th style=\"text-align: left;\">DESCRIPTION</th></tr>
<tr>
<td>data</td>
<td>Real</td>
<td>
<p>Rate of flow to be observed by connected flow element</p>
</td>
</tr>
<tr>
<td>rate (flow)</td>
<td>Real</td>
<td>
<p>Flow that affects the stock</p>
</td>
</tr>
</tbody>
</table>
<p><em>StockPort_Sepcial connectors</em> will only connect to <em>FlowPort_Special</em> connectors.</p>
<h4>Acknowledgements</h4>
<p>The <code>StockPort_Special</code> connector was used&nbsp;by Peter Junglas as <code>MassPortR</code> for his approach to SystemDynamics modeling [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">18</a>, Chapter 12] (see <a href=\"http://www.peter-junglas.de/fh/simulation/systemdynamics.html\">here</a>&nbsp;for a SystemDynamics Modelica library published by Peter Junglas) and has been simplified for the Business Simulation library.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort_Special\">FlowPort_Special</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, -100}, {100, 100}}), Rectangle(visible = true, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-80, -80}, {80, 80}})}));
end StockPort_Special;
