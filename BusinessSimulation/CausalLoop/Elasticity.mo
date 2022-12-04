within BusinessSimulation.CausalLoop;

model Elasticity "Fractional rate of change is proportional to that of the influencing stock"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.CoupledSourceOrSink;
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted (growing.isCCR)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  SourcesOrSinks.ExponentialChange exponentiallyChanging(isCCR = isCCR) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Division_Guarded fracGrowthRateStock(redeclare final type OutputType = Units.Rate) "Zero if divided by zero" annotation(Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 fracGrowthRate annotation(Placement(visible = true, transformation(origin = {-30, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(absoluteSensor1.stock, fracGrowthRateStock.u2) annotation(Line(visible = true, origin = {-103.5, 4.976}, points = {{-12.5, -0.024}, {-1.5, -0.024}, {-1.5, 0.024}, {15.5, 0.024}}, color = {1, 37, 163}));
  connect(actualCoefficient.y, fracGrowthRate.u1) annotation(Line(visible = true, origin = {-47.724, 32.5}, points = {{-7.225, 2.5}, {-2.276, 2.5}, {-2.276, -2.5}, {9.724, -2.5}}, color = {1, 37, 163}));
  connect(fracGrowthRateStock.y, fracGrowthRate.u2) annotation(Line(visible = true, origin = {-52.5, 15}, points = {{-19.5, -5}, {2.5, -5}, {2.5, 5}, {14.5, 5}}, color = {1, 37, 163}));
  connect(fracGrowthRate.y, exponentiallyChanging.u) annotation(Line(visible = true, origin = {-10.667, 20}, points = {{-11.333, 5}, {5.667, 5}, {5.667, -10}}, color = {1, 37, 163}));
  connect(exponentiallyChanging.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor1.netFlow, fracGrowthRateStock.u1) annotation(Line(visible = true, origin = {-101, 4.988}, points = {{-15, -10.012}, {1, -10.012}, {1, 10.012}, {13, 10.012}}, color = {1, 37, 163}));
  connect(exponentiallyChanging.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(exponentiallyChanging.y1, y1) annotation(Line(visible = true, origin = {63.146, -22.5}, points = {{-52.646, 17.5}, {-23.146, 17.5}, {-23.146, -17.5}, {98.937, -17.5}}, color = {1, 37, 163}));
  /* relation */
  annotation(defaultComponentName = "r", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>In a dynamic relation, a given <em>elasticity coefficient</em> (<code>coefficient</code>) implies that the fractional rate of change for an influenced stock <strong>B</strong> is proportional to the fractional rate of change for the influencing stock <strong>A</strong>, which is connected via the <code>stockInfoInput</code>. The factor of proportionality in this case is called the <a href=\"https://wiki2.org/en/Elasticity_(economics)+Brights.4\"><em>A-elasticity of B</em></a>. The rate of change for the stock <strong>B</strong> that is connected to the <code>flowPort</code> accordingly is given by the following equation, which uses <a href=\"https://wiki2.org/en/Newton%27s_notation+Brights.4#Newton's_notation\">Newton's dot notation</a> for rates:
<p><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/Elasticity/Formula.svg\" alt=\"Ḃ = ... \"></p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/Elasticity/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<ul>
<li>The given elasticity coefficient can optionally be multiplied by an exogenous input <strong>u</strong>.</li><br>
<li>By setting <code>coefficient = 1</code> the input <strong>u</strong> can be used to provide a variable elasticity coefficient.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ElasticityDelayed\">ElasticityDelayed</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Proportionality\">Proportionality</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.ProportionalityDelayed\">ProportionalityDelayed</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end Elasticity;
