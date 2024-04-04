within BusinessSimulation.SourcesOrSinks;

final model Cloud "Reservoir (stock/level) with an infinite capacity"
  Interfaces.Connectors.StockPort massPort "Connector for cloud" annotation(Placement(visible = true, transformation(origin = {-148.461, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  pre(massPort.stopInflow) = false;
  pre(massPort.stopOutflow) = false;
equation
  massPort.stock = 0;
  massPort.stopInflow = false;
  massPort.stopOutflow = false;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <code>Cloud</code> is a reservoir (stock or level) with an infinite capacty. It is used at a system's border to provide a source for incoming or a sink for outgoing \"matter\".</p>
</html>", revisions = "<html>
<ul>
<li>Added <code>initial equation</code> section to initialize <code>pre</code> values for <code>Boolean</code> stockPort flags in v2.1.0.</li>
</ul>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {50, 0}, rotation = -90, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-50, 50}, {50, -50}}), Line(visible = true, origin = {50.361, -1.132}, points = {{-19.013, -1.251}, {-19.013, 5.61}, {-13.146, 10.097}, {-4.518, 6.3}, {3.107, -1.637}, {9.976, -6.855}, {16.533, -6.855}, {19.639, -3.018}, {19.639, 4.92}, {13.107, 11.132}, {6.525, 8.716}, {3.107, 3.145}, {-4.173, -6.855}, {-14.872, -8.539}, {-19.013, -1.251}, {-19.013, -1.251}}, color = {255, 0, 0}, thickness = 3, smooth = Smooth.Bezier)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Cloud;
