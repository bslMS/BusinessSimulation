within BusinessSimulation.CausalLoop;

model SimpleInformationLevel "Information level for CLD-like modeling"
  extends Interfaces.PartialCLD.Stock;
protected
  Stocks.InformationLevel informationLevel(hasStockInfoOutput = true, initialValue = initialValue) annotation(Placement(visible = true, transformation(origin = {-0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(stockPort, informationLevel.inflow) annotation(Line(visible = true, origin = {-80, 0}, points = {{-70, -0}, {70, 0}}, color = {128, 0, 128}));
  connect(informationLevel.y_stockInfo, stockInfoOutput) annotation(Line(visible = true, origin = {81.584, 10.08}, points = {{-73.584, 0.32}, {-73.584, 9.92}, {38.416, 9.92}, {38.416, -10.08}, {70.337, -10.08}}, color = {128, 0, 128}));
  /* stock */
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is a simplified version of an →<a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\">InformationLevel</a>, i.e., a stock that can become negative.</p>
</p>Unlike a full <code>InformationLevel</code> this component only has a single <code>StockPort</code> to receive a flows (which will automatically added to a net flow) and <a href = \"modelica://BusinessSimulation.Types.StockInformation\"><code>StockInfoOutput</code></a> to report the amount in the stock and the net flow, which can be used to define induced change processes..</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleMaterialStock\">SimpleMaterialStock</a>
</p> 
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), defaultComponentName = "s", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SimpleInformationLevel;
