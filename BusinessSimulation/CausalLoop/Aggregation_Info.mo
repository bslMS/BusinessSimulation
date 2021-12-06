within BusinessSimulation.CausalLoop;

model Aggregation_Info "Generalized mean function for multiple information inputs"
  import BusinessSimulation.Types.AggregateFunctions;
  import BusinessSimulation.MoleculesOfStructure.InformationProcessing.AggregatePerformance;
  extends Interfaces.PartialCLD.InfoAggregation;
  parameter AggregateFunctions func = AggregateFunctions.arithmeticMean "Function to apply for aggregation" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real weights[nin] = ones(nin) "Constant weights to be used for aggregation";
protected
  AggregatePerformance aggregateInformation(nin = nin, func = func, useWeights = true, hasConstantWeights = true, weights = weights, redeclare replaceable type OutputType = Units.Dimensionless) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, aggregateInformation.u) annotation(Line(visible = true, origin = {-78, 0}, points = {{-67, 0}, {67, 0}}, color = {0, 0, 128}));
  connect(aggregateInformation.y, y) annotation(Line(visible = true, origin = {86.543, 0}, points = {{-75.543, 0}, {75.543, 0}}, color = {1, 37, 163}));
  /* block,  information processing */
  annotation(ddefaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is obtained by applying the selected aggregation function <code>func</code> with constant weights to <code>nin</code> inputs <strong>u</strong><code>[nin]</code>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.AggregatePerformance\">MoleculesOfStructure.InformationProcessing.AggregatePerformance</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Aggregation\">Aggregation</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-43.644, 0}, points = {{-50, 0}, {50, 0}}, color = {0, 0, 128}, thickness = 1), Polygon(visible = true, origin = {34.528, -80}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {-60.476, 80}, {-100, 60}, {-100, 100}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Aggregation_Info;
