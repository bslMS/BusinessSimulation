within BusinessSimulation.CausalLoop;

model InputControl "Directly set information using a ramp input profile"
  import BusinessSimulation.Units.*;
  extends BusinessSimulation.Interfaces.Basics.OutputTypeChoice;
  RealOutput y annotation(Placement(visible = true, transformation(origin = {161.666, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType initialInput = 1.0 "Information input, i.e., the control's output, until the intervention starts";
  parameter OutputType finalInput "Information input, i.e., the control's output, when the intervention is completed";
  parameter Time startTime = modelSettings.modelStartTime "Start time for the intervention";
  parameter Time duration(min = 0) = 0 "Duration of the intervention";
  outer ModelSettings modelSettings;
protected
  InformationSources.RampInput rampInput(offset = initialInput, height = finalInput - initialInput, startTime = startTime, duration = duration) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rampInput.y, y) annotation(Line(visible = true, origin = {64.833, 0}, points = {{-96.833, 0}, {96.833, 0}}, color = {1, 37, 163}));
  /* control */
  annotation(defaultComponentName = "c", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>InputControl</em> is an InformationSource, whose output <strong>y</strong> is given by a →<a href=\"modelica://BusinessSimulation.InformationSources.RampInput\"><code>RampInput</code></a>. It  can be used to model some kind of intervention that changes an information input, which the component is connected to, from <code>initialInput</code> to <code>finalInput</code> in a linear fashion over a time span set by the parameter <code>duration</code> starting at <code>startTime</code>.</p>
<h4>Notes</h4>
<p>This component can be used to indicate interventions that set or change rates of processes (using optional input connectors) or goals, i.e., setpoints.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleControl\">SimpleControl</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.PID_Control\">PID_Control</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-30, -30}, {30, 30}}), Line(visible = true, origin = {-33.536, 16.464}, rotation = 45, points = {{-5, 0}, {15, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, extent = {{-5, -5}, {5, 5}}), Text(visible = true, origin = {-50, -50}, textColor = {0, 128, 0}, extent = {{-150, -12}, {150, 12}}, textString = "%name", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InputControl;
