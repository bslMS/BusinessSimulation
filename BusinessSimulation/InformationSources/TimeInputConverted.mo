within BusinessSimulation.InformationSources;

block TimeInputConverted "Clock to provide time-signal in a different time base"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.TimeBases;
  extends Icons.InformationSourceIndicator;
  extends Icons.Clockface_white;
  extends Icons.ConverterName;
  Interfaces.Connectors.RealOutput y(final quantity = "Time", final unit = clockTimeBaseUnit) annotation(Placement(visible = true, transformation(origin = {160, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Time offset = modelSettings.modelStartTime "Offset of output signal y given in seconds (default = modelStartTime)";
  parameter Time startTime = modelSettings.modelStartTime "Output y = offset for time <= startTime (default = modelStartTime)";
  constant TimeBases clockTimeBase = TimeBases.seconds "TimeBase for the output signal" annotation(Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  constant String clockTimeBaseUnit = BusinessSimulation.Constants.timeBaseUnits[clockTimeBase] annotation(Dialog(enable = false, tab = "Initialization"));
  Modelica.Blocks.Sources.ContinuousClock contclock(offset = offset, startTime = startTime) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.TimeConversion timeConversion(timeBaseA = TimeBases.seconds, timeBaseB = clockTimeBase) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(timeConversion.u, contclock.y) annotation(Line(visible = true, origin = {41.813, 0}, points = {{20.813, 0}, {-20.813, -0}}, color = {0, 0, 127}));
  connect(timeConversion.y, y) annotation(Line(visible = true, origin = {118.681, 0}, points = {{-40.681, 0}, {0.319, 0}, {0.319, -0}, {41.319, -0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>output</em> <strong>y</strong> is a <em>time</em> signal (e.g., a clock)&nbsp;&rarr; <a href=\"modelica:/Modelica.Blocks.Sources.ContinuousClock\">Modelica.Blocks.Sources.ContinuousClock</a>. The units for the output will here be a non-SIunit (e.g., <code>min, h, d, wk</code>, ...).</p>
<h4>Notes</h4>
<ul>
<li>To make components and models compatible with each other, time should <em>always</em> be in the SIunit <code>s</code>, while <code>displayUnit</code> is used to enter and present values in a different unit of time.</li><br>
<li>This component can be used to provide an output with a different `unit` of time instead of merely a different `displayUnit` of time. It should be used sparsely and with care.</li><br>
<li>This component will not be supported by Modelica tools in general, but has been tested to work with Wolfram System Modeler 14.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.TimeInput\">TimeInput</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Types.TimeBases\">TimeBases</a></p>
</html>", revisions = "<html>
<ul>
<li>Class adapted to be compliant with MSL 4.0.0 in v2.2.</li><br>
<li>Icon modified and will show component name in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, lineThickness = 4, extent = {{-60, -60}, {60, 60}}), Line(visible = true, origin = {-0, 11.889}, rotation = -300, points = {{-11.97, -6.911}, {22.989, -6.652}}, color = {255, 255, 255}, thickness = 1, arrowSize = 0), Line(visible = true, origin = {0, 13}, rotation = -300, points = {{12.863, 7.426}, {-12.863, -7.426}}, color = {255, 0, 0}, thickness = 2.5, arrowSize = 0), Line(visible = true, origin = {7, -6}, rotation = -300, points = {{0, 9.158}, {0, -9.158}}, color = {255, 0, 0}, thickness = 2.5, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TimeInputConverted;
