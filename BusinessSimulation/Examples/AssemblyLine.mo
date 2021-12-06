within BusinessSimulation.Examples;

model AssemblyLine "Modeling a production process"
  extends Icons.Example;
  inner ModelSettings modelSettings(modelTimeHorizon = 25) annotation(Placement(visible = true, transformation(origin = {-125, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModelOutput modelOutput "Main Output of the Model" annotation(Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput "Main output"
    extends Icons.DataOutPort;
    import BusinessSimulation.Units.Material;
    Material incomingStore "Inventory for raw material";
    Material machine1 "Material in first batch production";
    Material movingOn "Material on conveyor belt";
    Material intermediateStore "Material in buffer stock";
    Material machine2 "Material in second batch production";
    Material outgoingInventory "Finished goods inventory";
  end ModelOutput;
protected
  SourcesOrSinks.Growth beingReleased(rate = 2, hasConstantRate = true) "Material flowing into the assembly line" annotation(Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock incomingStore(initialValue = 7, redeclare replaceable type OutputType = Units.Material) "Buffer stock for incoming material" annotation(Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.Oven machine1(hasConstantBatchSize = true, hasConstantProcessingTime = true, batchSize = 4, processingTime = 1, unloadingTime = 1, redeclare replaceable type OutputType = Units.Material) "First processing unit" annotation(Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition loading1(hasConstantRate = true, rate = 2) "Loading the processing unit" annotation(Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock enteringBelt "Outflow from machine 1" annotation(Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.MaterialStock intermediateStore(initialValue = 0, redeclare replaceable type OutputType = Units.Material) "Buffer stock for material" annotation(Placement(visible = true, transformation(origin = {40, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock leavingBelt "Entering the intermediate store" annotation(Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -360)));
  Stocks.Oven machine2(hasConstantBatchSize = true, hasConstantProcessingTime = true, batchSize = 2, processingTime = 0.5, unloadingTime = 0.5, redeclare replaceable type OutputType = Units.Material) "First processing unit" annotation(Placement(visible = true, transformation(origin = {-40, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition loading2(hasConstantRate = true, rate = 2) "Loading the processing unit" annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock unloading2 "Outflow from machine 1" annotation(Placement(visible = true, transformation(origin = {-80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Stocks.MaterialStock outgoingInventory(initialValue = 0, redeclare replaceable type OutputType = Units.Material) "Finished goods for shipment" annotation(Placement(visible = true, transformation(origin = {-120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Stocks.SimpleConveyor movingOn(initialValue = 0, delayTime = 2, redeclare replaceable type OutputType = Units.Material) "Conveyor belt transport" annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(beingReleased.massPort, incomingStore.inflow) annotation(Line(visible = true, origin = {-60, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(incomingStore.outflow, loading1.portA) annotation(Line(visible = true, origin = {-20, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(loading1.portB, machine1.inflow) annotation(Line(visible = true, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}, origin = {20, 30}));
  connect(machine1.outflow, enteringBelt.portA) annotation(Line(visible = true, origin = {60, 30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(leavingBelt.portB, intermediateStore.inflow) annotation(Line(visible = true, origin = {60, -30}, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}));
  connect(intermediateStore.outflow, loading2.portA) annotation(Line(visible = true, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}, origin = {20, -30}));
  connect(loading2.portB, machine2.inflow) annotation(Line(visible = true, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}, origin = {-20, -30}));
  connect(unloading2.portB, outgoingInventory.inflow) annotation(Line(visible = true, origin = {-100, -30}, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}));
  connect(machine2.outflow, unloading2.portA) annotation(Line(visible = true, origin = {-60, -30}, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}));
  connect(enteringBelt.portB, movingOn.inflow) annotation(Line(visible = true, origin = {103.333, 23.333}, points = {{-13.333, 6.667}, {6.667, 6.667}, {6.667, -13.333}}, color = {128, 0, 128}));
  connect(movingOn.outflow, leavingBelt.portA) annotation(Line(visible = true, origin = {103.333, -23.333}, points = {{6.667, 13.333}, {6.667, -6.667}, {-13.333, -6.667}}, color = {128, 0, 128}));
  connect(incomingStore.y1, modelOutput.incomingStore) annotation(Line(visible = true, origin = {12.625, -17.5}, points = {{-42.125, 42.5}, {-37.625, 42.5}, {-37.625, -42.5}, {117.375, -42.5}}, color = {192, 192, 192}));
  connect(movingOn.y1, modelOutput.movingOn) annotation(Line(visible = true, origin = {113.333, -43.5}, points = {{-8.333, 33}, {-8.333, -16.5}, {16.667, -16.5}}, color = {192, 192, 192}));
  connect(intermediateStore.y2, modelOutput.intermediateStore) annotation(Line(visible = true, origin = {74.749, -47.5}, points = {{-24.249, 12.5}, {-19.749, 12.5}, {-19.749, -12.5}, {55.251, -12.5}}, color = {192, 192, 192}));
  connect(outgoingInventory.y2, modelOutput.outgoingInventory) annotation(Line(visible = true, origin = {-47.375, -47.5}, points = {{-62.125, 12.5}, {-57.625, 12.5}, {-57.625, -12.5}, {177.375, -12.5}}, color = {192, 192, 192}));
  connect(machine1.y1, modelOutput.machine1);
  connect(machine2.y1, modelOutput.machine2);
  annotation(__Wolfram, Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Bitmap(visible = true, origin = {45, 53.493}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/AssemblyLine/Machine.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Bitmap(visible = true, origin = {-33.067, -6.507}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/AssemblyLine/Machine.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Bitmap(visible = true, origin = {-40, 55}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/AssemblyLine/Inventory.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Bitmap(visible = true, origin = {40, -5}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/AssemblyLine/Inventory.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Bitmap(visible = true, origin = {128.493, -1.933}, rotation = -90, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/AssemblyLine/ConveyorBelt.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Bitmap(visible = true, origin = {-120, -5}, fileName = "modelica://BusinessSimulation/Resources/Images/Examples/AssemblyLine/Inventory.svg", imageSource = "", extent = {{-16.933, -13.493}, {16.933, 13.493}}), Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Assembly Line", fontName = "Lato Black"), Text(visible = true, origin = {0, 70}, textColor = {76, 112, 136}, extent = {{-140, -3}, {140, 3}}, textString = "Peter Junglas [18]", fontName = "Lato", textStyle = {TextStyle.Bold})}), experiment(StartTime = 0, StopTime = 25), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Usually in System Dynamics we take the \"high road\" of a macro-level, strategic view on business systems and accordingly we will very often be content with modeling a production line using a →<a href=\"modelica://BusinessSimulation.Stocks.DelayN\"><strong>DelayN</strong> </a>where production time&nbsp;is distributed around some mean duration. In this example we take a <em>meso-level</em> perspective of modeling a simple assembly line that borders on discrete-event modeling—albeit not yet focussing on single entities.</p>
<p>In modeling an assembly line we here use <strong><a href=\"modelica://BusinessSimulation.Stocks.SimpleConveyor\">SimpleConveyor</a>&nbsp;</strong>and <strong><a href=\"modelica://BusinessSimulation.Stocks.Oven\">Oven</a></strong>—being dynamical stocks—with inherent (hidden) dynamics: The <em>SimpleConveyor </em>is like a conveyor belt that transports stuff from one stock to another using a fixed, exact amount of time and preserving order of entry. The <em>Oven</em> represents an idealized <em>batch process</em>, where a processor is loaded, then closes its doors to process the loaded material in a fixed amount of time, to then unload it into the next stage.</p>
<h4>Acknowledgments</h4>
<p>The example is taken from Peter Junglas [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">18</a>, pp. 247-252].</p>
</html>", figures = {Figure(title = "Inventories", identifier = "inventories", preferred = true, plots = {Plot(curves = {Curve(y = modelOutput.incomingStore, legend = "incomingStore"), Curve(y = modelOutput.outgoingInventory, legend = "outgoingInventory")})}, caption = "Incoming and outgoing inventories")}, revisions = "<html>
<ul>
<li>Modified diagram and simulation plots in v2.0.0.</li>
</ul>
</html>"));
end AssemblyLine;
