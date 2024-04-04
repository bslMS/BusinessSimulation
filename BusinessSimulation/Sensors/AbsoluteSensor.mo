within BusinessSimulation.Sensors;

model AbsoluteSensor "Reports basic stock–related information"
  extends Interfaces.Basics.GenericSensor;
equation
  stock = u_stockInfo.infoLevel;
  inFlow = u_stockInfo.infoInflow;
  outFlow = u_stockInfo.infoOutflow;
  netFlow = u_stockInfo.infoNetFlow;
  meanResidenceTime = u_stockInfo.infoMeanResidenceTime;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>AbsoluteSensor</em> connects to the <code>StockInfoOutput</code> connectors (<code>y_stockInfo</code>), which can be turned on and off). It reports the following information via its output connectors:</p>
<ul>
<li>current rate of <em>inflow</em> to the stock (&ge; 0)</li><br>
<li>current rate of <em>outflow</em> from the stock (&ge; 0)</li><br>
<li>current rate of<em> net flow<br><br></em></li>
<li><em>mean residence time</em> (amount in stock/net outflow)</li>
</ul>
<h4>Notes</h4>
<ul>
<li>The rates of inflow and outflow are determined by looking at the net flows at each <code>StockPort</code>—for this to be meaningful known inflows and outflows should be connected to the designated <code>inflow</code> and <code>outflow</code> ports of a stock. If a bi-flow is connected to a stock's port, then no other flow component should be connected to that port.</li><br>
<li>The net flow will be <em>positive for a net inflow</em> and <em>negative for a net outflow</em>.</li><br>
<li>The mean residence time will either be a specific value reported for a dynamic stock (e.g., the time of delay) or it will be determined by dividing the current amount in stock by the rate of outflow from the stock (see above note though). In case of no outflow a value of <code>-1</code> will be reported.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Sensors.StockInfo\">StockInfo</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Sensors.DynamicStockInfo\">DynamicStockInfo</a></p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end AbsoluteSensor;
