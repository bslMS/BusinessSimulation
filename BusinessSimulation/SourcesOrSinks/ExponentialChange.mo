within BusinessSimulation.SourcesOrSinks;

model ExponentialChange "Exponential growth or decline of connected stock"
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.SourceOrSink;
  extends Interfaces.Basics.SingleInput;
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Dialog(group = "Structural Parameters"));
protected
  Cloud cloud annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Bidirectional.Switching changing annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor stockLevel "LEvel of connected stock" annotation(Placement(visible = true, transformation(origin = {105, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 changingRate annotation(Placement(visible = true, transformation(origin = {-5, 25}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.PassThrough indicatedFractionalRate if isCCR "Output is equal to input" annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ForceOfInterest ccRate if not isCCR "Continuously Compounding Rate" annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cloud.massPort, changing.portA) annotation(Line(visible = true, origin = {-25, 0}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(changing.portB, massPort) annotation(Line(visible = true, origin = {85, 0}, points = {{-75, 0}, {75, 0}}, color = {128, 0, 128}));
  connect(stockLevel.flowPort, massPort) annotation(Line(visible = true, origin = {123.333, 2.328}, points = {{-18.333, 7.672}, {-18.333, -2.328}, {25.001, -2.328}}, color = {128, 0, 128}));
  connect(stockLevel.stock, changingRate.u1) annotation(Line(visible = true, origin = {52.524, 33.5}, points = {{52.524, -12.5}, {52.524, 6.5}, {-52.524, 6.5}, {-52.524, -0.5}}, color = {1, 37, 163}));
  connect(changing.y, y1) annotation(Line(visible = true, origin = {56.667, 50.133}, points = {{-51.667, -39.733}, {-51.667, 19.867}, {103.333, 19.867}}, color = {1, 37, 163}));
  connect(changing.y, y) annotation(Line(visible = true, origin = {56.667, 23.467}, points = {{-51.667, -13.067}, {-51.667, 6.533}, {103.333, 6.533}}, color = {1, 37, 163}));
  connect(changing.y1, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  connect(changingRate.y, changing.u) annotation(Line(visible = true, origin = {-5, 13.819}, points = {{0, 3.819}, {0, -3.819}}, color = {1, 37, 163}));
  connect(u, ccRate.u) annotation(Line(visible = true, origin = {-124, 40}, points = {{-46, 0}, {46, 0}}, color = {1, 37, 163}));
  connect(ccRate.y, changingRate.u2) annotation(Line(visible = true, origin = {-27.333, 37.667}, points = {{-34.667, 2.333}, {17.333, 2.333}, {17.333, -4.667}}, color = {1, 37, 163}));
  connect(u, indicatedFractionalRate.u) annotation(Line(visible = true, origin = {-112, 55}, points = {{-58, -15}, {12, -15}, {12, 15}, {34, 15}}, color = {1, 37, 163}));
  connect(indicatedFractionalRate.y, changingRate.u2) annotation(Line(visible = true, origin = {-27.333, 57.667}, points = {{-34.667, 12.333}, {17.333, 12.333}, {17.333, -24.667}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>ExponentialChange</em>&nbsp;will fill (or drain) the connected stock from a source (or into a sink) with infinite capacity at a rate that is determined at any time as the product of the current amount in the connected stock and the fractional rate given by the real input <strong>u</strong>. By convention, a positive rate will fill the stock, while a negative rate will drain it.</p>
<h4>Notes</h4>
<ul>
<li>By default it is assumed, that the rate given is a continously compounding rate (<code>isCCR = true</code>). If this is not case, the rate will be converted using the &rarr;<a href=\"modelica://BusinessSimulation.Converters.ForceOfInterest\">ForceOfInterest </a>converter.</li><br>
<li>Care has to be taken in case an &rarr;<a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\">InformationLevel </a>with a negative level is connected to the ExponentialChange, as the sign of the effective rate is affected by this.</li>
</ul>
<ul>
<li>Exponential change processes have a <em>constant doubling time</em>&nbsp;(or a <em>constant half-life</em>) which can be found by dividing log(2)&nbsp;&asymp; 0.69 by the continuously compounding fractional rate (or by log(1+rate) if the rate is not a continuously compounding rate).</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialGrowth\">ExponentialGrowth</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecline\">ExponentialDecline</a>, <a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecay\">ExponentialDecay</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "EXP Change", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-5.081, -78.316}, textColor = {0, 0, 128}, extent = {{-76.882, -12}, {76.882, 12}}, textString = "fractional rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {63.558, -10.273}, rotation = -5.306, points = {{32.722, 10.515}, {13.878, -30.192}, {-7.496, -34.124}, {-24.956, -15.69}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-32.154, -19.63}, rotation = 5.306, points = {{27.907, -47.216}, {36.663, -27.43}, {51.602, -8.364}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {39.835, -26.283}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {19.113, -25.409}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ExponentialChange;
