within BusinessSimulation.Converters.Lookup;

block TableFunction "Table function defined by external data on file using Modelica's CombiTable format"
  import Modelica.Blocks.Types.{Extrapolation,Smoothness};
  import BusinessSimulation.Types.TimeBases;
  import BusinessSimulation.Types.UnitChoices;
  extends Interfaces.PartialConverters.SISO;
  extends Icons.InterpolationTable;
  parameter Boolean convertInput = false "= true, if the input value is a rate or time variable that needs to be converted" annotation(Dialog(group = "Time Conversion"));
  parameter Boolean inputIsRate = false "= true, if the input is given in units of time, otherwise it is assumed to be a rate" annotation(Dialog(group = "Time Conversion", enable = convertInput));
  parameter Boolean convertOutput = false "= true, if the output value is a rate or time variable that needs to be converted" annotation(Dialog(group = "Time Conversion"));
  parameter Boolean outputIsRate = false "= true, if the output is given in units of time, otherwise it is assumed to be a rate" annotation(Dialog(group = "Time Conversion", enable = convertOutput));
  parameter TimeBases timeBaseInput = TimeBases.seconds "TimeBase to convert from (default = seconds)" annotation(Evaluate = true, Dialog(enable = convertInput, group = "Time Conversion"));
  parameter TimeBases timeBaseTableIn = modelSettings.modelDisplayTimeBase "TimeBase used for the lookup table input (default = modelDisplayTimeBase)" annotation(Evaluate = true, Dialog(enable = convertInput, group = "Time Conversion"));
  parameter TimeBases timeBaseTableOut = modelSettings.modelDisplayTimeBase "TimeBase used for the table output (default = modelSettings.modelDisplayTimeBase)" annotation(Evaluate = true, Dialog(enable = convertOutput, group = "Time Conversion"));
  parameter TimeBases timeBaseOutput = TimeBases.seconds "TimeBase used for the output (default = seconds)" annotation(Evaluate = true, Dialog(enable = convertOutput, group = "Time Conversion"));
  parameter Boolean tableOnFile = false "= true, if table is defined on file or in function usertab (combiTable1D.tableOnFile)" annotation(Dialog(group = "TableDataDefinition"));
  parameter Real table[:, :] = fill(0.0, 0, 2) "Table matrix (grid = first column; e.g., table=[0,2]) (combiTable1D.table)" annotation(Dialog(group = "TableDataDefinition", enable = not tableOnFile));
  parameter String tableName = "NoName" "Name of the table in the file containing the data" annotation(Dialog(group = "TableDataDefinition", enable = tableOnFile));
  parameter String fileNameURI = modelSettings.lookupDataFileURI "URI of the file to read the data from (default = modelSettings.lookupDataFileURI)" annotation(Dialog(group = "TableDataDefinition", enable = tableOnFile));
  parameter Smoothness smoothness = Smoothness.LinearSegments "Smoothness of table interpolation" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Integer column(min = 2) = 2 "Column of table to be interpolated" annotation(Dialog(group = "TableDataInterpretation"));
  // only one column is used in this component
  parameter Boolean verboseRead = true "= true, if info message that file is loading is to be printed (combiTable1D.verboseRead)" annotation(Dialog(group = "TableDataDefinition", enable = tableOnFile));
  parameter Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint "Extrapolation of data outside the definition range (combiTable.extrapolation)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Boolean verboseExtrapolation = false "= true, if warning messages are to be printed if table input is outside the definition range (combiTable.verboseExtrapolation)" annotation(Dialog(group = "TableDataInterpretation"));
