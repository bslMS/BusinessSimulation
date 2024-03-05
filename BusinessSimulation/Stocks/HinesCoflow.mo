within BusinessSimulation.Stocks;

model HinesCoflow "Accounting for changes in average quality of a stock as new entries with different characteristic flow in"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.{small, zero, inf, INF};
  extends Interfaces.Basics.GenericStock(hasStockInfoOutput = false, y.start = initialValue);
  extends Icons.Stock;
  extends Icons.FlowIndicators;
  Interfaces.Connectors.StockInfoInput u_stockInfo "Stock information input port" annotation(Placement(visible = true, transformation(origin = {-145, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealInput u "Characteristic of new elements flowing into the stock of fundamental quality" annotation(Placement(visible = true, transformation(origin = {-145, 45}, extent = {{10, -10}, {-10, 10}}, rotation = -540), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  parameter OutputType initialValue = 0 "Initial value for average characteristic";
protected
  InformationLevel avgCharacteristic(redeclare final type OutputType = OutputType, initialValue = initialValue) "Average characteristic" annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange changing "Change in the average characteristic" annotation(Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoleculesOfStructure.Policy.CloseGap rateOfChange(hasConstantAdjTime = false) "Rate of change is given as a first-order smooth" annotation(Placement(visible = true, transformation(origin = {-10, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MoleculesOfStructure.InformationProcessing.ResidenceTime dilutionTime(durationAtZeroRate = 0) "Time to dilute the average characteristic" annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.AbsoluteSensor absoluteSensor annotation(Placement(visible = true, transformation(origin = {-110, 37.865}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
equation
  connect(avgCharacteristic.y, y) annotation(Line(visible = true, origin = {90, 23.467}, points = {{-35, -13.067}, {-35, 6.533}, {70, 6.533}}, color = {0, 0, 127}));
  connect(avgCharacteristic.y, y1) annotation(Line(visible = true, origin = {90, 50.133}, points = {{-35, -39.733}, {-35, 19.867}, {70, 19.867}}, color = {0, 0, 127}));
  connect(avgCharacteristic.y1, y2) annotation(Line(visible = true, origin = {69.237, -28.5}, points = {{-8.737, 23.5}, {30.763, 23.5}, {30.763, -21.5}, {90.763, -21.5}}, color = {0, 0, 127}));
  connect(outflow, avgCharacteristic.outflow) annotation(Line(visible = true, origin = {104.232, 0}, points = {{44.232, 0}, {-44.232, 0}}, color = {128, 0, 128}));
  connect(inflow, avgCharacteristic.inflow) annotation(Line(visible = true, origin = {-50, -8.333}, points = {{-98.205, 8.333}, {-70, 8.333}, {80, 8.333}, {90, 8.333}}, color = {128, 0, 128}));
  connect(changing.massPort, avgCharacteristic.inflow) annotation(Line(visible = true, origin = {34.275, 10}, points = {{-14.275, 10}, {-1.625, 10}, {-1.625, -10}, {5.725, -10}}, color = {128, 0, 128}));
  connect(u_stockInfo, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-60, 88.5}, points = {{-85, 1.5}, {-85, 1.5}, {-50, 1.5}, {-50, -46.635}}, color = {128, 0, 128}));
  connect(absoluteSensor.stock, dilutionTime.u_level) annotation(Line(visible = true, origin = {-96.961, 27.955}, points = {{-17.991, 5.91}, {-17.991, -2.955}, {35.981, -2.955}}, color = {1, 37, 163}));
  connect(u_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {64, 21}, points = {{-209, 69}, {16, 69}, {16, -101}, {86, -101}}, color = {128, 0, 128}));
  connect(dilutionTime.y, rateOfChange.u_adjTime) annotation(Line(visible = true, origin = {-28.38, 37.884}, points = {{-10.362, -17.884}, {-1.62, -17.884}, {-1.62, 2.116}, {7.38, 2.116}}, color = {0, 0, 127}));
  connect(rateOfChange.y, changing.u) annotation(Line(visible = true, origin = {3.667, 40}, points = {{-2.667, 5}, {1.333, 5}, {1.333, -10}}, color = {1, 37, 163}));
  connect(u, rateOfChange.u_reference) annotation(Line(visible = true, origin = {-59, 52.5}, points = {{-86, -7.5}, {24, -7.5}, {24, -7.5}, {38, -7.5}}, color = {0, 0, 128}));
  connect(avgCharacteristic.y, rateOfChange.u_current) annotation(Line(visible = true, origin = {22.5, 49.1}, points = {{32.5, -38.7}, {32.5, 15.9}, {-32.5, 15.9}, {-32.5, 6.9}}, color = {1, 37, 163}));
  connect(absoluteSensor.inFlow, dilutionTime.u_rate) annotation(Line(visible = true, origin = {-107.342, 24.433}, points = {{-12.658, 9.432}, {-12.658, -9.433}, {46.319, -9.433}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>HinesCoflow</em> is a modification of the classical coflow structure used in system dynamics [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>, pp. 50f.]. The traditional coflow is a model of a stock's average quality (e.g., age, weight, price, income etc.) changing, as new entities with different characteristics <strong><code>u</code></strong> flow in while older entities flow out—in which case we assume, that the outflowing entities have an average quality [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">3</a>, pp. 497-511].</p>
<p>The <em>HinesCoflow</em> makes use of the fact, that the average quality of the entities in the stock is <em>diluted</em> by inflowing entities of different quality, i.e., the process is a <em>smooth</em> with a variable time constant. The benefit of this formulation is, that the average quality of the stock is directly modeled by a stock, so that processes that change the average (e.g., gaining experience over the time of residence for a stock of workers) can be directly modeled as in- or outflows to the <em>HinesCoflow</em>.</p>
<h4>Notes</h4>
<ul>
<li>The component makes use of the compact <code>StockInfoInput</code> connector to collect the required information from a connected stock. For this to properly work out, inflows and outflows should not be mixed at a single <code>StockPort</code> (e.g., it is best practice to connect known inflows to the <code>inflow</code> and known outflows to the <code>outflow</code> port). In case of a bi-directional flow, only <em>one</em> bi-flow should be connected to any single <code>StockPort</code>—no additional flows should be present at that port (see notes for &rarr;<a href=\"modelica://BusinessSimulation.Sensors.AbsoluteSensor\">AbsoluteSensor</a>).</li>
</ul>
<ul>
<li>Inflows and outflows changing the <em>mean quality</em>&nbsp;can be directly connected to the component (on either side; the markings for inflow and outflow are only suggestive).</li><br>
<li>The optional <code>StockInfoOutput</code> (<code>y_stockInfo</code>) can be used to pass the stock information received from a connected stock onward to additional coflow components—or sensors.</li>
</ul>
<h4>Acknowledgements</h4>
<p>The Hines Coflow is explicitly named after its creator, James Hines. More information can be found on <a href=\"https://sdmolecules.org/index.htm#MoleculeTopics/CloseGap/FirstOrderSmooth/HinesCoflow/hinesCoflow.htm\">his website</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\">InformationLevel&nbsp;</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {255, 0, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Mean Quality", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end HinesCoflow;
