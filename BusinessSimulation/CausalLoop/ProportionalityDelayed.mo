within BusinessSimulation.CausalLoop;

model ProportionalityDelayed "Process driven by proportionality with additional exponential delay"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.StockInfoToFlow(hasRateOutput = false);
  parameter Real factor = 1 "Constant factor of proportionality";
  parameter Time delayTime(min = modelSettings.dt) = 1 "Average time of delay";
  parameter Integer ORD(min = 1) = 1 "Order of the exponential delay" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  Sensors.AbsoluteSensor absoluteSensor if hasRateOutput annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Proportionality link(coefficient = factor, hasFactor = false) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ExponentialDelay del(hasFactor = false, hasStockInfoOutput = hasRateOutput, ORD = ORD, delayTime = delayTime) annotation(Placement(visible = true, transformation(origin = {0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(del.portB, flowPort) annotation(Line(visible = true, origin = {77.5, -0}, points = {{-72.5, -0}, {72.5, 0}}, color = {128, 0, 128}));
  connect(stockInfoInput, link.stockInfoInput) annotation(Line(visible = true, origin = {-97.5, 0}, points = {{-47.5, 0}, {47.5, 0}}, color = {128, 0, 128}));
  connect(link.flowPort, del.portA) annotation(Line(visible = true, origin = {-22.5, 0}, points = {{-17.5, 0}, {17.5, 0}}, color = {128, 0, 128}));
  connect(del.stockInfoOutput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {0, 10.5}, points = {{0, -5.5}, {0, 5.5}}, color = {128, 0, 128}));
  connect(absoluteSensor.outFlow, y) annotation(Line(visible = true, origin = {51.978, 32}, points = {{-41.978, -8}, {-41.978, 8}, {109.867, 8}}, color = {1, 37, 163}));
  connect(absoluteSensor.outFlow, y1) annotation(Line(visible = true, origin = {70.521, -7.75}, points = {{-60.521, 31.75}, {-60.521, 47.75}, {-15.521, 47.75}, {-15.521, -32.25}, {91.562, -32.25}}, color = {1, 37, 163}));
  /* relation */
  annotation(defaultComponentName = "r", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>ProportionalityDelayed</em> compactly combines →<a href=\"modelica://BusinessSimulation.CausalLoop.Proportionality\"><code>Proportionality</code></a> with →<a href=\"modelica://BusinessSimulation.CausalLoop.ExponentialDelay\"><code>ExponentialDelay</code></a>.</p>
<h4>Notes</h4>
<p>There are no optional input connectors for this component. If exogenous inputs (e.g., factors) are needed, then <code>Proportionality</code> and <code>ExponentialDelay</code> have to be used in combination.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ElasticityDelayed\">ElasticityDelayed</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-65, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%factor", fontName = "Lato"), Text(visible = true, origin = {-30, -30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "ø %delayTime", fontName = "Lato"), Line(visible = true, origin = {-118.463, -15}, points = {{5, 5}, {1.821, 5}, {-2.796, -6.74}, {-8.074, 0.021}, {-2.961, 6.618}, {1.162, -5}, {5, -5}}, color = {128, 0, 128}, thickness = 2, smooth = Smooth.Bezier), Line(visible = true, origin = {-35, -6.667}, points = {{0, 16.667}, {0, -3.333}}, color = {128, 0, 128}, thickness = 2), Line(visible = true, origin = {-25, -6.667}, points = {{0, 16.667}, {0, -3.333}}, color = {128, 0, 128}, thickness = 2)}));
end ProportionalityDelayed;
