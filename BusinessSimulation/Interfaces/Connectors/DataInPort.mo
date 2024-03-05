within BusinessSimulation.Interfaces.Connectors;

expandable connector DataInPort "Expandable connector for multiple inputs"
  extends Icons.DataInPort;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>A<em> DataBus</em>&nbsp;is an <em>expandable connector</em> for information inputs and outputs.</p>
<h4>Notes</h4>
<p>All <em>expandable connectors</em> can be connected to each other and will propagate variables and connectors contained within. Nevertheless, it is good practice in system dynamics modeling, to keep information and \"material\" networks separated from each other for clarity. Elements within a MultiPort should only be connected to elements in other&nbsp;<em>MultiPorts</em>, <em>FlowPorts</em> or <em>StockPorts</em>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>, <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>, <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.MultiPort\">MultiPort</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.OmniBus\">OmniBus</a></p>
</html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end DataInPort;
