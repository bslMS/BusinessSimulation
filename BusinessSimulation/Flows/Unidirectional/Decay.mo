within BusinessSimulation.Flows.Unidirectional;

model Decay "Draining a stock with a given average residence time"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Icons.UnidirectionalFlow;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.ThreeSO_rate;
  Interfaces.Connectors.RealInput u if not hasConstantResidenceTime "Residence time input" annotation(Placement(visible = true, transformation(origin = {-107.149, 43.598}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Time residenceTime(min = 0) = unspecified "Constant time of average residence (optional)" annotation(Dialog(enable = hasConstantResidenceTime));
  parameter Boolean hasConstantResidenceTime = false " = true, if the parameter residenceTime will be used instead of the continuous input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Sensors.FlowPortSensor levelA "Report the amount in the connected stock (Port A)" annotation(Placement(visible = true, transformation(origin = {-125, 13.459}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parDelayTime(value = residenceTime) if hasConstantResidenceTime "Constant delay time (optional)" annotation(Placement(visible = true, transformation(origin = {-102.149, 26.402}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ClipProcessTime clippedResidenceTime "Residence time may not be smaller than dt" annotation(Placement(visible = true, transformation(origin = {-57.149, 43.598}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Division indicatedRate(redeclare replaceable type OutputType = Rate) annotation(Placement(visible = true, transformation(origin = {-20, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transition draining "Flow from stock A to stock B" annotation(Placement(visible = true, transformation(origin = {-0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(not hasConstantResidenceTime or residenceTime < inf, "Parameter residenceTime needs to be specified");
  connect(portA, levelA.flowPort) annotation(Line(visible = true, origin = {-133.215, 6.557}, points = {{-26.785, -6.557}, {8.215, -6.557}, {8.215, 6.902}, {8.215, 6.902}}, color = {128, 0, 128}));
  connect(u, clippedResidenceTime.u) annotation(Line(visible = true, origin = {-86.149, 43.598}, points = {{-21, 0}, {21, 0}}, color = {1, 37, 163}));
  connect(parDelayTime.y, clippedResidenceTime.u) annotation(Line(visible = true, origin = {-83.899, 35}, points = {{-12.25, -8.598}, {-3.25, -8.598}, {-3.25, 8.598}, {18.75, 8.598}}, color = {1, 37, 163}));
  connect(clippedResidenceTime.y, indicatedRate.u2) annotation(Line(visible = true, origin = {-40.362, 51.799}, points = {{-8.787, -8.201}, {-1.787, -8.201}, {-1.787, 8.201}, {12.362, 8.201}}, color = {1, 37, 163}));
  connect(levelA.stock, indicatedRate.u1) annotation(Line(visible = true, origin = {-92.634, 54.82}, points = {{-32.317, -30.361}, {-32.317, 15.18}, {64.634, 15.18}}, color = {1, 37, 163}));
  connect(indicatedRate.y, draining.u) annotation(Line(visible = true, origin = {-7.333, 46.667}, points = {{-4.667, 18.333}, {2.333, 18.333}, {2.333, -36.667}}, color = {1, 37, 163}));
  connect(portA, draining.portA) annotation(Line(visible = true, origin = {-93.97, 18.598}, points = {{-54.364, -18.598}, {83.97, -18.598}}, color = {128, 0, 128}));
  connect(draining.portB, portB) annotation(Line(visible = true, origin = {79.232, 0}, points = {{-69.232, -0}, {69.232, 0}}, color = {128, 0, 128}));
  connect(draining.y, y1) annotation(Line(visible = true, origin = {56.667, 50.133}, points = {{-51.667, -39.733}, {-51.667, 19.867}, {103.333, 19.867}}, color = {1, 37, 163}));
  connect(draining.y, y) annotation(Line(visible = true, origin = {56.667, 23.467}, points = {{-51.667, -13.067}, {-51.667, 6.533}, {103.333, 6.533}}, color = {1, 37, 163}));
  connect(draining.y1, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The stock connected to port A (stockA) will be gradually drained at a rate determined by the<em> average time of residence </em>(<code>residenceTime</code>)&nbsp;in the stock. The rate which drains the stock (<code>draining</code>) is given by:</p>
<p><code>draining = stockA.y / residenceTime</code></p>
<h4>Implementation</h4>
<p>The residence time is clipped to never be smaller than the global parameter <code>dt</code>.</p>
<h4>Notes</h4>
<p>The process of decay is essentially <em>exponential decline</em>, since the outflow is a fraction of the stock. The rate of decay thus also exponentially declines towards zero if there is no inflow to the stock, that is connected to port A.</p>
<p>If there is no inflow to the stock the level of the stock will be less than<em>&nbsp;&alpha; x InitialLevel</em> (0 &lt; &alpha; &lt;1) after a time span of&nbsp;<em>- ln(&alpha;) &times;&nbsp;residenceTime.</em></p>
<p>So we can note the following multiples for the <code>residenceTime</code> to calculate the time it takes to drain the stock A to &alpha; [%] of its initial level:</p>
<table style=\"height: 185px;\" width=\"453\">
<tbody>
<tr>
<td style=\"text-align: center;\"><strong>&alpha; [%]</strong></td>
<td style=\"text-align: center;\"><strong>Time to drain as multiple of the <code>residenceTime</code></strong></td>
</tr>
<tr>
<td style=\"text-align: center;\">50</td>
<td style=\"text-align: center;\">
<p>0.69 &sdot;&nbsp;<code>residenceTime</code></p>
</td>
</tr>
<tr>
<td style=\"text-align: center;\">1/e&nbsp;&asymp; 37</td>
<td style=\"text-align: center;\">
<p>1.0 &sdot;&nbsp;<code>residenceTime</code></p>
</td>
</tr>
<tr>
<td style=\"text-align: center;\">10</td>
<td style=\"text-align: center;\">
<p>2.3 &sdot;&nbsp;<code>residenceTime</code></p>
</td>
</tr>
<tr>
<td style=\"text-align: center;\">5</td>
<td style=\"text-align: center;\">
<p>3.0 &sdot;&nbsp;<code>residenceTime</code></p>
</td>
</tr>
<tr>
<td style=\"text-align: center;\">1</td>
<td style=\"text-align: center;\">
<p>4.6 &sdot;&nbsp;<code>residenceTime</code></p>
</td>
</tr>
<tr>
<td style=\"text-align: center;\">0.1 = 1&nbsp;&permil;</td>
<td style=\"text-align: center;\">
<p>6.9 &sdot;&nbsp;<code>residenceTime</code></p>
</td>
</tr>
</tbody>
</table>
<p>The time span it takes to drain the stock by half is called its <em>half life</em>. As can be seen from the equation and table above it is about <code>ln(<em>2</em>)<em> &sdot;</em>&nbsp;residenceTime</code>&nbsp;&asymp; 69% of the (average) residence time.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Unidirectional.ProportionalTransition\">ProportionalTransition</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecay\">ExponentialDecay</a></p>
</html>", revisions = "<html>
<ul>
<li>Value for parameter set to <code>unspecified</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-1.392, -78.316}, textColor = {0, 0, 128}, extent = {{-81.392, -12}, {81.392, 12}}, textString = "residence time", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Decay", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-60.264, -14.352}, rotation = 5.306, points = {{-32.722, 10.515}, {-16.1, -26.782}, {20.02, -35.205}, {44.243, -12.981}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {4, -26.505}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {-15.474, -23.17}, rotation = -35, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Decay;
