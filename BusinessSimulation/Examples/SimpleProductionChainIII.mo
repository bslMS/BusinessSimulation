within BusinessSimulation.Examples;

model SimpleProductionChainIII "Further extending the first example to explain new product diffusion"
  extends Icons.Example;
  ModelOutput modelOutput annotation(Placement(visible = true, transformation(origin = {135, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModelSettings modelSettings(modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.months, dt(displayUnit = "mo") = 657436.5, modelTimeHorizon(displayUnit = "mo") = 315569520) annotation(Placement(visible = true, transformation(origin = {-135, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput
    extends Icons.DataOutPort;
    // stocks
    Amount customers "Customers";
    Amount potentialCustomers "Potential customers";
    Amount installedBase "Installed base";
    Amount inventory "Finished goods in stock";
    // rates
    AmountRate producing(displayUnit = "thousand/mo") "Production rate";
    AmountRate shipping(displayUnit = "thousand/mo") "Shipping rate";
    AmountRate scrapping(displayUnit = "thousand/mo") "Scrapping rate";
  end ModelOutput;
protected
  Stocks.MaterialStock inventory(initialValue = 100, hasStockInfoOutput = false, redeclare replaceable type OutputType = Amount) "Finished goods inventory" annotation(Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition shipping(hasConstantRate = false, rate = 0, redeclare replaceable type OutputType = AmountRate) "Shipments to the customers" annotation(Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth producing(hasConstantRate = false, rate = 100) "Production of a durable good" annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.DelayN installedBase(hasConstantDelayTime = true, n = 4, delayTime(displayUnit = "mo") = 157784760, redeclare replaceable type OutputType = Amount) "Products in use" annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock scrapping "Discarding of products (which will be replaced by new ones)" annotation(Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Cloud cloud1 annotation(Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.Add_2 totalOrders(redeclare replaceable type OutputType = AmountRate) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -900)));
  Stocks.MaterialStock potCustomers(initialValue(displayUnit = "thousand") = 250000, redeclare replaceable type OutputType = Amount) "Potential customers" annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoleculesOfStructure.Actuators.Diffusion wordOfMouth(hasConstantOtherAdopters = true, hasConstantOtherPopulation = true, hasConstantContactRate = true, nextStageIsInfluencing = true, hasConstantAdoptionFraction = true, adoptionFraction = 0.02, contactRate(displayUnit = "1/mo") = 3.80517503805175e-06, hasConstantFractionalAdoptionRate = true, fractionalAdoptionRate(displayUnit = "1/mo") = 0, otherAdopters = 0, otherPopulation = 0) "Bass diffusion model for a word-of-mouth process" annotation(Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock customers(initialValue = 10, redeclare replaceable type OutputType = Amount) "Initial customers (early adopters)" annotation(Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoleculesOfStructure.Policy.FirstOrderStockAdjustment productionPlanning(hasConstantAdjTime = true, adjTime(displayUnit = "mo") = 2629746) annotation(Placement(visible = true, transformation(origin = {-90, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.ConstantConverter desiredInventory(value = 100, redeclare replaceable type OutputType = Amount) annotation(Placement(visible = true, transformation(origin = {-55, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Connectors.DataBus bus annotation(Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {73.333, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inventory.outflow, shipping.portA) annotation(Line(visible = true, origin = {-30, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(shipping.portB, installedBase.inflow) annotation(Line(visible = true, origin = {10, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(producing.massPort, inventory.inflow) annotation(Line(visible = true, origin = {-70, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(installedBase.outflow, scrapping.portA) annotation(Line(visible = true, origin = {50, -30}, points = {{-10, 0}, {10, 0}}, color = {255, 0, 0}));
  connect(scrapping.portB, cloud1.massPort) annotation(Line(visible = true, origin = {90, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(scrapping.y, totalOrders.u1) annotation(Line(visible = true, origin = {56, -9.867}, points = {{19, -9.733}, {19, 4.867}, {-38, 4.867}}, color = {1, 37, 163}));
  connect(totalOrders.y, shipping.u) annotation(Line(visible = true, origin = {-9.333, -6.667}, points = {{11.333, 6.667}, {-5.667, 6.667}, {-5.667, -13.333}}, color = {1, 37, 163}));
  connect(wordOfMouth.portB, customers.inflow) annotation(Line(visible = true, origin = {-30, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(wordOfMouth.dataOut, bus) annotation(Line(visible = true, origin = {6.667, 46.8}, points = {{-51.667, -6.4}, {-51.667, 3.2}, {103.333, 3.2}}, color = {0, 0, 128}));
  connect(bus.totalAdoptionRate, totalOrders.u2) annotation(Line(visible = true, origin = {42.5, 21.318}, points = {{67.5, 28.682}, {-12.5, 28.682}, {-12.5, -16.318}, {-24.5, -16.318}}, color = {0, 0, 128}));
  connect(shipping.y2, productionPlanning.u_outflow) annotation(Line(visible = true, origin = {-54.1, -45.75}, points = {{33.6, 10.75}, {24.1, 10.75}, {24.1, -4.25}, {-40.9, -4.25}, {-40.9, -13.25}}, color = {1, 37, 163}));
  connect(inventory.y2, productionPlanning.u_current) annotation(Line(visible = true, origin = {-72.1, -47.77}, points = {{11.6, 12.77}, {7.1, 12.77}, {7.1, -7.23}, {-12.9, -7.23}, {-12.9, -11.23}}, color = {1, 37, 163}));
  connect(desiredInventory.y, productionPlanning.u_reference) annotation(Line(visible = true, origin = {-69.75, -70}, points = {{8.75, 0}, {-8.75, 0}}, color = {1, 37, 163}));
  connect(customers.y1, modelOutput.customers) annotation(Line(visible = true, origin = {83.185, 12.5}, points = {{-82.685, 12.5}, {16.815, 12.5}, {16.815, -12.5}, {51.815, -12.5}}, color = {192, 192, 192}));
  connect(potCustomers.y1, modelOutput.potentialCustomers) annotation(Line(visible = true, origin = {18.811, 12.772}, points = {{-98.311, 12.228}, {-88.811, 12.228}, {-88.811, 0.544}, {81.189, 0.544}, {81.189, -12.772}, {116.189, -12.772}}, color = {192, 192, 192}));
  connect(inventory.y1, modelOutput.inventory) annotation(Line(visible = true, origin = {37.583, -15}, points = {{-77.083, -20}, {-72.583, -20}, {-72.583, 5}, {62.417, 5}, {62.417, 15}, {97.417, 15}}, color = {192, 192, 192}));
  connect(installedBase.y, modelOutput.installedBase) annotation(Line(visible = true, origin = {81, -7.92}, points = {{-46, -11.68}, {-46, -2.08}, {19, -2.08}, {19, 7.92}, {54, 7.92}}, color = {192, 192, 192}));
  connect(producing.y1, modelOutput.producing) annotation(Line(visible = true, origin = {24.25, -31.667}, points = {{-103.75, -3.333}, {-99.25, -3.333}, {-99.25, -28.333}, {95.75, -28.333}, {95.75, 31.667}, {110.75, 31.667}}, color = {192, 192, 192}));
  connect(shipping.y1, modelOutput.shipping) annotation(Line(visible = true, origin = {64.25, -31.667}, points = {{-63.75, -3.333}, {-59.25, -3.333}, {-59.25, -28.333}, {55.75, -28.333}, {55.75, 31.667}, {70.75, 31.667}}, color = {192, 192, 192}));
  connect(scrapping.y1, modelOutput.scrapping) annotation(Line(visible = true, origin = {104.25, -31.667}, points = {{-23.75, -3.333}, {-19.25, -3.333}, {-19.25, -28.333}, {15.75, -28.333}, {15.75, 31.667}, {30.75, 31.667}}, color = {192, 192, 192}));
  connect(potCustomers.outflow, wordOfMouth.portA) annotation(Line(visible = true, origin = {-70, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(productionPlanning.y, producing.u) annotation(Line(visible = true, origin = {-106.2, -36}, points = {{5.2, -34}, {-13.8, -34}, {-13.8, 26}, {11.2, 26}, {11.2, 16}}, color = {1, 37, 163}));
  annotation(experiment(StartTime = 0, StopTime = 315569520, __Wolfram_DisplayTimeUnit = "mo", __Wolfram_NumberOfIntervals = -1), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>In this final extension of the introductory <code>SimpleProductionChain</code>, we have replaced the <code>Ramp</code> component for the first-time purchases with a model of new product diffusion.</p>
<p>We are assuming that there are 10 initial customers and a stock of 250'000 potential customers that will be turned into customers by \"word-of-mouth\" processes&mdash;for now we will assume that there is no growth or decline with regard to this potential. Each customer will meet 10 other persons at a constant <code>contactRate</code> per month and the <code>adoptionFraction</code> is assumed to be 2%.</p>
<h6>Model Output</h6>
<ul>
<li><strong>Potential customers</strong> and <strong>customers</strong> during the simulation.</li><br>
<li>The current <strong>inventory</strong> and the <strong>installed base</strong>.</li><br>
<li>The current rates of <strong>producing</strong>, <strong>shipping</strong>, and <strong>scrapping</strong>.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.StrategicBusinessSimulation\">Tutorial.StrategicBusinessSimulation</a>,
<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">SimpleProductionChain</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainII\">SimpleProductionChainII</a>,&nbsp;<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Actuators.Diffusion\">Diffusion</a></p>
</html>", figures = {Figure(title = "Stocks and Rates", identifier = "stocks-rates", preferred = true, plots = {Plot(title = "Stocks", identifier = "stocks", curves = {Curve(y = modelOutput.potentialCustomers, legend = "potential Customers"), Curve(y = modelOutput.customers, legend = "customers")}, x = Axis(unit = "yrCal"), y = Axis(unit = "thousand")), Plot(title = "Rates", identifier = "rates", curves = {Curve(y = modelOutput.producing, legend = "producing"), Curve(y = modelOutput.scrapping, legend = "scrapping")}, x = Axis(unit = "yrCal"))})}, revisions = "<html>
<ul>
<li>Updated plot and changed type to <code>AmountRate</code> for reported flows in v2.0.0.</li><br>
<li>Unit modification for <code>wordOfMouth.fractionalAdoptionRate</code> should have been a modification of <code>displayUnit</code>; fixed in v2.2.</li><br>
</ul>
</html>"), __Wolfram, Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 65}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Simple Production Chain III", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end SimpleProductionChainIII;
