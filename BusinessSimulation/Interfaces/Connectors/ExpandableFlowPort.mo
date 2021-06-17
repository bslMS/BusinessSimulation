within BusinessSimulation.Interfaces.Connectors;

expandable connector ExpandableFlowPort "Expandable connector for flow ports"
  extends Icons.ExpandableFlowPort;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Expandable connector to accomodate multiple flow ports.</p>
<h4>Notes</h4>
<p>While the <em>FlowMultiPort</em> component is typically used to visually show the presence of an array of <code>FlowPort</code>, this component is an <em>expandable connector</em> that is much more flexible.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowMultiPort\">FlowMultiPort</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a></p>
</html>"));
end ExpandableFlowPort;
