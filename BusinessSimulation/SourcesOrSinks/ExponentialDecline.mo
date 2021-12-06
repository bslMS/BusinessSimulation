within BusinessSimulation.SourcesOrSinks;

model ExponentialDecline "Exponential decline of connected stock"
  import BusinessSimulation.Units.Rate;
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.Sink;
  Interfaces.Connectors.RealInput u if not hasConstantRate "Fractional rate given as exogenous input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter OutputType fractionalRate(min = 0) = 0 "Constant fractional rate to be used if chosen" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantRate = false "= true, if the constant fractional rate is used instead of the real input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Flows.Unidirectional.ProportionalTransition decreasing annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Cloud cloud "System boundary" annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter parFractionalRate(value = fractionalRate) if hasConstantRate "Constant rate (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough indicatedRate if isCCR "Indicated fractional rate" annotation(Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ForceOfInterest convertedRate if not isCCR "Continuously compounding rate" annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massPort, decreasing.portA) annotation(Line(visible = true, origin = {85, 0}, points = {{75, 0}, {-75, 0}}, color = {128, 0, 128}));
  connect(decreasing.portB, cloud.massPort) annotation(Line(visible = true, origin = {-15, 0}, points = {{5, 0}, {-5, 0}}, color = {128, 0, 128}));
  connect(parFractionalRate.y, convertedRate.u) annotation(Line(visible = true, origin = {-92.269, 70}, points = {{-14.269, 0}, {14.269, 0}}, color = {1, 37, 163}));
  connect(indicatedRate.y, decreasing.u) annotation(Line(visible = true, origin = {-17.546, 36.667}, points = {{-45.092, 13.333}, {22.546, 13.333}, {22.546, -26.667}}, color = {1, 37, 163}));
  connect(u, convertedRate.u) annotation(Line(visible = true, origin = {-109.5, 55}, points = {{-35.5, -15}, {14.5, -15}, {14.5, 15}, {31.5, 15}}, color = {1, 37, 163}));
  connect(parFractionalRate.y, indicatedRate.u) annotation(Line(visible = true, origin = {-91.135, 60}, points = {{-15.404, 10}, {1.135, 10}, {1.135, -10}, {13.135, -10}}, color = {1, 37, 163}));
  connect(u, indicatedRate.u) annotation(Line(visible = true, origin = {-107, 45}, points = {{-38, -5}, {17, -5}, {17, 5}, {29, 5}}, color = {1, 37, 163}));
  connect(convertedRate.y, decreasing.u) annotation(Line(visible = true, origin = {-17.546, 50}, points = {{-45.092, 20}, {22.546, 20}, {22.546, -40}}, color = {1, 37, 163}));
  connect(decreasing.y2, y) annotation(Line(visible = true, origin = {52.625, 12.5}, points = {{-42.125, -17.5}, {-32.625, -17.5}, {-32.625, 17.5}, {107.375, 17.5}}, color = {1, 37, 163}));
  connect(decreasing.y2, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  connect(decreasing.y2, y1) annotation(Line(visible = true, origin = {52.625, 32.5}, points = {{-42.125, -37.5}, {-32.625, -37.5}, {-32.625, 37.5}, {107.375, 37.5}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>ExponentialDecline</em>&nbsp;will drain the connected stock into&nbsp;a sink with infinite capacity at a rate that is determined at any time as the product of the current amount in the connected stock and the fractional rate given. The rate can either be given as a constant parameter&nbsp;<code>fractionalRate</code> or as a real input&nbsp;<strong>u</strong>, making it variable in time.</p>
<h4>Notes</h4>
<ul>
<li>By default it is assumed, that the rate given is a continously compounding rate (<code>isCCR = true</code>). If this is not case, the rate will be converted using the &rarr;<a href=\"modelica://BusinessSimulation.Converters.ForceOfInterest\">ForceOfInterest </a>converter.</li><br>
<li>The effective rate of decline(e.g the product of the rate and amount in stock) must never be negative, as filling the connected stock is prohibited. Should the rate of outflow from&nbsp;the stock become negative, it will be set to zero.</li><br>
<li>Exponential decline processes have a <em>constant half-life</em> (e.g., the time it takes to to shrink by 50%) which can be found by dividing log(2)&nbsp;&asymp; 0.69 by the continuously compounding fractional rate (or by log(1+rate) if the rate is not a continuously compounding rate).</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialGrowth\">ExponentialGrowth</a>, <a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecay\">ExponentialDecay</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialChange\">ExponentialChange</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "EXP Decline", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {63.558, -10.273}, rotation = -5.306, points = {{32.722, 10.515}, {27.406, -27.31}, {3.18, -33.132}, {-12.083, -16.513}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Text(visible = true, origin = {0, -78.316}, textColor = {0, 0, 128}, extent = {{-71.945, -12}, {71.945, 12}}, textString = "fractional rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-22.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {36.663, -27.43}, {51.602, -8.364}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {51.134, -25.316}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {29.113, -25.409}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExponentialDecline;
