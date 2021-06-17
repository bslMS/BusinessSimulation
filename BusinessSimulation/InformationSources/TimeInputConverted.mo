within BusinessSimulation.InformationSources;

block TimeInputConverted "Clock to provide time-signal in a different time base"
  extends Icons.InformationSourceIndicator;
  extends Icons.Clockface_white;
  import BusinessSimulation.Units.Time;
  import BusinessSimulation.Types.TimeBases;
  Interfaces.Connectors.RealOutput y(final unit = clockTimeBaseUnit, final quantity = "Time") annotation(Placement(visible = true, transformation(origin = {160, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Time offset = modelSettings.modelStartTime "Offset of output signal y given in seconds (default = modelStartTime)";
  parameter Time startTime = modelSettings.modelStartTime "Output y = offset for time <= startTime (default = modelStartTime)";
  parameter TimeBases clockTimeBase = TimeBases.seconds "TimeBase for the output signal" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  parameter String clockTimeBaseUnit = BusinessSimulation.Constants.timeBaseUnits[clockTimeBase] annotation(Evaluate = true, Dialog(enable = false, tab = "Initialization"));
  Modelica.Blocks.Sources.Clock clock(offset = offset, startTime = startTime) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.TimeConversion timeConversion(timeBaseA = TimeBases.seconds, timeBaseB = clockTimeBase) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(timeConversion.u, clock.y) annotation(Line(visible = true, origin = {41.813, 0}, points = {{20.813, 0}, {-20.813, -0}}, color = {0, 0, 127}));
  connect(timeConversion.y, y) annotation(Line(visible = true, origin = {118.681, 0}, points = {{-40.681, 0}, {0.319, 0}, {0.319, -0}, {41.319, -0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>output</em> <strong>y</strong> is a <em>time</em> signal (e.g. a clock)&nbsp;&rarr; <a href=\"modelica://Modelica.Blocks.Sources.Clock\">Modelica.Blocks.Sources.Clock</a>. The units for the output will here be a non-SIunit (e.g. <code>min, h, d, wk</code> etc.).</p>
<h4>Notes</h4>
<p>To make models compatible internally time will <em>always</em> be in the SIunit <code>s</code> while <code>displayUnit</code> is used to enter and present values in a different unit of time.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.TimeInput\">TimeInput</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Types.TimeBases\">TimeBases</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {0, 13}, rotation = -300, points = {{12.863, 7.426}, {-12.863, -7.426}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0), Line(visible = true, origin = {7, -6}, rotation = -300, points = {{0, 9.158}, {0, -9.158}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0), Line(visible = true, origin = {0, -8.842}, points = {{0, 9.158}, {0, -9.158}}, color = {255, 0, 0}, thickness = 2.5, arrowSize = 0), Line(visible = true, origin = {-13.853, -0}, rotation = -570, points = {{12.863, 7.426}, {-12.863, -7.426}}, color = {255, 0, 0}, thickness = 2.5, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TimeInputConverted;
