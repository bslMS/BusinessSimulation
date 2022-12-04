within BusinessSimulation.Flows.Interaction;

model BrokenTransitionPull "The outflow from A is proportional to the inflow to B"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.Interaction4SO;
  extends Icons.Interaction;
  Interfaces.Connectors.RealInput u_rate if not hasConstantRate "Rate of inflow to B" annotation(Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealInput u_factor if not hasConstantFactor "Factor of proportionality (amount of A per amount of B)" annotation(Placement(visible = true, transformation(origin = {-20, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -450), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Rate rate(min = 0) = unspecified "Constant rate of inflow to the stock B" annotation(Dialog(enable = hasConstantRate));
  parameter Amount factor = 1 "Constant factor of proportionality to be multiplied with the outflow from A (default = 1 each [per 1 each])" annotation(Dialog(enable = hasConstantFactor));
  parameter Boolean hasConstantFactor = false "= true, if the factor is to be given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantRate = false "= true, if the outflow rate for A is to be given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  SourcesOrSinks.Decline flowingOut "Outflow for stock A" annotation(Placement(visible = true, transformation(origin = {-110, -0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.PassThrough u_InflowRate_B if not hasConstantRate "Input of inflow rate for B" annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterRate parInflowRate_B(final value = rate) if hasConstantRate "Constant rate of inflow to B" annotation(Placement(visible = true, transformation(origin = {-95, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.Product_2 outflowRate_A "Rate of outflow from stock A" annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth flowingIn "Inflow to stock B" annotation(Placement(visible = true, transformation(origin = {90, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough u_Factor if not hasConstantFactor "Input for factor of proportionality" annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parFactor(final value = factor) if hasConstantFactor "Constant factor of proportionality" annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  assert(not hasConstantRate or rate < inf, "Parameter rate needs to be specified");
  connect(portA, flowingOut.massPort) annotation(Line(visible = true, origin = {-140, -0}, points = {{-20, 0}, {20, -0}}, color = {128, 0, 128}));
  connect(flowingIn.massPort, portB) annotation(Line(visible = true, origin = {130, -0}, points = {{-30, -0}, {30, 0}}, color = {128, 0, 128}));
  connect(flowingOut.y, y1_A) annotation(Line(visible = true, origin = {-23.333, 30.133}, points = {{-91.667, -19.733}, {-91.667, 9.867}, {183.333, 9.867}}, color = {1, 37, 163}));
  connect(flowingOut.y, y_A) annotation(Line(visible = true, origin = {-23.333, 56.8}, points = {{-91.667, -46.4}, {-91.667, 23.2}, {183.333, 23.2}}, color = {1, 37, 163}));
  connect(u_Factor.y, outflowRate_A.u1) annotation(Line(visible = true, origin = {-27.333, 34}, points = {{7.333, 18}, {7.333, -9}, {-14.667, -9}}, color = {1, 37, 163}));
  connect(flowingIn.y1, y_B) annotation(Line(visible = true, origin = {125.125, -22.5}, points = {{-24.625, 17.5}, {-5.125, 17.5}, {-5.125, -17.5}, {34.875, -17.5}}, color = {1, 37, 163}));
  connect(flowingIn.y1, y1_B) annotation(Line(visible = true, origin = {125.125, -42.5}, points = {{-24.625, 37.5}, {-5.125, 37.5}, {-5.125, -37.5}, {34.875, -37.5}}, color = {1, 37, 163}));
  connect(parFactor.y, outflowRate_A.u1) annotation(Line(visible = true, origin = {-14, 34.667}, points = {{14, 19.333}, {14, -9.667}, {-28, -9.667}}, color = {1, 37, 163}));
  connect(u_factor, u_Factor.u) annotation(Line(visible = true, origin = {-20, 79}, points = {{0, 11}, {0, -11}}, color = {1, 37, 163}));
  connect(u_rate, u_InflowRate_B.u) annotation(Line(visible = true, origin = {-70, 79}, points = {{0, 11}, {0, -11}}, color = {1, 37, 163}));
  connect(parInflowRate_B.y, flowingIn.u) annotation(Line(visible = true, origin = {-5, 31.25}, points = {{-90, 23.75}, {-90, -1.25}, {90, -1.25}, {90, -21.25}}, color = {1, 37, 163}));
  connect(u_InflowRate_B.y, flowingIn.u) annotation(Line(visible = true, origin = {7.5, 30.5}, points = {{-77.5, 21.5}, {-77.5, -0.5}, {77.5, -0.5}, {77.5, -20.5}}, color = {1, 37, 163}));
  connect(flowingIn.y2, outflowRate_A.u2) annotation(Line(visible = true, origin = {9.375, 5}, points = {{70.125, -10}, {-9.375, -10}, {-9.375, 10}, {-51.375, 10}}, color = {1, 37, 163}));
  connect(outflowRate_A.y, flowingOut.u) annotation(Line(visible = true, origin = {-89.333, 16.667}, points = {{31.333, 3.333}, {-15.667, 3.333}, {-15.667, -6.667}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is a variant of the classical broken flow (&rarr;BrokenTransition) structure that allows for a different parameterization:&nbsp; In this component the given value for the rate (<code>rate</code> or <code>u_rate</code>) relates to the rate of inflow to stock B, while the factor of proportionality (<code>factor</code> or <code>u_factor</code>) determines the outflow from stock A that is necessary for this process.</p>
<p>A typical application would be to have a given rate of production (here the stock B would be the stock of finished goods) which needs and outflow from the stock of materials that is proprotional to the rate of production according to a factor determined by the bill of materials.</p>
<p>Hence:</p>
<p><em>rate of outflow from A = rate of inflow to B &times; factor of proportionality</em></p>
<p>The factor of proportionality will be given as amount of A per amount of B, so that the resulting outflow from A will have proper units[amnount of B per second].&nbsp;</p>
<h4>Implementation</h4>
<br>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Diagram for BrokenTransitionPull</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/BrokenTransitionPull/Diagram.png\" alt=\"Diagram.png\" width=\"500\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<p>Unlike the classical broken flow structure, setting the rate for the stock B might not take into account the availability of material in the stock A; so this has to be taken care of by the modeler explicitly.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.BrokenTransition\">BrokenTransition</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Transition\">Transition</a></p>
</html>", revisions = "<html>
<ul>
<li>Value for the optional parameter <code>rate</code> changed to <code>unspecified</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.924, -54.714}, textColor = {0, 0, 128}, extent = {{-19.048, -12}, {19.048, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {42.118, 50}, textColor = {0, 0, 128}, extent = {{-65, -12}, {65, 12}}, textString = "factor", fontName = "Lato", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Broken Transition", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {33.142, 17.162}, rotation = 5.35, points = {{-56.426, 30.508}, {-66.107, 22.749}, {-75.3, 9.902}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-45.895, -19.209}, rotation = 5.35, points = {{56.426, -30.508}, {66.107, -22.749}, {75.3, -9.902}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {-41.165, 23.17}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, -9}, {-5, 5}, {5, 5}}), Polygon(visible = true, origin = {28.979, -23.17}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BrokenTransitionPull;
