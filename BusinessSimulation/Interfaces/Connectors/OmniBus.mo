within BusinessSimulation.Interfaces.Connectors;

expandable connector OmniBus "Expandable connector for combined transport of matter or information"
  extends Icons.OmniBus;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>OmniBus</em> is an <em>expandable</em> <em>connector</em> that can contain input and output-connnectors (data) as well as stock and flow ports.</p>
<h4>Notes</h4>
<p>All <em>expandable connectors</em> can be connected to each other and will propagate variables and connectors contained within.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>, <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.DataBus\">DataBus</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.MultiPort\">MultiPort</a></p>
</html>", revisions = ""));
end OmniBus;
