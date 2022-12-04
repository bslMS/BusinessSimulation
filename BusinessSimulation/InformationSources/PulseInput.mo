within BusinessSimulation.InformationSources;

model PulseInput "Generate pulse or pulse-train signal of real input"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.PartialConverters.InformationSource_SO;
  parameter OutputType offset = 0 "Offset of output signal y";
  parameter Time startTime = 0 "Output y = offset for time < startTime";
  parameter OutputType amplitude = 1 "Amplitude of pulse (with regard to offset)";
  parameter Real width(final min = small, final max = 100) = 50 "Width of pulse in % of period";
  parameter Time period(final min = small, start = 1) "Timespan for one period";
  parameter Integer nperiod = -1 "Number of periods (< 0 means infinite number of periods)";
protected
  Modelica.Blocks.Sources.Pulse pulse(offset = offset, startTime = startTime, amplitude = amplitude, width = width, period = period, nperiod = nperiod) annotation(Placement(visible = true, transformation(origin = {0.863, 0}, extent = {{-55.863, -55.863}, {55.863, 55.863}}, rotation = 0)));
equation
  connect(pulse.y, y) annotation(Line(visible = true, origin = {111.156, 0}, points = {{-48.844, 0}, {48.844, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real <em>output</em> <strong>y</strong> is a <em>pulse</em> signal&nbsp;&rarr; <a href=\"modelica://Modelica.Blocks.Sources.Pulse\">Modelica.Blocks.Sources.Pulse</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInput\">ConstantInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.StepInput\">StepInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.RampInput\">RampInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.SineInput\">SineInput</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-17.67, 4.296}, points = {{-30, -24.296}, {0, -24.296}, {0, 24.296}, {30, 24.296}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0), Line(visible = true, origin = {16.467, 4.296}, points = {{30, -24.296}, {0, -24.296}, {0, 24.296}, {-30, 24.296}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PulseInput;
