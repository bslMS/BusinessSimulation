within BusinessSimulation.CausalLoop;

model RateInformation "Provide rate of net flow information"
  import BusinessSimulation.Units.*;
  extends Interfaces.Basics.OutputTypeChoice;
  Interfaces.Connectors.StockInfoInput stockInfoInput "StockInfo input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealOutput y "Output of type OutputType" annotation(Placement(visible = true, transformation(origin = {161.619, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Sensors.AbsoluteSensor absoluteSensor annotation(Placement(visible = true, transformation(origin = {-100, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(stockInfoInput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-124.5, 0}, points = {{-20.5, 0}, {20.5, 0}}, color = {128, 0, 128}));
  /* block,  information processing */
  connect(absoluteSensor.netFlow, y) annotation(Line(visible = true, origin = {5.934, -2.512}, points = {{-101.934, -2.512}, {-85.934, -2.488}, {-85.934, 2.512}, {155.685, 2.512}}, color = {1, 37, 163}));
  annotation(defaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the current rate of net flow to the stock whose <code>stockInfoOutput</code> is connected to the component's <code>stockInfoInput</code> connector.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.StockInformation\">StockInformation</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-67.179, 0}, points = {{-29.696, 0}, {-14.815, 0}, {-12.821, 0}}, color = {128, 0, 128}, thickness = 2), Line(visible = true, origin = {-50.304, 0}, points = {{-29.696, 0}, {-5.422, 0}, {0.304, 0}}, color = {0, 0, 128}, thickness = 2)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end RateInformation;
