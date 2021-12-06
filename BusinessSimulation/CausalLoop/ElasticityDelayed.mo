within BusinessSimulation.CausalLoop;

model ElasticityDelayed "Process driven by elasticity and additional exponential delay"
  import BusinessSimulation.Units.Time;
  extends Interfaces.PartialCLD.StockInfoToFlow(hasRateOutput = false);
  parameter Real elasticity = 1 "Constant elasticity";
  parameter Time delayTime(min = modelSettings.dt) = 1 "Average time of delay";
  parameter Integer ORD(min = 1) = 1 "Order of the exponential delay" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
  Sensors.AbsoluteSensor absoluteSensor if hasRateOutput annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Elasticity link(hasFactor = false, isCCR = true, coefficient = elasticity) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ExponentialDelay del(hasFactor = false, hasStockInfoOutput = hasRateOutput, ORD = ORD, delayTime = delayTime) annotation(Placement(visible = true, transformation(origin = {0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(stockInfoInput, link.stockInfoInput) annotation(Line(visible = true, origin = {-97.5, 0}, points = {{-47.5, 0}, {47.5, 0}}, color = {128, 0, 128}));
  connect(link.flowPort, del.portA) annotation(Line(visible = true, origin = {-22.5, -0}, points = {{-17.5, 0}, {17.5, -0}}, color = {128, 0, 128}));
  connect(del.portB, flowPort) annotation(Line(visible = true, origin = {77.5, -0}, points = {{-72.5, -0}, {72.5, 0}}, color = {128, 0, 128}));
  connect(del.stockInfoOutput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {0, 10.5}, points = {{0, -5.5}, {0, 5.5}}, color = {128, 0, 128}));
  connect(absoluteSensor.outFlow, y) annotation(Line(visible = true, origin = {60.615, 34.667}, points = {{-50.615, -10.667}, {-50.615, 5.333}, {101.23, 5.333}}, color = {1, 37, 163}));
  connect(absoluteSensor.outFlow, y1) annotation(Line(visible = true, origin = {60.785, 4.8}, points = {{-50.785, 19.2}, {-50.785, 35.2}, {-0.785, 35.2}, {-0.785, -44.8}, {101.298, -44.8}}, color = {1, 37, 163}));
  /* relation */
  annotation(defaultComponentName = "r", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>ElasticityDelayed</em> compactly combines →<a href=\"modelica://BusinessSimulation.CausalLoop.Elasticity\"><code>Elasticity</code></a> with →<a href=\"modelica://BusinessSimulation.CausalLoop.ExponentialDelay\"><code>ExponentialDelay</code></a>.</p>
<h4>Notes</h4>
<p>There are no optional input connectors for this component. If exogenous inputs (e.g., factors) are needed, then <code>Elasticity</code> and <code>ExponentialDelay</code> have to be used in combination.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ProportionalityDelayed\">ProportionalityDelayed</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-65, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%elasticity", fontName = "Lato"), Text(visible = true, origin = {-30, -30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "ø %delayTime", fontName = "Lato"), Line(visible = true, origin = {-35, -6.667}, points = {{0, 16.667}, {0, -3.333}}, color = {128, 0, 128}, thickness = 2), Line(visible = true, origin = {-25, -6.667}, points = {{0, 16.667}, {0, -3.333}}, color = {128, 0, 128}, thickness = 2)}));
end ElasticityDelayed;
