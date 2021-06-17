within BusinessSimulation.Interfaces.PartialStocks;

partial model BasicStock "Unrestricted reservoir to store information"
  import BusinessSimulation.Constants.inf;
  import BusinessSimulation.Types.InitializationOptions;
  extends Icons.Stock;
  extends Interfaces.Basics.GenericStock(hasStockInfoOutput = false, y.start = initialValue, init = modelSettings.init);
  parameter OutputType initialValue(min = minValue, max = maxValue) = 0 "Initial level (should be different from 0 to find non-trivial steady state solution)";
  parameter OutputType maxValue = inf "Maximum admissable value";
  parameter OutputType minValue = -inf "Minimum admissable value";
  parameter Boolean useAssert = false "= true, if  leaving the admissable range is to cause an error or warning" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean causeError = true "= true, if leaving the admissable range is to cause an error instead of simply a warning" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Sensors.StockInfo stockInfoSensor if hasStockInfoOutput annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  OutputType x(start = initialValue, min = minValue, max = maxValue) "State variable" annotation(Dialog(enable = false, tab = "Initialization"));
  Converters.Special.RangeAssert rangeControl(maxValue = maxValue, minValue = minValue, causeError = causeError) if useAssert "Use assert() to check admissable values" annotation(Placement(visible = true, transformation(origin = {70, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
initial equation
  // initialize the stock by finding a valid initial value, by using a given initialValue, or by trying to find a steady state solution
  if init == InitializationOptions.FixedValue then
    x = initialValue;
  elseif init == InitializationOptions.SteadyState then
    der(x) = 0;
  end if;
equation
  // rate of change for the stock
  der(x) = inflow.rate + outflow.rate;
  // ports shall have level information for stock
  inflow.stock = x;
  outflow.stock = x;
  // children of this class need to set the boolean flags for inflow and outflow ports:
  //   inflow.stopInflow = true | false;
  //   outflow.stopInflow = true | false;
  //   inflow.stopOutflow = true | false;
  //   outflow.stopOutflow = ture | false;
  // report current value of stock via output connectors
  y = inflow.stock;
  y1 = inflow.stock;
  y2 = inflow.stock;
  connect(inflow, stockInfoSensor.inPort) annotation(Line(visible = true, origin = {-71.5, -30}, points = {{-88.5, 30}, {11.5, 30}, {11.5, -30}, {65.5, -30}}, color = {128, 0, 128}));
  connect(stockInfoSensor.outPort, outflow) annotation(Line(visible = true, origin = {71.5, -30}, points = {{-65.5, -30}, {-11.5, -30}, {-11.5, 30}, {88.5, 30}}, color = {128, 0, 128}));
  connect(y, stockInfoSensor.levelInfo) annotation(Line(visible = true, origin = {80, 14}, points = {{80, 16}, {80, 26}, {-80, 26}, {-80, -68}}, color = {1, 37, 163}));
  connect(stockInfoSensor.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {53.333, -75.333}, points = {{-53.333, 9.333}, {-53.333, -4.667}, {106.667, -4.667}}, color = {128, 0, 128}));
  // issue warnings if values out of range
  connect(y, rangeControl.u) annotation(Line(visible = true, origin = {119.6, 54}, points = {{40.4, -24}, {40.4, -4}, {-19.6, -4}, {-19.6, 16}, {-41.6, 16}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is the general, <em>unrestricted reservoir</em> of the System Dynamics methodology, it accumulates information transported by flow components connected to the StockPorts.</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -80}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%initialValue", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BasicStock;
