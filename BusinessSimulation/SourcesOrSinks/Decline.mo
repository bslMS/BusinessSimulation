within BusinessSimulation.SourcesOrSinks;

model Decline "A stock is drained at a given rate"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.Sink;
  Interfaces.Connectors.RealInput u if not hasConstantRate "Rate of decline given as exogenous input" annotation(Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter OutputType rate = unspecified "Constant rate of decline (optional)" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean hasConstantRate = false "= true, if the constant rate is used instead of an exogenous input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Converters.ConstantConverter parConstantRate(value = rate) if hasConstantRate "Constante rate of decline (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition decreasing "Process of linear delince" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Cloud cloud "System boundary" annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(not hasConstantRate or rate < inf, "Parameter rate needs to be specified");
  connect(massPort, decreasing.portA) annotation(Line(visible = true, origin = {85, 0}, points = {{75, 0}, {-75, 0}}, color = {128, 0, 128}));
  connect(decreasing.y2, y) annotation(Line(visible = true, origin = {52.625, 12.5}, points = {{-42.125, -17.5}, {-32.625, -17.5}, {-32.625, 17.5}, {107.375, 17.5}}, color = {1, 37, 163}));
  connect(decreasing.y2, y1) annotation(Line(visible = true, origin = {52.625, 32.5}, points = {{-42.125, -37.5}, {-32.625, -37.5}, {-32.625, 37.5}, {107.375, 37.5}}, color = {1, 37, 163}));
  connect(decreasing.y2, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  connect(parConstantRate.y, decreasing.u) annotation(Line(visible = true, origin = {-32.18, 50}, points = {{-74.359, 20}, {37.18, 20}, {37.18, -40}}, color = {1, 37, 163}));
  connect(u, decreasing.u) annotation(Line(visible = true, origin = {-43.333, 30}, points = {{-96.667, 10}, {48.333, 10}, {48.333, -20}}, color = {1, 37, 163}));
  connect(decreasing.portB, cloud.massPort) annotation(Line(visible = true, origin = {-25, 0}, points = {{15, 0}, {-15, 0}}, color = {128, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>Decline</em> can be used to model&nbsp;an outflow from a stock into a sink with infinite capacity outside the border of the system in focus. The rate of flow can either be set by the real input <strong>u</strong> (<code>hasConstantRate = false</code>) or by the parameter <code>rate</code> (<code>hasConstantRate = true</code>).</p>
<h4>Notes</h4>
<ul>
<li>The rate of flow has to be&nbsp;non-negative as the connected stock should never be filled. A negative rate of flow will be set to zero internally.</li><br>
<li>If the connected stock might also be filled,&nbsp;&rarr;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExogenousChange\">ExogenousChange</a> should be used.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.Growth\">Growth</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExogenousChange\">ExogenousChange&nbsp;</a></p>
</html>", revisions = "<html>
<ul>
<li>Value for parameter set to <code>unspecified</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {25.628, -73.291}, textColor = {0, 0, 128}, extent = {{-48.638, -12}, {48.638, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Decline", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-5.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {41, -26.925}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Decline;
