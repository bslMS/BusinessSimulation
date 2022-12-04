within BusinessSimulation.CausalLoop;

model Lookup_TableOnFile "Table-based lookup given on file"
  import BusinessSimulation.Units.*;
  import Modelica.Blocks.Types.{Smoothness,Extrapolation};
  extends Interfaces.PartialCLD.Lookup;
  parameter Boolean hasConstantReference = true "= true, if the reference value for the stock is given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter String tableName = "NoName" "Name of the table in the file containing the data" annotation(Dialog(group = "TableDataDefinition"));
  parameter String fileNameURI = modelSettings.lookupDataFileURI "URI of the file to read the data from (default = modelSettings.lookupDataFileURI)" annotation(Dialog(group = "TableDataDefinition"));
  parameter Boolean verboseRead = true "= true, if info message that file is loading is to be printed" annotation(Dialog(group = "TableDataDefinition"));
  parameter Smoothness smoothness = Smoothness.LinearSegments "Smoothness of table interpolation" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Extrapolation extrapolation = Extrapolation.HoldLastPoint "Extrapolation of data outside the definition range" annotation(Dialog(group = "TableDataInterpretation"));
  parameter Boolean verboseExtrapolation = false "= true, if warning messages are to be printed if table input is outside the definition range" annotation(Dialog(group = "TableDataInterpretation"));
  outer ModelSettings modelSetting;
protected
  Converters.Lookup.TableFunction lookup(redeclare type OutputType = Dimensionless, convertInput = false, convertOutput = false, tableOnFile = true, smoothness = smoothness, extrapolation = extrapolation, tableName = tableName, fileNameURI = fileNameURI, verboseRead = verboseRead, verboseExtrapolation = verboseExtrapolation) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(normalizedStock.y, lookup.u) annotation(Line(visible = true, origin = {-30, 0}, points = {{-22, 0}, {22, 0}}, color = {1, 37, 163}));
  connect(lookup.y, y) annotation(Line(visible = true, origin = {85.043, 0}, points = {{-77.043, 0}, {77.043, 0}}, color = {1, 37, 163}));
  /* block,  information processing */
  annotation(defaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the lookup converter →<a href =\"modelica://BusinessSimulation.Converters.Lookup.TableFunction\"><code>TableFunction</code></a> the normalized current value of the stock, which is connected via the <code>StockInfoInput</code> connector, is used as input to an interpolation table (on file) to obtain the output <strong>y</strong>.</p>
<p>The value used for the normalization is a constant by default (<code>referenceValue = 1</code>); if <code>hasConstantReference = false</code> the optional input <strong>u</strong> is used instead.</p>
<h4>Notes</h4>
<ul>
<li>The reference value for normalization should be strictly positive; the divison for normalization is protected against divison by zero and will return zero in that case.</li><br>
<li>Instead of using the current value of a connected stock, the input connector <strong>u</strong> can be used as basis by setting <code>hasStockInfoInput = false</code>.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_Table\">Lookup_Table</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_JPositive\">Lookup_JPositive</a>, 
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_JNegative\">Lookup_JNegative</a>, 
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_SPositive\">Lookup_SPositive</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_SNegative\">Lookup_SNegative</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {-32.04, 28.906}, lineColor = {255, 255, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-67.96, 28.906}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-67.96, 9.906}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-32.04, 9.906}, lineColor = {255, 255, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-67.96, -9.094}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-32.04, -9.094}, lineColor = {255, 255, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-67.96, -28.297}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Rectangle(visible = true, origin = {-32.04, -28.297}, lineColor = {255, 255, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-17.96, -8.906}, {17.96, 8.906}}), Ellipse(visible = true, origin = {-33.903, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Ellipse(visible = true, origin = {-68.903, 10}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-68.903, -10}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-33.903, -11}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-33.903, 10}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {-68.903, 0}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Text(visible = true, origin = {-50, -50}, textColor = {160, 160, 164}, extent = {{-20, -12}, {20, 12}}, textString = "file", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Lookup_TableOnFile;
