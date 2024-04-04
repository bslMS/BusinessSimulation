within BusinessSimulation.Sensors;

model StockInfo "Collect basic stock-related information for basic stocks"
  extends Interfaces.Basics.GenericStockInfo;
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
  y_stockInfo.infoMeanResidenceTime = if noEvent(y_stockInfo.infoOutflow > 0) then levelInfo / y_stockInfo.infoOutflow else -1;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>StockInfo</em> is used inside stock components and will be connected to the matching&nbsp;outside connectors of a component to collect basic &rarr;<a href=\"modelica://BusinessSimulation.Types.StockInformation\">stock-related information </a>which will be passed as a record to the StockInfoOutput connector.</p>
<h4>Notes</h4>
<ul>
<li>The rates of inflow and outflow are determined by looking at the net flows at each <code>StockPort</code>—for this to be meaningful known inflows and outflows should be connected to the designated <code>inflow</code> and <code>outflow</code> ports of a stock. If a bi-flow is connected to a stock's port, then no other flow component should be connected to that port.</li><br>
<li>The net flow will be <em>positive for a net inflow</em> and <em>negative for a net outflow</em>.</li><br>
<li>The mean residence time will either be a specific value reported for a dynamic stock (e.g., the time of delay) or it will be determined by dividing the current amount in stock by the rate of outflow from the stock (see above note though). In case of no outflow a value of <code>-1</code> will be reported.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Sensors.AbsoluteSensor\">AbsoluteSensor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Sensors.DynamicStockInfo\">DynamicStockInfo</a></p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end StockInfo;
