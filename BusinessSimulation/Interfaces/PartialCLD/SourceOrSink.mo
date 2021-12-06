within BusinessSimulation.Interfaces.PartialCLD;

encapsulated partial model SourceOrSink "Partial source or sink for causal loop diagramming"
  import BusinessSimulation.Interfaces.PartialCLD.FlowPort;
  import BusinessSimulation.Units.{Time,Rate};
  import BusinessSimulation.ModelSettings;
  import BusinessSimulation.Constants.inf;
  import BusinessSimulation.Interfaces.Connectors.RealInput;
  import BusinessSimulation.InformationSources.{PulseInput,RampInput};
  import BusinessSimulation.Converters.{Product_3,ConstantConverterRate,ConstantConverter};
  extends FlowPort;
  RealInput u if hasFactor "Factor input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  RealInput u_rate if not hasConstantRate "Rate input" annotation(Placement(visible = true, transformation(origin = {-145, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Rate rate "Constant rate (optional)";
  parameter TimingChoices tc = TimingChoices.permanent "Selecting an optional timing regime for the change process" annotation(Evaluate = true, Dialog(group = "Timing"));
  parameter Time startTime = modelSettings.modelStartTime "Start time for the change process" annotation(Dialog(group = "Timing", enable = tc <> TimingChoices.permanent));
  parameter Time stopTime = modelSettings.modelStopTime "Stop time for the change process" annotation(Dialog(group = "Timing", enable = tc <> TimingChoices.permanent));
  parameter Boolean hasConstantRate = true "= true, if rate is a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasFactor = false "= true, if rate is to be multiplied with input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
  type TimingChoices = enumeration(permanent "Permanent process", period "On-off timing");
protected
  ConstantConverter parFactor(value = 1) if not hasFactor annotation(Placement(visible = true, transformation(origin = {-40, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PulseInput onOff(width = 100, nperiod = 1, startTime = startTime, period = stopTime - startTime, offset = 0, amplitude = 1) if tc == TimingChoices.period annotation(Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Product_3 actualRate annotation(Placement(visible = true, transformation(origin = {-40, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverterRate parRate(value = rate, timeBaseString = "second") if hasConstantRate annotation(Placement(visible = true, transformation(origin = {-100, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter permanent(value = 1) if tc == TimingChoices.permanent annotation(Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(parRate.y, actualRate.u2) annotation(Line(visible = true, origin = {-70, 20}, points = {{-24, -5}, {0, -5}, {0, 5}, {22, 5}}, color = {1, 37, 163}));
  connect(u_rate, actualRate.u2) annotation(Line(visible = true, origin = {-83.25, 25}, points = {{-61.75, 5}, {13.25, 5}, {13.25, 0}, {35.25, 0}}, color = {0, 0, 128}));
  connect(u, actualRate.u1) annotation(Line(visible = true, origin = {-78.25, 45}, points = {{-66.75, 15}, {18.25, 15}, {18.25, -15}, {30.25, -15}}, color = {0, 0, 128}));
  connect(onOff.y, actualRate.u3) annotation(Line(visible = true, origin = {-69.56, 5}, points = {{-12.44, -25}, {9.56, -25}, {9.56, 15}, {21.56, 15}}, color = {1, 37, 163}));
  connect(parFactor.y, actualRate.u1) annotation(Line(visible = true, origin = {-53.5, 40}, points = {{7.5, 10}, {-6.5, 10}, {-6.5, -10}, {5.5, -10}}, color = {1, 37, 163}));
  connect(permanent.y, actualRate.u3) annotation(Line(visible = true, origin = {-63, -25}, points = {{-21, -15}, {3, -15}, {3, 45}, {15, 45}}, color = {1, 37, 163}));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial class extending →<a href=\"modelica://BusinessSimulation.Interfaces.PartialCLD.FlowPort\"><code>FlowPort</code></a> to build processes of growth or decline at the system's border.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Interfaces/PartialCLD/SourceOrSink/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-50.032, -30}, textColor = {0, 0, 128}, extent = {{-55.032, -6}, {55.032, 6}}, textString = "%rate", fontName = "Lato"), Polygon(visible = true, origin = {-67.72, 0}, rotation = 90, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{10, -7.744}, {-10, -7.744}, {0, 1.28}}), Line(visible = true, origin = {-38.752, 0}, points = {{-26.248, 0}, {3.752, 0}, {22.496, 0}}, color = {0, 128, 0}, thickness = 1), Polygon(visible = true, origin = {-12.28, 0}, rotation = -90, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-10, -7.744}, {10, -7.744}, {0, 1.28}}), Line(visible = true, origin = {-99.639, -1.132}, points = {{-19.013, -1.251}, {-19.013, 5.61}, {-13.146, 10.097}, {-4.518, 6.3}, {3.107, -1.637}, {9.976, -6.855}, {16.533, -6.855}, {19.639, -3.018}, {19.639, 4.92}, {13.107, 11.132}, {6.525, 8.716}, {3.107, 3.145}, {-4.173, -6.855}, {-14.872, -8.539}, {-19.013, -1.251}, {-19.013, -1.251}}, color = {255, 0, 0}, thickness = 3, smooth = Smooth.Bezier)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SourceOrSink;
