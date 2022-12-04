within BusinessSimulation.MoleculesOfStructure.Incubators;

model Collector "A reservoir that aggregates multiple stock ports"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import BusinessSimulation.Types.InitializationOptions;
  extends Icons.SubsystemIncubator;
  extends Interfaces.Basics.ThreeSO;
  Interfaces.Connectors.StockInfoOutput y_stockInfo if hasStockInfoOutput "Optional StockInfoOutput" annotation(Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Interfaces.Connectors.StockMultiPort[nin] stockMultiPort annotation(Placement(visible = true, transformation(origin = {-147.51, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.StockPort stockPort annotation(Placement(visible = true, transformation(origin = {148.243, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiOutput[nin] y_flows(quantity = "Rate", unit = "1/s") "Output of netflows with regard to the multiple stock ports" annotation(Placement(visible = true, transformation(origin = {150, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  parameter Integer nin(min = 1) = 2 "Number of stock ports to be joined in the collector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter OutputType initialValue = 0 "Initial level of stock";
  parameter OutputType maxValue = inf "Maximum admissable value (reservoir.maxValue)";
  parameter OutputType minValue = -inf "Minimum admissable value (reservoir.minValue)";
  parameter Boolean hasStockInfoOutput = false "= true, if a StockInfoOutput should be added to the stock (reservoir.hasStockInfoOutput)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState) (reservoir.init)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean useAssert = false "= true, if  leaving the admissable range is to cause an error or warning (reservoir.useAssert)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean causeError = true "= true, if leaving the admissable range is to cause an error instead of simply a warning (reservoir.causeError)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  replaceable Stocks.InformationLevel collectingReservoir(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) constrainedby BusinessSimulation.Interfaces.PartialStocks.BasicStock "The joint collecting reservoir" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)), choices(choice(redeclare replaceable BusinessSimulation.Stocks.InformationLevel collectingReservoir(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) "Information Level"), choice(redeclare replaceable BusinessSimulation.Stocks.MaterialStock collectingReservoir(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) "Material Stock"), choice(redeclare replaceable BusinessSimulation.Stocks.CapacityRestrictedStock collectingReservoir(initialValue = initialValue, hasStockInfoOutput = hasStockInfoOutput, init = init, useAssert = useAssert, causeError = causeError, maxValue = maxValue, minValue = minValue) "Capacity Restricted Stock")));
  outer ModelSettings modelSettings;
protected
  Sensors.StockPortSensor[nin] sensor annotation(Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(collectingReservoir.outflow, stockPort) annotation(Line(visible = true, origin = {79.121, 0}, points = {{-69.121, 0}, {69.121, 0}}, color = {128, 0, 128}));
  connect(collectingReservoir.y, y1) annotation(Line(visible = true, origin = {56.667, 50.133}, points = {{-51.667, -39.733}, {-51.667, 19.867}, {103.333, 19.867}}, color = {1, 37, 163}));
  connect(collectingReservoir.y, y) annotation(Line(visible = true, origin = {56.667, 23.467}, points = {{-51.667, -13.067}, {-51.667, 6.533}, {103.333, 6.533}}, color = {1, 37, 163}));
  connect(collectingReservoir.y1, y2) annotation(Line(visible = true, origin = {98.022, -27.5}, points = {{-87.522, 22.5}, {-18.022, 22.5}, {-18.022, -22.5}, {61.978, -22.5}}, color = {1, 37, 163}));
  connect(collectingReservoir.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {97.2, -23.12}, points = {{-89.2, 33.52}, {-89.2, 40.12}, {2.8, 40.12}, {2.8, -56.88}, {52.8, -56.88}}, color = {128, 0, 128}));
  connect(stockMultiPort, sensor.stockPort) annotation(Line(visible = true, origin = {-133.755, 0}, points = {{-13.755, 0}, {13.755, 0}}, color = {128, 0, 128}));
  connect(sensor.netFlow, y_flows) annotation(Line(visible = true, origin = {-23.318, 63.667}, points = {{-86.659, -52.667}, {-86.659, 26.333}, {173.318, 26.333}}, color = {1, 37, 163}));
  connect(sensor[1].flowPort, collectingReservoir.inflow) annotation(Line(visible = true, origin = {-55.118, 0}, points = {{-45.118, 0}, {45.118, 0}}, color = {128, 0, 128}));
  for i in 2:nin loop
    connect(sensor[i].flowPort, collectingReservoir.inflow);
  end for;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>Collector</em> aggregates multiple <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">→StockPort</a> connectors and essentially treats them as if they were connected to one joint reservoir (i.e., a collecting tank). The stock may be filled or drained via any of multiple stock ports (<code>stockMultiPort</code>) or the single stock port (<code>stockPort</code>).</p>
<h4>Implementation</h4>
<p>The joint reservoir is internally represented by a stock called <code>collectingReservoir</code>. It is declared with the prefix <code>replaceable</code> and may be <em>redeclared</em> as any of the following stock classes:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Stocks.InformationLevel\">InformationLevel</a></li><br>
<li><a href = \"modelica://BusinessSimulation.Stocks.MaterialStock\">MaterialStock</a></li><br>
<li><a href = \"modelica://BusinessSimulation.Stocks.CapacityRestrictedStock\">CapacityRestrictedStock</a></li><br>
</ul>
<h4>Notes</h4>
<ul>
<li>Each of the multiple stock ports will report the flow restrictions set by the internal <code>collectingReservoir</code>.</li><br>
<li>The flow restrictions for <code>collectingReservoir</code> will be set as specified by the chosen stock class (e.g., no draining below zero for a <code>MaterialStock</code>) and with regard to the <em>netflow</em> of all flows connected to the stock ports.</li><br>
</ul>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {255, 0, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Collector", fontName = "Lato", textStyle = {TextStyle.Bold}), Rectangle(visible = true, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-41.036, -41.036}, {41.036, 41.036}}), Polygon(visible = true, origin = {-49.547, 28.814}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Polygon(visible = true, origin = {-70.356, 29.072}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{2.773, 3.823}, {2.773, -3.863}, {-5.547, 0.041}}), Line(visible = true, origin = {-69.109, 29}, points = {{0, 0}, {18.109, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {-60.022, 29.089}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}}), Polygon(visible = true, origin = {-49.547, -0.186}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Polygon(visible = true, origin = {-70.356, 0.072}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{2.773, 3.823}, {2.773, -3.863}, {-5.547, 0.041}}), Line(visible = true, origin = {-69.109, 0}, points = {{0, 0}, {18.109, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {-60.022, 0.089}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}}), Polygon(visible = true, origin = {-49.547, -29.186}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Polygon(visible = true, origin = {-70.356, -28.928}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{2.773, 3.823}, {2.773, -3.863}, {-5.547, 0.041}}), Line(visible = true, origin = {-69.109, -29}, points = {{0, 0}, {18.109, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {-60.022, -28.911}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}}), Polygon(visible = true, origin = {69.453, -0.186}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Polygon(visible = true, origin = {48.644, 0.072}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{2.773, 3.823}, {2.773, -3.863}, {-5.547, 0.041}}), Line(visible = true, origin = {49.891, 0}, points = {{0, 0}, {18.109, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {58.978, 0.089}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}})}));
end Collector;
