within BusinessSimulation.Examples;

model SimpleProductionChainII "Extending the first example to include replacement purchases"
  extends Icons.Example;
  ModelOutput modelOutput "Main output for the model" annotation(Placement(visible = true, transformation(origin = {130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModelSettings modelSettings(modelDisplayTimeBase = BusinessSimulation.Types.TimeBases.months, dt(displayUnit = "mo") = 657000, modelTimeHorizon(displayUnit = "mo") = 157680000) annotation(Placement(visible = true, transformation(origin = {-135, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput "Main output for the model"
    extends Icons.DataOutPort;
    Amount inventory "Finished goods inventory";
    Amount installedBase "Installed base for the product";
    Rate producing "Rate of production";
    Rate shipping "Rate of shipping to customers";
    Rate scrapping "Rate of scrapping at the end of useful life";
  end ModelOutput;
protected
  Stocks.MaterialStock inventory(initialValue = 0, redeclare replaceable type OutputType = Amount) "Finished goods inventory" annotation(Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition shipping(hasConstantRate = false, rate(displayUnit = "1/mo") = 3.80517503805175e-06, redeclare replaceable type OutputType = Rate) "Shippment to the customer at an exogenous rate" annotation(Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth producing(hasConstantRate = false, rate(displayUnit = "1/mo") = 3.80517503805175e-05) "Production at a constant rate" annotation(Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.DelayN installedBase(hasConstantDelayTime = false, n = 4, delayTime(displayUnit = "yr") = 157680000, initialValue = 0, redeclare replaceable type OutputType = Amount) "Product stays in use for around 5 years" annotation(Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock scrapping "After its useful life has expired, products will be discarded" annotation(Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InformationSources.RampInput firstTimePurchases(redeclare replaceable type OutputType = Rate, offset(displayUnit = "1/mo") = 3.80517503805175e-06, height(displayUnit = "1/mo") = 3.42465753424658e-05, startTime(displayUnit = "mo") = 15768000, duration(displayUnit = "mo") = 47304000) "Ramping up from 10 to 100 units per month starting at 6 mo for 18 mo" annotation(Placement(visible = true, transformation(origin = {-65, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime usefulLife(value(displayUnit = "yr") = 157680000) "Average time a product remains in use" annotation(Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Add_2 shippingRate(redeclare replaceable type OutputType = Rate) "The total rate of material that is being shipped to customers" annotation(Placement(visible = true, transformation(origin = {-15, 22.729}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MoleculesOfStructure.Policy.FirstOrderStockAdjustment productionRate(adjTime(displayUnit = "mo") = 2628000, hasConstantAdjTime = true) "Policy to determine rate of production" annotation(Placement(visible = true, transformation(origin = {-90, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.ConstantConverter desiredInventory(value = 100) "The constant level of inventory we wich to maintain" annotation(Placement(visible = true, transformation(origin = {-50, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SourcesOrSinks.Cloud cloud1 annotation(Placement(visible = true, transformation(origin = {110, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(inventory.outflow, shipping.portA) annotation(Line(visible = true, origin = {-30, -10}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(shipping.portB, installedBase.inflow) annotation(Line(visible = true, origin = {10, -10}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(producing.massPort, inventory.inflow) annotation(Line(visible = true, origin = {-70, -10}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(installedBase.outflow, scrapping.portA) annotation(Line(visible = true, origin = {50, -10}, points = {{-10, 0}, {10, 0}}, color = {255, 0, 0}));
  connect(scrapping.portB, cloud1.massPort) annotation(Line(visible = true, origin = {90, -10}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(usefulLife.y, installedBase.u) annotation(Line(visible = true, origin = {22, 13.333}, points = {{-6, 6.667}, {3, 6.667}, {3, -13.333}}, color = {1, 37, 163}));
  connect(firstTimePurchases.y, shippingRate.u2) annotation(Line(visible = true, origin = {-32.333, 40.243}, points = {{-24.667, 4.757}, {12.333, 4.757}, {12.333, -9.514}}, color = {1, 37, 163}));
  connect(shippingRate.y, shipping.u) annotation(Line(visible = true, origin = {-15, 7.364}, points = {{0, 7.364}, {0, -7.364}}, color = {1, 37, 163}));
  connect(scrapping.y, shippingRate.u1) annotation(Line(visible = true, origin = {32.5, 30.282}, points = {{42.5, -29.882}, {42.5, 14.718}, {-42.5, 14.718}, {-42.5, 0.447}}, color = {1, 37, 163}));
  connect(desiredInventory.y, productionRate.u_reference) annotation(Line(visible = true, origin = {-67.5, -50}, points = {{11.5, 0}, {-11.5, 0}}, color = {1, 37, 163}));
  connect(shipping.y2, productionRate.u_outflow) annotation(Line(visible = true, origin = {-54.1, -25.8}, points = {{33.6, 10.8}, {24.1, 10.8}, {24.1, -4.2}, {-40.9, -4.2}, {-40.9, -13.2}}, color = {1, 37, 163}));
  connect(inventory.y2, productionRate.u_current) annotation(Line(visible = true, origin = {-74.1, -27.8}, points = {{13.6, 12.8}, {4.1, 12.8}, {4.1, -7.2}, {-10.9, -7.2}, {-10.9, -11.2}}, color = {1, 37, 163}));
  connect(productionRate.y, producing.u) annotation(Line(visible = true, origin = {-106.2, -16}, points = {{5.2, -34}, {-13.8, -34}, {-13.8, 26}, {11.2, 26}, {11.2, 16}}, color = {1, 37, 163}));
  connect(producing.y1, modelOutput.producing) annotation(Line(visible = true, origin = {-24.875, -27.5}, points = {{-54.625, 12.5}, {-50.125, 12.5}, {-50.125, -12.5}, {154.875, -12.5}}, color = {192, 192, 192}));
  connect(shipping.y1, modelOutput.shipping) annotation(Line(visible = true, origin = {35.125, -27.5}, points = {{-34.625, 12.5}, {-30.125, 12.5}, {-30.125, -12.5}, {94.875, -12.5}}, color = {192, 192, 192}));
  connect(inventory.y1, modelOutput.inventory) annotation(Line(visible = true, origin = {5.125, -27.5}, points = {{-44.625, 12.5}, {-40.125, 12.5}, {-40.125, -12.5}, {124.875, -12.5}}, color = {192, 192, 192}));
  connect(scrapping.y1, modelOutput.scrapping) annotation(Line(visible = true, origin = {95.125, -27.5}, points = {{-14.625, 12.5}, {-10.125, 12.5}, {-10.125, -12.5}, {34.875, -12.5}}, color = {192, 192, 192}));
  connect(installedBase.y1, modelOutput.installedBase) annotation(Line(visible = true, origin = {65.125, -27.5}, points = {{-24.625, 12.5}, {-20.125, 12.5}, {-20.125, -12.5}, {64.875, -12.5}}, color = {192, 192, 192}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>In this model we extend the introductory example &rarr;<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">SimpleProductionChain</a>&nbsp;by including the rate of scrapping in determining the rate of shipping. We simply assume, that whatever is scrapped will immediately be replaced by a new product.</p>
<p>Since this introduces some variation in the rate of shipping, we need to have an adequate <em>policy</em> to determine the production rate. In this case we make use of a policy component called &rarr;<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy.FirstOrderStockAdjustment\">FirstOrderStockAdjustment</a> that can be found in the <code<MoleculesOfStructure</code> package. It simply determines the rate of inflow needed to keep a stock at a desired level, given the current amount in the stock and the (perceived) rate of outflow from the stock.</p>
<p>Here we would like to keep the inventory at a desired level of 100 units.&nbsp;</p>
<h6>Model Output</h6>
<ul>
<li>The current <strong>inventory</strong> and the <strong>installed base</strong>.</li><br>
<li>The current rates of <strong>producing</strong>, <strong>shipping</strong>, and <strong>scrapping</strong>.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.StrategicBusinessSimulation\">Tutorial.StrategicBusinessSimulation</a>,
<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">SimpleProductionChain</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainIII\">SimpleProductionChainIII</a></p>
</html>", figures = {Figure(title = "Stocks", identifier = "stocks", plots = {Plot(curves = {Curve(y = modelOutput.inventory, legend = "inventory"), Curve(y = modelOutput.installedBase, legend = "installedBase")})}), Figure(title = "Flows", identifier = "flows", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.producing, legend = "producing"), Curve(y = modelOutput.scrapping, legend = "scrapping"), Curve(y = modelOutput.shipping, legend = "shipping")}, y = Axis(unit = "1/mo"))}, caption = "The production rate quickly tracks the shipping rate once inventory is filled to 100 units. Two years into the simulation shipping is \"moulded\" by replacement purchases.")}, revisions = "<html>
<ul>
<li>Updated plots in v2.0.0.</li>
</ul>
</html>"), experiment(StartTime = 0, StopTime = 157680000, __Wolfram_DisplayTimeUnit = "mo"), __Wolfram, Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 65}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Simple Production Chain II", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end SimpleProductionChainII;
