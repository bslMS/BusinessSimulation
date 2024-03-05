within BusinessSimulation.MoleculesOfStructure.Blocks;

block ExperienceCurve "Unit cost degression due to gaining experience"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Interfaces.Basics.OutputTypeChoice;
  extends OutputTypeChoice;
  extends Icons.SubsystemBlock;
  Interfaces.Connectors.RealInput u "Input of output the cumulation of which triggeres learning" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y "Costs, productivity, defects etc. being affected by experience" annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType initialCost = 1 "Inial value of cost, time, defects etc. being affected by experience";
  parameter Dimensionless learningRate(min = -1, max = 1) = 0.2 "Learning rate (LR) stating the relative reduction for each doubling of cumulated production";
  parameter OutputType costLimit(min = 0) = 0 "Minimum or maximum cost level (depending on sign of learning rate), which is not to be exceeded" annotation(Dialog(enable = hasLimit));
  parameter Boolean hasCumulatedInput = false "= true, if input u is cumulated production value; false, if u is the current production value" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasLimit = false "= true, if output y will not be below the given limit or exceed it" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  parameter Real initialProduction(fixed = false) "Value to be used for initialization of the implicit stock" annotation(Dialog(enable = false, tab = "Initialization"));
  parameter Real valReferenceProduction = if hasCumulatedInput == true and initialProduction >= 1 then initialProduction else 1 "Initialize reference production" annotation(Dialog(enable = false, tab = "Initialization"));
  parameter Real b = if learningRate < 1 then log(1 - learningRate) / log(2) else 0 "Exponent for experience effect calculation" annotation(Dialog(enable = false, tab = "Initialization"));
  Stocks.InformationLevel cumulatedProduction(init = BusinessSimulation.Types.InitializationOptions.FixedValue, initialValue = 1) if not hasCumulatedInput "Accumulated output driving learning" annotation(Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth producing if not hasCumulatedInput "Output generation" annotation(Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.Division normalizedOuput annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter referenceProduction(value = valReferenceProduction) "Reference level of output" annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Power effectLearning(hasConstantExponent = false) "Total effect of experience" annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.Max cumulatedOutput if hasCumulatedInput "Cumulated output driving learning if input  is already cumulated value" annotation(Placement(visible = true, transformation(origin = {-90, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter log2ProgressRatio(value = b) "Binary logarithm of progress ratio" annotation(Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 actualCosts "Actual level for influenced variable" annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter referenceCost(value = initialCost) "Initial level of influenced variable" annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter minCumProd(value = 1) if hasCumulatedInput "Minimum cumulated production" annotation(Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough unchanged if not hasLimit annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Clip ceiling(maxValue = costLimit, minValue = 0, hasConstantLimits = true) if hasLimit and learningRate < 0 "Do not exceed maximum value" annotation(Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Clip floor(minValue = costLimit, hasConstantLimits = true) if hasLimit and learningRate >= 0 "Do not go below minimum value" annotation(Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  initialProduction = u "Initialize  reference production to initial input";
equation
  connect(producing.massPort, cumulatedProduction.inflow) annotation(Line(visible = true, origin = {-90, 50}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(u, producing.u) annotation(Line(visible = true, origin = {-125, 13.333}, points = {{-20, -13.333}, {10, -13.333}, {10, 26.667}}, color = {0, 0, 128}));
  connect(cumulatedOutput.y, normalizedOuput.u1) annotation(Line(visible = true, origin = {-52.5, 2.5}, points = {{-29.5, -7.5}, {-7.5, -7.5}, {-7.5, -17.5}, {44.5, -17.5}}, color = {1, 37, 163}));
  connect(referenceProduction.y, normalizedOuput.u2) annotation(Line(visible = true, origin = {-25.5, -12.5}, points = {{-68.5, -47.5}, {5.5, -47.5}, {5.5, -12.5}, {17.5, -12.5}}, color = {1, 37, 163}));
  connect(cumulatedProduction.y1, normalizedOuput.u1) annotation(Line(visible = true, origin = {-36.875, 25}, points = {{-22.625, 20}, {-3.125, 20}, {-3.125, -40}, {28.875, -40}}, color = {1, 37, 163}));
  connect(log2ProgressRatio.y, effectLearning.u_exponent) annotation(Line(visible = true, origin = {28.667, -62.667}, points = {{-22.667, -17.333}, {11.333, -17.333}, {11.333, 34.667}}, color = {1, 37, 163}));
  connect(normalizedOuput.y, effectLearning.u) annotation(Line(visible = true, origin = {20, -20}, points = {{-12, 0}, {12, 0}}, color = {1, 37, 163}));
  connect(effectLearning.y, actualCosts.u2) annotation(Line(visible = true, origin = {60, -12.5}, points = {{-12, -7.5}, {0, -7.5}, {0, 7.5}, {12, 7.5}}, color = {1, 37, 163}));
  connect(referenceCost.y, actualCosts.u1) annotation(Line(visible = true, origin = {49.5, 22.5}, points = {{-43.5, 17.5}, {10.5, 17.5}, {10.5, -17.5}, {22.5, -17.5}}, color = {1, 37, 163}));
  connect(u, cumulatedOutput.u1) annotation(Line(visible = true, origin = {-121.5, 0}, points = {{-23.5, 0}, {23.5, 0}}, color = {0, 0, 128}));
  connect(minCumProd.y, cumulatedOutput.u2) annotation(Line(visible = true, origin = {-105.5, -20}, points = {{-8.5, -10}, {0.5, -10}, {0.5, 10}, {7.5, 10}}, color = {1, 37, 163}));
  connect(actualCosts.y, unchanged.u) annotation(Line(visible = true, origin = {95, 0}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(unchanged.y, y) annotation(Line(visible = true, origin = {139, 0}, points = {{-21, 0}, {21, 0}}, color = {1, 37, 163}));
  connect(actualCosts.y, ceiling.u) annotation(Line(visible = true, origin = {95, 15}, points = {{-7, -15}, {0, -15}, {0, 15}, {7, 15}}, color = {1, 37, 163}));
  connect(ceiling.y, y) annotation(Line(visible = true, origin = {132, 15}, points = {{-14, 15}, {-7, 15}, {-7, -15}, {28, -15}}, color = {1, 37, 163}));
  connect(actualCosts.y, floor.u) annotation(Line(visible = true, origin = {95, -15}, points = {{-7, 15}, {0, 15}, {0, -15}, {7, -15}}, color = {1, 37, 163}));
  connect(floor.y, y) annotation(Line(visible = true, origin = {132, -15}, points = {{-14, -15}, {-7, -15}, {-7, 15}, {28, 15}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p> The output <strong>y</strong> describes the input that is needed to produce one unit. The <a href = \"https://wiki2.org/en/Experience_curve_effects+Brights.4\">experience curve</a> describes the often observed empirical trend, that with every doubling in cumulated production, the effort or cost needed per unit (e.g., unit cost) will shrink by a constant percentage (<code>learningRate</code>), see Louwen and Subtil Lacerda [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">27</a>] for an introduction.</p>
<p>The output <strong>y</strong> is obtained by the following formula:</p>
<p><img src = \"modelica://BusinessSimulation/Resources/Images/MoleculesOfStructure/Blocks/ExperienceCurve/Formula.svg\" alt = \"Formula.svg\"></p>
<br>
<h4>Notes</h4>
<br>
<ul>
<li>If <code>hasCumulatedInput = true</code> the input <strong>u</strong> is assumed to be the cumulated value of production (N) and the initial production (N_0) is initialized with the initial value of <strong>u</strong> (unless <code>u < 1</code>, in which case the initial production is initialized to 1).</li><br>
<li>If <code>hasCumulatedInput = false</code> the input <strong>u</strong> is assumed to be the current rate of production which will be accumulated starting with <code>N_0 = 1</code>.</li><br>
<li>Optionally, a limit for the output value (<code>costLimit</code>) can be given. It will be either a floor (<code>learningRate >= 0</code>) or a ceiling (<code>learningRate < 0</code>).</li>.
</ul>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 0, 128}, extent = {{-100, -12}, {100, 12}}, textString = "Experience Curve", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {3.406, -40}, textColor = {0, 0, 128}, extent = {{-53.406, -6}, {53.406, 6}}, textString = "Cumulated Output", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-9.184, -30}, points = {{-46.394, 0}, {77.285, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-55.548, 15.857}, rotation = -270, points = {{-45.857, 0}, {34.143, 0}}, color = {128, 128, 128}, thickness = 1), Text(visible = true, origin = {-64.078, 47.363}, textColor = {0, 0, 128}, extent = {{-9.128, -6}, {9.128, 6}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-48.686, -32.099}, rotation = -90, points = {{-72.099, 1.709}, {-2.099, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Line(visible = true, origin = {2.099, 38.291}, points = {{-56.948, 1.709}, {-49.31, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Ellipse(visible = true, origin = {-55.199, 40}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Line(visible = true, origin = {-16.063, -7.873}, points = {{-31.7, 47.873}, {-12.374, 3.456}, {14.13, -12.127}, {70.728, -13.938}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Ellipse(visible = true, origin = {-46.903, -30}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-47, 40}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExperienceCurve;
