within BusinessSimulation.Flows.Unidirectional;

model ProportionalTransition "Rate of transition is proportional to the amount in stock A"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Icons.UnidirectionalFlow;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.ThreeSO_rate;
  Interfaces.Connectors.RealInput u if not hasConstantRate "Fractional rate input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Rate fractionalRate(min = 0) = unspecified "Constant fractional rate of transition (optional)" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean hasConstantRate = false "= true, if the parameter fractionalRate is to be used instead of the continuous input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Transition flowing "Flow from A to B" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor stockLevelA "Report the amount in the connected stock (Port A)" annotation(Placement(visible = true, transformation(origin = {-125, 13.459}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 netRate "Rate of flow" annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterRate parConstantRate(value = fractionalRate) if hasConstantRate "Constant fractional rate of flow (optional)" annotation(Placement(visible = true, transformation(origin = {-140, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(not hasConstantRate or fractionalRate < inf, "Parameter rate needs to be specified");
  connect(portA, flowing.portA) annotation(Line(visible = true, origin = {-85, 0}, points = {{-75, 0}, {75, 0}}, color = {128, 0, 128}));
  connect(flowing.portB, portB) annotation(Line(visible = true, origin = {79.232, 0}, points = {{-69.232, -0}, {69.232, 0}}, color = {128, 0, 128}));
  connect(flowing.y, y) annotation(Line(visible = true, origin = {56.667, 23.467}, points = {{-51.667, -13.067}, {-51.667, 6.533}, {103.333, 6.533}}, color = {1, 37, 163}));
  connect(flowing.y, y1) annotation(Line(visible = true, origin = {56.667, 50.133}, points = {{-51.667, -39.733}, {-51.667, 19.867}, {103.333, 19.867}}, color = {1, 37, 163}));
  connect(flowing.y1, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  connect(portA, stockLevelA.flowPort) annotation(Line(visible = true, origin = {-133.215, 6.557}, points = {{-15.119, -6.557}, {8.215, -6.557}, {8.215, 6.902}, {8.215, 6.902}}, color = {128, 0, 128}));
  connect(stockLevelA.stock, netRate.u2) annotation(Line(visible = true, origin = {-105.967, 31.486}, points = {{-18.984, -7.027}, {-18.984, 3.514}, {37.967, 3.514}}, color = {1, 37, 163}));
  connect(parConstantRate.y, netRate.u1) annotation(Line(visible = true, origin = {-101.5, 45}, points = {{-33.5, 0}, {33.5, 0}}, color = {1, 37, 163}));
  connect(u, netRate.u1) annotation(Line(visible = true, origin = {-92, 52.5}, points = {{-53, 7.5}, {12, 7.5}, {12, -7.5}, {24, -7.5}}, color = {1, 37, 163}));
  connect(netRate.y, flowing.u) annotation(Line(visible = true, origin = {-20.667, 30}, points = {{-31.333, 10}, {15.667, 10}, {15.667, -20}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The rate of transition from stock A to stock B will be <em>propotional</em> to the amount in stock A:</p><p><code>rate = fractionalRate &sdot; stockA.y</code></p><h4>Notes</h4><p>Since this is a <em>unidirectional</em> flow, the rate of flow will automatically be set to zero (causing an event), if the given rate of transition is a negative value.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Decay\">Decay</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Bidirectional.ProportionalSwitching\">ProportionalSwitching</a></p>
</html>", revisions = "<html>
<ul>
<li>Value for parameter set to <code>unspecified</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-60.264, -14.352}, rotation = 5.306, points = {{-32.722, 10.515}, {-16.1, -26.782}, {20.02, -35.205}, {44.243, -12.981}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Text(visible = true, origin = {0, -76.311}, textColor = {0, 0, 128}, extent = {{-71.477, -12}, {71.477, 12}}, textString = "fractional rate", fontSize = 60, fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Proportional Flow", fontName = "Lato", textStyle = {TextStyle.Bold}), Polygon(visible = true, origin = {4, -26.505}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {-15.474, -23.17}, rotation = -35, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ProportionalTransition;
