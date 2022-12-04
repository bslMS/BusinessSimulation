within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

block Trend "Calculating a fractional rate of change to be used in forecasting"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.InitializationOptions;
  extends Interfaces.PartialConverters.InformationProcessing_SO(redeclare replaceable type OutputType = Rate);
  Interfaces.Connectors.RealInput u "Current value as basis for trend formulation" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_ppc if reportPPC "Report the perceived present condition (optional)" annotation(Placement(visible = true, transformation(origin = {160, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Rate initialTrend = 0 "Initial trend" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter Time tppc(min = 0) = 1 "Averaging time for perception of current quantity (i.e., the present condition)";
  parameter Time thrc(min = 0) = 1 "Time horizon for reference condition";
  parameter Time tpt(min = 0) = 1 "Time to perceive the trend (i.e., there is gradual adaptation to a new trend)" annotation(Dialog(enable = smoothTrend));
  parameter Boolean smoothTrend = false "= true, if the calculated trend is to be smoothed" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean reportPPC = false "= true, if the perceived present conditon is to be reported" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  parameter Real initialRC(fixed = false) "Initial Value for the reference condition" annotation(Dialog(tab = "Initialization", enable = false));
  parameter Real initialPPC(fixed = false) "InitialValue for the perceived present condition" annotation(Dialog(tab = "Initialization", enable = false));
  Converters.PassThrough actualTrend if not smoothTrend annotation(Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.Smooth rc(initialValue = initialRC, hasConstantDelayTime = false, init = init) "Reference condition for calculating the fractional trend" annotation(Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.DiscreteDelay.Smooth ppc(initialValue = initialPPC, hasConstantDelayTime = false, init = init) "Perceived present condition" annotation(Placement(visible = true, transformation(origin = {-85, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parTPPC(value = tppc) "Time to perceive present condition" annotation(Placement(visible = true, transformation(origin = {-105, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parTHRC(value = thrc) "Time horizon for the reference condition (duration of trend formulation)" annotation(Placement(visible = true, transformation(origin = {-105, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parTPT(value = tpt) if smoothTrend "Time to perceive the trend (i.e., adjustment time)" annotation(Placement(visible = true, transformation(origin = {100, 25}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.Smooth perceivedTrend(initialValue = initialTrend, hasConstantDelayTime = false, redeclare replaceable type OutputType = Rate, init = init) if smoothTrend "Perceived growth rate" annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Division_Guarded indicatedTrend "Indicated fractional growth rate (trend)" annotation(Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Gap delta "Difference between perceived present condition and reference condition" annotation(Placement(visible = true, transformation(origin = {-20, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 rcTimesTHRC "Referenc condition times time horizon for reference condition" annotation(Placement(visible = true, transformation(origin = {-6.933, -45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  initialPPC = u / (1 + tppc * initialTrend);
  initialRC = initialPPC / (1 + thrc * initialTrend);
equation
  connect(ppc.y, rc.u) annotation(Line(visible = true, origin = {-68.591, -20}, points = {{-6.409, 20}, {-1.409, 20}, {-1.409, -20}, {9.228, -20}}, color = {0, 0, 127}));
  connect(u, ppc.u) annotation(Line(visible = true, origin = {-119.681, 0}, points = {{-25.319, 0}, {25.319, 0}}, color = {0, 0, 127}));
  connect(perceivedTrend.y, y) "Fractional trend (fractional rate of growth)" annotation(Line(visible = true, origin = {122.384, -5}, points = {{-32.384, 5}, {-2.384, 5}, {-2.384, 5}, {27.616, 5}}, color = {1, 37, 163}));
  connect(parTPPC.y, ppc.u_delayTime) annotation(Line(visible = true, origin = {-89.667, 15}, points = {{-9.333, 5}, {4.667, 5}, {4.667, -10}}, color = {1, 37, 163}));
  connect(parTHRC.y, rc.u_delayTime) annotation(Line(visible = true, origin = {-66.333, -55}, points = {{-32.667, -5}, {16.333, -5}, {16.333, 10}}, color = {1, 37, 163}));
  connect(parTPT.y, perceivedTrend.u_delayTime) annotation(Line(visible = true, origin = {84.667, 18.333}, points = {{9.333, 6.667}, {-4.667, 6.667}, {-4.667, -13.333}}, color = {1, 37, 163}));
  connect(indicatedTrend.y, perceivedTrend.u) annotation(Line(visible = true, origin = {49.659, -5}, points = {{-11.659, -5}, {-4.659, -5}, {-4.659, 5}, {20.978, 5}}, color = {0, 0, 127}));
  connect(ppc.y, delta.u1) annotation(Line(visible = true, origin = {-51.5, 0}, points = {{-23.5, 0}, {23.5, 0}}, color = {0, 0, 127}));
  connect(delta.y, indicatedTrend.u1) annotation(Line(visible = true, origin = {5, -5}, points = {{-17, 0}, {17, 0}}, color = {0, 0, 127}));
  connect(rc.y, delta.u2) annotation(Line(visible = true, origin = {-31.366, -25}, points = {{-8.634, -15}, {1.366, -15}, {1.366, 15}, {3.366, 15}}, color = {0, 0, 127}));
  connect(rcTimesTHRC.y, indicatedTrend.u2) annotation(Line(visible = true, origin = {13.857, -30}, points = {{-12.79, -15}, {1.143, -15}, {1.143, 15}, {8.143, 15}}, color = {0, 0, 127}));
  connect(parTHRC.y, rcTimesTHRC.u2) annotation(Line(visible = true, origin = {-45.868, -55}, points = {{-53.132, -5}, {15.868, -5}, {15.868, 5}, {30.935, 5}}, color = {0, 0, 127}));
  connect(rc.y, rcTimesTHRC.u1) annotation(Line(visible = true, origin = {-27.466, -40}, points = {{-12.534, 0}, {12.534, 0}}, color = {0, 0, 127}));
  connect(indicatedTrend.y, actualTrend.u) annotation(Line(visible = true, origin = {50, -20}, points = {{-12, 10}, {-5, 10}, {-5, -10}, {22, -10}}, color = {1, 37, 163}));
  connect(actualTrend.y, y) annotation(Line(visible = true, origin = {122, -15}, points = {{-34, -15}, {-2, -15}, {-2, 15}, {38, 15}}, color = {1, 37, 163}));
  connect(ppc.y, y_ppc) annotation(Line(visible = true, origin = {30.833, -51.667}, points = {{-105.833, 51.667}, {-100.833, 51.667}, {-100.833, -43.333}, {89.167, -43.333}, {89.167, -8.333}, {129.167, -8.333}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>Trend</em> component represents forecasting in behavioral models and has been proposed by Sterman [<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.Trend\">3</a>, pp. 634 - 638]. The basic idea is rather intuitive: Forecasters perceive a present condition of some input as a smoothed input (ppc), while they also perceive the historic or reference condition&nbsp;(rc) as a smooth of their current perception.</p>
<p>Dividing the diffence between the current condition and the reference condition by the reference condition will determine the fractional increase. A further division by the time horizon for the reference condition will then turn this into a <em>fractional rate</em>. The thus calculated rate of change (i.e., the indicated trend) may then again be smoothed, if <code>smoothTrend = true</code>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.TrendBasedForecast\">TrendBasedForecast</a>,
<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth</a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Trend", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Rectangle(visible = true, origin = {12.357, -32.5}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, pattern = LinePattern.Dash, extent = {{-45, -42.5}, {45, 42.5}}), Text(visible = true, origin = {10.611, -80}, textColor = {128, 128, 128}, extent = {{-54.39, -6.559}, {54.39, 6.559}}, textString = "indicatedTrend = ( ppc- rc ) / rc / thrc", fontSize = 16, fontName = "Arial")}));
end Trend;
