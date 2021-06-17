within BusinessSimulation.Interfaces.Connectors;

expandable connector OmniBus "Expandable connector for combined mass and information transport pipelines"
  extends Icons.OmniBus;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>OmniBus</em> is an <em>expandable</em> <em>connector</em> that can contain input and output-connnectors (data) as well as Stock- and Flow-Ports.</p>
<h4>Notes</h4>
<p>All <em>expandable connectors</em> can be connected to each other and will propagate variables and connectors contained within.</p>
<h4>See also</h4>
<p><a href=\"modelica:///BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>, <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>,&nbsp;<a href=\"modelica:///BusinessSimulation.Interfaces.Connectors.DataBus\">DataBus</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.MultiPort\">MultiPort</a></p>
</html>", revisions = ""));
end OmniBus;
