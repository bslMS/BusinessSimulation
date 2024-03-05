within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

block TrendBasedForecast "Trend-based forecast for an exponentially growing quantity"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.InformationProcessing_SO;
  Interfaces.Connectors.RealInput u "Current value as basis for trend formulation" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Units.Rate initialTrend = 0 "Initial trend (fracGrowthRate.initialTrend)";
  parameter Time fcsth(min = 0) = 1 "Forecast horizon";
  parameter Time tppc(min = 0) = 1 "Averaging time for perception of current quantity (i.e., the present condition)";
  parameter Time thrc(min = 0) = 1 "Time horizon for reference condition";
  parameter Time tpt(min = 0) = 1 "Time to perceive the trend (i.e., there is gradual adaptation to a new trend)" annotation(Dialog(enable = smoothTrend));
  parameter Boolean smoothTrend = false "= true, if the calculated trend is to be smoothed (fracGrowthRate.smoothTrend)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Converters.Product_2 fractionalGrowth "FractionalGrowthRate times perceptionTime" annotation(Placement(visible = true, transformation(origin = {-7.422, 40.047}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Add_2 extrapolationFactor "Extrapolaton factor using fractional growth rate and perception time to eliminate perception lage" annotation(Placement(visible = true, transformation(origin = {21.781, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Trend fracGrowthRate(tppc = tppc, thrc = thrc, tpt = tpt, reportPPC = true, initialTrend = initialTrend, smoothTrend = smoothTrend) "TREND-formulation is used to calculate a fractional growth rate" annotation(Placement(visible = true, transformation(origin = {-47.422, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 extrapolPC "Present Condition extrapolated from perceived quantity and the time to perceive it" annotation(Placement(visible = true, transformation(origin = {51.661, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TimeValueOfMoney futureValue "Future value according to exponential growth model" annotation(Placement(visible = true, transformation(origin = {91.661, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime timePPC(value = tppc) "Time to perceive present condition" annotation(Placement(visible = true, transformation(origin = {-50, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime forecastHorizon(value = fcsth) "Forecast horizon (T)" annotation(Placement(visible = true, transformation(origin = {56.661, -15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter one(value = 1, redeclare replaceable type OutputType = Dimensionless) "Time to perceive present condition" annotation(Placement(visible = true, transformation(origin = {-6.688, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, fracGrowthRate.u) annotation(Line(visible = true, origin = {-101.896, 0}, points = {{-43.104, 0}, {43.474, 0}}, color = {0, 0, 127}));
  connect(futureValue.y, y) annotation(Line(visible = true, origin = {115.342, 0}, points = {{-12.681, 0}, {44.658, 0}}, color = {0, 0, 127}));
  connect(forecastHorizon.y, futureValue.u_T) annotation(Line(visible = true, origin = {71.286, -10}, points = {{-8.625, -5}, {0.375, -5}, {0.375, 5}, {9.375, 5}}, color = {1, 37, 163}));
  connect(extrapolPC.y, futureValue.u) annotation(Line(visible = true, origin = {76.563, 10}, points = {{-16.902, 10}, {-1.466, 10}, {-1.466, -10}, {4.098, -10}}, color = {1, 37, 163}));
  connect(fractionalGrowth.y, extrapolationFactor.u2) annotation(Line(visible = true, origin = {5.879, 40.023}, points = {{-5.301, 0.024}, {-1.301, 0.023}, {-1.301, -0.023}, {7.902, -0.023}}, color = {1, 37, 163}));
  connect(one.y, extrapolationFactor.u1) annotation(Line(visible = true, origin = {5.68, 55}, points = {{-6.368, 5}, {-0.367, 5}, {-0.367, -5}, {8.101, -5}}, color = {1, 37, 163}));
  connect(timePPC.y, fractionalGrowth.u1) annotation(Line(visible = true, origin = {-32.605, 45.023}, points = {{-11.395, -0.023}, {-2.395, -0.023}, {-2.395, 0.023}, {17.183, 0.024}}, color = {1, 37, 163}));
  connect(extrapolationFactor.y, extrapolPC.u1) annotation(Line(visible = true, origin = {36.751, 35}, points = {{-6.97, 10}, {0.03, 10}, {0.03, -10}, {6.91, -10}}, color = {1, 37, 163}));
  connect(fracGrowthRate.y, futureValue.u_r) annotation(Line(visible = true, origin = {43.56, 2.5}, points = {{-79.982, -2.5}, {21.44, -2.5}, {21.44, 2.5}, {37.101, 2.5}}, color = {1, 37, 163}));
  connect(fracGrowthRate.y_ppc, extrapolPC.u2) annotation(Line(visible = true, origin = {-12.282, 5}, points = {{-24.14, -10}, {12.282, -10}, {12.282, 10}, {55.943, 10}}, color = {1, 37, 163}));
  connect(fracGrowthRate.y, fractionalGrowth.u2) annotation(Line(visible = true, origin = {-26.593, 17.477}, points = {{-9.829, -17.477}, {-3.407, -17.523}, {-3.407, 17.523}, {11.171, 17.57}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The trend-based forecast makes use of a perceived present condition and a fractional growth rate computed by a &rarr;<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.Trend\">Trend</a> block that follows the model proposed by Sterman [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">3</a>, pp. 34 - 38].</p>
<p>The perceived present condition (PPC) will be \"brought forward\" to the actual time using linear extrapolation:</p>
<p><code>Extrapolated&nbsp;Present Condition = Perceived Present Condition &middot; ( 1 + fractional growth rate &middot; time to perceive present condition)</code></p>
<p>The actual forecast is then arrived at by using exponential growth and continuous compounding:</p>
<p><code>forecast = extrapolated present condition &middot; EXP( fractional growth rate &middot; forecast horizon)</code></p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.Trend\">Trend</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Forecast", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Trend-based", fontName = "Lato", textStyle = {TextStyle.Bold}), Rectangle(visible = true, origin = {-134.89, 113.027}, fillColor = {255, 255, 255}, extent = {{-0.491, -0.631}, {0.491, 0.631}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TrendBasedForecast;
