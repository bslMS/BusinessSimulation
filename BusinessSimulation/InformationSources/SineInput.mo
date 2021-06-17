within BusinessSimulation.InformationSources;

block SineInput "Generate sine wave as input signal"
  import BusinessSimulation.Units.Time;
  import Modelica.SIunits.{Frequency,Angle};
  extends Interfaces.PartialConverters.InformationSource_SO;
  parameter OutputType offset = 0 "Offset of output signal y";
  parameter Time startTime = 0 "Output y = offset for time < startTime";
  parameter OutputType amplitude = 1 "Amplitude of sine wave (with regard to offset)";
  parameter Time period(min = 0.001) = 1 "Period of sine wave (= 1/freqHz)";
  parameter Angle phase = 0 "Phase of sine wave";
protected
  final Modelica.Blocks.Sources.Sine sine(offset = offset, startTime = startTime, amplitude = amplitude, freqHz = 1 / period, phase = phase) annotation(Placement(visible = true, transformation(origin = {1.413, -0}, extent = {{-46.413, -46.413}, {46.413, 46.413}}, rotation = 0)));
equation
  assert(period > 0., "Period must be greater than zero");
  connect(sine.y, y) annotation(Line(visible = true, origin = {106.234, 0}, points = {{-53.766, 0}, {53.766, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real <em>output</em> <strong>y</strong> is a <em>sine</em> signal&nbsp;&rarr; <a href=\"modelica://Modelica.Blocks.Sources.Sine\">Modelica.Blocks.Sources.Sine</a>.</p>
<h4>Notes</h4>
<p>A <em>cosine</em> input signal can be simply achieved by using a SineInput with a phase of 90&deg;.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInput\">ConstantInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.StepInput\">StepInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.RampInput\">RampInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.PulseInput\">PulseInput</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-3.666, -2.761}, points = {{-38.911, 1.472}, {-28.911, 27.793}, {-14.004, 36.075}, {-2.224, 22.761}, {4.77, -23.743}, {20.599, -31.106}, {33.666, -17.239}, {38.269, 3.313}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0, smooth = Smooth.Bezier)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SineInput;
