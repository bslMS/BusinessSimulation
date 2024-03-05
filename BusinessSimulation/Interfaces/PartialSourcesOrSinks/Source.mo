within BusinessSimulation.Interfaces.PartialSourcesOrSinks;

partial model Source "Inflow from a stock with infinite capacity"
  extends Basics.GenericSourceOrSink;
  extends Icons.Source;
protected
  // a positive rate will fill the stock - the elements rate should thus be negative following Modelica's rule for rates
  OutputType rate(min = 0);
equation
  assert(rate >= 0, "Rate must be positive", level = AssertionLevel.warning);
  // switch signs for setting the rate in accordance with Modelica's rule for rates
  // observe stock signals and constraints
  massPort.rate = Functions.constrainedRate(-max(rate, 0), massPort.stopInflow, massPort.stopOutflow);
  // report current rate of flow via output connectors
  // so that it may be used directly as exogenous rate by another source element (e.g., positive rate)
  y = -massPort.rate;
  y1 = -massPort.rate;
  y2 = -massPort.rate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial model extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.GenericSourceOrSink\">GenericSourceOrSink</a> base class. This partial class can be used to model <em>Source&nbsp;</em>components using equations to assign a value to the Real variable <code>rate</code>.</p>
<h4>Notes</h4>
<p>Only positive values should be assigned to <code>rate</code> and accordingly negative values will cause a warning.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-100, -100}, {100, 100}}), Line(visible = true, origin = {21.584, -10}, points = {{-48.416, 0}, {48.416, 0}}, color = {0, 128, 0}, thickness = 5), Line(visible = true, origin = {19.213, 8.274}, points = {{-46.013, 0}, {46.013, 0}}, color = {0, 128, 0}, thickness = 5), Rectangle(visible = true, origin = {-59.838, 0}, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, lineThickness = 2.5, extent = {{-32.838, -32.117}, {32.838, 32.117}}), Polygon(visible = true, origin = {72.114, -0.25}, rotation = -450, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-22.295, -7.943}, {22.191, -7.943}, {0.104, 15.886}}), Ellipse(visible = true, origin = {21.899, 0}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-15.107, -15.107}, {15.107, 15.107}}), Text(visible = true, origin = {22.487, 1}, textColor = {255, 255, 255}, extent = {{-16.513, -12.307}, {16.513, 12.307}}, textString = "X", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-59.639, -1.461}, points = {{-19.013, -1.251}, {-19.013, 5.61}, {-13.146, 10.097}, {-4.518, 6.3}, {3.107, -1.637}, {9.976, -6.855}, {16.533, -6.855}, {19.639, -3.018}, {19.639, 4.92}, {13.107, 11.132}, {6.525, 8.716}, {3.107, 3.145}, {-4.173, -6.855}, {-14.872, -8.539}, {-19.013, -1.251}, {-19.013, -1.251}}, color = {255, 0, 0}, thickness = 3, smooth = Smooth.Bezier)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Source;
