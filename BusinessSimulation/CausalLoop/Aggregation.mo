within BusinessSimulation.CausalLoop;

model Aggregation "Generalized mean function for multiple stock information inputs"
  import BusinessSimulation.Interfaces.Connectors.{StockInfoMultiInput,StockInfoOutput};
  import BusinessSimulation.Types.AggregateFunctions;
  import BusinessSimulation.Types.StockInformation;
  import BusinessSimulation.Sensors.AbsoluteSensor;
  import BusinessSimulation.MoleculesOfStructure.InformationProcessing.AggregatePerformance;
  StockInfoMultiInput[nin] stockInfoInput annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StockInfoOutput stockInfoOutput annotation(Placement(visible = true, transformation(origin = {152.054, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer nin(min = 2) = 2 "Number of inputs" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter AggregateFunctions func = AggregateFunctions.arithmeticMean "Function to apply for aggregation" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real weights[nin] = ones(nin) "Constant weights to be used for aggregation";
protected
  StockInformation aggregateStockInformation "Aggregate stock information";
  AbsoluteSensor[nin] absoluteSensor annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AggregatePerformance aggregateIN(nin = nin, func = func, useWeights = true, hasConstantWeights = true, weights = weights, redeclare replaceable type OutputType = Units.Rate) annotation(Placement(visible = true, transformation(origin = {-0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AggregatePerformance aggregateS(nin = nin, func = func, useWeights = true, hasConstantWeights = true, weights = weights, redeclare replaceable type OutputType = Types.Reals) annotation(Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AggregatePerformance aggregateMRT(nin = nin, func = func, useWeights = true, hasConstantWeights = true, weights = weights, redeclare replaceable type OutputType = Units.Time) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AggregatePerformance aggregateF(nin = nin, func = func, useWeights = true, hasConstantWeights = true, weights = weights, redeclare replaceable type OutputType = Units.Rate) annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AggregatePerformance aggregateOUT(nin = nin, func = func, useWeights = true, hasConstantWeights = true, weights = weights, redeclare replaceable type OutputType = Units.Rate) annotation(Placement(visible = true, transformation(origin = {-0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(stockInfoInput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-124.5, 0}, points = {{-20.5, 0}, {20.5, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor.inFlow, aggregateIN.u) annotation(Line(visible = true, origin = {-54.6, 28.607}, points = {{-41.4, -18.607}, {19.6, -18.607}, {19.6, 41.393}, {43.6, 41.393}}, color = {1, 37, 163}));
  connect(absoluteSensor.stock, aggregateS.u) annotation(Line(visible = true, origin = {-41.75, 17.476}, points = {{-54.25, -12.524}, {11.75, -12.524}, {11.75, 12.524}, {30.75, 12.524}}, color = {1, 37, 163}));
  connect(absoluteSensor.meanResidenceTime, aggregateMRT.u) "aggregateMRT" annotation(Line(visible = true, origin = {-69.25, -0.012}, points = {{-26.75, -0.012}, {-15.75, -0.012}, {-15.75, 0.012}, {58.25, 0.012}}, color = {1, 37, 163}));
  connect(absoluteSensor.netFlow, aggregateF.u) annotation(Line(visible = true, origin = {-41.75, -17.512}, points = {{-54.25, 12.488}, {11.75, 12.488}, {11.75, -12.488}, {30.75, -12.488}}, color = {1, 37, 163}));
  connect(absoluteSensor.outFlow, aggregateOUT.u) annotation(Line(visible = true, origin = {-56.266, -38}, points = {{-39.734, 28}, {21.266, 28}, {21.266, -32}, {45.266, -32}}, color = {1, 37, 163}));
  aggregateStockInformation = StockInformation(aggregateIN.y, aggregateS.y, aggregateMRT.y, aggregateF.y, aggregateOUT.y);
  stockInfoOutput = aggregateStockInformation;
  /* block,  information processing */
  annotation(defaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The component uses the selected aggreagation function <code>func</code> applying constant <code>weights</code> to aggregate each information (→<a href=\"modelica://BusinessSimulation.Types.StockInformation\"><code>StockInformation</code></a>) provided within the <code>nin</code> input connectors (<code>stockInfoInput[nin</code>). The output is given via a single <code>stockInfoOutput</code>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.AggregatePerformance\">MoleculesOfStructure.InformationProcessing.AggregatePerformance</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Aggregation_Info\">Aggregation_Info</a>
</p> 
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-43.644, 0}, points = {{-50, 0}, {50, 0}}, color = {128, 0, 128}, thickness = 1), Polygon(visible = true, origin = {34.528, -80}, lineColor = {128, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {-60.476, 80}, {-100, 60}, {-100, 100}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Aggregation;
