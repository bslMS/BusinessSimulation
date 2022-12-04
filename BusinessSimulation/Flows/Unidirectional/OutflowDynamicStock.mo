within BusinessSimulation.Flows.Unidirectional;

model OutflowDynamicStock "Outflow from a dynamic stock—the rate is set by the stock"
  import BusinessSimulation.Units.*;
  extends Interfaces.Basics.GenericFlow_Special;
  extends Icons.Outflow;
  extends Interfaces.Basics.ThreeSO_rate;
equation
  portA.rate = portA.data;
  portB.rate = -portA.rate;
  // report the rate of flow at Port A
  y = portA.rate;
  y1 = portA.rate;
  y2 = portA.rate;
  // outflow must never be negative and the stopInflow flag must not be true at portB
  assert(portA.rate >= 0, "Rate of outflow must never be negative", AssertionLevel.warning);
  assert(not portB.stopInflow, "There must not be capacity restrictions (stopInflow) for the stock at portB");
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>OutflowDynamicStock</em> can be used to model the outflow from a stock with inherent dynamic behavior (e.g., a conveyor or a higher-order delay). In these cases, the stock will set the flow and \"signal\" it via its &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort_Special\">StockPort_Special</a>.
&nbsp;</p>
<h4>Implementation</h4>
<p>Since neither negative outflows (after all, this is a unidirectional flow) nor preventing an outflow by \"stock control\" (e.g., the receiving stock at <code>portB</code> has <code>stopInflow = true</code>) are compatible with this flow element, the following <code>assert</code> conditions will have breaches of these conditions cause errors that will stop the simulation:</p>
<pre>assert(portA.rate &gt;= 0, \"Rate of outflow must never be negative\");<br>assert(not portB.stopInflow, \"There must not be capacity restrictions (stopInflow) for the stock at portB\");</pre>
<h4>Notes</h4>
<ul>
<li>The <code>OutflowDynamicStock</code> flow will not observe the <code>stopInflow</code> flag of a stock connected to the B-side port. This means that the receiving stock must have sufficient capacity for the mass flowing out and capacity restrictions have to be imposed by an explicit control structure.</li>
</ul>
<ul>
<li>To model a fractional outflow from a dynamic stock, <code>SplitOutflowDynamicStock</code> should be used.</li><br>
<li>To model a \"leak\" <code>SplitOutflowDynamicStock</code> can be used with some fraction of the outflow being directed into a &rarr;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.Cloud\">Cloud</a>.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\">SplitOutflowDynamicStock<br></a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Outflow", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end OutflowDynamicStock;
