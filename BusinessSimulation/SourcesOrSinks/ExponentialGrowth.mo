within BusinessSimulation.SourcesOrSinks;

model ExponentialGrowth "Exponential growth of connected stock"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.Source;
  Interfaces.Connectors.RealInput u if not hasConstantRate "Fractional rate given as exogenous input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter OutputType fractionalRate(min = 0) = unspecified "Constant fractional rate to be used if chosen" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantRate = false "= true, if the constant fractional rate is used instead of the real input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Cloud cloud "System boundary" annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Transition growing "Inflow to connected stock" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor stockLevel "Report amount in connected stock" annotation(Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 rate "Rate of growth is proportional to level of connected stock" annotation(Placement(visible = true, transformation(origin = {-5, 25}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parFractionalRate(value = fractionalRate) if hasConstantRate "Constant rate (optional)" annotation(Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough indicatedFractionalRate if isCCR "Output is equal to input" annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ForceOfInterest ccRate if not isCCR "Continuously Compounding Rate" annotation(Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(not hasConstantRate or fractionalRate < inf, "Parameter fractionalRate needs to be specified");
  // positive rate grows the connected stock
  connect(stockLevel.flowPort, massPort) annotation(Line(visible = true, origin = {135, 5}, points = {{-45, 5}, {-45, -5}, {25, -5}}, color = {128, 0, 128}));
  connect(growing.portB, massPort) annotation(Line(visible = true, origin = {85, 0}, points = {{-75, 0}, {75, 0}}, color = {128, 0, 128}));
  connect(stockLevel.stock, rate.u1) annotation(Line(visible = true, origin = {45.024, 33.5}, points = {{45.024, -12.5}, {45.024, 6.5}, {-45.024, 6.5}, {-45.024, -0.5}}, color = {1, 37, 163}));
  connect(rate.y, growing.u) annotation(Line(visible = true, origin = {-5, 13.819}, points = {{0, 3.819}, {0, -3.819}}, color = {1, 37, 163}));
  connect(cloud.massPort, growing.portA) annotation(Line(visible = true, origin = {-25, 0}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(growing.y, y1) annotation(Line(visible = true, origin = {56.667, 50.133}, points = {{-51.667, -39.733}, {-51.667, 19.867}, {103.333, 19.867}}, color = {1, 37, 163}));
  connect(growing.y, y) annotation(Line(visible = true, origin = {56.667, 23.467}, points = {{-51.667, -13.067}, {-51.667, 6.533}, {103.333, 6.533}}, color = {1, 37, 163}));
  connect(growing.y1, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  connect(parFractionalRate.y, indicatedFractionalRate.u) annotation(Line(visible = true, origin = {-92.269, 70}, points = {{-34.269, 0}, {34.269, 0}}, color = {1, 37, 163}));
  connect(indicatedFractionalRate.y, rate.u2) annotation(Line(visible = true, origin = {-20.879, 57.667}, points = {{-21.758, 12.333}, {10.879, 12.333}, {10.879, -24.667}}, color = {1, 37, 163}));
  connect(parFractionalRate.y, ccRate.u) annotation(Line(visible = true, origin = {-103.25, 60}, points = {{-21.75, 10}, {-11.75, 10}, {-11.75, -10}, {45.25, -10}}, color = {1, 37, 163}));
  connect(ccRate.y, rate.u2) annotation(Line(visible = true, origin = {-20.667, 44.333}, points = {{-21.333, 5.667}, {10.667, 5.667}, {10.667, -11.333}}, color = {1, 37, 163}));
  connect(u, ccRate.u) annotation(Line(visible = true, origin = {-107, 45}, points = {{-38, -5}, {7, -5}, {7, 5}, {49, 5}}, color = {1, 37, 163}));
  connect(u, indicatedFractionalRate.u) annotation(Line(visible = true, origin = {-97.43, 55}, points = {{-47.57, -15}, {-2.57, -15}, {-2.57, 15}, {39.43, 15}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>ExponentialGrowth</em> will fill the connected stock from a source with infinite capacity at a rate that is determined at any time as the product of the current amount in the connected stock and the fractional rate given. The rate can either be given as a constant parameter&nbsp;<code>fractionalRate</code> or as a real input&nbsp;<strong>u</strong>, making it variable in time.</p>
<h4>Notes</h4>
<ul>
<li>By default it is assumed, that the rate given is a continously compounding rate (<code>isCCR = true</code>). If this is not case, the rate will be converted using the &rarr;<a href=\"modelica://BusinessSimulation.Converters.ForceOfInterest\">ForceOfInterest </a>converter.</li><br>
<li>The effective rate of growth (e.g the product of rate and amount in stock) must never be negative, as draining the connected stock is prohibited. Should the rate of inflow to the stock become negative, it will be set to zero.</li><br>
<li>Exponential growth processes have a <em>constant doubling time</em> which can be found by dividing log(2)&nbsp;&asymp; 0.69 by the continuously compounding fractional rate (or by log(1+rate) if the rate is not a continuously compounding rate).</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecline\">ExponentialDecline</a>, <a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecay\">Decay</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialChange\">ExponentialChange</a></p>
</html>", revisions = "<html>
<ul>
<li>Value for parameter set to <code>unspecified</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "EXP Growth", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {63.558, -10.273}, rotation = -5.306, points = {{32.722, 10.515}, {13.878, -30.192}, {-15.693, -37.076}, {-32.22, -15.961}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {36.663, -27.43}, {51.602, -8.364}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Text(visible = true, origin = {6.087, -78}, textColor = {0, 0, 128}, extent = {{-81.281, -12}, {81.281, 12}}, textString = "fractional rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Polygon(visible = true, origin = {31.134, -25.316}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {9.113, -25.409}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExponentialGrowth;
