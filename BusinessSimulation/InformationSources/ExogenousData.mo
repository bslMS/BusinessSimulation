within BusinessSimulation.InformationSources;

block ExogenousData "Reading external data from a file using Modelica's CombiTimeTable format (MCTT)"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import Modelica.Blocks.Types.{Smoothness, Extrapolation, TimeEvents};
  extends Interfaces.Basics.BaseConverter;
  extends Icons.InformationSourceIndicator;
  RealOutput y if combiTimeTable.nout == 1 "Single Output" annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -1440)));
  RealMultiOutput[combiTimeTable.nout] y_nout if combiTimeTable.nout > 1 "Output vector" annotation(Placement(visible = true, transformation(origin = {150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // RealMultiOutput y_nout[combiTimeTable.nout] if combiTimeTable.nout > 1 "Output vector" annotation(Placement(visible = true, transformation(origin = {150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -1440)));
  parameter Boolean tableOnFile = true "= true, if table is defined on file or in function usertab (combiTimeTable.tableOnFile)" annotation(Dialog(group = "TableDataDefinition"));
  parameter Real table[:, :] = fill(0.0, 2, 2) "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4]) (combiTimeTable.table)" annotation(Dialog(group = "TableDataDefinition", enable = not tableOnFile));
  parameter String tableName = "NoName" "Table name on file or in function usertab (see docu) (combiTimeTable.tableName)" annotation(Dialog(group = "TableDataDefinition", enable = tableOnFile));
  parameter String fileNameURI = modelSettings.exogenousDataFileURI "URI for the exogenous data file" annotation(Evaluate = true, Dialog(group = "TableDataDefinition", enable = tableOnFile));
  parameter Boolean verboseRead = true "= true, if info message that file is loading is to be printed (combiTimeTable.verboseRead)" annotation(Dialog(group = "TableDataDefinition", enable = tableOnFile));
  parameter Integer columns[:] = 2:size(table, 2) "Columns of table to be interpolated (combiTimeTable.columns)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Smoothness smoothness = Smoothness.LinearSegments "Smoothness of table interpolation (combiTimeTable.smoothness)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Extrapolation extrapolation = Extrapolation.LastTwoPoints "Extrapolation of data outside the definition range (combiTimeTable.extrapolation)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Time timeScale(min = eps) = 1 "Time scale of first table column (combiTimeTable.timeScale)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Real offset[:] = {0} "Offsets of output signals (combiTimeTable.offset)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Time startTime = 0 "Output = offset for time < startTime (combiTimeTable.startTime)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Time shiftTime = startTime "Shift time of first table column (combiTimeTable.shiftTime)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter TimeEvents timeEvents = TimeEvents.Always "Time event handling of table interpolation (combiTimeTable.timeEvents)" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Boolean verboseExtrapolation = false "= true, if warning messages are to be printed if time is outside the table definition range (combiTimeTable.verboseExtrapolation)" annotation(Dialog(group = "TableDataInterpretation"));
  outer ModelSettings modelSettings;
protected
  parameter String fileName = if tableOnFile then Modelica.Utilities.Files.loadResource(fileNameURI) else "NoName" annotation(Dialog(group = "Initialization", enable = false));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = tableOnFile, table = table, tableName = tableName, fileName = fileName, verboseRead = verboseRead, columns = columns, smoothness = smoothness, extrapolation = extrapolation, timeScale = timeScale, offset = offset, startTime = startTime, shiftTime = shiftTime, timeEvents = timeEvents, verboseExtrapolation = verboseExtrapolation) annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(combiTimeTable.y[1], y) annotation(Line(visible = true, origin = {110.5, 0}, points = {{-49.5, 0}, {49.5, 0}}, color = {1, 37, 163}));
  connect(combiTimeTable.y, y_nout) annotation(Line(visible = true, origin = {91.912, -10}, points = {{-30.912, 10}, {-11.912, 10}, {-11.912, -10}, {58.088, -10}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This block generates an output signal <code>y_nout[:]</code> (or <code>y</code> in case of a single output) by <strong>constant</strong>, <strong>linear</strong> or <strong>cubic Hermite spline interpolation</strong> in a table. The time points and function values are stored in a matrix <code>table[i,j]</code>, where the first column <code>table[:,1]</code> contains the time points and the other columns contain the data to be interpolated. For more information&nbsp;&rarr; <a href=\"modelica:/Modelica.Blocks.Sources.CombiTimeTable\">Modelica.Blocks.Sources.CombiTimeTable</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.LinearTimeTable\">LinearTimeTable</a></p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, origin = {0, -29}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-34.897, -8.406}, {34.897, 8.406}}), Rectangle(visible = true, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-34.267, -28.975}, {34.267, 28.975}}), Line(visible = true, origin = {35.015, -1.665}, points = {{0, -29.101}, {0, 29.101}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0), Line(visible = true, origin = {-35.03, -0.899}, points = {{0, -29.101}, {0, 29.101}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0), Ellipse(visible = true, origin = {0, 28.406}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-34.897, -8.406}, {34.897, 8.406}}), Line(visible = true, origin = {-2.144, -12.375}, rotation = 5.164, points = {{-28.995, -11.343}, {-19.983, -5.85}, {-14.635, -5.914}, {-9.262, 7.899}, {-1.929, -1.174}, {5.533, 18.233}, {9.982, 4.086}, {18.558, 3.311}, {21.756, -5.914}, {31.554, 9.574}}, color = {255, 255, 255}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Ellipse(visible = true, origin = {28.294, 0.181}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-2.706, -2.706}, {2.706, 2.706}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExogenousData;
