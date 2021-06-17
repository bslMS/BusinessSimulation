within BusinessSimulation.SourcesOrSinks;

model ExogenousChange "A stock is filled or drained at a given rate"
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.SourceOrSink;
  extends Interfaces.Basics.SingleInput;
protected
  Flows.Bidirectional.Switching switching annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Cloud cloud annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(switching.portB, massPort) annotation(Line(visible = true, origin = {85, 0}, points = {{-75, 0}, {75, 0}}, color = {128, 0, 128}));
  connect(cloud.massPort, switching.portA) annotation(Line(visible = true, origin = {-15, 0}, points = {{-5, 0}, {5, 0}}, color = {128, 0, 128}));
  connect(switching.y, y1) annotation(Line(visible = true, origin = {54.667, 50.133}, points = {{-49.667, -39.733}, {-49.667, 19.867}, {105.333, 19.867}}, color = {0, 0, 127}));
  connect(switching.y, y) annotation(Line(visible = true, origin = {54.667, 23.467}, points = {{-49.667, -13.067}, {-49.667, 6.533}, {105.333, 6.533}}, color = {0, 0, 127}));
  connect(switching.y1, y2) annotation(Line(visible = true, origin = {69.237, -28.5}, points = {{-58.737, 23.5}, {30.763, 23.5}, {30.763, -21.5}, {90.763, -21.5}}, color = {0, 0, 127}));
  connect(u, switching.u) annotation(Line(visible = true, origin = {-50, 30}, points = {{-90, 10}, {45, 10}, {45, -20}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>ExogenousChange</em> can be used to model an inflow to a stock from a source or an outflow from a stock to a sink. In either case it is assumed, that the source or sink has infinite capacity and thus lies outside the border of the system in focus. By convention, a positive rate will fill the connected stock, while a negative rate will drain it. The rate of flow is determined by the real input <strong>u</strong>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.Growth\">Growth</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.Decline\">Decline</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {20, -75.803}, textColor = {0, 0, 128}, extent = {{-53.428, -12}, {53.428, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Change", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-15.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {31, -26.925}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExogenousChange;
