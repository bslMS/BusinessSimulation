within BusinessSimulation.SourcesOrSinks;

model Growth "A stock is filled at a given rate"
  import BusinessSimulation.Units.Rate;
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.Source;
  Interfaces.Connectors.RealInput u if not hasConstantRate "Rate of growth given as exogenous input" annotation(Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter OutputType rate = 0 "Constant rate of growth (optional)" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean hasConstantRate = false "= true, if the constant rate is used instead of an exogenous input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Converters.ConstantConverter parConstantRate(value = rate) if hasConstantRate "Constante rate of growth (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition growing(hasConstantRate = false) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Cloud cloud annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(cloud.massPort, growing.portA) annotation(Line(visible = true, origin = {-25, 0}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(growing.portB, massPort) annotation(Line(visible = true, origin = {79.167, 0}, points = {{-69.167, 0}, {69.167, 0}}, color = {128, 0, 128}));
  connect(growing.y, y1) annotation(Line(visible = true, origin = {56.667, 50.133}, points = {{-51.667, -39.733}, {-51.667, 19.867}, {103.333, 19.867}}, color = {0, 0, 127}));
  connect(growing.y, y) annotation(Line(visible = true, origin = {56.667, 23.467}, points = {{-51.667, -13.067}, {-51.667, 6.533}, {103.333, 6.533}}, color = {0, 0, 127}));
  connect(growing.y1, y2) annotation(Line(visible = true, origin = {-10.763, -28.5}, points = {{21.263, 23.5}, {30.763, 23.5}, {30.763, -21.5}, {170.763, -21.5}}, color = {0, 0, 127}));
  connect(parConstantRate.y, growing.u) annotation(Line(visible = true, origin = {-38.333, 50}, points = {{-66.667, 20}, {33.333, 20}, {33.333, -40}}, color = {1, 37, 163}));
  connect(u, growing.u) annotation(Line(visible = true, origin = {-50, 30}, points = {{-90, 10}, {45, 10}, {45, -20}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>Growth</em> can be used to model&nbsp;an inflow to a stock from a source with infinite capacity outside the border of the system in focus. The rate of flow can either be set by the real input <strong>u</strong> (<code>hasConstantRate = false</code>) or by the parameter <code>rate</code> (<code>hasConstantRate = true</code>).</p>
<h4>Notes</h4>
<ul>
<li>The rate of flow has to be&nbsp;non-negative as the connected stock should never be drained. A negative rate of flow will be set to zero internally by the component.</li><br>
<li>If the connected stock might also be drained,&nbsp;&rarr;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExogenousChange\">ExogenousChange</a> should be used.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.Decline\">Decline</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExogenousChange\">ExogenousChange&nbsp;</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Growth", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {14.095, -73.77}, textColor = {0, 0, 128}, extent = {{-34.095, -12}, {34.095, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-22.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {24, -26.925}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Growth;
