within BusinessSimulation.InformationSources;

block TimeInput "Clock to provide time-signal"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.InformationSource_SO(redeclare final type OutputType = Time);
  extends Icons.Clockface_white;
  parameter Time offset = modelSettings.modelStartTime "Offset of output signal y (default = modelStartTime)";
  parameter OutputType startTime = modelSettings.modelStartTime "Output y = offset for time <= startTime (default = modelStartTime)";
  outer ModelSettings modelSettings;
protected
  final Modelica.Blocks.Sources.ContinuousClock contclock(offset = offset, startTime = startTime) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(contclock.y, y) annotation(Line(visible = true, origin = {90.5, 0}, points = {{-69.5, 0}, {69.5, 0}}, color = {1, 37, 163}));
  annotation(__Wolfram(itemFlippingEnabled = true), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>output</em> <strong>y</strong> is a <em>time</em> signal (e.g., a clock)&nbsp;&rarr; <a href=\"modelica:/Modelica.Blocks.Sources.ContinuousClock\">Modelica.Blocks.Sources.ContinuousClock</a>.</p>
<h4>Notes</h4>
<ul>
<li>Time should always be given in the SI base unit <code>s</code> so that models are compatible with those from other domains.</li><br>
<li>To provide a time signal in non-SI units (e.g., <code>min, h, d, wk</code>, ...), &rarr;<a href=\"modelica://BusinessSimulation.InformationSources.TimeInputConverted\">TimeInputConverted</a> may be used in rare cases.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.TimeInputConverted\">TimeInputConverted</a></p>
</html>", revisions = "<html>
<ul>
<li>Class adapted to be compliant with MSL 4.0.0 in v2.2.</li><br>
<li>Slightly modified Icon in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -18}, textColor = {255, 255, 255}, extent = {{-28.908, -12}, {28.908, 12}}, textString = "s", fontName = "Lato"), Line(visible = true, origin = {-0, 11.889}, rotation = -300, points = {{-11.97, -6.911}, {22.989, -6.652}}, color = {255, 0, 0}, thickness = 1, arrowSize = 0), Line(visible = true, origin = {0, 13}, rotation = -300, points = {{12.863, 7.426}, {-12.863, -7.426}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0), Line(visible = true, origin = {7, -6}, rotation = -300, points = {{0, 9.158}, {0, -9.158}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TimeInput;