protected
  outer ModelSettings modelSettings;
  parameter String fileName = if tableOnFile then Modelica.Utilities.Files.loadResource(fileNameURI) else "NoName" "Absolute path to the file specified by fileName" annotation(Dialog(group = "Initialization", enable = false));
  RateConversion rateConversionIn(timeBaseA = timeBaseInput, timeBaseB = timeBaseTableIn) if convertInput and inputIsRate "Convert the input (rate) to another time base" annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PassThrough noConversionIn if not convertInput "Use input as is" annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TimeConversion timeConversionIn(timeBaseA = timeBaseInput, timeBaseB = timeBaseTableIn) if convertInput and not inputIsRate "Convert the input to another time base" annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable(fileName = fileName, tableName = tableName, smoothness = smoothness, tableOnFile = tableOnFile, table = table, columns = {column}, verboseRead = verboseRead, extrapolation = extrapolation, verboseExtrapolation = verboseExtrapolation) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PassThrough noConversionOut if not convertOutput "Use output as is" annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RateConversion rateConversionOut(timeBaseA = timeBaseTableOut, timeBaseB = timeBaseOutput) if convertOutput and outputIsRate "Convert the output (rate) to 1/s" annotation(Placement(visible = true, transformation(origin = {60, 27.063}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TimeConversion timeConversionOut(timeBaseA = timeBaseTableOut, timeBaseB = timeBaseOutput) if convertOutput and not outputIsRate "Convert the output to seconds" annotation(Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(column >= 2 and column <= size(table, 2), "column is out of range");
  connect(u, noConversionIn.u) annotation(Line(visible = true, origin = {-134, 0}, points = {{-36, 0}, {36, 0}}, color = {1, 37, 163}));
  connect(noConversionIn.y, combiTable.u) annotation(Line(visible = true, origin = {-47, 0}, points = {{-35, 0}, {35, 0}}, color = {1, 37, 163}));
  connect(u, rateConversionIn.u) annotation(Line(visible = true, origin = {-127, 15}, points = {{-43, -15}, {7, -15}, {7, 15}, {29, 15}}, color = {1, 37, 163}));
  connect(rateConversionIn.y, combiTable.u) annotation(Line(visible = true, origin = {-43.5, 15}, points = {{-38.5, 15}, {3.5, 15}, {3.5, -15}, {31.5, -15}}, color = {1, 37, 163}));
  connect(u, timeConversionIn.u) annotation(Line(visible = true, origin = {-127, -15}, points = {{-43, 15}, {7, 15}, {7, -15}, {29, -15}}, color = {1, 37, 163}));
  connect(timeConversionIn.y, combiTable.u) annotation(Line(visible = true, origin = {-43.5, -15}, points = {{-38.5, -15}, {3.5, -15}, {3.5, 15}, {31.5, 15}}, color = {1, 37, 163}));
  connect(combiTable.y[1], noConversionOut.u) annotation(Line(visible = true, origin = {31.5, 0}, points = {{-20.5, 0}, {20.5, 0}}, color = {1, 37, 163}));
  connect(noConversionOut.y, y) annotation(Line(visible = true, origin = {114, 0}, points = {{-46, 0}, {46, 0}}, color = {1, 37, 163}));
  connect(combiTable.y[1], rateConversionOut.u) annotation(Line(visible = true, origin = {28.25, 13.531}, points = {{-17.25, -13.531}, {-3.25, -13.531}, {-3.25, 13.531}, {23.75, 13.531}}, color = {1, 37, 163}));
  connect(combiTable.y[1], timeConversionOut.u) annotation(Line(visible = true, origin = {28.25, -15}, points = {{-17.25, 15}, {-3.25, 15}, {-3.25, -15}, {23.75, -15}}, color = {1, 37, 163}));
  connect(timeConversionOut.y, y) annotation(Line(visible = true, origin = {107, -15}, points = {{-39, -15}, {-7, -15}, {-7, 15}, {53, 15}}, color = {1, 37, 163}));
  connect(rateConversionOut.y, y) annotation(Line(visible = true, origin = {107, 13.531}, points = {{-39, 13.532}, {-7, 13.531}, {-7, -13.531}, {53.268, -13.531}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This converter uses the Modelica CombiTable format to read in a 1-D table function from file. For more explanation regarding the 1-D Modelica CombiTable interpolation see <a href=\"modelica://Modelica.Blocks.Tables.CombiTable1Ds\">Modelica.Blocks.Tables.CombiTable1Ds</a>.</p>
<h4>Notes</h4>
<p>The Modelica CombiTable format can be generated by Wolfram Mathematica using <code>Export[]:</code></p>
<p><code>Export[ <em>filename</em>, { {\"TableName1\", table1}, {\"TableName2\", table2}, ... }, \"MCTT\" ]</code></p>
<p>where <code>table1, table2, ...</code> are 2-dimensional arrays. By default all lookup data are assumed to be included in a single file whose name is given by the global parameter <code>lookupDataFileURI</code>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.TableFunctionVector\">TableFunctionVector</a>,&nbsp;<a href=\"modelica://BusinessSimulation.InformationSources.LinearTimeTable\">LinearTimeTable</a></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TableFunction;
