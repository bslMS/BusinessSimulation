within BusinessSimulation.Interfaces.Connectors;

connector FlowPort_Special "Used to represent a flow connected to a dynamic stock that will set the rate of flow"
  Real data "Flow value to be observed by connected flow element";
  flow Rate rate "Flow that affects the stock";
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {-5, 5}, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-55, -55}, {55, 55}}), Text(visible = true, origin = {0, 90}, textColor = {128, 128, 128}, extent = {{-100, -12}, {100, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>FlowPort_Special&nbsp;</em>is the corresponding connector to the <em>StockPort_Special</em> and will only connect to these. While usually the rate of flow is determined by a flow component, in the case of dynamic stocks (e.g., higher order delays) the rate of outflow will be determined by the stock component and transmitted to the connected flow using the variable <code>data</code>.&nbsp;</p>
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
<h4>Acknowledgements</h4>
<p>The <code>FlowPort_Special</code> connector class is used as <code>MassPortF</code> &nbsp;by Peter Junglas for his approach to SystemDynamics modeling [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">18</a>, Chapter 12] (see <a href=\"http://www.peter-junglas.de/fh/simulation/systemdynamics.html\">here</a>&nbsp;for a System Dynamics Modelica library published by Peter Junglas) and has been simplified for the Business Simulation library.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort_Special\">StockPort_Special</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Rectangle(visible = true, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, -80}, {80, 80}})}));
end FlowPort_Special;
