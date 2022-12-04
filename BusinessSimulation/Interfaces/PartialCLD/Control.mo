within BusinessSimulation.Interfaces.PartialCLD;

partial model Control "Partial model for control in CLD+ modeling"
  extends FlowPort(hasRateOutput = false);
  extends TimedSource;
  replaceable type SetpointType = Unspecified constrainedby Unspecified "Type choice for setpoint input" annotation(choicesAllMatching = true);
  // structural parameters
  parameter Boolean hasExogenousSetpoint = false "= true, if the setpoint is to be given by an input connector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  // setpoint regime
  parameter SetpointType initialSetpoint "Setpoint valid from modelStartTime to startTime" annotation(Dialog(enable = not hasExogenousSetpoint));
  parameter SetpointType finalSetpoint "Final setpoint valid from startTime + duration until the end of the simulation" annotation(Dialog(enable = not hasExogenousSetpoint));
  parameter Time startTime = modelSettings.modelStartTime "Start time for change of setpoint" annotation(Dialog(enable = not hasExogenousSetpoint));
  parameter Time duration(min = modelSettings.dt) = modelSettings.modelTimeHorizon "Time until final setpoint is reached" annotation(Dialog(enable = not hasExogenousSetpoint));
  Connectors.RealInput u if hasExogenousSetpoint "Setpoint input for controller" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  InformationSources.RampInput setpoint(offset = initialSetpoint, height = finalSetpoint - initialSetpoint, duration = duration, startTime = startTime) if not hasExogenousSetpoint "Ramp input determining the setpoint" annotation(Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor currentValue "Current value of connected stock" annotation(Placement(visible = true, transformation(origin = {120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(currentValue.flowPort, flowPort) annotation(Line(visible = true, origin = {130, 6.667}, points = {{-10, 13.333}, {-10, -6.667}, {20, -6.667}}, color = {128, 0, 128}));
  // assertions
  assert(offTime >= onTime, "The offTime should not be smaller than the onTime", level = AssertionLevel.warning);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is the basic class for <em>control</em> components, which typically set a flow to a stock under control, whose current level is measured by a sensor <code>currentValue.y</code>.</p>
<p>The class allows to use either a <code>RampInput</code> or an optional input connector <strong>u</strong> to provide <em>setpoint</em> information.</p>
<p>Timing choices can be given, which determin whether a <code>PulseInput</code> or a <code>ConstantConverter</code> is active.</p>
</html>", revisions = "<html>
<ul>
<li>Moved check for <code>offTime <= onTime</code> to an <code>assert</code> statement as to prevent the <code>min</code> attribute to be set by a parameter with <code>fixed = false</code> in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-30, -30}, {30, 30}}), Line(visible = true, origin = {-33.536, 16.464}, rotation = 45, points = {{-5, 0}, {15, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, extent = {{-5, -5}, {5, 5}}), Text(visible = true, origin = {-50, -60}, textColor = {0, 128, 0}, extent = {{-150, -12}, {150, 12}}, textString = "%name", fontName = "Lato")}));
end Control;
