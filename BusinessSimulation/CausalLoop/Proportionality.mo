within BusinessSimulation.CausalLoop;

model Proportionality "Rate of change is proportional to that of the influencing stock"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.CoupledSourceOrSink;
protected
  SourcesOrSinks.ExogenousChange linearilyChanging annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 fracGrowthRate annotation(Placement(visible = true, transformation(origin = {-30, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(actualCoefficient.y, fracGrowthRate.u1) annotation(Line(visible = true, origin = {-47.724, 32.5}, points = {{-7.225, 2.5}, {-2.276, 2.5}, {-2.276, -2.5}, {9.724, -2.5}}, color = {1, 37, 163}));
  connect(fracGrowthRate.y, linearilyChanging.u) annotation(Line(visible = true, origin = {-10.667, 20}, points = {{-11.333, 5}, {5.667, 5}, {5.667, -10}}, color = {1, 37, 163}));
  connect(linearilyChanging.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor1.netFlow, fracGrowthRate.u2) annotation(Line(visible = true, origin = {-68.5, 7.488}, points = {{-47.5, -12.512}, {8.5, -12.512}, {8.5, 12.512}, {30.5, 12.512}}, color = {1, 37, 163}));
  connect(linearilyChanging.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(linearilyChanging.y1, y1) annotation(Line(visible = true, origin = {63.146, -22.5}, points = {{-52.646, 17.5}, {-23.146, 17.5}, {-23.146, -17.5}, {98.937, -17.5}}, color = {1, 37, 163}));
  /* relation */
  annotation(defaultComponentName = "r", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>Proportionality</em> expresses the fact that the rate of change for an influenced stock <strong>B</strong> is proportional to the net rate of change for an influencing stock <strong>A</strong>, which is connected via the <code>stockInfoInput</code>. The factor of proportionality <em>k</em> is given by the parameter <code>coefficient</code>. The rate of change for the stock <strong>B</strong> that is connected to the <code>flowPort</code> accordingly is given by the following equation, which uses Newton's dot notation for rates:
<p><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/Proportionality/Formula.svg\" alt=\"Ḃ = k · Ȧ \"></p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/Proportionality/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<ul>
<li>The given coefficient can optionally be multiplied by an exogenous input <strong>u</strong>.</li><br>
<li>By setting <code>coefficient = 1</code> the input <strong>u</strong> can be used to provide a variable factor of proportionality.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ProportionalityDelayed\">ProportionalityDelayed</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Elasticity\">Elasticity</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.ElasticityDelayed\">ElasticityDelayed</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-44.926, -15}, points = {{5, 5}, {1.821, 5}, {-2.796, -6.74}, {-8.074, 0.021}, {-2.961, 6.618}, {1.162, -5}, {5, -5}}, color = {0, 0, 128}, thickness = 2, smooth = Smooth.Bezier)}));
end Proportionality;
