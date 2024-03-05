within BusinessSimulation.CausalLoop;

model StockInformation "Provide amount in stock information"
  import BusinessSimulation.Units.*;
  extends Interfaces.Basics.OutputTypeChoice;
  Interfaces.Connectors.StockInfoInput stockInfoInput "StockInfo input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealOutput y "Output of type OutputType" annotation(Placement(visible = true, transformation(origin = {161.619, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Sensors.AbsoluteSensor absoluteSensor annotation(Placement(visible = true, transformation(origin = {-100, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(stockInfoInput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-124.5, 0}, points = {{-20.5, 0}, {20.5, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor.stock, y) annotation(Line(visible = true, origin = {16.405, 2.476}, points = {{-112.405, 2.475}, {-16.405, 2.476}, {-16.405, -2.476}, {145.214, -2.476}}, color = {1, 37, 163}));
  /* block,  information processing */
  annotation(defaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the current amount in the stock whose <code>stockInfoOutput</code> is connected to the component's <code>stockInfoInput</code> connector.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.RateInformation\">RateInformation</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-67.179, 0}, points = {{-29.696, 0}, {-14.815, 0}, {-12.821, 0}}, color = {128, 0, 128}, thickness = 2), Line(visible = true, origin = {-50.304, 0}, points = {{-29.696, 0}, {-5.422, 0}, {0.304, 0}}, color = {0, 0, 128}, thickness = 2)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end StockInformation;
