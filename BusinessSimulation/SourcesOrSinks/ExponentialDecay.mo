within BusinessSimulation.SourcesOrSinks;

model ExponentialDecay "A stock is drained at a rate proportional to its content"
  import BusinessSimulation.Units.*;
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.Sink;
  Interfaces.Connectors.RealInput u if not hasConstantResidenceTime "Residence time input" annotation(Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Boolean hasConstantResidenceTime = false "= true, if the constant residence time is used instead of the real input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Time residenceTime(min = 0) = 1 "Constant time of average residence (optional) (decaying.residenceTime)" annotation(Dialog(enable = hasConstantResidenceTime));
protected
  Converters.ConstantConverterTime parResidenceTime(value = residenceTime) if hasConstantResidenceTime "Constant residence time (optional)" annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.Decay decaying(hasConstantResidenceTime = false, residenceTime = residenceTime) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 540)));
  Cloud drainedMaterial "System boundary - the stock will be assumed to have infinite capacity" annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massPort, decaying.portA) annotation(Line(visible = true, origin = {85, 0}, points = {{75, 0}, {-75, 0}}, color = {128, 0, 128}));
  connect(decaying.portB, drainedMaterial.massPort) annotation(Line(visible = true, origin = {-25, 0}, points = {{15, 0}, {-15, 0}}, color = {128, 0, 128}));
  connect(u, decaying.u) annotation(Line(visible = true, origin = {-43.333, 43.333}, points = {{-96.667, 16.667}, {48.333, 16.667}, {48.333, -33.333}}, color = {1, 37, 163}));
  connect(decaying.y, y1) annotation(Line(visible = true, origin = {50, 50.133}, points = {{-55, -39.733}, {-55, 19.867}, {110, 19.867}}, color = {1, 37, 163}));
  connect(decaying.y, y) annotation(Line(visible = true, origin = {50, 23.467}, points = {{-55, -13.067}, {-55, 6.533}, {110, 6.533}}, color = {1, 37, 163}));
  connect(decaying.y2, y2) annotation(Line(visible = true, origin = {52.625, -27.5}, points = {{-42.125, 22.5}, {-32.625, 22.5}, {-32.625, -22.5}, {107.375, -22.5}}, color = {1, 37, 163}));
  connect(parResidenceTime.y, decaying.u) annotation(Line(visible = true, origin = {-35, 30}, points = {{-80, 10}, {40, 10}, {40, -20}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>ExponentialDecay</em>&nbsp;is identical to&nbsp;&rarr;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecline\">ExponentialDecline</a>, e.g., the connected stock is drained at a rate proportional to its content into a sink with infinite capacity outside the border of the system in focus. Instead of using a fractional rate <em>&lambda;</em>&nbsp;to describe the process, we are using the mean <em>residence time&nbsp;&tau;</em> (aka mean <em>lifetime </em>or the exponential <em>time constant</em>) to parameterize the process:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/SourcesOrSinks/ExponentialDecay/FormulaResidenceTime.svg\" alt=\"tau = 1/lambda\"></p>
<p>The mean residence time can be given either as a constant parameter (residenceTime) or as a continuous time input <strong>u</strong>.</p>
<p>The effective rate of decay with respect to a connected stock <em>x</em> at any time will be given by</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/SourcesOrSinks/ExponentialDecay/FormulaRate.svg\" alt=\"dx/dt = -x/tau\"></p>
<h4>Notes</h4>
<ul>
<li>The effective rate of decay (e.g the product of the rate and amount in stock) must never be negative, as filling the connected stock is prohibited. Should the rate of outflow from&nbsp;the stock become negative, it will be set to zero.</li>
</ul>
<ul>
<li>In case of a constant residence time&nbsp;<em>&tau; </em>there will be 1/e&nbsp;&asymp; 37% of the initial amount in the connected stock left after the residence time has elapsed.<em><br><br></em></li>
<li>Often the half-life of an exponential decay process is of interest, whith can be obtained by<br><br><img src=\"modelica://BusinessSimulation/Resources/Images/SourcesOrSinks/ExponentialDecay/FormulaHalfLife.svg\" alt=\"t_1/2 = log(2) tau\"></li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialDecline\">ExponentialDecline</a>, <a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Decay\">Decay</a>,&nbsp;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialChange\">ExponentialChange</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "EXP Decay", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -75.728}, textColor = {0, 0, 128}, extent = {{-75.716, -11.684}, {75.716, 11.684}}, textString = "residence time", fontSize = 60, fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {63.558, -10.273}, rotation = -5.306, points = {{32.722, 10.515}, {27.406, -27.31}, {3.18, -33.132}, {-12.083, -16.513}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-22.154, -19.63}, rotation = 5.306, points = {{26.276, -45.045}, {36.663, -27.43}, {51.602, -8.364}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {51.134, -25.316}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {29.113, -25.409}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}));
end ExponentialDecay;
