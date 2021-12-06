within BusinessSimulation.Examples;

model SIR "Classical epidemic model by Kermack and McKendrick"
  extends Icons.Example;
  inner ModelSettings modelSettings(modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.days, modelTimeHorizon(displayUnit = "d") = 8640000, dt(displayUnit = "d") = 21600) annotation(Placement(visible = true, transformation(origin = {-115, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput "The model's main output"
    import BusinessSimulation.Units.{Amount,Rate};
    extends Icons.DataOutPort;
    Amount infected(displayUnit = "million") "Infected population";
    Amount susceptible(displayUnit = "million") "Susceptible population";
    Amount removed(displayUnit = "million") "Removed population";
  end ModelOutput;

  ModelOutput modelOutput "The model's main output" annotation(Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Converters.ConstantConverter.OutputType baseReproductionNumber(displayUnit = "each") = 2.5 "Value of constant output (R0.value)";
  parameter Converters.ConstantConverterTime.OutputType infPeriod(displayUnit = "d") = 432000 "Length of the infectious perid (infectiousPeriod.value)";
  parameter Integer n(min = 1) = 3 "Order of the exponential delay (infected.n)";
protected
  Stocks.MaterialStock susceptible(initialValue(displayUnit = "million") = 1e6, redeclare replaceable type OutputType = Units.Amount) "Population in the susceptible stage of the disease" annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock removed(redeclare replaceable type OutputType = Units.Amount) annotation(Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.DelayN infected(n = n, initialValue = 1, hasConstantDelayTime = false, delayTime.unit = "d", redeclare replaceable type OutputType = Units.Amount) "Population in the infectious stage of the disease" annotation(Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoleculesOfStructure.Actuators.Diffusion becoming_infected(hasConstantOtherAdopters = true, hasConstantOtherPopulation = false, hasConstantFractionalAdoptionRate = true, hasConstantAdoptionFraction = true, nextStageIsInfluencing = true, fractionalAdoptionRate = 0, adoptionFraction = 1) "The infection is spread by a process of social diffusion" annotation(Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock being_removed annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime infectiousPeriod(value(displayUnit = "d") = infPeriod) "Time interval during which an individual is infectious" annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.ConstantConverter R0(value(displayUnit = "each") = baseReproductionNumber) "Basic reproduction number for the infectious disease" annotation(Placement(visible = true, transformation(origin = {20, 25}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.Division transmissionRate "Effective contact rate" annotation(Placement(visible = true, transformation(origin = {-30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Connectors.DataInPort inputDiffusion "Collected (named) input for the infection process" annotation(Placement(visible = true, transformation(origin = {-90, 5}, extent = {{-10, -10}, {10, 10}}, rotation = -810), iconTransformation(origin = {-63.333, 35.643}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(susceptible.outflow, becoming_infected.portA) annotation(Line(visible = true, origin = {-70, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(becoming_infected.portB, infected.inflow) annotation(Line(visible = true, origin = {-30, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(infected.outflow, being_removed.portA) annotation(Line(visible = true, origin = {10, -30}, points = {{-10, 0}, {10, 0}}, color = {255, 0, 0}));
  connect(being_removed.portB, removed.inflow) annotation(Line(visible = true, origin = {50, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(R0.y, transmissionRate.u1) annotation(Line(visible = true, origin = {-4, 25}, points = {{18, 0}, {-18, 0}}, color = {1, 37, 163}));
  connect(infectiousPeriod.y, transmissionRate.u2) annotation(Line(visible = true, origin = {-0.439, 7.5}, points = {{14.439, -7.5}, {3.061, -7.5}, {3.061, 7.5}, {-21.561, 7.5}}, color = {1, 37, 163}));
  connect(becoming_infected.dataIn, inputDiffusion) annotation(Line(visible = true, origin = {-72.5, -5}, points = {{17.5, -15}, {17.5, -5}, {-17.5, -5}, {-17.5, 10}}, color = {0, 0, 128}));
  connect(removed.y, inputDiffusion.otherPopulation) annotation(Line(visible = true, origin = {-7.5, 25.1}, points = {{82.5, -44.7}, {82.5, 24.9}, {-82.5, 24.9}, {-82.5, -20.1}}, color = {1, 37, 163}));
  connect(infectiousPeriod.y, infected.u) annotation(Line(visible = true, origin = {-5.333, -6.667}, points = {{19.333, 6.667}, {-9.667, 6.667}, {-9.667, -13.333}}, color = {1, 37, 163}));
  connect(transmissionRate.y, inputDiffusion.contactRate) annotation(Line(visible = true, origin = {-72.667, 15}, points = {{34.667, 5}, {-17.333, 5}, {-17.333, -10}}, color = {1, 37, 163}));
  connect(susceptible.y1, modelOutput.susceptible) annotation(Line(visible = true, origin = {-24.875, -47.5}, points = {{-54.625, 12.5}, {-50.125, 12.5}, {-50.125, -12.5}, {154.875, -12.5}}, color = {192, 192, 192}));
  connect(infected.y1, modelOutput.infected) annotation(Line(visible = true, origin = {37.248, -47.5}, points = {{-36.748, 12.5}, {-32.248, 12.5}, {-32.248, -12.5}, {92.752, -12.5}}, color = {192, 192, 192}));
  connect(removed.y1, modelOutput.removed) annotation(Line(visible = true, origin = {102.203, -47.5}, points = {{-21.703, 12.5}, {-17.203, 12.5}, {-17.203, -12.5}, {27.797, -12.5}}, color = {192, 192, 192}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The SIR model is a classical approach in mathematical epidemiology to study the spread of infectious diseases. The model goes back to William Ogilvy Kermack and Anderson Gray McKendrick [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">23</a>] and is also called Kermack-McKendrick-Model.</p>
<p>The whole population is separated into three stocks(→<strong>modelOutput</strong>):</p>
<ul>
<li>The <strong>Susceptible (S)</strong> population that is not immune and may be infected.</li><br>
<li>The <strong>Infected (I)</strong> population that is infected and <em>infectious</em>.</li><br>
<li>The <strong>Removed (R)</strong> population can neither be infected nor spread the disease.</li>
</ul>
<p>As in the example →<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainIII\">SimpleProductionChainIII</a> we are using the →<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Actuators.Diffusion\">Diffusion</a> component to model <em>social diffusion</em>, e.g., spread by contact. The <code>transmissionRate</code> (&beta; in the mathematical literature) is also sometimes called the <em>effective contact rate</em> which helps to understand why we have set the <code>adoptionFraction</code> to <code>1</code>in the <code>Diffusion</code> component.</p>
<table cellspacing=\"0\" cellpadding=\"2\" style=\"margin-left: auto; margin-right: auto;\"><caption align=\"bottom\">Simulation Results</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/SIR/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>As in the example →<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainIII\">SimpleProductionChainIII</a> we need to use an <em>expandable connector</em> (<code>inputDiffusion</code>) at the scope of the model to establish connections for inputs to <code>becoming_infected</code> in compliance with Modelica specifications. SystemModeler will assist connections with a drop down list making this rather convenient.</li>
</ul>
<html>", revisions = "<html>
<ul>
<li>Adjusted <code>modelSettings</code> and modified plot in v2.0.0.</li>
</ul>
</html>", figures = {Figure(title = "SIR", identifier = "stocks", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.susceptible, legend = "Susceptible"), Curve(y = modelOutput.infected, legend = "Infected"), Curve(y = modelOutput.removed, legend = "Removed")})}, caption = "Susceptible, infected, and removed population.")}), experiment(StartTime = 0, StopTime = 8640000, __Wolfram_DisplayTimeUnit = "d"), __Wolfram, Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "SIR Model of an Epidemic", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 65}, textColor = {76, 112, 136}, extent = {{-140, -3}, {140, 3}}, textString = DynamicSelect("Kermack and McKendrick", "Kermack and McKendrick"), fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-90, -60}, textColor = {128, 128, 128}, extent = {{-11.512, -12.439}, {11.512, 12.439}}, textString = "S", fontSize = 72, textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-10, -60}, textColor = {128, 128, 128}, extent = {{-11.512, -12.439}, {11.512, 12.439}}, textString = "I", fontSize = 72, textStyle = {TextStyle.Bold}), Text(visible = true, origin = {70, -60}, textColor = {128, 128, 128}, extent = {{-11.512, -12.439}, {11.512, 12.439}}, textString = "R", fontSize = 72, textStyle = {TextStyle.Bold}), Bitmap(visible = true, origin = {-38.467, -7.49}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/SIR/Virus.svg", imageSource = "", extent = {{-13.467, -10.731}, {13.467, 10.731}})}));
end SIR;
