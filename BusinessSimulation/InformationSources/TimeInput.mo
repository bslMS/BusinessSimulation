within BusinessSimulation.InformationSources;

block TimeInput "Clock to provide time-signal"
  import BusinessSimulation.Units.Time;
  extends Interfaces.PartialConverters.InformationSource_SO(redeclare final type OutputType = Time);
  extends Icons.Clockface_white;
  parameter Time offset = modelSettings.modelStartTime "Offset of output signal y (default = modelStartTime)";
  parameter OutputType startTime = modelSettings.modelStartTime "Output y = offset for time <= startTime (default = modelStartTime)";
  outer ModelSettings modelSettings;
protected
  final Modelica.Blocks.Sources.Clock clock(offset = offset, startTime = startTime) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(clock.y, y) annotation(Line(visible = true, origin = {90.5, 0}, points = {{-69.5, 0}, {69.5, 0}}, color = {1, 37, 163}));
  annotation(__Wolfram(itemFlippingEnabled = true), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>output</em> <strong>y</strong> is a <em>time</em> signal (e.g., a clock)&nbsp;&rarr; <a href=\"modelica://Modelica.Blocks.Sources.Clock\">Modelica.Blocks.Sources.Clock</a>.</p>
<h4>Notes</h4>
<p>Time will always be given in the SIunit <code>s</code> so that models are compatible with those from other domains. To provide a time signal in non SIunits (e.g., <code>min, h, d, wk</code> etc.) <em>TimeInputConverted</em> should be used.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.TimeInputConverted\">TimeInputConverted</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {0, 13}, rotation = -300, points = {{12.863, 7.426}, {-12.863, -7.426}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0), Line(visible = true, origin = {7, -6}, rotation = -300, points = {{0, 9.158}, {0, -9.158}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TimeInput;
