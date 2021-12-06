within BusinessSimulation.Examples;

model LotkaVolterraEquationsRevisited "Predator-prey dynamics with an additional predator"
  import BusinessSimulation.Units.Rate;
  extends Icons.Example;
  ModelOutput modelOutput "Main output for the model" annotation(Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModelSettings modelSettings(init = BusinessSimulation.Types.InitializationOptions.FixedValue, modelTimeHorizon(displayUnit = "yr") = 4415040000, dt(displayUnit = "yr") = 7884000) annotation(Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Theta theta(foxRabbit_beta(displayUnit = "1/yr")) annotation(Placement(visible = true, transformation(origin = {-110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput "Main output of the model"
    import BusinessSimulation.Units.{Population};
    extends Icons.DataOutPort;
    Population wolves "Wolf population";
    Population foxes "Fox population";
    Population rabbits "Rabbit population";
  end ModelOutput;

  model Theta "Parameter definitions for the Base Case"
    import BusinessSimulation.Units.{Population,Rate};
    extends Icons.Theta;
    // initial values for populations
    parameter Population IRA = 25 "Initial rabbit population";
    parameter Population IFO = 2 "Initial fox population";
    parameter Population IWO = 4 "Initial wolf population";
    // rates
    parameter Rate foxRabbit_beta(displayUnit = "1/yr") = 6.34195839675292e-10 "Rabbit fractional death rate per fox";
    parameter Rate foxRabbit_delta(displayUnit = "1/yr") = 6.34195839675292e-10 "Fox fractional reproduction rate per rabbit";
    parameter Rate foxesDeathRate(displayUnit = "1/yr") = 1.26839167935058e-08 "Fractional death rate for fox popultion";
    parameter Rate rabbitsReproRate(displayUnit = "1/yr") = 3.17097919837646e-09 "Fractional reproduction rate for rabbit population";
    parameter Rate wolfRabbit_beta(displayUnit = "1/yr") = 6.34195839675292e-10 "Rabbit fractional death rate per wolf";
    parameter Rate wolfRabbit_delta(displayUnit = "1/yr") = 3.17097919837646e-10 "Wolf fractional reproduction rate per rabbit";
    parameter Rate wolvesDeathRate(displayUnit = "1/yr") = 1.26839167935058e-08 "Fractopmaö death rate for wolf population";
    parameter Rate wolfFox_beta(displayUnit = "1/yr") = 1.26839167935058e-09 "Fox fractional death rate per wolf";
    parameter Rate wolfFox_delta(displayUnit = "1/yr") = 2.53678335870117e-09 "Wolf fractional reproduction rate per fox";
  end Theta;
protected
  Stocks.MaterialStock rabbits(initialValue = theta.IRA, redeclare replaceable type OutputType = Units.Population) "Population of rabbits" annotation(Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock foxes(initialValue = theta.IFO, redeclare replaceable type OutputType = Units.Population) "Population of foxes" annotation(Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock wolves(initialValue = theta.IWO, redeclare replaceable type OutputType = Units.Population) "Population of wolves" annotation(Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExponentialGrowth reproduction(fractionalRate = theta.rabbitsReproRate, hasConstantRate = true) "Population growth for rabbit population" annotation(Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExponentialDecline foxesStarving(hasConstantRate = true, fractionalRate = theta.foxesDeathRate) "Mortality for foxes" annotation(Placement(visible = true, transformation(origin = {51.709, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Flows.Interaction.NonlinearInteraction fox_rabbit_predation(hasConstantFactorA = true, hasConstantFactorB = true, a_AB = -theta.foxRabbit_beta, b_AB = theta.foxRabbit_delta) "Foxes predating on rabbits" annotation(Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Interaction.NonlinearInteraction wolf_rabbit_predation(hasConstantFactorA = true, hasConstantFactorB = true, a_AB = -theta.wolfRabbit_beta, b_AB = theta.wolfRabbit_delta) "Wolves predating on rabbits" annotation(Placement(visible = true, transformation(origin = {-50, 5}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Flows.Interaction.NonlinearInteraction wolf_fox_predation(hasConstantFactorA = true, hasConstantFactorB = true, a_AB = -theta.wolfFox_beta, b_AB = theta.wolfFox_delta) "Wolves predating on foxes" annotation(Placement(visible = true, transformation(origin = {30, 5}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  SourcesOrSinks.ExponentialDecline wolvesStarving(hasConstantRate = true, fractionalRate = theta.wolvesDeathRate) "Mortality for foxes" annotation(Placement(visible = true, transformation(origin = {100, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(reproduction.massPort, rabbits.inflow) annotation(Line(visible = true, origin = {-90, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(rabbits.outflow, fox_rabbit_predation.portA) annotation(Line(visible = true, origin = {-50, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(fox_rabbit_predation.portB, foxes.inflow) annotation(Line(visible = true, origin = {-10, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(foxes.outflow, foxesStarving.massPort) annotation(Line(visible = true, origin = {30.855, -30}, points = {{-10.855, 0}, {10.855, 0}}, color = {128, 0, 128}));
  connect(wolf_rabbit_predation.portA, rabbits.outflow) annotation(Line(visible = true, origin = {-53.333, -21.667}, points = {{3.333, 16.667}, {3.333, -8.333}, {-6.667, -8.333}}, color = {128, 0, 128}));
  connect(wolf_fox_predation.portA, foxes.outflow) annotation(Line(visible = true, origin = {26.667, -21.667}, points = {{3.333, 16.667}, {3.333, -8.333}, {-6.667, -8.333}}, color = {128, 0, 128}));
  connect(wolves.outflow, wolvesStarving.massPort) annotation(Line(visible = true, origin = {80, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(wolves.inflow, wolf_rabbit_predation.portB) annotation(Line(visible = true, origin = {-16.667, 25}, points = {{66.667, 5}, {-33.333, 5}, {-33.333, -10}}, color = {128, 0, 128}));
  connect(wolves.inflow, wolf_fox_predation.portB) annotation(Line(visible = true, origin = {36.667, 25}, points = {{13.333, 5}, {-6.667, 5}, {-6.667, -10}}, color = {128, 0, 128}));
  connect(rabbits.y1, modelOutput.rabbits) annotation(Line(visible = true, origin = {-7.375, -47.5}, points = {{-52.125, 12.5}, {-42.625, 12.5}, {-42.625, -12.5}, {137.375, -12.5}}, color = {192, 192, 192}));
  connect(foxes.y1, modelOutput.foxes) annotation(Line(visible = true, origin = {52.625, -47.5}, points = {{-32.125, 12.5}, {-22.625, 12.5}, {-22.625, -12.5}, {77.375, -12.5}}, color = {192, 192, 192}));
  connect(wolves.y1, modelOutput.wolves) annotation(Line(visible = true, origin = {90.125, -17.5}, points = {{-19.625, 42.5}, {-10.125, 42.5}, {-10.125, -42.5}, {39.875, -42.5}}, color = {192, 192, 192}));
  annotation(experiment(StartTime = 0, StopTime = 4415040000, __Wolfram_DisplayTimeUnit = "yr"), __Wolfram(itemFlippingEnabled = true), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Lotka-Volterra Equations Revisited", fontName = "Lato Black"), Text(visible = true, origin = {0, 70}, textColor = {76, 112, 136}, extent = {{-140, -3}, {140, 3}}, textString = "Example given by Michael Tiller in 'Modelica by Example'", fontName = "Lato", textStyle = {TextStyle.Bold}), Bitmap(visible = true, origin = {-80, -53.493}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraSystems/Rabbit.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Bitmap(visible = true, origin = {49.395, 46.418}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraEquationsRevisited/Wolf.svg", imageSource = "", extent = {{20.605, -16.418}, {-20.605, 16.418}}), Bitmap(visible = true, origin = {10.605, -51.418}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraSystems/Fox.svg", imageSource = "", extent = {{20.605, -16.418}, {-20.605, 16.418}})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This model extends the two species model given in the example →<a href=\"modelica://BusinessSimulation.Examples.LotkaVolterraSystems\">LotkaVolterraSystems</a> by introducing a third species: wolves. Wolves predate on both, rabbits and foxes.</p>
<p>We can immediately extend the model for two species by introducing another material stock for wolves. As predators <code>wolves</code> will also be connected to a process of <em>exponential decline</em> (e.g., starvation in absence of prey). Since <code>wolves</code> predate on <code>rabbits</code> and <code>foxes</code>, there will be two nonlinear interactions between the stock of <code>wolves</code> and the other stocks. As before, the predator side (<code>portB</code>) of the <code>NonlinearInteraction</code> flow will be connected to the <code>inflow</code> port for <code>wolves</code>, while the prey side (<code>portA</code>) will be connected to the <code>outflow</code> port of <code>rabbits</code> and <code>foxes</code>.</p>
<h6>Model Output</h6>
<ul>
<li>The number of <strong>foxes</strong>, <strong>rabbits</strong>, and <strong>wolves</strong>.</li><br>
</ul>
<table cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Simulation Results</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraEquationsRevisited/TimePlot.svg\" alt=\"TimePlot.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>Setting <code>init = InitializationOptions.SteadyState</code> in the <em>Advanced</em> tab for <code>modelSettings</code> allows us to find the equilibrium levels for the three populations.</li><br>
<li>Instead of putting all parameters directly in the global model scope, we have used a dedicated <code>model</code> to collect global parameters: <code>theta</code>. Doing so is quite convenient for more complex models (where we will often choose to additionally assign the <code>inner</code> prefix), as we can set up the model as a component of its own and then simply modify an instance of it to arrive at a scenario run.</li><br>
<li>Selecting the icon for <code>theta</code> in the diagram we can then set all parameters in the <code>General</code> or in the <code>Parameters</code> tab in SystemModeler.</li></br>
</ul>
<h4>Acknowledgments</h4>
<p>The model presented here comes from Michael Tiller's excellent introduction \"Modelica by Example\" (see Object-Oriented Modeling&gt;Components&gt;Examples&gt;Lotka-Volterra Equations Revisited), which ships with <a href=\"wsm:///ref/ModelicaByExample/components/components/population/\">SystemModeler </a>and can also be found <a href=\"https://mbe.modelica.university/components/components/population/\">online</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Examples.LotkaVolterraSystems\">LotkaVolterraSystems</a>,
<a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.UnitsInBusinessSimulations\">Tutorial.UnitsInBusinessSimulations</a></p>
</html>", figures = {Figure(title = "Populations", identifier = "populations", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.foxes, legend = "foxes"), Curve(y = modelOutput.rabbits, legend = "rabbits"), Curve(y = modelOutput.wolves, legend = "wolves")})}, caption = "Population dynamics for foxes, rabbits, and wolves"), Figure(title = "Phase Plot I", identifier = "foxes-rabbits", plots = {Plot(curves = {Curve(x = modelOutput.foxes, y = modelOutput.rabbits, legend = "rabbits vs foxes")}, x = Axis(label = "foxes"), y = Axis(label = "rabbits"))}, caption = "Phase plot for foxes and rabbits."), Figure(title = "Phase Plot II", identifier = "foxes-wolves", plots = {Plot(curves = {Curve(x = modelOutput.foxes, y = modelOutput.wolves, legend = "wolves vs foxes")}, x = Axis(label = "foxes"), y = Axis(label = "wolves"))}, caption = "Phase plot for foxes and wolves.")}, revisions = "<html>
<ul>
<li>Slight modification for units, diagram, and simulation plots in v2.0.0.</li>
</ul>
</html>"));
end LotkaVolterraEquationsRevisited;
