within BusinessSimulation.Interfaces.Connectors;

expandable connector ExpandableStockPort "Expandable connector for stock ports"
  extends Icons.ExpandableStockPort;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Expandable connector to accomodate multiple stock ports.</p>
<h4>Notes</h4>
<p>While the <em>StockMultiPort</em> component is typically used to visually show the presence of an array of <code>StockPort</code>, this component is an <em>expandable connector</em> that is much more flexible.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockMultiPort\">StockMultiPort</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a></p>
</html>"));
end ExpandableStockPort;
