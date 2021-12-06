within BusinessSimulation.Examples;

model HealTheWorld "Causal loop model of world dynamics"
  extends BusinessSimulation.Icons.Example;
  import BusinessSimulation.Units.Time;
  // parameter Real c = +0.3 "Elasticity coefficient for the impact of environmental load upon societal action (≥0)";
  parameter Real campaignTarget = 1 / 0.3 "Target multiplier for the elasticity coefficient" annotation(Dialog(enable = withIntervention));
  parameter Time campaignStart(displayUnit = "yr", min = modelSettings.modelStartTime) = 31536000 "Start time for the intervention" annotation(Dialog(enable = withIntervention));
  parameter Time campaignDuration(displayUnit = "yr", min = modelSettings.dt) = 94608000 "Duration of the intervention" annotation(Dialog(enable = withIntervention));
  parameter Boolean withIntervention = false "= true, if there is to be a compaign to raise public awareness" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  inner ModelSettings modelSettings(modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.years, modelTimeHorizon(displayUnit = "yr") = 315360000, dt(displayUnit = "yr") = 7884000, samplingPeriod.displayUnit = "yr") annotation(Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  final Interfaces.Connectors.DataOutPort modelOutput "Index levels for the model's stocks" annotation(Placement(visible = true, transformation(origin = {130, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  CausalLoop.SimpleInformationLevel societalAction annotation(Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel environmentalLoad annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel population annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.SimpleInformationLevel consumption annotation(Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -630)));
  CausalLoop.InputControl campaign(startTime(displayUnit = "yr") = campaignStart, duration(displayUnit = "yr") = campaignDuration, initialInput = 1.0, finalInput = campaignTarget) if withIntervention "Awareness campain as 'control'" annotation(Placement(visible = true, transformation(origin = {-65, 55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.ExponentialChange p1(rate(displayUnit = "1/yr") = 3.17097919837646e-10, hasRateOutput = false) "Exponential growth of the population" annotation(Placement(visible = true, transformation(origin = {10, -45}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  CausalLoop.Elasticity r1(coefficient = +1) "Population growth is tightly coupled to increases in environmental load" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  CausalLoop.Elasticity r2(coefficient = -0.1) "Societal action increases will slightly decrease population growth" annotation(Placement(visible = true, transformation(origin = {-25, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.Elasticity r3(coefficient = -0.1) "Increases in environmental load will slightly decrease population growth" annotation(Placement(visible = true, transformation(origin = {-30, 5}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  CausalLoop.Elasticity r4(coefficient = -1) "Societal action is tightly coupled to decreases in resource consumption" annotation(Placement(visible = true, transformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.Elasticity r5(coefficient = +1.1) "Environmental load increase will rather strongly increase the level of resource consumption" annotation(Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  CausalLoop.Elasticity r6(coefficient = +0.3, hasFactor = withIntervention) "Growth in the environmental load will slightly increase growth of societal action" annotation(Placement(visible = true, transformation(origin = {-50, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  CausalLoop.Elasticity r7(coefficient = +0.3) "Increases in the level of resource consumption will slightly increase population growth" annotation(Placement(visible = true, transformation(origin = {25, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -540)));
  CausalLoop.Elasticity r8(coefficient = +1) "Increases in resource consumption are tightly coupled to increases in environmental load" annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 540)));
  CausalLoop.LoopIndicator_CW R1 "consumption > environmentalLoad > consumption" annotation(Placement(visible = true, transformation(origin = {45, 32.707}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.LoopIndicator_CW R2 "population > environmentalLoad > consumption > population" annotation(Placement(visible = true, transformation(origin = {20, -7.15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.LoopIndicator_CCW B1(pol = "–") "population > environmentalLoad > population" annotation(Placement(visible = true, transformation(origin = {-15, 2.026}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.LoopIndicator_CCW B2(pol = "–") "population > environmentalLoad > societalAction > population" annotation(Placement(visible = true, transformation(origin = {-43.327, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.LoopIndicator_CCW B3(pol = "–") "population > environmentalLoad > societalAction > consumption > population" annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CausalLoop.MatFlowIndicator lab1 annotation(Placement(visible = true, transformation(origin = {-12.564, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  final CausalLoop.StockInformation indexInfo[4] "Index levels for the model's stocks" annotation(Placement(visible = true, transformation(origin = {120, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(environmentalLoad.stockInfoOutput, r6.stockInfoInput) annotation(Line(visible = true, origin = {-13.333, 35}, points = {{13.333, -10}, {13.333, 5}, {-26.667, 5}}, color = {128, 0, 128}));
  connect(r6.flowPort, societalAction.stockPort) annotation(Line(visible = true, origin = {-55.553, 35.422}, points = {{5.553, 4.578}, {-4.447, 4.578}, {-4.447, -25.422}}, color = {128, 0, 128}));
  connect(r1.flowPort, environmentalLoad.stockPort) annotation(Line(visible = true, origin = {0, 10}, points = {{0, -10}, {0, 10}}, color = {128, 0, 128}));
  connect(societalAction.stockInfoOutput, r2.stockInfoInput) annotation(Line(visible = true, origin = {-51.667, -31.667}, points = {{-8.333, 36.667}, {-8.333, -18.333}, {16.667, -18.333}}, color = {128, 0, 128}));
  connect(r2.flowPort, population.stockPort) annotation(Line(visible = true, origin = {-12.5, -40}, points = {{-12.5, -10}, {0, -10}, {0, 10}, {12.5, 10}}, color = {128, 0, 128}));
  connect(r3.flowPort, population.stockPort) annotation(Line(visible = true, origin = {-15, -11.664}, points = {{-15, 16.664}, {-15, -18.336}, {15, -18.336}}, color = {128, 0, 128}));
  connect(r3.stockInfoInput, environmentalLoad.stockInfoOutput) annotation(Line(visible = true, origin = {-15, 22.5}, points = {{-15, -7.5}, {-15, 7.5}, {15, 7.5}, {15, 2.5}}, color = {128, 0, 128}));
  connect(r4.stockInfoInput, societalAction.stockInfoOutput) annotation(Line(visible = true, origin = {-30, -45}, points = {{60, -25}, {-30, -25}, {-30, 50}}, color = {128, 0, 128}));
  connect(r4.flowPort, consumption.stockPort) annotation(Line(visible = true, origin = {53.333, -50}, points = {{-13.333, -20}, {6.667, -20}, {6.667, 40}}, color = {128, 0, 128}));
  connect(environmentalLoad.stockInfoOutput, r5.stockInfoInput) annotation(Line(visible = true, origin = {13.333, 35}, points = {{-13.333, -10}, {-13.333, 5}, {26.667, 5}}, color = {128, 0, 128}));
  connect(r5.flowPort, consumption.stockPort) annotation(Line(visible = true, origin = {62.097, 15}, points = {{-12.097, 25}, {-2.097, 25}, {-2.097, -25}}, color = {128, 0, 128}, rotation = -360));
  connect(r8.flowPort, environmentalLoad.stockPort) annotation(Line(visible = true, origin = {10, 20}, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}));
  connect(r8.stockInfoInput, consumption.stockInfoOutput) annotation(Line(visible = true, origin = {39.308, 5}, points = {{-9.308, 15}, {5.692, 15}, {5.692, -15}, {15.692, -15}}, color = {128, 0, 128}));
  connect(r7.flowPort, population.stockPort) annotation(Line(visible = true, origin = {12.5, -30}, points = {{12.5, 0}, {-12.5, 0}}, color = {128, 0, 128}));
  connect(p1.flowPort, population.stockPort) annotation(Line(visible = true, origin = {3.333, -40}, points = {{6.667, -5}, {-3.333, -5}, {-3.333, 10}}, color = {128, 0, 128}));
  connect(campaign.y, r6.u) annotation(Line(visible = true, origin = {-51.667, 51.667}, points = {{-13.333, 3.333}, {6.667, 3.333}, {6.667, -6.667}}, color = {1, 37, 163}));
  connect(population.stockInfoOutput, r1.stockInfoInput) annotation(Line(visible = true, origin = {0, -17.5}, points = {{0, -7.5}, {0, 7.5}}, color = {128, 0, 128}));
  connect(consumption.stockInfoOutput, r7.stockInfoInput) annotation(Line(visible = true, origin = {45, -20}, points = {{10, 10}, {0, 10}, {0, -10}, {-10, -10}}, color = {128, 0, 128}));
  // invisible connections
  connect(population.stockInfoOutput, indexInfo[1].stockInfoInput) "Population";
  connect(environmentalLoad.stockInfoOutput, indexInfo[2].stockInfoInput) "Environmental load";
  connect(consumption.stockInfoOutput, indexInfo[3].stockInfoInput) "Consumption";
  connect(societalAction.stockInfoOutput, indexInfo[4].stockInfoInput) "Societal action";
  connect(indexInfo[1].y, modelOutput.population) "Index for the world population";
  connect(indexInfo[2].y, modelOutput.environmentalLoad) "Index for the environmental load";
  connect(indexInfo[3].y, modelOutput.consumption) "Index for resource consumption";
  connect(indexInfo[4].y, modelOutput.societalAction) "Index for societal action taken";
  annotation(preferredView = "diagram", Documentation(figures = {Figure(title = "State of the World", identifier = "default", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.environmentalLoad, legend = "environmentalLoad"), Curve(y = modelOutput.population, legend = "population")}, y = Axis(min = 0, max = 3.5))})}, info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the classes in the →<a href = \"modelica://BusinessSimulation.CausalLoop\"><code>CausalLoop</code></a> package we can quickly start out with a model that captures the important dynamics in a system. This simplified model of world dynamics is given by Hartmut Bossel [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">25</a>] who reduces the world system to four main variables indicating the <em>state</em> of the world: <em>population, consumption, environmental load, and societal action</em>.</p>
<p>These <em>states</em> or <em>stocks</em> may be initialized with a value of <code>1.0</code> representing the respective current <em>level</em>, i.e., an index. In the next step, we must identify <em>direct</em> causal influences between the model variables, i.e., a change in A will affect B (<em>A → B</em>). To more precisely capture the dynamics of the system we may ask ourselves for any impact: <em>If A increases by </em><code>r_A</code><em> percent, what will be the fractional rate </em>(<code>r_B</code>)<em> of change for B?</em>. The <em>elasticity coefficient</em> is simply the factor of proportionality between the fractional rates and we can use it to embedd the stocks in a <em>dynamic model of impact</em> as shown in the diagram below.</p>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/HealTheWorld/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<p>For example, we state that a change in the level of the world <code>population</code> will affect a change in the level of <code>environmentalLoad</code> and that the <em>polarity</em> for this relation is <em>positive</em>, i.e., an <em>increase</em> will cause an <em>increase</em> and, conversely, a <em>decrease</em> will cause a <em>decrease</em>. We further assume the percentage change in the level of <code>environmentalLoad</code> to be equivalent to that in the <code>population</code> and accordingly we have set <code>coefficient = +1.0</code> for the relation (<code>r1</code>) between the two stocks.</p>
<p>The <em>elasticity coefficient</em> for the impact of <code>societalAction</code> upon the level of <code>consumption</code> is set to <code>-1.0</code>, which indicates that any fractional increase in <code>societal action</code> will cause a decrease in <code>consumption</code> at the same fractional rate.</p>
<p>Since all dynamics in a model are solely driven by relative changes, the model is in <em>equilibrium</em> initially, i.e., there will be no dynamics. Two typical questions are of interest in using such a model:</p>
<ul>
<li>What will happen if there is some <em>exogenous impact</em> to one or more system states?</li><br>
<li>If the system turns out to be <em>instable</em>,i.e., grow or deteriorate without bounds, what can be done?</li>
</ul>
<p>In this example, we will assume that the <code>population</code> will grow exponentially during the next 10 years at a fractional rate of <code>1% per year</code>. As a potential intervention, we are considering a public awareness campaign that will start one year into the simulation and last for three years. In the model the intervention (<code>campaign</code>) will affect the elasticity coefficient for the impact of <code>environmentalLoad</code> upon <code>societalAction</code>, which in the base run settings is <code>+0.3</code>. The effect upon the coefficient is modeled as a <em>multiplication</em>; <code>campainTarget = 1/0.3</code> implies that at the end of the intervention the elasticity coefficient will have risen to a value of <code>+1.0</code>—tightly coupling <code>societalAction</code> to <code>environmentalLoad</code>.</p>
<p>The simulation results for the <em>base run</em> (without intervention) and the <em>policy run</em> (with intervention) are shown in the plots below:</p>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Simulation Plots</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/HealTheWorld/Graphs.svg\" alt=\"Graphs.svg\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<p>While this, of course, is a toy model, system dynamics modelers coming from other tools may take a moment to reflect upon the following:</p>
<ul>
<li>This model fits a single page and has just four stocks—how would this model look in conventional system dynamics tools?</li><br>
<li>The causal loop (<code>B1</code>)between <code>population</code> and <code>environment</code> introduces a cycle with regard to variables that are not stocks (e.g., rates of flow to the stocks); the compactness of modeling that we see here is possbile, because Modelica allows <em>algebraic next to differential equations</em>(→<a href =\"https://wiki2.org/en/Differential-algebraic_system_of_equations+Brights.4\">DAE</a>).</li><br>
<li>Finally, we also see the improved reusability of object-oriented models at work when we consider that we may simply remove the exponential growth process from <code>population</code> and connect it to <code>consumption</code> without having to change anything else in the model.</li>
</ul><br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Examples.SoftwareReleaseProject\">SoftwareReleaseProject</a>
</p> 
</html>", revisions = "<html>
<ul>
<li>Added in v2.0.0.</li>
</ul>
</html>"), experiment(StartTime = 0, StopTime = 315360000, __Wolfram_DisplayTimeUnit = "yr"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "World Model", fontName = "Lato Black"), Text(visible = true, origin = {0, 70}, textColor = {76, 112, 136}, extent = {{-140, -3}, {140, 3}}, textString = "Hartmut Bossel [25]", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end HealTheWorld;
