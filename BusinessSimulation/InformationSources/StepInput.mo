within BusinessSimulation.InformationSources;

model StepInput "Generate a step signal of real input"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.InformationSource_SO;
  parameter OutputType offset = 0 "Offset of output signal y";
  parameter Time startTime = 0 "Output y = offset for time < startTime";
  parameter OutputType height = 1 "Height of step";
protected
  Modelica.Blocks.Sources.Step step(final offset = offset, final startTime = startTime, final height = height) annotation(Placement(visible = true, transformation(origin = {1.316, -0}, extent = {{-58.684, -58.684}, {58.684, 58.684}}, rotation = 0)));
equation
  connect(step.y, y) annotation(Line(visible = true, origin = {112.934, 0}, points = {{-47.066, 0}, {47.066, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The Real <em>output</em> <strong>y</strong> is a <em>step</em> signal. For more information &rarr; <a href=\"modelica:/Modelica.Blocks.Sources.Step\">Modelica.Blocks.Sources.Step</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInput\">ConstantInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.RampInput\">RampInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.PulseInput\">PulseInput</a>,&nbsp;<a href=\"modelica://BusinessSimulation.InformationSources.SineInput\">SineInput</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {0, 1.104}, points = {{-30, -24.296}, {0, -24.296}, {0, 24.296}, {30, 24.296}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end StepInput;
