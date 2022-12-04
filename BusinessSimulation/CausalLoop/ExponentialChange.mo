within BusinessSimulation.CausalLoop;

model ExponentialChange "Exponential growth or decline process"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Interfaces.PartialCLD.SourceOrSink;
  extends SourceOrSink(hasConstantRate = true);
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Dialog(group = "Structural Parameters"));
protected
  SourcesOrSinks.ExponentialChange exponentiallyChanging(isCCR = isCCR) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(exponentiallyChanging.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(actualRate.y, exponentiallyChanging.u) annotation(Line(visible = true, origin = {-14, 20}, points = {{-18, 5}, {9, 5}, {9, -10}}, color = {1, 37, 163}));
  connect(exponentiallyChanging.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(exponentiallyChanging.y1, y1) annotation(Line(visible = true, origin = {63.146, -22.5}, points = {{-52.646, 17.5}, {-23.146, 17.5}, {-23.146, -17.5}, {98.937, -17.5}}, color = {1, 37, 163}));
  /* process */
  annotation(defaultComponentName = "p", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the →<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialChange\"><code>ExponentialChange</code></a> component from the <code>SourcesOrSinks</code> package, this component allows to model exponential change at either a constant fractional <code>rate</code> or at an exogneous rate given by the input <code>u_rate</code>.</p>
<p>The process by default is active over the whole simulation run, but can be restricted to an <em>on-off period</em> using <code>tc = TimingChoices.period</code> and the parameters <code>startTime</code> and <code>stopTime</code>. Any given rate—<code>rate</code> or <code>u_rate</code>—can be <em>modified</em> by multiplication with an optionally given input <strong>u</strong>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/ExponentialChange/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.LinearChange\">LinearChange</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.LogisticGrowth\">LogisticGrowth</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-40, 14}, textColor = {0, 128, 0}, extent = {{-20, -12}, {20, 12}}, textString = "exp", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExponentialChange;
