within BusinessSimulation.Sensors;

model DynamicStockInfo "Collect basic stock-related information for stocks with implicit dynamics"
  extends Interfaces.Basics.GenericStockInfo_Special;
  Interfaces.Connectors.RealInput residenceTimeInfo "Provide residence time input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
protected
  Real totalFlow = inPort.rate + outPort.rate;
equation
  // dynamic stocks can only be filled via the inflow port and drained via the outflow port
  // report information
  y_stockInfo.infoLevel = levelInfo;
  y_stockInfo.infoInflow = inPort.rate;
  y_stockInfo.infoOutflow = -outPort.rate;
  y_stockInfo.infoNetFlow = totalFlow;
  y_stockInfo.infoMeanResidenceTime = residenceTimeInfo;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>DynamicStockInfo</em> is used inside stock components with inherent dynamic behavior (e.g., a &rarr;<a href=\"modelica://BusinessSimulation.Stocks.DelayN\">DelayN</a>) and will be connected to the matching&nbsp;outside connectors of a component to collect basic &rarr;<a href=\"modelica://BusinessSimulation.Types.StockInformation\">stock-related information </a>which will be passed as a record to the <code>StockInfoOutput</code> connector.</p>
<h4>Notes</h4>
<ul>
<li>The net flow will be <em>positive for a net inflow</em> and <em>negative for a net outflow</em>.</li><br>
<li>Since dynamic stocks set the rate of outflow, the residence time information will be directly&nbsp;provided by the <code>residenceTimeInfo</code> input connector.&nbsp;</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Sensors.AbsoluteSensor\">AbsoluteSensor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Sensors.StockInfo\">StockInfo</a></p>
</html>", revisions = "<html>
<ul>
<li>Simplified equations in v2.2 as dynamic stocks can only be filled via inflow and drained via outflow port.</li><br>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DynamicStockInfo;
