within BusinessSimulation.CausalLoop;

model LinearChange "Process of growth or decline at given rate"
  extends Interfaces.PartialCLD.SourceOrSink;
protected
  SourcesOrSinks.ExogenousChange linearlyChanging annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(linearlyChanging.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(actualRate.y, linearlyChanging.u) annotation(Line(visible = true, origin = {-14, 20}, points = {{-18, 5}, {9, 5}, {9, -10}}, color = {1, 37, 163}));
  connect(linearlyChanging.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(linearlyChanging.y1, y1) annotation(Line(visible = true, origin = {62.708, -22.5}, points = {{-52.208, 17.5}, {-22.708, 17.5}, {-22.708, -17.5}, {99.375, -17.5}}, color = {1, 37, 163}));
  /* process */
  annotation(defaultComponentName = "p", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the →<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExogenousChange\"><code>ExogenousChange</code></a> component from the <code>SourcesOrSinks</code> package, this component allows to model linear (additive) change at a given a constant <code>rate</code> or at an exogneous rate given by the input <code>u_rate</code>.</p>
<p>The process by default is active over the whole simulation run, but can be restricted to an <em>on-off period</em> using <code>tc = TimingChoices.period</code> and the parameters <code>startTime</code> and <code>stopTime</code>. Any given rate—<code>rate</code> or <code>u_rate</code>—can be <em>modified</em> by multiplication with an optionally given input <strong>u</strong>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/LinearChange/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ExponentialChange\">ExponentialChange</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.LogisticGrowth\">LogisticGrowth</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-40, 14}, textColor = {0, 128, 0}, extent = {{-20, -12}, {20, 12}}, textString = "lin", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LinearChange;
