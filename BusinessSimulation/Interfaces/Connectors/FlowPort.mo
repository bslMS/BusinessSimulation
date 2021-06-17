within BusinessSimulation.Interfaces.Connectors;

connector FlowPort "Used to represent stock and flow connections"
  import BusinessSimulation.Units.Rate;
  Real stock "The current amount of 'mass' in a connected stock";
  flow Rate rate "Flow that affects the stock";
  input Boolean stopInflow "= true, if nothing can flow into a connected stock";
  input Boolean stopOutflow "= true, if nothing can flow out of a connected stock";
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {-5, 5}, lineColor = {128, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-55, -55}, {55, 55}}), Text(visible = true, origin = {0, 90}, textColor = {128, 128, 128}, extent = {{-100, -12}, {100, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>FlowPort </em>is the counter part to the <em>StockPort&nbsp;</em>and contains&nbsp;an <em>acausal connector</em> with the <strong>Real potential</strong> variable <code>stock</code> indicating the stored amount in a connected reservoir and the <strong>Real flow</strong> variable <code>rate</code> indicating the rate of flow <em>into the connected stock</em>&nbsp;(<code>rate &lt; 0</code>) or <em>out of the connected stock</em> (<code>rate &gt; 0</code>).</p>
<p>There are also two <strong>Boolean input variables</strong>, which indicate whether draining the connected reservoir (<code>stopOutflow</code>) or filling it (<code>stopInflow</code>) is prohibited. These signals originate with the connected stock.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>.&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowMultiPort\">FlowMultiPort</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {128, 0, 128}, fillColor = {128, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Rectangle(visible = true, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, -80}, {80, 80}})}));
end FlowPort;
