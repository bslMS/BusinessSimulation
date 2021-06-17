within BusinessSimulation.InformationSources;

block RampInput "Generate ramp signal of real input"
  import BusinessSimulation.Units.Time;
  extends Interfaces.PartialConverters.InformationSource_SO;
  parameter OutputType offset = 0 "Offset of output signal y";
  parameter Time startTime = 0 "Output y = offset for time < startTime";
  parameter OutputType height = 1 "Height of ramp";
  parameter Time duration = 1 "Duration of ramp (0 gives step)";
protected
  Modelica.Blocks.Sources.Ramp ramp(final offset = offset, final startTime = startTime, final height = height, final duration = duration) annotation(Placement(visible = true, transformation(origin = {1.356, 0}, extent = {{-48.644, -48.644}, {48.644, 48.644}}, rotation = 0)));
equation
  connect(ramp.y, y) annotation(Line(visible = true, origin = {107.432, -0}, points = {{-52.568, -0}, {52.568, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real <em>output</em> <strong>y</strong> is a <em>ramp</em> signal&nbsp;&rarr; <a href=\"modelica://Modelica.Blocks.Sources.Ramp\">Modelica.Blocks.Sources.Ramp</a>.</p>
<h4>Notes</h4>
<p>If parameter duration is set to zero,&nbsp;the output will be a step signal.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInput\">ConstantInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.StepInput\">StepInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.PulseInput\">PulseInput</a>,&nbsp;<a href=\"modelica://BusinessSimulation.InformationSources.SineInput\">SineInput</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-1.364, 0}, points = {{-38.636, -24.296}, {-8.636, -24.296}, {9.463, 24.296}, {37.808, 24.296}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end RampInput;
