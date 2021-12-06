within BusinessSimulation.Examples;

model LotkaVolterraSystems "Predator-prey dynamics"
  import BusinessSimulation.Units.Rate;
  extends Icons.Example;
  ModelOutput modelOutput "Main output of the model" annotation(Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Rate alpha(displayUnit = "1/yr") = 3.17097919837646e-9 "Reproduction rate of prey";
  parameter Rate beta(displayUnit = "1/yr") = 6.34195839675292e-10 "Mortality rate of prey per predator";
  parameter Rate gamma(displayUnit = "1/yr") = 1.26839167935058e-8 "Mortality rate of predator";
  parameter Rate delta(displayUnit = "1/yr") = 6.34195839675292e-10 "Reproduction rate of predators per prey";
  inner ModelSettings modelSettings(modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.years, dt(displayUnit = "yr") = 7884000, modelTimeHorizon(displayUnit = "yr") = 3153600000) annotation(Placement(visible = true, transformation(origin = {-135, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput
    extends Icons.DataOutPort;
    import BusinessSimulation.Units.Population;
    Population rabbits "Rabbit population";
    Population foxes "Fox population";
    Population prey "Prey population";
    Population predators "Predator population";
  end ModelOutput;
protected
  Stocks.MaterialStock prey(initialValue = 10, init = BusinessSimulation.Types.InitializationOptions.FixedValue, redeclare replaceable type OutputType = Units.Population) "Prey population" annotation(Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock predators(initialValue = 10, init = BusinessSimulation.Types.InitializationOptions.FixedValue, redeclare replaceable type OutputType = Units.Population) "Predator population" annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock rabbits(initialValue = 10, init = BusinessSimulation.Types.InitializationOptions.FixedValue, redeclare replaceable type OutputType = Units.Population) "Rabbit population" annotation(Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock foxes(initialValue = 10, init = BusinessSimulation.Types.InitializationOptions.FixedValue, redeclare replaceable type OutputType = Units.Population) "Fox population" annotation(Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExponentialGrowth reproducing(fractionalRate = alpha, hasConstantRate = true) "Growth of rabbit population" annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExponentialDecline starving(hasConstantRate = true, fractionalRate = gamma) "Foxes mortality in absense of prey" annotation(Placement(visible = true, transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Flows.Interaction.NonlinearInteraction predation(hasConstantFactorA = true, hasConstantFactorB = true, a_AB = -beta, b_AB = delta) "Foxes predating on rabbits" annotation(Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Interaction.LotkaVolterra predating(hasConstantAlpha = true, hasConstantBeta = true, hasConstantGamma = true, hasConstantDelta = true, alpha = alpha, beta = beta, delta = delta, gamma = gamma, redeclare replaceable type OutputType_A = Rate(unit = "individuals/s"), redeclare replaceable type OutputType_B = Rate(unit = "individuals/s")) "Compact interaction flow that combines all processes of growth and decline" annotation(Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(prey.outflow, predating.portA) annotation(Line(visible = true, origin = {-30, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(predating.portB, predators.inflow) annotation(Line(visible = true, origin = {10, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(reproducing.massPort, rabbits.inflow) annotation(Line(visible = true, origin = {-70, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(rabbits.outflow, predation.portA) annotation(Line(visible = true, origin = {-30, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(predation.portB, foxes.inflow) annotation(Line(visible = true, origin = {10, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(foxes.outflow, starving.massPort) annotation(Line(visible = true, origin = {50, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(rabbits.y2, modelOutput.rabbits) annotation(Line(visible = true, origin = {-19.685, -20}, points = {{-40.815, 45}, {-50.315, 45}, {-50.315, -40}, {149.685, -40}}, color = {192, 192, 192}));
  connect(prey.y1, modelOutput.prey) annotation(Line(visible = true, origin = {7.625, -47.5}, points = {{-47.125, 12.5}, {-37.625, 12.5}, {-37.625, -12.5}, {122.375, -12.5}}, color = {192, 192, 192}));
  connect(predators.y1, modelOutput.predators) annotation(Line(visible = true, origin = {67.625, -47.5}, points = {{-27.125, 12.5}, {-17.625, 12.5}, {-17.625, -12.5}, {62.375, -12.5}}, color = {192, 192, 192}));
  connect(foxes.y1, modelOutput.foxes) annotation(Line(visible = true, origin = {70.125, -17.5}, points = {{-29.625, 42.5}, {-15.125, 42.5}, {-15.125, -42.5}, {59.875, -42.5}}, color = {192, 192, 192}));
  annotation(experiment(StartTime = 0, StopTime = 3153600000, __Wolfram_DisplayTimeUnit = "yr"), __Wolfram(itemFlippingEnabled = true), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Lotka-Volterra Systems", fontName = "Lato Black"), Text(visible = true, origin = {0, 70}, textColor = {76, 112, 136}, extent = {{-140, -3}, {140, 3}}, textString = "Example given by Michael Tiller in 'Modelica by Example'", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {118.123, 11.585}, textColor = {76, 112, 136}, extent = {{-21.877, -6}, {21.877, 6}}, textString = "Explicit", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {118.123, -11.585}, textColor = {76, 112, 136}, extent = {{-21.877, -6}, {21.877, 6}}, textString = "Generic", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {46.667, 0}, points = {{33.333, 0}, {93.333, 0}, {93.333, 0}}, color = {76, 112, 136}, thickness = 1), Bitmap(visible = true, origin = {30.605, 1.418}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraSystems/Fox.svg", imageSource = "", extent = {{20.605, -16.418}, {-20.605, 16.418}}), Bitmap(visible = true, origin = {-50, 1.507}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraSystems/Rabbit.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Line(visible = true, origin = {-158.333, 0}, points = {{18.333, 0}, {78.333, 0}}, color = {76, 112, 136}, thickness = 1)}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is the basic two species model of predation from ecology&mdash;the so called <em>Lotka-Volterra-Model</em> [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">17</a>].</p>
<p>In the upper model we recognize more explicitly that both populations, rabbits and foxes, have independent processes of<em> exponential growth</em> (the prey population's net rate of growth) and <em>exponential decline</em> (the predator's net rate of negative growth&nbsp;when there is no prey). The predation is modeled using an&nbsp;an &rarr;<a href=\"modelica://BusinessSimulation.Flows.Interaction\"><em>interaction</em> </a>(a special kind of flow element). It introduces nonlinearity, as there is some fractional rate (<code>beta, delta</code>) that is multiplied with <em>rabbits(t) &sdot; foxes(t).&nbsp;</em>Predation results in an outflow from the rabbit population (increased deaths) and an inflow to the prey population (increased reproduction).</p>
<p>The model below shows the same model structure in a generalized, more compact fashion using the interaction flow component &rarr;<a href=\"modelica://BusinessSimulation.Flows.Interaction.LotkaVolterra\"><em>LotkaVolterra</em> </a>.</p>
<h6>Model Output</h6>
<ul>
<li>The number of <strong>rabbits</strong> and <strong>foxes</strong>.</li><br>
<li>The number of <strong>prey</strong> and <strong>predators</strong>.</li><br>
</ul>
<table cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Simulation Results</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/LotkaVolterraSystems/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>The model is set up in <em>years</em>, and accordingly we can enter the reproduction rate for the prey population as <code>0.1 [1/yr]</code> using the <code>displayUnit</code> attribute and conversion tables. All calculations in a simulation will always use SI-units for time so that rates are in unit <code>1/s</code> and times in unit <code>s</code>.</li><br>
<li>Model output is made explit using an <em>expandable connector</em> (<code>modelOutput</code>) where the variables <code>rabbits, foxes, prey, predators</code> are explicitly declared with appropriate units.</li>
</ul>
<h4>Acknowledgments</h4>
<p>The model presented here comes from Michael Tiller's excellent introduction \"Modelica by Example\" (see Describing Behavior&gt;Basic Equations&gt;Examples&gt;Lotka-Volterra System), which ships with <a href=\"wsm:///ref/ModelicaByExample/behavior/equations/population/\">SystemModeler </a>and can also be found <a href=\"https://mbe.modelica.university/behavior/equations/population/\">online</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.LotkaVolterra\">LotkaVolterra</a>, <a href=\"modelica://BusinessSimulation.Flows.Interaction.NonlinearInteraction\">NonlinearInteraction</a>, <a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialGrowth\">ExponentialGrowth</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecline\">ExponentialDecline</a></p>
</html>", figures = {Figure(title = "Population Dynamics", identifier = "population-plot", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.foxes, legend = "foxes"), Curve(y = modelOutput.rabbits, legend = "rabbits")})}, caption = "Population dynamics for rabbits and foxes"), Figure(title = "Phase Plot", identifier = "phase-plot", plots = {Plot(curves = {Curve(x = modelOutput.rabbits, y = modelOutput.foxes, legend = "foxes vs rabbits")}, x = Axis(label = "rabbits"), y = Axis(label = "foxes"))}, caption = "In the phase plot the oscillatory behavior of the system manifests as an orbit around a focal point.")}, revisions = "<html>
<ul>
<li>Updated units, e.g., a stock named <code>foxes</code> does not need <code>unit=\"foxes\"</code>, diagram and simulation plots in v2.0.0.</li>
</ul>
</html>"));
end LotkaVolterraSystems;
