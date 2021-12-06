within BusinessSimulation.Examples;

model LookupFunctions "Showcase of lookup-functions"
  extends Icons.Example;
  ModelOutput modelOutput "The main model output" annotation(Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80.808, -6.712}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real slope1To50(min = 1, max = 50) = 2 "Slope parameter (general)";
  parameter Real slope(min = 0) = slope1To50 "Determines the gradient of the curve (Janoschek and S-Shaped)";
  parameter Real slopeUpTo1(min = 0, max = 1) = 0.5 "Slope parameter (0< slope <= 1) (concaveLookupPosisitve)";
  parameter Real interceptUpward(min = 0, max = 1) = 0. "Value of y when input is zero or less (y0) for upward sloping functions";
  parameter Real interceptDownward(min = 1) = 2. "Value of y when input is zero or less (y0) for downward sloping functions";
  parameter Real upperBound = 2 "Upper asymptote for u <= 0 (upperBound > lowerBound) (Janoschek and S-Shaped)";
  parameter Real lowerBound = 0 "Lower asymptote for u -> infinity (Janoschek)";
  parameter Real x_ref(min = 0) = 1 "x-value for point of inflection(>0) (Janoschek)";
  parameter Real y_ref = 1 "y-value for point of inflection(lowerBound < y_ref < upperBound) (Janoschek)";
  parameter Real table[:, :] = {{0, 0}, {2, 4}, {4, 6}, {6, 8}} "Table matrix (grid = first column; e.g., table=[0,2]) (combiTable1D.table) (tableFunction.table)";
  parameter Modelica.Blocks.Types.Smoothness smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments "Smoothness of table interpolation (tableFunction.smoothness)";
  parameter Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint "Extrapolation of data outside the definition range (combiTable.extrapolation) (tableFunction.extrapolation)";
  inner ModelSettings modelSettings(modelTimeHorizon = 10) annotation(Placement(visible = true, transformation(origin = {-110, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InformationSources.RampInput '0..10'(height = 10, duration = 10, offset = 0, startTime = 0) "Ramp from 0 to 10 in 10 units of time" annotation(Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InformationSources.RampInput '-5..5'(offset = -5, height = 10, duration = 10) "Ramp from -5 to 5 in 10 units of time" annotation(Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  expandable connector ModelOutput "Main Output"
    extends Icons.DataOutPort;
  end ModelOutput;
protected
  Converters.Lookup.ConcaveLookupNegative concaveLookupNegative(s = slope1To50, y0 = interceptDownward) annotation(Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.ConcaveLookupPositive concaveLookupPositive(s = slopeUpTo1, y0 = interceptUpward) annotation(Placement(visible = true, transformation(origin = {-50, 55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.ConvexLookupNegative convexLookupNegative(y0 = interceptDownward) annotation(Placement(visible = true, transformation(origin = {-50, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.ConvexLookupPositive convexLookupPositive(s = slope1To50, y0 = interceptUpward) annotation(Placement(visible = true, transformation(origin = {-50, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.JanoschekNegative janoschek_negative_x_y(growthRate = slope, x_ref = x_ref, y_ref = y_ref, lowerBound = lowerBound, upperBound = upperBound) annotation(Placement(visible = true, transformation(origin = {-50, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.JanoschekPositive janoschek_positive_x_y(lowerBound = lowerBound, upperBound = upperBound, growthRate = slope, x_ref = x_ref, y_ref = y_ref) annotation(Placement(visible = true, transformation(origin = {-50, -65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.SShapedNegative sShapedNegative_origin(s = slope, upperBound = upperBound) annotation(Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.SShapedPositive sShapedPositive_origin(s = slope, upperBound = upperBound) annotation(Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.TableFunction tableFunction(table = table, tableOnFile = false, extrapolation = extrapolation, smoothness = smoothness) annotation(Placement(visible = true, transformation(origin = {-50, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect('0..10'.y, concaveLookupPositive.u) annotation(Line(visible = true, origin = {-71.503, 32.5}, points = {{-30.497, -22.5}, {-8.497, -22.5}, {-8.497, 22.5}, {13.503, 22.5}}, color = {0, 0, 127}));
  connect('0..10'.y, convexLookupNegative.u) annotation(Line(visible = true, origin = {-71.503, 17.5}, points = {{-30.497, -7.5}, {-8.497, -7.5}, {-8.497, 7.5}, {13.503, 7.5}}, color = {0, 0, 127}));
  connect('0..10'.y, janoschek_positive_x_y.u) annotation(Line(visible = true, origin = {-71.503, -27.5}, points = {{-30.497, 37.5}, {-8.497, 37.5}, {-8.497, -37.5}, {13.503, -37.5}}, color = {0, 0, 127}));
  connect('0..10'.y, convexLookupPositive.u) annotation(Line(visible = true, origin = {-71.503, 2.5}, points = {{-30.497, 7.5}, {-8.497, 7.5}, {-8.497, -7.5}, {13.503, -7.5}}, color = {0, 0, 127}));
  connect('0..10'.y, janoschek_negative_x_y.u) annotation(Line(visible = true, origin = {-71.503, -12.5}, points = {{-30.497, 22.5}, {-8.497, 22.5}, {-8.497, -22.5}, {13.503, -22.5}}, color = {0, 0, 127}));
  connect('-5..5'.y, sShapedNegative_origin.u) annotation(Line(visible = true, origin = {29.997, 20}, points = {{-11.997, -10}, {10.003, -10}, {10.003, 10}, {32.003, 10}}, color = {0, 0, 127}));
  connect('-5..5'.y, sShapedPositive_origin.u) annotation(Line(visible = true, origin = {39.997, 0}, points = {{-21.997, 10}, {0.003, 10}, {0.003, -10}, {22.003, -10}}, color = {0, 0, 127}));
  connect('0..10'.y, tableFunction.u) annotation(Line(visible = true, origin = {-87.117, -40}, points = {{-14.883, 50}, {7.117, 50}, {7.117, -50}, {29.117, -50}}, color = {1, 37, 163}));
  connect('0..10'.y, concaveLookupNegative.u) annotation(Line(visible = true, origin = {-80, 45}, points = {{-22, -35}, {0, -35}, {0, 35}, {22, 35}}, color = {1, 37, 163}));
  connect(concaveLookupNegative.y, modelOutput.concaveLookupNegative) annotation(Line(visible = true, origin = {9.5, 20}, points = {{-51.5, 60}, {-29.5, 60}, {-29.5, -60}, {110.5, -60}}, color = {192, 192, 192}));
  connect(concaveLookupPositive.y, modelOutput.concaveLookupPositive) annotation(Line(visible = true, origin = {9.5, 7.5}, points = {{-51.5, 47.5}, {-29.5, 47.5}, {-29.5, -47.5}, {110.5, -47.5}}, color = {192, 192, 192}));
  connect(convexLookupNegative.y, modelOutput.convexLookupNegative) annotation(Line(visible = true, origin = {9.5, -7.5}, points = {{-51.5, 32.5}, {-29.5, 32.5}, {-29.5, -32.5}, {110.5, -32.5}}, color = {192, 192, 192}));
  connect(convexLookupPositive.y, modelOutput.convexLookupPositive) annotation(Line(visible = true, origin = {9.5, -22.5}, points = {{-51.5, 17.5}, {-29.5, 17.5}, {-29.5, -17.5}, {110.5, -17.5}}, color = {192, 192, 192}));
  connect(janoschek_negative_x_y.y, modelOutput.janoschekNegative) annotation(Line(visible = true, origin = {9.5, -37.5}, points = {{-51.5, 2.5}, {-29.5, 2.5}, {-29.5, -2.5}, {110.5, -2.5}}, color = {192, 192, 192}));
  connect(janoschek_positive_x_y.y, modelOutput.janoschekPositive) annotation(Line(visible = true, origin = {9.919, -52.5}, points = {{-51.919, -12.5}, {-29.919, -12.5}, {-29.919, 12.5}, {110.081, 12.5}}, color = {192, 192, 192}));
  connect(tableFunction.y, modelOutput.tableFunction) annotation(Line(visible = true, origin = {9.5, -65}, points = {{-51.5, -25}, {-29.5, -25}, {-29.5, 25}, {110.5, 25}}, color = {192, 192, 192}));
  connect(sShapedNegative_origin.y, modelOutput.sShapedNegative) annotation(Line(visible = true, origin = {99.5, -5}, points = {{-21.5, 35}, {0.5, 35}, {0.5, -35}, {20.5, -35}}, color = {192, 192, 192}));
  connect(sShapedPositive_origin.y, modelOutput.sShapedPositive) annotation(Line(visible = true, origin = {99.5, -25}, points = {{-21.5, 15}, {0.5, 15}, {0.5, -15}, {20.5, -15}}, color = {192, 192, 192}));
  annotation(preferredView = "diagram", __Wolfram, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This example demonstrates the use of parametric lookup and table functions in models and may serve as a showcase. While table functions are still frequently used, the advantage of parametric functions is their <em>smoothness</em>—at least in the relevant range—and the better calibration/identification options.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.Lookup\">Converters.Lookup</a>
</p>
</html>", figures = {Figure(title = "Concave Lookup", identifier = "concave", preferred = true, plots = {Plot(title = "Negative", identifier = "neg", curves = {Curve(y = modelOutput.concaveLookupNegative, legend = "concaveLookupNegative")}), Plot(title = "Positive", identifier = "pos", curves = {Curve(y = modelOutput.concaveLookupPositive, legend = "concaveLookupPositive")})}, caption = "Concave lookup with positive and negative slopes."), Figure(title = "Convex Lookup", identifier = "convex", plots = {Plot(title = "Negative", identifier = "neg", curves = {Curve(y = modelOutput.convexLookupNegative, legend = "convexLookupNegative")}), Plot(title = "Positive", curves = {Curve(y = modelOutput.convexLookupPositive, legend = "convexLookupPositive")})}, caption = "Convex lookups with positive and negative slopes."), Figure(title = "Table Function", identifier = "table", plots = {Plot(curves = {Curve(y = modelOutput.tableFunction, legend = "tableFunction")})}, caption = "Classical table function lookup."), Figure(title = "Janosckek's Growth Function", identifier = "janoschek", plots = {Plot(title = "Positive", identifier = "pos", curves = {Curve(y = modelOutput.janoschekPositive, legend = "janoschekPositive")}), Plot(title = "Negative", identifier = "neg", curves = {Curve(y = modelOutput.janoschekNegative, legend = "janoschekNegative")})}, caption = "Janoschek's growth function with positive and negative slopes."), Figure(title = "S-shaped Lookup", identifier = "sshaped", plots = {Plot(title = "Positive", identifier = "pos", curves = {Curve(x = '-5..5'.y, y = modelOutput.sShapedPositive, legend = "sShapedPositive vs '-5..5'.y")}), Plot(title = "Negative", identifier = "neg", curves = {Curve(x = '-5..5'.y, y = modelOutput.sShapedNegative, legend = "sShapedNegative vs '-5..5'.y")})}, caption = "S-shaped Lookup with positive and negative slope")}, revisions = "<html>
<ul>
<li>Modified simulation plots in v2.0.0.</li>
</ul>
</html>"), experiment(StartTime = 0, StopTime = 10, NumberOfIntervals = 10000, __Wolfram_Algorithm = "dassl", __Wolfram_SynchronizeWithRealTime = false), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {60, 80}, textColor = {76, 112, 136}, extent = {{-50, -6}, {50, 6}}, textString = "Lookup Converters", fontName = "Lato Black", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {60, 70}, textColor = {128, 128, 128}, extent = {{-50, -3}, {50, 3}}, textString = "Parametric- and Interpolating-Functions", fontName = "Lato", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left)}));
end LookupFunctions;
