within BusinessSimulation.Sensors;

model DynamicStockInfo "Collect basic stock-related information for stocks with implicit dynamics"
  extends Interfaces.Basics.GenericStockInfo_Special;
  Interfaces.Connectors.RealInput residenceTimeInfo "Provide residence time input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
protected
  Real totalFlow = inPort.rate + outPort.rate;
  Real inflowInflow, inflowOutflow, outflowInflow, outflowOutflow;
equation
  // separate the flows
  inflowInflow = if noEvent(inPort.rate > 0) then inPort.rate else 0;
  inflowOutflow = if noEvent(inPort.rate < 0) then -inPort.rate else 0;
  outflowInflow = if noEvent(outPort.rate > 0) then outPort.rate else 0;
  outflowOutflow = if noEvent(outPort.rate < 0) then -outPort.rate else 0;
  // report information
  y_stockInfo.infoLevel = levelInfo;
  y_stockInfo.infoInflow = inflowInflow + outflowInflow;
  y_stockInfo.infoOutflow = inflowOutflow + outflowOutflow;
  y_stockInfo.infoNetFlow = totalFlow;
  y_stockInfo.infoMeanResidenceTime = residenceTimeInfo;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>DynamicStockInfo</em> is used inside stock components with inherent dynamic behavior (e.g. a &rarr;<a href=\"modelica://BusinessSimulation.Stocks.DelayN\">DelayN</a>) and will be connected to the matching&nbsp;outside connectors of a component to collect basic &rarr;<a href=\"modelica://BusinessSimulation.Types.StockInformation\">stock-related information </a>which will be passed as a record to the <code>StockInfoOutput</code> connector.</p>
<h4>Notes</h4>
<ul>
<li>The rates of inflow and outflow are determined by looking at the net flows at each <code>StockPort</code>—for this to be meaningful known inflows and outflows should be connected to the designated <code>inflow</code> and <code>outflow</code> ports of a stock. If a bi-flow is connected to a stock's port, then no other flow component should be connected to that port.</li><br>
<li>The net flow will be <em>positive for a net inflow</em> and <em>negative for a net outflow</em>.</li><br>
<li>Since dynamic stocks set the rate of outflow, the residence time information will be directly&nbsp;provided by the <code>residenceTimeInfo</code> input connector.&nbsp;</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Sensors.AbsoluteSensor\">AbsoluteSensor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Sensors.StockInfo\">StockInfo</a></p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DynamicStockInfo;
