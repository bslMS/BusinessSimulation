within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

model BasicOrientation "Assessing a system's performance and sustainability according to basic orientors"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.{BasicOrientors, AggregateFunctions};
  extends Icons.InformationProcessing;
  Interfaces.Connectors.RealMultiInput u_weights[nPerf] if not hasConstantWeights "Weights to be used for performance measurement" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealMultiInput u[BasicOrientors] "Basic orientors to monitor a system's sustainability" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_psy if hasSentinentBeings "Psychological needs indicator (optional)" annotation(Placement(visible = true, transformation(origin = {-145, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_perf(final unit = "1") "Aggregate performance score for the monitored system" annotation(Placement(visible = true, transformation(origin = {160, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_sus(final unit = "1") "Aggregate degree of sustainability for the monitored system" annotation(Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real[:] weights = ones(nPerf) "Weights for calculating a weighted average performance score (default = equal weights)" annotation(Dialog(enable = hasConstantWeights));
  parameter Boolean hasSentinentBeings = false "= true, if the system comprises sentinent beings with psychological needs" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantWeights = true "= true, if constant weights are to be used for performance aggregation" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter AggregateFunctions func = AggregateFunctions.arithmeticMean "Function to apply for aggregation (aggregatePerformance.func)";
protected
  constant Integer nOrientors = size(u, 1) "Number of basic orientors valid for any system";
  parameter Integer nPerf = if hasSentinentBeings then nOrientors + 1 else nOrientors "Number of orientors used for perfomance calculation" annotation(Evaluate = true, Dialog(group = "Initialization", enable = false));
  AggregatePerformance aggregatePerformance(useWeights = true, hasConstantWeights = false, nin = nPerf, func = func) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough sustainabilityNonSentinent if not hasSentinentBeings "Sustainability score for systems without sentinent beings" annotation(Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Min sustainabilitySentinent if hasSentinentBeings "Sustainability score for systems with sentinent beings" annotation(Placement(visible = true, transformation(origin = {10, -65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.ConstantConverter parWeights(redeclare final type OutputType = Dimensionless, final value = weights) if hasConstantWeights "Weights for performance score" annotation(Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.Min basicSustainability(redeclare final type OutputType = Dimensionless, nin = nOrientors) "Sustainability score according to basic orientors" annotation(Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, basicSustainability.u) annotation(Line(visible = true, origin = {-101.5, -40}, points = {{-43.5, 0}, {43.5, 0}}, color = {0, 0, 128}));
  connect(basicSustainability.y, sustainabilityNonSentinent.u) annotation(Line(visible = true, origin = {-20, -40}, points = {{-22, 0}, {22, 0}}, color = {1, 37, 163}));
  connect(sustainabilityNonSentinent.y, y_sus) annotation(Line(visible = true, origin = {89, -40}, points = {{-71, 0}, {71, 0}}, color = {1, 37, 163}));
  connect(u_psy, sustainabilitySentinent.u1) annotation(Line(visible = true, origin = {-71.5, -60}, points = {{-73.5, 0}, {73.5, 0}}, color = {0, 0, 128}));
  connect(sustainabilitySentinent.y, y_sus) annotation(Line(visible = true, origin = {74.5, -52.5}, points = {{-56.5, -12.5}, {-14.5, -12.5}, {-14.5, 12.5}, {85.5, 12.5}}, color = {1, 37, 163}));
  connect(basicSustainability.y, sustainabilitySentinent.u2) annotation(Line(visible = true, origin = {-27.5, -55}, points = {{-14.5, 15}, {-7.5, 15}, {-7.5, -15}, {29.5, -15}}, color = {1, 37, 163}));
  connect(u, aggregatePerformance.u[1:6]) annotation(Line(visible = true, origin = {-94, 0}, points = {{-51, -40}, {-6, -40}, {-6, 40}, {63, 40}}, color = {0, 0, 128}));
  connect(u_psy, aggregatePerformance.u[7]) annotation(Line(visible = true, origin = {-84, -10}, points = {{-61, -50}, {4, -50}, {4, 50}, {53, 50}}, color = {0, 0, 128}));
  connect(parWeights.y, aggregatePerformance.u_weights) annotation(Line(visible = true, origin = {-51.333, 70.333}, points = {{-62.667, 9.667}, {31.333, 9.667}, {31.333, -19.333}}, color = {1, 37, 163}));
  connect(aggregatePerformance.y, y_perf) annotation(Line(visible = true, origin = {75.5, 40}, points = {{-84.5, 0}, {84.5, 0}}, color = {1, 37, 163}));
  connect(u_weights, aggregatePerformance.u_weights) annotation(Line(visible = true, origin = {-61.667, 57}, points = {{-83.333, 3}, {41.667, 3}, {41.667, -6}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Basic Orientation will provide two outputs: an aggregate performance score (<code>y_perf</code>) and a score indicating the <em>minimum sustainability</em> (<code>y_sus</code>) according to a set of basic orientor inputs <code>u</code>.</p>
<p>While a system is free to emphasize certain orientors over others (i.e., freedom in the choice of weights according to preferences/strategies), no system can excape the pressures put upon it from its environment and other systems therein. In a much cited report to the Balaton Group Hartmut Bossel [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">22</a>] identified <em>six basic orientors</em> that will guide a (living) systems' evolution in order to maintain viability [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">10</a>, p. 185]:</p>
<table>
<tbody>
<tr>
<td style=\"text-align: left;\"><strong>Basic Orientor</strong></td>
<td style=\"text-align: left;\"><strong>Description</strong></td>
</tr>
<tr>
<td style=\"text-align: left;\"><strong>EXISTENCE</strong></td>
<td style=\"text-align: left;\">The system must be compatible with, and able to exist in the normal environmental state. The information, energy, and material inputs necessary to sustain the system must be available.</td>
</tr>
<tr>
<td style=\"text-align: left;\"><strong>EFFECTIVENESS</strong></td>
<td style=\"text-align: left;\">The system should on balance (over the long-term) be effective (not necessarily efficient) in its efforts to secure scarce resources (information, matter, energy) from, and to exert influence on its environment.&nbsp;</td>
</tr>
<tr>
<td style=\"text-align: left;\"><strong>FREEDOM OF ACTION</strong></td>
<td style=\"text-align: left;\">The system must have the ability to cope in various ways with the challanges posed by environmental variety.&nbsp;</td>
</tr>
<tr>
<td style=\"text-align: left;\"><strong>SECURITY</strong></td>
<td style=\"text-align: left;\">The system must be able to protect itself from the detrimental effects of environmental variability, i.e., variable, fluctuating, and unpredictable conditions outside the normal environmental state.&nbsp;</td>
</tr>
<tr>
<td style=\"text-align: left;\"><strong>ADAPTABILITY</strong></td>
<td style=\"text-align: left;\">The system should be able to learn, adapt, and self-organize in order to generate more appropriate responses to challenges posed by environmental change.</td>
</tr>
<tr>
<td style=\"text-align: left;\"><strong>COEXISTENCE</strong></td>
<td style=\"text-align: left;\">The system must be able to modify its behavior to account for behavior and interestes (orientors) of other (actor) systems in its environment.&nbsp;</td>
</tr>
</tbody>
</table>
<p>Each of the six basic dimensions highlights a necessary aspect of viability, that cannot be compensated by a good score in another dimension. Accordingly, the sustainability score according to the inputs for the basic orientors will be aggregated using the <em>min</em> operator. fo further details, see [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">10</a>, Chapter 4].</p>
<h4>Notes</h4>
<ul>
<li>Bossel additionally points out, that next to <em>environment-determined</em> orientors, there are <em>system-determined</em> orientors (i.e., reproduction, psychological needs, and responsibility). The discussion can be limited to the six orientors from above plus psychological needs for systems containing sentinent beings [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">10</a>, pp. 185-186].</li><br>
<li>It is advisable to work with dimensionless indicator scores on the closed unit interval, where a score of 0 indicates unsustainable performance, while a score of 1 would indicate the best possible performance. (This also conicides with the notion, that all continuous utility functions can be limited to the closed unit interval without loss of generality.)</li><br>
<li>The basic orientors have to be operationalized in any real application and a lot of though has to go into finding fitting indicators (which may \"load\" onto different orientors at the same time). For systems that are made up of subsystems, a subsystem's viability impact upon the total system's viability has to be considered explicitly.</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.AggregatePerformance\">AggregatePerformance</a>,
<a href=\"modelica://BusinessSimulation.Converters.Lookup.PerformanceIndicator\">PerformanceIndicator</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DmnlInput\">DmnlInput</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Basic", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Orientation", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BasicOrientation;
