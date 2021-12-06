within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

model AggregatePerformance "Aggregate the information received from a set of performance indicators"
  import BusinessSimulation.Types.AggregateFunctions;
  extends Interfaces.PartialConverters.InformationProcessing_SO(redeclare replaceable type OutputType = Units.Dimensionless);
  Interfaces.Connectors.RealMultiInput[nin] u "Vector of performance indicator inputs" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput[nin] u_weights if useWeights and not hasConstantWeights "Vector of weights (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Integer nin(min = 1) = 2 "Number of performance indicator inputs (length of input vector)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter AggregateFunctions func = BusinessSimulation.Types.AggregateFunctions.arithmeticMean "Function to apply for aggregation" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real[:] weights = ones(nin) "Constant weights to be used for performance inputs" annotation(Dialog(enable = useWeights and hasConstantWeights));
  parameter Boolean useWeights = false "= true, if the output is to be a weighted arithmetic mean" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantWeights = true "= true, if the weights are constant" annotation(Dialog(group = "Structural Parameters", enable = useWeights));
protected
  Converters.Vector.ConstantConverter parWeights(value = weights) if hasConstantWeights and useWeights "Constant weights" annotation(Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.ArithmeticMean arithAvgPerformance(useWeights = useWeights, hasConstantWeights = false, nin = nin, redeclare replaceable type OutputType = Units.Dimensionless) if func == AggregateFunctions.arithmeticMean "(Weighted) arithmetic mean" annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.GeometricMean geomAvgPerformance(nin = nin, useWeights = useWeights, hasConstantWeights = false, redeclare replaceable type OutputType = Units.Dimensionless) if func == AggregateFunctions.geometricMean "(Weighted) geometric mean" annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.Max maximumPerformance(nin = nin, redeclare replaceable type OutputType = Units.Dimensionless) if func == AggregateFunctions.maximum "Maximum of the performance inputs" annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.Min minimumPerformance(nin = nin, redeclare replaceable type OutputType = Units.Dimensionless) if func == AggregateFunctions.minimum "Minimum of the performance inputs" annotation(Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(parWeights.y, geomAvgPerformance.u_weights) annotation(Line(visible = true, origin = {-41.333, 69.333}, points = {{-42.667, 10.667}, {21.333, 10.667}, {21.333, -21.333}}, color = {1, 37, 163}));
  connect(u_weights, geomAvgPerformance.u_weights) annotation(Line(visible = true, origin = {-61.667, 56}, points = {{-83.333, 4}, {41.667, 4}, {41.667, -8}}, color = {0, 0, 128}));
  connect(u, arithAvgPerformance.u) annotation(Line(visible = true, origin = {-86.5, 0}, points = {{-58.5, 0}, {58.5, 0}}, color = {0, 0, 128}));
  connect(u, geomAvgPerformance.u) annotation(Line(visible = true, origin = {-83.25, 20}, points = {{-61.75, -20}, {3.25, -20}, {3.25, 20}, {55.25, 20}}, color = {0, 0, 128}));
  connect(u, maximumPerformance.u) annotation(Line(visible = true, origin = {-83.25, -20}, points = {{-61.75, 20}, {3.25, 20}, {3.25, -20}, {55.25, -20}}, color = {0, 0, 128}));
  connect(u, minimumPerformance.u) annotation(Line(visible = true, origin = {-83.25, -40}, points = {{-61.75, 40}, {3.25, 40}, {3.25, -40}, {55.25, -40}}, color = {0, 0, 128}));
  connect(geomAvgPerformance.y, y) annotation(Line(visible = true, origin = {67, 20}, points = {{-79, 20}, {-7, 20}, {-7, -20}, {93, -20}}, color = {1, 37, 163}));
  connect(arithAvgPerformance.y, y) annotation(Line(visible = true, origin = {74, 0}, points = {{-86, 0}, {86, 0}}, color = {1, 37, 163}));
  connect(maximumPerformance.y, y) annotation(Line(visible = true, origin = {67, -20}, points = {{-79, -20}, {-7, -20}, {-7, 20}, {93, 20}}, color = {1, 37, 163}));
  connect(minimumPerformance.y, y) annotation(Line(visible = true, origin = {67, -40}, points = {{-79, -40}, {-7, -40}, {-7, 40}, {93, 40}}, color = {1, 37, 163}));
  connect(parWeights.y, arithAvgPerformance.u_weights) annotation(Line(visible = true, origin = {-40.8, 41.6}, points = {{-43.2, 38.4}, {0.8, 38.4}, {0.8, -21.6}, {20.8, -21.6}, {20.8, -33.6}}, color = {1, 37, 163}));
  connect(u_weights, arithAvgPerformance.u_weights) annotation(Line(visible = true, origin = {-47, 33.6}, points = {{-98, 26.4}, {7, 26.4}, {7, -13.6}, {27, -13.6}, {27, -25.6}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is given by applying an <em>aggregate function</em> (e.g., →<a href=\"modelica://BusinessSimulation.Converters.Vector.Min\">Min</a>, →<a href=\"modelica://BusinessSimulation.Converters.Vector.GeometricMean\">GeometricMean</a>, →<a href=\"modelica://BusinessSimulation.Converters.Vector.ArithmeticMean\">ArithmeticMean</a>, →<a href=\"modelica://BusinessSimulation.Converters.Vector.Max\">Max</a>) to a set of performance indicator inputs <strong>u</strong>. Optionally a vector of weights can be given as constant <code>weights</code> or external input <code>u_weights</code>, so that <em>weighted averages</em> can be used.</p>
<h4>Notes</h4>
<ul>
<li>Since ultimately very different aspects of a system's performance need to be monitored, aggregated, and compared, it is advisable to use dimensionless performance scores—if possible in the closed unit interval [0,1] which generalizes the space of utility functions.<br><br></li>
<li>It it well established, that the following ordering holds in general: max(u) ≤ geometricMean(u) ≤ arithmeticMean(u) ≤ max(u)<br><br></li>
<li>If deficits in any of the inputs should not be easily compensatable by surplusses in other inputs, then the <em>geometric mean</em> should be preferred to the <em>arithmetic mean</em> (the minimum would obviously be the extreme case of any deficit dominating the calculation of an aggregate).
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.BasicOrientation\">BasicOrientation</a>,
<a href=\"modelica://BusinessSimulation.Converters.Lookup.PerformanceIndicator\">PerformanceIndicator</a>
</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Performance", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Aggregate", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end AggregatePerformance;
