within BusinessSimulation.Examples;

model SoftwareReleaseProject "Causal loop example given by van Zijderveld (MARVEL)"
  extends BusinessSimulation.Icons.Example;
  import BusinessSimulation.Units.Time;
  inner ModelSettings modelSettings(modelTimeHorizon(displayUnit = "yr") = 315360000, dt(displayUnit = "yr") = 7884000, modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.years, samplingPeriod.displayUnit = "yr") annotation(Placement(visible = true, transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real wCost = 1 "Weigth for cost performance" annotation(Dialog(group = "Performance"));
  parameter Real wQuality = 1 "Weigth for quality performance" annotation(Dialog(group = "Performance"));
  parameter Real wUsage = 1 "Weigth for usage performance" annotation(Dialog(group = "Performance"));
  parameter Real wk = 0.2 "Weak influence" annotation(Dialog(group = "Strength of Influence"));
  parameter Real av = 0.5 "Average influence" annotation(Dialog(group = "Strength of Influence"));
  parameter Real st = 1 "Strong influence" annotation(Dialog(group = "Strength of Influence"));
  parameter Real vs = 1.2 "Very strong influence" annotation(Dialog(group = "Strength of Influence"));
  parameter Time v4(displayUnit = "yr") = 7884000 "Very high speed" annotation(Dialog(group = "Speed of Influence"));
  parameter Time v3(displayUnit = "yr") = 15768000 "High speed" annotation(Dialog(group = "Speed of Influence"));
  parameter Time v2(displayUnit = "yr") = 31536000 "Average speed" annotation(Dialog(group = "Speed of Influence"));
  parameter Time v1(displayUnit = "yr") = 94608000 "Low speed" annotation(Dialog(group = "Speed of Influence"));
  parameter Boolean c1ActiveQ = true "= true, to activate the budget control" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean c2ActiveQ = false "= true, to activate the clear mandate control" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean c3ActiveQ = false "= true, to activate the management knowledge level control" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean c4ActiveQ = false "= true, to activate the management quality control" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Interfaces.Connectors.DataOutPort modelOutput "The model's performance output" annotation(Placement(visible = true, transformation(origin = {152.239, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  block AccumulatedPerformance "Weighted average performance per period"
    extends Interfaces.PartialCLD.Converter(nin = 3, redeclare replaceable type OutputType = Units.Dimensionless);
    parameter Real weights[nin] "Constant weights to be used for aggregation";
    InformationSources.TimeInput modelTime "Time into the simulation" annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Converters.Division_Guarded avgPerf "Average weighted performance score" annotation(Placement(visible = true, transformation(origin = {60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    MoleculesOfStructure.Incubators.Account cumPerf(redeclare replaceable type OutputType = Units.Dimensionless, hasNetRateInput = true) "Accumulated performance" annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    CausalLoop.Aggregation_Info avgWeightedPerformance(nin = nin, weights = weights) annotation(Placement(visible = true, transformation(origin = {-117.5, 0}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  equation
    connect(u, avgWeightedPerformance.u) annotation(Line(visible = true, origin = {-135, 0}, points = {{-10, 0}, {10, 0}}, color = {0, 0, 128}));
    connect(avgWeightedPerformance.y, cumPerf.u_plus) annotation(Line(visible = true, origin = {-42.25, -6.667}, points = {{-74.5, 6.667}, {37.25, 6.667}, {37.25, -13.333}}, color = {1, 37, 163}));
    connect(cumPerf.y, avgPerf.u1) annotation(Line(visible = true, origin = {17.333, -3.2}, points = {{-17.333, -16.4}, {-17.333, 8.2}, {34.667, 8.2}}, color = {1, 37, 163}));
    connect(modelTime.y, avgPerf.u2) annotation(Line(visible = true, origin = {53.5, -22.5}, points = {{18.5, -17.5}, {-8.5, -17.5}, {-8.5, 17.5}, {-1.5, 17.5}}, color = {1, 37, 163}));
    connect(avgPerf.y, y) annotation(Line(visible = true, origin = {115.042, -0}, points = {{-47.043, -0}, {47.043, 0}}, color = {1, 37, 163}));
    annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>From the inputs <strong>u[nin =3]</strong> a <em>weighted average</em> is calculated using <code>weights[nin]</code>. This average is then accumulated (<code>cumPerf</code>) and averaged over the period from <code>startTime</code> to current model time (<code>modelTime</code>) to obtain the output <strong>y</strong>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/SoftwareReleaseProject/AccumulatedPerformance/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
</html>"));
  end AccumulatedPerformance;
protected
  // visual commentary
  CausalLoop.MatFlowIndicator lab1 annotation(Placement(visible = true, transformation(origin = {-10, 28.446}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab2 annotation(Placement(visible = true, transformation(origin = {-107.604, 31.668}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab3 annotation(Placement(visible = true, transformation(origin = {-117.679, 42.977}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
  CausalLoop.MatFlowIndicator lab4 annotation(Placement(visible = true, transformation(origin = {-0, -20}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
  CausalLoop.MatFlowIndicator lab5 annotation(Placement(visible = true, transformation(origin = {19.49, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 270)));
  CausalLoop.MatFlowIndicator lab7 annotation(Placement(visible = true, transformation(origin = {52.667, 10}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
  CausalLoop.MatFlowIndicator lab8 annotation(Placement(visible = true, transformation(origin = {40, 16.707}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab9 annotation(Placement(visible = true, transformation(origin = {-30, 46.897}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab10 annotation(Placement(visible = true, transformation(origin = {75, 66.779}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab11 annotation(Placement(visible = true, transformation(origin = {129.624, 27}, extent = {{10, 10}, {-10, -10}}, rotation = 270)));
  CausalLoop.MatFlowIndicator lab12 annotation(Placement(visible = true, transformation(origin = {-18.016, -65.201}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab13 annotation(Placement(visible = true, transformation(origin = {-93.248, -14.165}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // variables (i.e., stocks)
  CausalLoop.SimpleInformationLevel budget(initialValue = 0.5) "Available budget" annotation(Placement(visible = true, transformation(origin = {-80, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel externalResources(initialValue = 0.7) "Available external resources" annotation(Placement(visible = true, transformation(origin = {-96.984, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel clearMandate(initialValue = 0.3) "Clear mandate assignment" annotation(Placement(visible = true, transformation(origin = {-126.752, -15}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel partiesInvolved(initialValue = 0.7) "Number of parties involved" annotation(Placement(visible = true, transformation(origin = {-105, -45}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel decisionSpeed(initialValue = 0.3) "Speed of decision making" annotation(Placement(visible = true, transformation(origin = {-75, -17}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel adHocDesignDecisions(initialValue = 0.7) "Number of adhoc design decisions" annotation(Placement(visible = true, transformation(origin = {-50, -45}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel designQuality(initialValue = 0.6) "Quality of software design" annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel swQuality(initialValue = 0.6) "Software quality" annotation(Placement(visible = true, transformation(origin = {30, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel swAcceptance(initialValue = 0.2) "Software acceptance" annotation(Placement(visible = true, transformation(origin = {60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel swUsage(initialValue = 0.1) "Software usage" annotation(Placement(visible = true, transformation(origin = {90, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel prodQuality(initialValue = 0.8) "Quality of production" annotation(Placement(visible = true, transformation(origin = {123.248, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel prodEfficiency(initialValue = 0.6) "Production efficiency" annotation(Placement(visible = true, transformation(origin = {93.272, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel costs(initialValue = 0.5) "Costs" annotation(Placement(visible = true, transformation(origin = {65, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel costEffectiveness(initialValue = 0.3) "Cost effectiveness" annotation(Placement(visible = true, transformation(origin = {95, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel changePressure(initialValue = 0.8) "Need to change" annotation(Placement(visible = true, transformation(origin = {135, 55}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel mgtKnowledgeLevel(initialValue = 0.2) "Management knowledge level" annotation(Placement(visible = true, transformation(origin = {-45, -1}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel decisionQuality(initialValue = 0.5) "Quality of decisions made" annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel swMgtOrgCapacity(initialValue = 0.4) "Software management organization capacity" annotation(Placement(visible = true, transformation(origin = {-15, 17}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel employees(initialValue = 0.8) "Number of employees" annotation(Placement(visible = true, transformation(origin = {17, -5}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel swResistance(initialValue = 0.7) "Resistance against software" annotation(Placement(visible = true, transformation(origin = {28, -15}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel mgtQuality(initialValue = 0.4) "Management quality" annotation(Placement(visible = true, transformation(origin = {40, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  // relations (impact)
  CausalLoop.ProportionalityDelayed r1(factor = +wk, delayTime(displayUnit = "yr") = v1) "External resrouces >> clear mandate" annotation(Placement(visible = true, transformation(origin = {-135, 5}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  CausalLoop.ProportionalityDelayed r2(factor = +wk, delayTime(displayUnit = "yr") = v2) "External resources >> management knowledge level" annotation(Placement(visible = true, transformation(origin = {-64, 7}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r3(factor = +av, delayTime(displayUnit = "yr") = v2) "External resources >> management quality" annotation(Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r4(factor = +av, delayTime(displayUnit = "yr") = v3) "External resources >> software management organization capacity" annotation(Placement(visible = true, transformation(origin = {-63, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r5(factor = +st, delayTime(displayUnit = "yr") = v3, hasRateOutput = false) "Budget >> external resources" annotation(Placement(visible = true, transformation(origin = {-100, 55}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r6(factor = -st, delayTime(displayUnit = "yr") = v3) "Clear mandate >> number of parties involved" annotation(Placement(visible = true, transformation(origin = {-118, -35}, extent = {{10, 10}, {-10, -10}}, rotation = -270)));
  CausalLoop.ProportionalityDelayed r7(factor = -vs, delayTime(displayUnit = "yr") = v3) "Costs >> cost effectiveness" annotation(Placement(visible = true, transformation(origin = {82.503, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r8(factor = +vs, delayTime(displayUnit = "yr") = v3) "Decision quality >> design quality" annotation(Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  CausalLoop.ProportionalityDelayed r9(factor = -av, delayTime(displayUnit = "yr") = v2) "Decision speed >> number of ad hoc design decisions" annotation(Placement(visible = true, transformation(origin = {-65, -35}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  CausalLoop.ProportionalityDelayed r10(factor = +av, delayTime(displayUnit = "yr") = v2) "Design quality >> software quality" annotation(Placement(visible = true, transformation(origin = {15, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r11(factor = +st, delayTime(displayUnit = "yr") = v4) "Management knowledge level >> decision quality" annotation(Placement(visible = true, transformation(origin = {-30, -15}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  CausalLoop.ProportionalityDelayed r12(factor = -wk, delayTime(displayUnit = "yr") = v2) "Management quality >> resistance against software" annotation(Placement(visible = true, transformation(origin = {50, -5.412}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  CausalLoop.ProportionalityDelayed r13(factor = +wk, delayTime(displayUnit = "yr") = v2) "Management quality >> software usage" annotation(Placement(visible = true, transformation(origin = {72.552, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r14(factor = +av, delayTime(displayUnit = "yr") = v2) "Change pressure >> budget" annotation(Placement(visible = true, transformation(origin = {-10, 45}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r15(factor = -av, delayTime(displayUnit = "yr") = v4) "Number of ad hoc design decisions >> design quality" annotation(Placement(visible = true, transformation(origin = {-25, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r16(factor = +av, delayTime(displayUnit = "yr") = v4) "Number of employees >> costs" annotation(Placement(visible = true, transformation(origin = {33, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r17(factor = -wk, delayTime(displayUnit = "yr") = v2) "Number of employees >> resistance against software" annotation(Placement(visible = true, transformation(origin = {28, -7.49}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  CausalLoop.ProportionalityDelayed r18(factor = -av, delayTime(displayUnit = "yr") = v3) "Number of parties involved >> decision speed" annotation(Placement(visible = true, transformation(origin = {-105, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  CausalLoop.ProportionalityDelayed r19(factor = -av, delayTime(displayUnit = "yr") = v2) "Production efficiency >> costs" annotation(Placement(visible = true, transformation(origin = {80, 15}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r20(factor = +av, delayTime(displayUnit = "yr") = v3) "Production quality >> cost effectiveness" annotation(Placement(visible = true, transformation(origin = {123.248, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  CausalLoop.ProportionalityDelayed r21(factor = +vs, delayTime(displayUnit = "yr") = v4) "Software acceptance >> software usage" annotation(Placement(visible = true, transformation(origin = {80, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r22(factor = -av, delayTime(displayUnit = "yr") = v3) "Number of parties involved >> design quality" annotation(Placement(visible = true, transformation(origin = {-64, -70}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r23(factor = +wk, delayTime(displayUnit = "yr") = v1) "Software management organization capacity >> software quality" annotation(Placement(visible = true, transformation(origin = {-3.016, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  CausalLoop.ProportionalityDelayed r24(factor = +av, delayTime(displayUnit = "yr") = v2) "Software quality >> software acceptance" annotation(Placement(visible = true, transformation(origin = {40, -65}, extent = {{10, 10}, {-10, -10}}, rotation = -270)));
  CausalLoop.ProportionalityDelayed r25(factor = -wk, delayTime(displayUnit = "yr") = v2) "Software usage >> number of employees" annotation(Placement(visible = true, transformation(origin = {65, -27.118}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r26(factor = +av, delayTime(displayUnit = "yr") = v3) "Software usage >> productive efficiency" annotation(Placement(visible = true, transformation(origin = {85, -5}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  CausalLoop.ProportionalityDelayed r27(factor = +av, delayTime(displayUnit = "yr") = v3) "Software usage >> production quality" annotation(Placement(visible = true, transformation(origin = {115, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r28(factor = -st, delayTime(displayUnit = "yr") = v2) "Production quality >> change pressure" annotation(Placement(visible = true, transformation(origin = {135, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  CausalLoop.ProportionalityDelayed r29(factor = -wk, delayTime(displayUnit = "yr") = v4) "Software usage >> resistance against software" annotation(Placement(visible = true, transformation(origin = {63, -15}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.ProportionalityDelayed r30(factor = -st, delayTime(displayUnit = "yr") = v4) "resistance against software >> software acceptance" annotation(Placement(visible = true, transformation(origin = {50, -55}, extent = {{10, 10}, {-10, -10}}, rotation = -270)));
  CausalLoop.ProportionalityDelayed r31(factor = +av, delayTime(displayUnit = "yr") = v4) "Software management organization capacity >> number of employees" annotation(Placement(visible = true, transformation(origin = {8.076, 7.13}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  // interventions (e.g., control)
  CausalLoop.SimpleControl c1(initialSetpoint = 0.8, finalSetpoint = 0.8, duration(displayUnit = "yr") = 315360000, adjTime(displayUnit = "yr") = 31536000) if c1ActiveQ annotation(Placement(visible = true, transformation(origin = {-90, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleControl c2(initialSetpoint = 0.7, finalSetpoint = 0.7, duration(displayUnit = "yr") = 315360000, adjTime(displayUnit = "yr") = 31536000, hasRateOutput = false) if c2ActiveQ annotation(Placement(visible = true, transformation(origin = {-135, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleControl c3(initialSetpoint = 0.5, finalSetpoint = 0.5, duration(displayUnit = "yr") = 315360000, adjTime(displayUnit = "yr") = 31536000, hasRateOutput = false) if c3ActiveQ annotation(Placement(visible = true, transformation(origin = {-45, -12.32}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  CausalLoop.SimpleControl c4(initialSetpoint = 0.6, finalSetpoint = 0.6, duration(displayUnit = "yr") = 315360000, adjTime(displayUnit = "yr") = 31536000) if c4ActiveQ annotation(Placement(visible = true, transformation(origin = {21.696, 35}, extent = {{-10, 10}, {10, -10}}, rotation = 360)));
  // performance (i.e., goals)
  CausalLoop.Performance usage(pol = "+", a = 0, b = 1) annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  CausalLoop.Performance quality(pol = "+", a = 0, b = 1) annotation(Placement(visible = true, transformation(origin = {135, -35}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  CausalLoop.Performance cost(pol = "+", a = 0, b = 1) annotation(Placement(visible = true, transformation(origin = {80, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 540)));
  AccumulatedPerformance totalPerformance(nin = 3, weights = {wCost, wQuality, wUsage}) "Mean weighted-average performance from startTime to currentTime" annotation(Placement(visible = true, transformation(origin = {127.5, -80}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
equation
  connect(externalResources.stockInfoOutput, r1.stockInfoInput) annotation(Line(visible = true, origin = {-117.5, 25}, points = {{20.516, 0}, {20.516, 5}, {-17.5, 5}, {-17.5, -10}}, color = {128, 0, 128}));
  connect(externalResources.stockInfoOutput, r2.stockInfoInput) annotation(Line(visible = true, origin = {-93, 17}, points = {{-3.984, 8}, {-3.984, 13}, {8, 13}, {8, -10}, {19, -10}}, color = {128, 0, 128}));
  connect(externalResources.stockInfoOutput, r3.stockInfoInput) annotation(Line(visible = true, origin = {-75, 28.333}, points = {{-21.984, -3.333}, {-21.984, 1.667}, {35, 1.667}}, color = {128, 0, 128}));
  connect(r3.flowPort, mgtQuality.stockPort) annotation(Line(visible = true, origin = {5, 30}, points = {{-35, 0}, {35, 0}}, color = {128, 0, 128}));
  connect(externalResources.stockInfoOutput, r4.stockInfoInput) annotation(Line(visible = true, origin = {-92, 21}, points = {{-4.984, 4}, {-4.984, 9}, {7, 9}, {7, -4}, {19, -4}}, color = {128, 0, 128}));
  connect(r4.flowPort, swMgtOrgCapacity.stockPort) annotation(Line(visible = true, origin = {-39, 17}, points = {{-24, 0}, {24, 0}}, color = {128, 0, 128}));
  connect(budget.stockInfoOutput, r5.stockInfoInput) annotation(Line(visible = true, origin = {-83.333, 53.333}, points = {{3.333, -3.333}, {3.333, 1.667}, {-6.667, 1.667}}, color = {128, 0, 128}));
  connect(r5.flowPort, externalResources.stockPort) annotation(Line(visible = true, origin = {-107.5, 37.5}, points = {{7.5, 17.5}, {-7.5, 17.5}, {-7.5, -17.5}, {10.516, -17.5}}, color = {128, 0, 128}));
  connect(r6.flowPort, partiesInvolved.stockPort) annotation(Line(visible = true, origin = {-113.667, -41.667}, points = {{-4.333, 6.667}, {-4.333, -3.333}, {8.667, -3.333}}, color = {128, 0, 128}));
  connect(clearMandate.stockInfoOutput, r6.stockInfoInput) annotation(Line(visible = true, origin = {-117.5, -12.5}, points = {{-9.252, 2.5}, {-9.252, 7.5}, {-0.5, 7.5}, {-0.5, -12.5}}, color = {128, 0, 128}));
  connect(costs.stockInfoOutput, r7.stockInfoInput) annotation(Line(visible = true, origin = {67.501, 33.333}, points = {{-2.501, -13.333}, {-2.501, 6.667}, {5.002, 6.667}}, color = {128, 0, 128}));
  connect(r7.flowPort, costEffectiveness.stockPort) annotation(Line(visible = true, origin = {88.751, 40}, points = {{-6.248, 0}, {6.249, 0}}, color = {128, 0, 128}));
  connect(decisionQuality.stockInfoOutput, r8.stockInfoInput) annotation(Line(visible = true, origin = {-15, -16.25}, points = {{-5, 1.25}, {-5, 6.25}, {5, 6.25}, {5, -13.75}}, color = {128, 0, 128}));
  connect(r8.flowPort, designQuality.stockPort) annotation(Line(visible = true, origin = {-6.667, -53.333}, points = {{-3.333, 13.333}, {-3.333, -6.667}, {6.667, -6.667}}, color = {128, 0, 128}));
  connect(decisionSpeed.stockInfoOutput, r9.stockInfoInput) annotation(Line(visible = true, origin = {-72.5, -12.901}, points = {{-2.5, 0.901}, {-2.5, 2.901}, {7.5, 2.901}, {7.5, -12.099}}, color = {128, 0, 128}));
  connect(r9.flowPort, adHocDesignDecisions.stockPort) annotation(Line(visible = true, origin = {-60, -41.667}, points = {{-5, 6.667}, {-5, -3.333}, {10, -3.333}}, color = {128, 0, 128}));
  connect(r10.flowPort, swQuality.stockPort) annotation(Line(visible = true, origin = {22.5, -40}, points = {{-7.5, 0}, {7.5, 0}}, color = {128, 0, 128}));
  connect(designQuality.stockInfoOutput, r10.stockInfoInput) annotation(Line(visible = true, origin = {1.667, -45}, points = {{-1.667, -10}, {-1.667, 5}, {3.333, 5}}, color = {128, 0, 128}));
  connect(mgtKnowledgeLevel.stockInfoOutput, r11.stockInfoInput) annotation(Line(visible = true, origin = {-38.599, 7.574}, points = {{-6.401, -3.574}, {-6.401, -0.846}, {8.599, -0.846}, {8.599, -12.574}}, color = {128, 0, 128}));
  connect(r11.flowPort, decisionQuality.stockPort) annotation(Line(visible = true, origin = {-26.667, -18.333}, points = {{-3.333, 3.333}, {-3.333, -1.667}, {6.667, -1.667}}, color = {128, 0, 128}));
  connect(mgtQuality.stockInfoOutput, r12.stockInfoInput) annotation(Line(visible = true, origin = {45, 34.605}, points = {{-5, 0.395}, {-5, 5.395}, {5, 5.395}, {5, -30.017}}, color = {128, 0, 128}));
  connect(mgtQuality.stockInfoOutput, r13.stockInfoInput) annotation(Line(visible = true, origin = {50, 11}, points = {{-10, 24}, {-10, 29}, {5, 29}, {5, -51}, {12.552, -51}}, color = {128, 0, 128}));
  connect(r14.flowPort, budget.stockPort) annotation(Line(visible = true, origin = {-45, 45}, points = {{35, 0}, {-35, 0}}, color = {128, 0, 128}));
  connect(r14.stockInfoInput, changePressure.stockInfoOutput) annotation(Line(visible = true, origin = {53.683, 52}, points = {{-53.683, -7}, {-23.683, -7}, {-23.683, 13}, {81.317, 13}, {81.317, 8}}, color = {128, 0, 128}));
  connect(r15.flowPort, designQuality.stockPort) annotation(Line(visible = true, origin = {-12.5, -60}, points = {{-12.5, 0}, {12.5, 0}}, color = {128, 0, 128}));
  connect(adHocDesignDecisions.stockInfoOutput, r15.stockInfoInput) annotation(Line(visible = true, origin = {-45, -49}, points = {{-5, 9}, {-5, 14}, {5, 14}, {5, -11}, {10, -11}}, color = {128, 0, 128}));
  connect(r16.flowPort, costs.stockPort) annotation(Line(visible = true, origin = {49, 15}, points = {{-16, 0}, {16, 0}}, color = {128, 0, 128}));
  connect(r12.flowPort, swResistance.stockPort) annotation(Line(visible = true, origin = {42.667, -11.804}, points = {{7.333, 6.392}, {7.333, -3.196}, {-14.667, -3.196}}, color = {128, 0, 128}));
  connect(employees.stockInfoOutput, r16.stockInfoInput) annotation(Line(visible = true, origin = {19, 10}, points = {{-2, -10}, {-2, 5}, {4, 5}}, color = {128, 0, 128}));
  connect(employees.stockInfoOutput, r17.stockInfoInput) annotation(Line(visible = true, origin = {20, 7.505}, points = {{-3, -7.505}, {-3, 0.755}, {8, 0.755}, {8, -4.995}}, color = {128, 0, 128}));
  connect(r17.flowPort, swResistance.stockPort) annotation(Line(visible = true, origin = {28, -11.245}, points = {{0, 3.755}, {0, -3.755}}, color = {128, 0, 128}));
  connect(r1.flowPort, clearMandate.stockPort) annotation(Line(visible = true, origin = {-131.667, -2.282}, points = {{-3.333, 7.282}, {-3.333, -12.718}, {4.915, -12.718}}, color = {128, 0, 128}));
  connect(r18.flowPort, decisionSpeed.stockPort) annotation(Line(visible = true, origin = {-93.125, -17.5}, points = {{-11.875, -2.5}, {-11.875, 0.5}, {18.125, 0.5}}, color = {128, 0, 128}));
  connect(partiesInvolved.stockInfoOutput, r18.stockInfoInput) annotation(Line(visible = true, origin = {-105, -35}, points = {{0, -5}, {0, 5}}, color = {128, 0, 128}));
  connect(r19.flowPort, costs.stockPort) annotation(Line(visible = true, origin = {72.5, 15}, points = {{7.5, 0}, {-7.5, 0}}, color = {128, 0, 128}));
  connect(r19.stockInfoInput, prodEfficiency.stockInfoOutput) annotation(Line(visible = true, origin = {92.181, 11.667}, points = {{-2.181, 3.333}, {1.091, 3.333}, {1.091, -6.667}}, color = {128, 0, 128}));
  connect(prodQuality.stockInfoOutput, r20.stockInfoInput) annotation(Line(visible = true, origin = {123.248, -10}, points = {{0, -5}, {0, 5}}, color = {128, 0, 128}));
  connect(r20.flowPort, costEffectiveness.stockPort) annotation(Line(visible = true, origin = {113.333, 28.333}, points = {{9.915, -23.333}, {9.915, 11.667}, {-18.333, 11.667}}, color = {128, 0, 128}));
  connect(swAcceptance.stockInfoOutput, r21.stockInfoInput) annotation(Line(visible = true, origin = {63.333, -58.333}, points = {{-3.333, -6.667}, {-3.333, 3.333}, {6.667, 3.333}}, color = {128, 0, 128}));
  connect(partiesInvolved.stockInfoOutput, r22.stockInfoInput) annotation(Line(visible = true, origin = {-95, -50}, points = {{-10, 10}, {-10, 15}, {5, 15}, {5, -20}, {21, -20}}, color = {128, 0, 128}));
  connect(r22.flowPort, designQuality.stockPort) annotation(Line(visible = true, origin = {-25, -66.667}, points = {{-39, -3.333}, {25, -3.333}, {25, 6.667}}, color = {128, 0, 128}));
  connect(swMgtOrgCapacity.stockInfoOutput, r23.stockInfoInput) annotation(Line(visible = true, origin = {-7.5, 16.94}, points = {{-7.5, 5.06}, {-7.5, 9.741}, {4.484, 9.741}, {4.484, -16.94}}, color = {128, 0, 128}));
  connect(r23.flowPort, swQuality.stockPort) annotation(Line(visible = true, origin = {14, -29}, points = {{-17.016, 19}, {-17.016, -1}, {6, -1}, {6, -11}, {16, -11}}, color = {128, 0, 128}));
  connect(swQuality.stockInfoOutput, r24.stockInfoInput) annotation(Line(visible = true, origin = {37.5, -33.75}, points = {{-7.5, -1.25}, {-7.5, 3.75}, {2.5, 3.75}, {2.5, -21.25}}, color = {128, 0, 128}));
  connect(r24.flowPort, swAcceptance.stockPort) annotation(Line(visible = true, origin = {46.667, -68.333}, points = {{-6.667, 3.333}, {-6.667, -1.667}, {13.333, -1.667}}, color = {128, 0, 128}));
  connect(r21.flowPort, swUsage.stockPort) annotation(Line(visible = true, origin = {86.667, -50}, points = {{-6.667, -5}, {3.333, -5}, {3.333, 10}}, color = {128, 0, 128}));
  connect(r13.flowPort, swUsage.stockPort) annotation(Line(visible = true, origin = {81.276, -40}, points = {{-8.724, 0}, {8.724, 0}}, color = {128, 0, 128}));
  connect(r25.flowPort, employees.stockPort) annotation(Line(visible = true, origin = {33.333, -18.101}, points = {{31.667, -9.017}, {-16.333, -9.017}, {-16.333, 13.101}}, color = {128, 0, 128}));
  connect(r25.stockInfoInput, swUsage.stockInfoOutput) annotation(Line(visible = true, origin = {85, -29.745}, points = {{-10, 2.627}, {5, 2.627}, {5, -5.255}}, color = {128, 0, 128}));
  connect(r26.flowPort, prodEfficiency.stockPort) annotation(Line(visible = true, origin = {87.757, -1.667}, points = {{-2.757, -3.333}, {-2.757, 1.667}, {5.515, 1.667}}, color = {128, 0, 128}));
  connect(r27.stockInfoInput, swUsage.stockInfoOutput) annotation(Line(visible = true, origin = {98.75, -37.078}, points = {{6.25, -2.922}, {1.25, -2.922}, {1.25, 7.078}, {-8.75, 7.078}, {-8.75, 2.078}}, color = {128, 0, 128}));
  connect(swUsage.stockInfoOutput, r26.stockInfoInput) annotation(Line(visible = true, origin = {87.5, -22.5}, points = {{2.5, -12.5}, {2.5, 2.5}, {-2.5, 2.5}, {-2.5, 7.5}}, color = {128, 0, 128}));
  connect(prodQuality.stockInfoOutput, r28.stockInfoInput) annotation(Line(visible = true, origin = {127.5, -6.25}, points = {{-4.252, -8.75}, {-4.252, -3.75}, {7.5, -3.75}, {7.5, 16.25}}, color = {128, 0, 128}));
  connect(r28.flowPort, changePressure.stockPort) annotation(Line(visible = true, origin = {130, 43.333}, points = {{5, -23.333}, {5, 11.667}, {5, 11.667}}, color = {128, 0, 128}));
  connect(r29.flowPort, swResistance.stockPort) annotation(Line(visible = true, origin = {45.5, -15}, points = {{17.5, 0}, {-17.5, 0}}, color = {128, 0, 128}));
  connect(r29.stockInfoInput, swUsage.stockInfoOutput) annotation(Line(visible = true, origin = {83, -21}, points = {{-10, 6}, {-3, 6}, {-3, 1}, {7, 1}, {7, -14}}, color = {128, 0, 128}));
  connect(swResistance.stockInfoOutput, r30.stockInfoInput) annotation(Line(visible = true, origin = {45, -25.863}, points = {{-17, 5.863}, {-17, 2.411}, {5, 2.411}, {5, -19.137}}, color = {128, 0, 128}));
  connect(r30.flowPort, swAcceptance.stockPort) annotation(Line(visible = true, origin = {53.333, -55}, points = {{-3.333, 0}, {-3.333, -15}, {6.667, -15}}, color = {128, 0, 128}));
  connect(swMgtOrgCapacity.stockInfoOutput, r31.stockInfoInput) annotation(Line(visible = true, origin = {-1.032, 19.163}, points = {{-13.968, 2.837}, {-13.968, 7.518}, {9.108, 7.518}, {9.108, -2.033}}, color = {128, 0, 128}));
  connect(r31.flowPort, employees.stockPort) annotation(Line(visible = true, origin = {11.667, -1.032}, points = {{-3.591, 8.162}, {-3.591, -3.968}, {5.333, -3.968}}, color = {128, 0, 128}));
  connect(swUsage.stockInfoOutput, usage.stockInfoInput) annotation(Line(visible = true, origin = {95, -36.25}, points = {{-5, 1.25}, {-5, 6.25}, {5, 6.25}, {5, -13.75}}, color = {128, 0, 128}));
  connect(prodQuality.stockInfoOutput, quality.stockInfoInput) annotation(Line(visible = true, origin = {127.5, -17.041}, points = {{-4.252, 2.041}, {-4.252, 7.041}, {7.5, 7.041}, {7.5, -7.959}}, color = {128, 0, 128}));
  connect(costEffectiveness.stockInfoOutput, cost.stockInfoInput) annotation(Line(visible = true, origin = {93.333, 48.333}, points = {{1.667, -3.333}, {1.667, 1.667}, {-3.333, 1.667}}, color = {128, 0, 128}));
  connect(c1.flowPort, budget.stockPort) annotation(Line(visible = true, origin = {-85, 45}, points = {{-5, 0}, {5, 0}}, color = {128, 0, 128}));
  connect(c2.flowPort, clearMandate.stockPort) annotation(Line(visible = true, origin = {-129.501, -25}, points = {{-5.499, -5}, {2.749, -5}, {2.749, 10}}, color = {128, 0, 128}));
  connect(c3.flowPort, mgtKnowledgeLevel.stockPort) annotation(Line(visible = true, origin = {-45, -6.66}, points = {{0, -5.66}, {0, 5.66}}, color = {128, 0, 128}));
  connect(r2.flowPort, mgtKnowledgeLevel.stockPort) annotation(Line(visible = true, origin = {-56.995, 1.667}, points = {{-7.005, 5.333}, {-7.005, 5.1}, {1.995, 5.1}, {1.995, -2.667}, {11.995, -2.667}}, color = {128, 0, 128}));
  connect(r27.flowPort, prodQuality.stockPort) annotation(Line(visible = true, origin = {120.499, -33.333}, points = {{-5.499, -6.667}, {2.749, -6.667}, {2.749, 13.333}}, color = {128, 0, 128}));
  connect(c4.flowPort, mgtQuality.stockPort) annotation(Line(visible = true, origin = {30.512, 33.388}, points = {{-8.816, 1.612}, {-0.512, 1.612}, {-0.512, -3.388}, {9.488, -3.388}}, color = {128, 0, 128}));
  connect(cost.y, totalPerformance.u[1]) "Cost performance" annotation(Line(visible = true, origin = {104.25, -1.25}, points = {{-25.25, 51.25}, {-39.25, 51.25}, {-39.25, 76.25}, {40.75, 76.25}, {40.75, -68.75}, {5.75, -68.75}, {5.75, -78.75}, {15.75, -78.75}}, color = {192, 192, 192}));
  connect(quality.y, totalPerformance.u[2]) "Quality performance" annotation(Line(visible = true, origin = {124, -59.2}, points = {{11, 23.2}, {11, -10.8}, {-14, -10.8}, {-14, -20.8}, {-4, -20.8}}, color = {192, 192, 192}));
  connect(usage.y, totalPerformance.u[3]) "Usage performance" annotation(Line(visible = true, origin = {106.667, -73.667}, points = {{-6.667, 12.667}, {-6.667, -6.333}, {13.333, -6.333}}, color = {192, 192, 192}));
  connect(totalPerformance.y, modelOutput.totalPerformance) "Accumulated average performance" annotation(Line(visible = true, origin = {140.122, -75}, points = {{-11.872, -5}, {-0.122, -5}, {-0.122, 5}, {12.117, 5}}, color = {192, 192, 192}));
  connect(usage.y, modelOutput.usagePerformance) annotation(Line(visible = true, origin = {117.413, -67}, points = {{-17.413, 6}, {-17.413, -3}, {34.826, -3}}, color = {192, 192, 192}));
  connect(cost.y, modelOutput.costPerformance) annotation(Line(visible = true, origin = {108.807, 18.333}, points = {{-29.807, 31.667}, {-43.807, 31.667}, {-43.807, 56.667}, {36.193, 56.667}, {36.193, -88.333}, {43.432, -88.333}}, color = {192, 192, 192}));
  connect(quality.y, modelOutput.qualityPerformance) annotation(Line(visible = true, origin = {140.746, -58.667}, points = {{-5.746, 22.667}, {-5.746, -11.333}, {11.493, -11.333}}, color = {192, 192, 192}));
  annotation(preferredView = "diagram", Documentation(revisions = "<html>
<ul>
<li>Added in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>In 2007 Erik J.A. van Zijderveld introduced what he coined a \"<em>Method to Analyse Relations between Variables using Enriched Loops</em> (MARVEL)\"</em> [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">24</a>]. He made the following observations:</p>
<ul>
<li>A <em>causal loop diagram</em> (CLD)—or impact diagram—is a good tool for integrating information from different stakeholdes and a modeling paradigm, which people with different backgrounds can easily relate to.</li><br>
<li>While quantitative data may be hard to obtain quickly and reliably, stakeholders and decision makers can often reach consensus on <em>speed</em> and <em>strength</em> with regard to impact relations.</li><br>
<li>Decision makers can typically identify <em>pressure</em> or <em>intervention points</em> and relevant <em>performance indicators</em> in such diagrams.</li><br>
<li>Often to come up with relevant insight it will suffice to show initial dynamic behavior, i.e., we do not need the kind of long-run validity that a fully fledged simulation model provides—given that the effort building such a model will usually be 10 to 100 times higher.
</ul>
In section 5 of his paper van Zijderveld gives an illustrative example for the application and utility of MARVEL. The MARVEL diagram for that illustrative application is given below. The problem at hand is a <em>software release project</em>, i.e., a new software is to be introduced in a company, which has great impact upon procedures and organization, while resistance against the software endangers the project. The resistance stems from dismissals, low software quality and poor management  [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">24</a>, p.13].<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">MARVEL Diagram for a new software release project [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">24</a>, p.14]</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/SoftwareReleaseProject/CausalLoopDiagram.png\" alt=\"CausalLoopDiagram.png\"></td>
</tr>
</tbody>
</table>
<p>In the diagram, the thickness of an arrow indicates the <em>strengh</em> of impact whereas length and number of \"barriers\" at their tips indicate the <em>speed</em> of impact propagation. These attributes are assigned qualitatively using <em>weak, average, strong, very strong</em> to rank <em>strengths</em> and <em>low, average, high, very high</em> to rank <em>speeds</em>.</p>
<p>The model diagram below illustrates how such a model can be built using the →<a href=\"modelica://BusinessSimulation.CausalLoop\"><code>CausalLoop</code></a> package. Impact relations between variables are encoded using the →<a href=\"modelica://BusinessSimulation.CausalLoop.ProportionalityDelayed\"><code>ProportionalityDelayed</code></a> component with global parameters for <em>strength</em> (<code>wk, av, st, vs</code>) and <em>speed</em> (<code>v1, v2, v3, v4</code>) in place, the latter being transformed to <em>delay times</em>, which are inversely related to speed.</p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Diagram View</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/SoftwareReleaseProject/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
<p>In accordance with the MARVEL version there are four control or intervention points, which can be turned on or off for a simulation run:</p>
<ul>
<li><code>c1</code> : budget control with <code>setpoint = 0.8</code></li><br>
<li><code>c2</code> : mandate control with <code>setpoint = 0.7</code></li><br>
<li><code>c3</code> : management knowledge level control with <code>setpoint = 0.5</code></li><br>
<li><code>c4</code> : management quality control with <code>setpoint = 0.6</code></li>
</ul>
<p>These controls mean that whenever there is a deviation between <code>setpoint</code> and actual level of the variable under control, then corrective action will be taken, i.e. a flow to the stock, in order to erradicate the deviation within the chosen adjustment time, whcih is set to <code>1 yr</code> for all controls.</p>
<p>There are three main performance <em>goals</em>: cost effectiveness (<em>costs</em>), production quality (<em>quality</em>), and software usage (<em>usage</em>). In this example the normalized stock values pertaining to the goals are simply mapped upon the linear scale <code>[0,1]</code>. The graph blow shows the development for these performance indicators over a period of 10 years with just the budget control (<code>c1</code>) activated.</p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Performance Evaluation (c1 active)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/SoftwareReleaseProject/PerformanceC1.png\" alt=\"PerformanceC1.png\"></td>
</tr>
</tbody>
</table>
<p>In order to better combare different scenarios we can use a <em>weighted average performance</em> and calculate the mean over the simulation period (→<a href=\"modelica://BusinessSimulation.Examples.SoftwareReleaseProject.AccumulatedPerformance\"><code>totalPerformance</code></a>). Using this measure we can compare different combinations of interventions and it turns out that a combination of <code>c3</code> and <code>c4</code> shows best average performance albeit withouth considering the control effort (see Notes).</p>
<table width = \"300\" cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Performance (basis points) for different control combinations</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/SoftwareReleaseProject/ControlCombinations.png\" alt=\"ControlCombinations.png\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>The parameters in the model are set to the values specified in van Zijderveld's paper whenever possible.</li><br>
<li>The model by specification is set up in <em>equilibrium</em> as there are not processes of exogenous growth in the model and all motion is triggered by <em>changes</em>. If at least one control is activated the model will show dynamic behavior.</li><br>
<li>Since control elements (optionally) report their rates, i.e., the control effort, one can readily expand the evaluation of scenarios by comparing performance gains to the required control effort.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Examples.HealTheWorld\">HealTheWorld</a>
</p> 
</html>", figures = {Figure(title = "Performance Evaluation", identifier = "default", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.costPerformance, legend = "Cost"), Curve(y = modelOutput.qualityPerformance, legend = "Quality"), Curve(y = modelOutput.usagePerformance, legend = "Usage")})}), Figure(title = "Total Performance", identifier = "totalPerformance", plots = {Plot(curves = {Curve(y = modelOutput.totalPerformance, legend = "total perforamcne")})})}), experiment(StopTime = 315360000, __Wolfram_DisplayTimeUnit = "yr", __Wolfram_NumberOfIntervals = -1), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), uses(Modelica(version = "3.2.3"), BusinessSimulation(version = "1.1.0-alpha")), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Software Release Project", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 70}, textColor = {76, 112, 136}, extent = {{-140, -3}, {140, 3}}, textString = "van Zijderveld [24]", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end SoftwareReleaseProject;
