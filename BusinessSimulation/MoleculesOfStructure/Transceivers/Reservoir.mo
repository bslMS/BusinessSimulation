within BusinessSimulation.MoleculesOfStructure.Transceivers;

model Reservoir "A single stock drained by an outflow at a given rate"
  import BusinessSimulation.Constants.inf;
  import BusinessSimulation.Types.InitializationOptions;
  extends Icons.SubsystemTransceiver;
  extends Interfaces.Basics.OutputTypeChoice;
  Interfaces.Connectors.StockPort stockPort "Receiving side of the element" annotation(Placement(visible = true, transformation(origin = {-148.207, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.FlowPort flowPort if hasFlowPort annotation(Placement(visible = true, transformation(origin = {148.053, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u "Rate of outflow from the stock" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.StockInfoOutput y_stockInfo if hasStockInfoOutput "Optional StockInfoOutput" annotation(Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  RealOutput y "Amount in the stock" annotation(Placement(visible = true, transformation(origin = {160, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  parameter OutputType initialValue = 0 "Initial level of stock";
  parameter OutputType maxValue = inf "Maximum admissable value (reservoir.maxValue)";
  parameter OutputType minValue = -inf "Minimum admissable value (reservoir.minValue)";
  parameter Boolean hasStockInfoOutput = false "= true, if a StockInfoOutput should be added to the stock (reservoir.hasStockInfoOutput)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasFlowPort = true "= true, if the outflow from the stock will go to a flow port instead of a cloud" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState) (reservoir.init)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean useAssert = false "= true, if  leaving the admissable range is to cause an error or warning (reservoir.useAssert)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean causeError = true "= true, if leaving the admissable range is to cause an error instead of simply a warning (reservoir.causeError)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  replaceable Stocks.InformationLevel stock(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) constrainedby BusinessSimulation.Interfaces.PartialStocks.BasicStock "The reservoir that is filled or drained by the connected flows." annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)), choices(choice(redeclare replaceable BusinessSimulation.Stocks.InformationLevel stock(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) "Information Level"), choice(redeclare replaceable BusinessSimulation.Stocks.MaterialStock stock(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) "Material Stock"), choice(redeclare replaceable BusinessSimulation.Stocks.CapacityRestrictedStock stock(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) "Capacity Restricted Stock")));
  Flows.Unidirectional.Transition movingOn annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Cloud cloud if not hasFlowPort "System boundary" annotation(Placement(visible = true, transformation(origin = {105, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(u, movingOn.u) annotation(Line(visible = true, origin = {-25, 43.333}, points = {{-120, 16.667}, {60, 16.667}, {60, -33.333}}, color = {0, 0, 127}));
  connect(stock.outflow, movingOn.portA) annotation(Line(visible = true, origin = {20, 0}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(movingOn.portB, flowPort) annotation(Line(visible = true, origin = {99.026, 0}, points = {{-49.026, 0}, {49.026, 0}}, color = {128, 0, 128}));
  connect(stock.inflow, stockPort) annotation(Line(visible = true, origin = {-79.103, 0}, points = {{69.103, 0}, {-69.103, 0}}, color = {128, 0, 128}));
  connect(stock.y, y) annotation(Line(visible = true, origin = {56.667, 30.133}, points = {{-51.667, -19.733}, {-51.667, 9.867}, {103.333, 9.867}}, color = {1, 37, 163}));
  connect(stock.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {65.2, -21.92}, points = {{-57.2, 32.32}, {-57.2, 41.92}, {14.8, 41.92}, {14.8, -58.08}, {84.8, -58.08}}, color = {128, 0, 128}));
  connect(movingOn.portB, cloud.massPort) annotation(Line(visible = true, origin = {66.25, -10}, points = {{-16.25, 10}, {-6.25, 10}, {-6.25, -10}, {28.75, -10}}, color = {128, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The reservoir structure consists of a stock component that is typically <em>filled</em> via the accumulated net flow received at its <code>stockPort</code>. The stock is then drained at a rate set by the input <strong>u</strong>.</p>
<h4>Implementation</h4>
<p>The stock component used is declared as</p>
<pre><strong>replaceable</strong> Stocks.Informationlevel stock <strong>constrainedby</strong> Interfaces.PartialStocks.BasicStock</pre>
<p>Accordingly the →<a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\"><code>InformationLevel</code></a> can be <em>redeclared</em> either as a →<a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\"><code>MaterialStock</code></a> or a →<a href=\"modelica://BusinessSimulation.Stocks.CapacityRestrictedStock\"><code>CapacityRestrictedStock</code></a>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Incubators.Account\">Account</a>,
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Transceivers.Chain\">Chain</a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-4.16, -0.234}, points = {{0, 0}, {28.109, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {9.978, 0}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}}), Rectangle(visible = true, origin = {-14.948, 0}, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-10, -10}, {10, 10}}), Polygon(visible = true, origin = {24.453, -0.275}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Text(visible = true, origin = {0, 75}, textColor = {76, 112, 136}, extent = {{-100, -12}, {100, 12}}, textString = "Reservoir", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end Reservoir;
