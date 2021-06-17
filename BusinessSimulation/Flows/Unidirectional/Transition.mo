within BusinessSimulation.Flows.Unidirectional;

model Transition "Flow from stock A to stock B at a given rate"
  import BusinessSimulation.Units.Rate;
  extends Interfaces.PartialFlows.UnidirectionalFlow;
  parameter OutputType rate(min = 0) = 0 "Constant rate of transition (optional)" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean hasConstantRate = false "= true, if the parameter rate is to be used instead of the variable input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Interfaces.Connectors.RealInput u if not hasConstantRate "Rate input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Interfaces.Connectors.RealInput constantRate = rate if hasConstantRate "Conditional connector for constant rate input";
  Interfaces.Connectors.RealInput actualRate "Actual rate to use within the component";
equation
  connect(constantRate, actualRate);
  connect(u, actualRate);
  A_rate = actualRate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is the prototypical unidirectional flow of mass&nbsp;from stock A to stock B at a given rate. The rate can be either constant (<code>rate</code>) or given by the continuous input <strong>u</strong>.</p>
<h4>Notes</h4>
<p>Since this is a <em>unidirectional</em> flow the rate of flow will always be set to zero (causing an event) if the given rate of transition is a negative value.</p>
<p><strong>See also</strong></p>
<p><a href=\"modelica://BusinessSimulation.Flows.Bidirectional.Switching\">Switching</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Interaction.BrokenTransition\">BrokenTransition</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {4, -26.925}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Text(visible = true, origin = {-5.905, -73.77}, textColor = {0, 0, 128}, extent = {{-34.095, -12}, {34.095, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Transition", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Transition;
