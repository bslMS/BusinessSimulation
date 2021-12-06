within BusinessSimulation.Stocks;

model Oven "Batch processing of inflow (aka batch delay)"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.Time;
  import BusinessSimulation.Constants.{inf,INF};
  extends Icons.Oven;
  extends Interfaces.Basics.GenericStock_Special(final init = InitializationOptions.FixedValue, hasStockInfoOutput = false);

  expandable connector InputConnector "Named inputs for the component"
    extends Icons.DataInPort;
    OutputType u_BatchSize "Size of batch to be processed";
    Time u_processingTime "Time to process batch";
    Time u_maxLoadingTime "Maximum allowed duration for loading";
    Time u_setupTime "Time for preparing the next operation";
    Time u_unloadingTime "Time needed to unload";
  end InputConnector;

  expandable connector OutputConnector
    extends Icons.DataOutPort;
    OutputType y_load "Current load";
    discrete Time y_leadTime "Manufacturing lead time (time from first unit enters to last unit exits on a batch)";
    discrete Time y_processingTime "Effective processing time for the batch process or per unit loaded";
    discrete Time y_setupTime "Effective setup time";
    discrete Time y_loadingTime "Effective loading time";
    discrete Time y_unloadingTime "Effective unloading time";
  end OutputConnector;

  InputConnector dataIn if not (hasConstantLoadingTime and hasConstantBatchSize and hasConstantProcessingTime and hasConstantSetupTime and hasConstantUnloadingTime) "Expandable connector for inputs" annotation(Placement(visible = true, transformation(origin = {0, 85}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  OutputConnector dataOut "Expandable connector for outputs" annotation(Placement(visible = true, transformation(origin = {40, 85}, extent = {{-10, -10}, {10, 10}}, rotation = -270), iconTransformation(origin = {0, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  parameter OutputType initialLoad(min = 0) = 0 "Amount loaded at start time";
  parameter Time initialLoadingTime(min = 0) = 0 "Time that has already passed to load the initial load at start time";
  parameter OutputType batchSize(min = 0) = 10 "Constant number of units processed in one batch (optional)" annotation(Dialog(enable = hasConstantBatchSize));
  parameter Time maxLoadingTime(min = 0) = inf "Constant maximum allowed time for loading (optional)" annotation(Dialog(enable = hasConstantLoadingTime));
  parameter Time processingTime(min = 0) = 1 "Constant processing time for the batch process or per unit loaded (optional)" annotation(Dialog(enable = hasConstantProcessingTime));
  parameter Time setupTime(min = 0) = 0 "Time needed after processing is finished before loading can start (set to zero for simultaneous loading and unloading)" annotation(Dialog(enable = hasConstantSetupTime));
  parameter Time unloadingTime(min = 0) = modelSettings.dt "Time needed to unload" annotation(Dialog(enable = hasConstantUnloadingTime));
  parameter Boolean hasFixedProcessingTime = true "= true, if the processing time is given for the process, otherwise it is the time per unit loaded" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantLoadingTime = true "= true, if the maximum allowed time for loading is to be given by the parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantBatchSize = true "= true, if the batch size is to be given by the parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantProcessingTime = true "= true, if the processing time is to be given by the parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantSetupTime = true "= true, if the setup time is to be given by a parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantUnloadingTime = true "= true, if the unloading time is to be given as a parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  // converters
  Converters.ConstantConverterTime parMaxLoadingTime(value = maxLoadingTime) if hasConstantLoadingTime "Constant max loading time" annotation(Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterTime parProcessingTime(value = processingTime) if hasConstantProcessingTime "Constant processing time" annotation(Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parBatchSize(value = batchSize) if hasConstantBatchSize "Constant batch size" annotation(Placement(visible = true, transformation(origin = {120, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.PassThrough u_maxLoadingTime if not hasConstantLoadingTime "Variable input of loading time" annotation(Placement(visible = true, transformation(origin = {-65, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.PassThrough u_processingTime if not hasConstantProcessingTime "Variable input of processing time" annotation(Placement(visible = true, transformation(origin = {60, 48.274}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.PassThrough u_BatchSize if not hasConstantBatchSize "Variable batch size" annotation(Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterTime parSetupTime(value = setupTime) if hasConstantSetupTime "Constant setup time (optional)" annotation(Placement(visible = true, transformation(origin = {-135, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.PassThrough u_setupTime if not hasConstantSetupTime "Variable input of setup time" annotation(Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ClipProcessTime actualMaxLoadingTime "Maximum allowed loading time" annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ClipProcessTime actualProcessingTime "Processing time" annotation(Placement(visible = true, transformation(origin = {10, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.ZeroIfNegative actualBatchSize "Batch size to be processed" annotation(Placement(visible = true, transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.ZeroIfNegative actualSetupTime "Setup time for further calculations" annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.DynamicStockInfo dynamicStockInfo1 if hasStockInfoOutput annotation(Placement(visible = true, transformation(origin = {-0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough residenceTimeInfo "Residence time info for StockInfoPort" annotation(Placement(visible = true, transformation(origin = {-80, -47.043}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ClipProcessTime actualUnloadingTime "Unloading time" annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough u_unloadingTime if not hasConstantUnloadingTime "Variable input of unloading time" annotation(Placement(visible = true, transformation(origin = {-35, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterTime parUnloadingTime(value = unloadingTime) if hasConstantUnloadingTime "Constant unloading time" annotation(Placement(visible = true, transformation(origin = {-15, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  // local vars
  Real x(min = 0) "Load";
  discrete Time latestStartTime "Time at which the process will commence latest";
  discrete Time lastStartLoading "Time at which the process finished last";
  discrete Time lastStartTime "Time at which the process actually started last";
  discrete Time nextStartLoading "Time at which the process will restart loading next";
  discrete Time fixedProcessingTime "The value for processing time used in current or last process";
  discrete Time fixedLoadingTime "The value for loading time used in the current or last process";
  discrete Time fixedSetupTime "The value for unloading time used in the current or last process";
  discrete Time fixedMaxLoadingTime "Maximum allowed loading time using for current calculations";
  discrete Time fixedUnloadingTime "The value for unloading time used in the current or last process";
initial equation
  // find an initial value for the lastStartLoading of the process
  x = initialLoad;
  outflow.data = 0;
  // properly initialize discrete vars with fixed = false
  // oven may be filled at inflow-port, but never drained
  pre(inflow.stopOutflow) = true;
  pre(fixedMaxLoadingTime) = actualMaxLoadingTime.y;
  pre(lastStartTime) = -1;
  pre(nextStartLoading) = inf;
  // we don't know yet
  pre(fixedLoadingTime) = -1;
  // fix initial values
  pre(fixedProcessingTime) = if not hasFixedProcessingTime then actualBatchSize.y * actualProcessingTime.y else actualProcessingTime.y;
  pre(fixedSetupTime) = actualSetupTime.y;
  pre(fixedUnloadingTime) = actualUnloadingTime.y;
  // take the min(initialLoadingTime, actualLoadingTime) to calculate the lastStartLoading initially
  pre(lastStartLoading) = if initialLoadingTime < fixedMaxLoadingTime then time - initialLoadingTime else time - fixedMaxLoadingTime;
  pre(latestStartTime) = lastStartLoading + fixedMaxLoadingTime;
  // no setup time included in the initial case
  pre(inflow.stopInflow) = if initialLoad < actualBatchSize.y then false else true;
  pre(inflow.stopOutflow) = true;
  pre(dataOut.y_leadTime) = fixedSetupTime + fixedLoadingTime + fixedProcessingTime + fixedLoadingTime;
  pre(dataOut.y_processingTime) = fixedProcessingTime;
  pre(dataOut.y_loadingTime) = fixedLoadingTime;
  pre(dataOut.y_setupTime) = fixedSetupTime;
algorithm
  // in this section event-based, discrete behavior takes place
  // check wheter production can start
  when time >= pre(latestStartTime) or x > actualBatchSize.y then
    inflow.stopInflow := true;
    // no more inflow
    lastStartTime := time;
    // update the last time the process started
    // fix all variable 'parameters'
    fixedProcessingTime := if not hasFixedProcessingTime then x * actualProcessingTime.y else actualProcessingTime.y;
    fixedSetupTime := actualSetupTime.y;
    fixedLoadingTime := time - lastStartLoading;
    fixedUnloadingTime := actualUnloadingTime.y;
    nextStartLoading := time + fixedProcessingTime + fixedSetupTime;
    lastStartLoading := nextStartLoading;
  end when;
  //check whether production is done
  when time >= pre(lastStartTime) + pre(fixedProcessingTime) then
    outflow.data := x / fixedUnloadingTime;
    // drain the stock in minimum time dt
    // check whether loading can commence
  elsewhen time >= pre(lastStartTime) + pre(fixedProcessingTime) + pre(fixedUnloadingTime) then
    outflow.data := 0;
  end when;
  // check whether loading can start
  when time >= pre(nextStartLoading) then
    inflow.stopInflow := false;
    fixedMaxLoadingTime := actualMaxLoadingTime.y;
    latestStartTime := lastStartLoading + fixedMaxLoadingTime;
  end when;
  /* TO DO:
   Processing Time should be a fixed amount or a variable amount (x * processTime) depending upon a switch
   Batch Size should also be a fixed variable to make this easier to understand
  */
equation
  // basic idendities
  dataOut.y_load = y;
  dataOut.y_leadTime = fixedSetupTime + fixedLoadingTime + fixedProcessingTime + fixedLoadingTime;
  dataOut.y_processingTime = fixedProcessingTime;
  dataOut.y_loadingTime = fixedLoadingTime;
  dataOut.y_setupTime = fixedSetupTime;
  residenceTimeInfo.u = fixedSetupTime + (fixedLoadingTime + fixedUnloadingTime) / 2 + fixedProcessingTime;
  // textual equations
  der(x) = inflow.rate + outflow.rate;
  inflow.stock = x;
  // outflow.info = 1;
  // data will always be the rate to drain the stock
  inflow.stopOutflow = true;
  // oven must never be drained via inflow-port
  // report current load via output connectors
  y = inflow.stock;
  y1 = inflow.stock;
  y2 = inflow.stock;
  // connect equations
  connect(u_maxLoadingTime.u, dataIn.u_maxLoadingTime) "External input of maximum allowed loading time" annotation(Line(visible = true, origin = {-30, 72}, points = {{-35, -14}, {-35, -2}, {30, -2}, {30, 13}}, color = {1, 37, 163}));
  connect(u_processingTime.u, dataIn.u_processingTime) "External input of processing time" annotation(Line(visible = true, origin = {15, 72}, points = {{45, -15.726}, {45, -2}, {-15, -2}, {-15, 13}}, color = {1, 37, 163}));
  connect(u_BatchSize.u, dataIn.u_BatchSize) "External input of batch size" annotation(Line(visible = true, origin = {40, 72}, points = {{50, -14}, {50, -2}, {-40, -2}, {-40, 13}}, color = {1, 37, 163}));
  connect(parMaxLoadingTime.y, actualMaxLoadingTime.u) annotation(Line(visible = true, origin = {-79.333, 28}, points = {{-10.667, 16}, {-10.667, -8}, {21.333, -8}}, color = {1, 37, 163}));
  connect(u_maxLoadingTime.y, actualMaxLoadingTime.u) annotation(Line(visible = true, origin = {-62.667, 27.333}, points = {{-2.333, 14.667}, {-2.333, -7.333}, {4.667, -7.333}}, color = {1, 37, 163}));
  connect(parProcessingTime.y, actualProcessingTime.u) annotation(Line(visible = true, origin = {26, 28}, points = {{4, 16}, {4, -8}, {-8, -8}}, color = {1, 37, 163}));
  connect(u_processingTime.y, actualProcessingTime.u) annotation(Line(visible = true, origin = {46, 26.758}, points = {{14, 13.516}, {14, -6.758}, {-28, -6.758}}, color = {1, 37, 163}));
  connect(u_BatchSize.y, actualBatchSize.u) annotation(Line(visible = true, origin = {86, 20.879}, points = {{4, 21.758}, {4, -10.879}, {-8, -10.879}}, color = {1, 37, 163}));
  connect(parBatchSize.y, actualBatchSize.u) annotation(Line(visible = true, origin = {106, 21.667}, points = {{14, 23.333}, {14, -11.667}, {-28, -11.667}}, color = {1, 37, 163}));
  connect(u_setupTime.u, dataIn.u_setupTime) "Input of variable unloading time" annotation(Line(visible = true, origin = {-60, 72}, points = {{-50, -14}, {-50, -2}, {60, -2}, {60, 13}}, color = {1, 37, 163}));
  connect(parSetupTime.y, actualSetupTime.u) annotation(Line(visible = true, origin = {-122.667, 14.667}, points = {{-12.333, 29.333}, {-12.333, -14.667}, {24.667, -14.667}}, color = {1, 37, 163}));
  connect(actualSetupTime.u, u_setupTime.y) annotation(Line(visible = true, origin = {-106, 14}, points = {{8, -14}, {-4, -14}, {-4, 28}}, color = {1, 37, 163}));
  connect(inflow, dynamicStockInfo1.inPort) annotation(Line(visible = true, origin = {-114, -10}, points = {{-46, 10}, {-31, 10}, {-31, -10}, {108, -10}}, color = {128, 0, 128}));
  connect(dynamicStockInfo1.outPort, outflow) annotation(Line(visible = true, origin = {101.996, -10}, points = {{-95.996, -10}, {18.004, -10}, {18.004, 10}, {58.004, 10}}, color = {128, 0, 128}));
  connect(dynamicStockInfo1.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {48, -36.8}, points = {{-48, 22.8}, {-48, 31.8}, {-8, 31.8}, {-8, -43.2}, {102, -43.2}}, color = {128, 0, 128}));
  connect(y2, dynamicStockInfo1.levelInfo) annotation(Line(visible = true, origin = {80, -39}, points = {{80, -11}, {80, -1}, {-80, -1}, {-80, 13}}, color = {1, 37, 163}));
  connect(u_unloadingTime.y, actualUnloadingTime.u) annotation(Line(visible = true, origin = {-26, -26}, points = {{-9, 68}, {-9, -34}, {18, -34}}, color = {1, 37, 163}));
  connect(parUnloadingTime.y, actualUnloadingTime.u) annotation(Line(visible = true, origin = {-12.667, -25.333}, points = {{-2.333, 69.333}, {-2.333, -34.667}, {4.667, -34.667}}, color = {1, 37, 163}));
  connect(residenceTimeInfo.y, dynamicStockInfo1.residenceTimeInfo) annotation(Line(visible = true, origin = {-20.879, -40.029}, points = {{-51.758, -7.014}, {25.879, -7.014}, {25.879, 14.029}}, color = {1, 37, 163}));
  connect(u_unloadingTime.u, dataIn.u_unloadingTime) "Input unloading time" annotation(Line(visible = true, origin = {-20, 72}, points = {{-15, -14}, {-15, -2}, {20, -2}, {20, 13}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -80}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%initialLoad", fontName = "Lato")}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>An <em>oven</em> (aka <em>batch delay</em>) can be seen as an idealized model of a <em>batch process</em>, e.g., cookies are put on a baking tray, the oven is loaded, the cookies are baked for some time, and finally the oven is unloaded (the process may then start over again).</p>
<p>The parameters or inputs <code>batchSize</code>, <code>maxLoadingTime</code>, <code>processingTime</code>, and <code>setupTime</code> specify the behavior of the batch process. The oven is loaded by a flow connected to its <code>inflow</code> port (usually from a cloud or another stock representing a buffer stock) until either the <code>batchSize</code> is reached (the oven's capacity) or the time since the loading of the oven commenced has reached the <code>maxLoadingTime</code>. It will then close and prevent further inflow for the duration of the <code>processingTime</code>. The unloading of the finished \"material\" will take place in <code>dt</code> time - a global variable that indicates the shortest possible durationa of any process in a model. The reloading can commence after <code>setupTime</code> has passed since the process has ended. For <code>setupTime = 0</code> simulatenous loading and unloading will take place.</p>
<p>To initialize the oven, an <code>initialLoad</code> and an <code>initialLoadingTime</code> (e.g., how much time has already passed loading the oven when the simulation starts) have to be given.</p>
<h4>Notes</h4>
<ul>
<li>Care has to be taking in the case of simultaneous loading and unloading as in the case of the loading rate being higher than the unloading rate the capacity could be reached before the unloading is done so that material would be processed twice.</li><br>
<li><code>batchSize</code>, <code>maxLoadingTime</code>, <code>processingTime</code>, and <code>setupTime</code> can be time-varying continuous inputs, but are internally recalculated every time the process starts and then are held fixed.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -87.876}, {147.976, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Oven;
