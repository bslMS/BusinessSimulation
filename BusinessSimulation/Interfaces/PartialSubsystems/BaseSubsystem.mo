within BusinessSimulation.Interfaces.PartialSubsystems;

encapsulated partial model BaseSubsystem "Partial subsystem with flexible number of connectors"
  import BusinessSimulation.Icons.{SubsystemBlock,SubsystemIncubator,SubsystemTransceiver,SubsystemActuator};
  import BusinessSimulation.Interfaces.Connectors.{DataBus,RealInput,RealMultiInput,RealOutput,RealMultiOutput,FlowMultiPort,FlowPort,StockPort,StockMultiPort,StockInfoMultiInput,StockInfoInput,StockInfoMultiOutput,StockInfoOutput};
  constant Integer nin(min = 0) = 0 "Number of input connectors" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Integer nout(min = 0) = 0 "Number of output connectors" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Integer n_stockPorts(min = 0) = 0 "Number of stock port connectors" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Integer n_flowPorts(min = 0) = 0 "Number of flow port connectors" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Integer n_stockInfoInputs(min = 0) = 0 "Number of stockInfo input connectors" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Integer n_stockInfoOutputs(min = 0) = 0 "Number of stockInfo output connectors" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Boolean hasDataBus = true "= true, if the system is to have an expandable connector" annotation(Dialog(tab = "Subsystem Specs", group = "System Connectors"));
  constant Boolean hasMultiInput = false "= true, if the system has an array of input connectors" annotation(Dialog(tab = "Subsystem Specs", group = "Array Connectors"));
  constant Boolean hasMultiOutput = false "= true, if the system has an array of output connectors" annotation(Dialog(tab = "Subsystem Specs", group = "Array Connectors"));
  constant Boolean hasMultiStockPort = false "= true, if the system has an array of stock ports" annotation(Dialog(tab = "Subsystem Specs", group = "Array Connectors"));
  constant Boolean hasMultiFlowPort = false "= true, if the system has an array of flow ports" annotation(Dialog(tab = "Subsystem Specs", group = "Array Connectors"));
  constant Boolean hasMultiStockInfoInput = false "= true, if the system has an array of stock info input connectors" annotation(Dialog(tab = "Subsystem Specs", group = "Array Connectors"));
  constant Boolean hasMultiStockInfoOutput = false "= true, if the system has an array of stock info output connectors" annotation(Dialog(tab = "Subsystem Specs", group = "Array Connectors"));
  FlowMultiPort flowPorts[n_flowPorts] if hasMultiFlowPort and n_flowPorts > 0 "Flow port connectors" annotation(Placement(visible = true, transformation(origin = {148.163, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FlowPort flowPort if not hasMultiFlowPort and n_flowPorts > 0 and n_flowPorts < 2 "Flow port connector" annotation(Placement(visible = true, transformation(origin = {148.163, 1}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StockMultiPort stockPorts[n_stockPorts] if hasMultiStockPort and n_stockPorts > 0 "Stock port connectors" annotation(Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StockPort stockPort if not hasMultiStockPort and n_stockPorts > 0 and n_stockPorts < 2 "Stock port connector" annotation(Placement(visible = true, transformation(origin = {-150, 1}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StockInfoMultiInput u_stockInfos[n_stockInfoInputs] if hasMultiStockInfoInput and n_stockInfoInputs > 0 "Stock info input connectors" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  StockInfoMultiInput u_stockInfo if not hasMultiStockInfoInput and n_stockInfoInputs > 0 and n_stockInfoInputs < 2 "Stock info input connector" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  StockInfoMultiOutput y_stockInfos[n_stockInfoOutputs] if hasMultiStockInfoOutput and n_stockInfoOutputs > 0 "Stock info output connectors" annotation(Placement(visible = true, transformation(origin = {150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  StockInfoMultiOutput y_stockInfo if not hasMultiStockInfoOutput and n_stockInfoOutputs > 0 and n_stockInfoOutputs < 2 "Stock info output connector" annotation(Placement(visible = true, transformation(origin = {150, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {105, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  RealMultiInput u_mult[nin] if hasMultiInput and nin > 0 "Input connectors" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
  RealInput u if not hasMultiInput and nin > 0 and nin < 2 "Input connector" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
  RealMultiOutput y_mult[nout] if hasMultiOutput and nout > 0 "Output connectors" annotation(Placement(visible = true, transformation(origin = {150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -630)));
  RealOutput y if not hasMultiOutput and nout > 0 and nout < 2 "Output connector" annotation(Placement(visible = true, transformation(origin = {160, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -630)));
  DataBus dataBus if hasDataBus "Information inputs and outputs" annotation(Placement(visible = true, transformation(origin = {0, 105}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This partial class offers convenient flexible with regard to connectors. It is only used for extension.</p>
<h4>Notes</h4>
<ul>
<li>The class uses structural parameters in the tab <code>Subsystem Specs</code> to allow for fast and flexibel building of susbsytem components in a model.</li><br>
<li>Use of the switches in the group <code>Array Connectors</code> allows to have array connectors even if the number of connectors has been given as 1.</li><br>
</ul>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BaseSubsystem;
