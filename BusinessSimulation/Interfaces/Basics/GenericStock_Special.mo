within BusinessSimulation.Interfaces.Basics;

partial model GenericStock_Special "Generic Stock with internal dynamics"
  import BusinessSimulation.Interfaces.Connectors.StockPort;
  import BusinessSimulation.Interfaces.Connectors.StockPort_Special;
  import BusinessSimulation.Interfaces.Connectors.StockInfoOutput;
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Interfaces.Basics.ThreeSO;
  import BusinessSimulation.Icons.FlowIndicators;
  extends ThreeSO;
  extends FlowIndicators;
  StockPort inflow "Inflow port of the stock" annotation(Placement(visible = true, transformation(origin = {-148.075, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StockPort_Special outflow "Special outflow port of the stock (stock sets rate)" annotation(Placement(visible = true, transformation(origin = {148.334, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter InitializationOptions init = InitializationOptions.FixedValue "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean hasStockInfoOutput = false "= true, if a StockInfoOutput should be added to the stock" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  StockInfoOutput y_stockInfo if hasStockInfoOutput "Optional StockInfoOutput" annotation(Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model with three Real output connectors, a &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>&nbsp;connector on the inflow side, a &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort_Special\">StockPort_Special</a> connector on the outflow side, and an optional &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutput</a>. This is the base class for dynamic stock components that will usually signal the rate of outflow to a connected flow component.</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GenericStock_Special;
