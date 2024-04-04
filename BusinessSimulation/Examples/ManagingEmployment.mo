within BusinessSimulation.Examples;

model ManagingEmployment "Human resource planning"
  extends Icons.Example;
  ModelOutput modelOutput "The model's main output" annotation(Placement(visible = true, transformation(origin = {120, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {87.542, -1.783}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModelSettings modelSettings(modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.seconds, modelTimeHorizon = 10, dt = 0.25) annotation(Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput "The model's main output"
    extends Icons.DataOutPort;
    Labor workforce "The workforce given as FTE";
    Labor desiredWorkforce "The desired workforce";
    Time experience "Average workexperience in the workforce";
  end ModelOutput;

  Converters.ConstantConverter gainingExperienceRate(redeclare type OutputType = BusinessSimulation.Units.Ratio, value = 1) "Gaining experience in units 1s per 1s" annotation(Placement(transformation(origin = {-70, -75}, extent = {{-10, -10}, {10, 10}})));
protected
  SourcesOrSinks.Growth hiring "Workforce entering the company" annotation(Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.DelayN workforce(hasConstantDelayTime = false, hasStockInfoOutput = true, n = 3, redeclare replaceable type OutputType = Labor, initialValue = 750) "Workforce measured in full-time equivalents (FTE)" annotation(Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoleculesOfStructure.Policy.FirstOrderStockAdjustment recruitingPolicy(adjTime = 0.5) "How many people are needed?" annotation(Placement(visible = true, transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.HinesCoflow expertise(initialValue = 8, hasStockInfoOutput = false, redeclare type OutputType = BusinessSimulation.Units.Time) "Average erperience of employees measured in years" annotation(Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth gainingExperience(hasConstantRate = false) "Gaining experience on the job" annotation(Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock attrition "Workforce leaving the company" annotation(Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Cloud cloud1 annotation(Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime employmentPeriod(value = 5, redeclare type OutputType = BusinessSimulation.Units.Time) "Average length of employment" annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.Smooth perceivedAttrition(delayTime = 1, init = BusinessSimulation.Types.InitializationOptions.SteadyState, redeclare replaceable type OutputType = LaborGrowthRate) "The rate of leaving the company reported with delay" annotation(Placement(visible = true, transformation(origin = {10, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  InformationSources.RampInput experienceNewEmployees(redeclare type OutputType = BusinessSimulation.Units.Time, offset = 5, startTime = 1, height = -3, duration = 4) "The prior experience of new employees given in years" annotation(Placement(visible = true, transformation(origin = {-117.141, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InformationSources.RampInput desiredWorkforce(offset = 750, startTime = 1, height = 450, duration = 6, redeclare replaceable type OutputType = Labor) "The desired Workforce given in FTE" annotation(Placement(visible = true, transformation(origin = {-118.276, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
public
equation
  connect(hiring.massPort, workforce.inflow) annotation(Line(visible = true, origin = {-10, -10}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(recruitingPolicy.y, hiring.u) annotation(Line(visible = true, origin = {-39.667, 20}, points = {{-9.333, 10}, {4.667, 10}, {4.667, -20}}, color = {1, 37, 163}));
  connect(workforce.y_stockInfo, expertise.u_stockInfo) annotation(Line(visible = true, origin = {19.333, -14.933}, points = {{-1.333, 15.333}, {-1.333, 19.933}, {10.667, 19.933}, {10.667, -15.067}, {-9.333, -15.067}, {-9.333, -25.067}}, color = {128, 0, 128}));
  connect(gainingExperience.massPort, expertise.inflow) annotation(Line(visible = true, origin = {-10, -50}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(workforce.outflow, attrition.portA) annotation(Line(visible = true, origin = {30, -10}, points = {{-10, 0}, {10, 0}}, color = {255, 0, 0}));
  connect(attrition.portB, cloud1.massPort) annotation(Line(visible = true, origin = {70, -10}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(employmentPeriod.y, workforce.u) annotation(Line(visible = true, origin = {14.667, 13.333}, points = {{19.333, 6.667}, {-9.667, 6.667}, {-9.667, -13.333}}, color = {1, 37, 163}));
  connect(attrition.y, perceivedAttrition.u) annotation(Line(visible = true, origin = {43.121, 40.133}, points = {{11.879, -39.733}, {11.879, 19.867}, {-23.758, 19.867}}, color = {1, 37, 163}));
  connect(perceivedAttrition.y, recruitingPolicy.u_outflow) annotation(Line(visible = true, origin = {-36.667, 53.667}, points = {{36.667, 6.333}, {-18.333, 6.333}, {-18.333, -12.667}}, color = {1, 37, 163}));
  connect(workforce.y2, recruitingPolicy.u_current) annotation(Line(visible = true, origin = {-30.1, 22.2}, points = {{29.6, -37.2}, {20.1, -37.2}, {20.1, 27.8}, {-34.9, 27.8}, {-34.9, 18.8}}, color = {1, 37, 163}));
  connect(experienceNewEmployees.y, expertise.u) annotation(Line(visible = true, origin = {-33.047, -33.333}, points = {{-76.094, 3.333}, {38.047, 3.333}, {38.047, -6.667}}, color = {1, 37, 163}));
  connect(workforce.y1, modelOutput.workforce) annotation(Line(visible = true, origin = {47.625, -27.5}, points = {{-27.125, 12.5}, {-22.625, 12.5}, {-22.625, -7.5}, {72.375, -7.5}}, color = {192, 192, 192}));
  connect(desiredWorkforce.y, modelOutput.desiredWorkforce) annotation(Line(visible = true, origin = {-37.569, -2.5}, points = {{-72.707, 32.5}, {-42.431, 32.5}, {-42.431, -32.5}, {157.569, -32.5}}, color = {192, 192, 192}));
  connect(expertise.y, modelOutput.experience) annotation(Line(visible = true, origin = {50, -36.533}, points = {{-35, -3.067}, {-35, 1.533}, {70, 1.533}}, color = {192, 192, 192}));
  connect(gainingExperienceRate.y, gainingExperience.u) annotation(Line(points = {{-65, -75}, {-35, -75}, {-35, -60}}, color = {1, 37, 163}));
  connect(desiredWorkforce.y, recruitingPolicy.u_reference) annotation(Line(points = {{-110, 30}, {-70, 30}}, color = {1, 37, 163}));
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Managing Employment", fontName = "Lato"), Text(visible = true, origin = {-0, 70}, textColor = {255, 0, 0}, extent = {{-140, -3}, {140, 3}}, textString = "1 s === 1 y", fontName = "Lato")}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>In this stylized model of human resource management, we are using →<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.FirstOrderStockAdjustment\">FirstOrderStockAdjustment</a> to control the rate of <code>hiring</code> to keep a company's workforce at the desired level given in full time equivalents (FTE). The workforce in the present case is reduced by attrition as the average employment period is <code>5 years</code>—we will model this delay as an exponential delay of 3rd order.</p>
<p>At the start of the simulation we will have the workforce meet its desired level of <code>750 FTE</code>. The desired workforce will then ramp up by <code>450 FTE</code> starting at the end of the first year over a time of six years.</p>
<p>We would like to keep track of the average experience of the workforce, which we will simply measure in years of relevant work experience. New employees will arrive with an experience of <code>5 years</code>, but we assume that this will fall to just <code>2 years</code> starting at the end of the first year over four years due to fierce competition for experienced workers. At the start of the simulation, the average experience in our company is around <code>8 years</code>.</p>
<h6>Model Output</h6>
<ul>
<li>The <strong>desired workforce</strong>.</li><br>
<li>The current <strong>workforce</strong>.</li><br>
<li>The current, average <strong>experience</strong> for the workforce.</li><br>
</ul>
<h4>Notes</h4>
<ul>
<li>In this example we make use of what is called a \"coflow\" (→<a href = \"modelica://BusinessSimulation.Stocks.HinesCoflow\">HinesCoflow</a>) to keep track of some <em>mean quality</em> with regard to entities within a stock (e.g., <code>expertise</code> of the <code>workforce</code>).</li><br>
<li>Using the structural parameters <code>hasStockInfoOutput = true</code> for <code>workforce</code> will introduce an additional connector <code>y_stockInfo</code> which we can then simply connect to the matching connector <code>u_stockInfo</code> for <code>expertise</code>. All we need then is an <code>input</code> providing the current attribute for new entries to <code>workforce</code> and we are all set.</li><br>
<li>Using the <code>inflow</code> and <code>outflow</code> ports for the coflow we can connect <em>processes that directly change the average quality</em> (e.g., gaining experience on the job as done here).</li>
</ul>
</html>", figures = {Figure(title = "Workforce and Experience", identifier = "workforce-experience", preferred = true, plots = {Plot(title = "Workforce", identifier = "Fig1", curves = {Curve(y = modelOutput.workforce, legend = "workforce"), Curve(y = modelOutput.desiredWorkforce, legend = "desiredWorkforce")}), Plot(title = "Experiece", identifier = "Fig2", curves = {Curve(y = modelOutput.experience, legend = "experience")})}, caption = "The workforce closely follows the desired level (Fig1); average workexperience drops significantly over the next years (Fig2).")}, revisions = "<html>
<ul>
<li>Modified simulation plots in v2.0.0.</li>
</ul>
</html>"));
end ManagingEmployment;
