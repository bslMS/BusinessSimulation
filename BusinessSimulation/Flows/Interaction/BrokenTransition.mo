within BusinessSimulation.Flows.Interaction;

model BrokenTransition "The inflow to B is proportional to the outflow from A"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.Interaction4SO;
  extends Icons.Interaction;
  Interfaces.Connectors.RealInput u_rate if not hasConstantRate "Rate of outflow from A" annotation(Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealInput u_factor if not hasConstantFactor "Factor of proportionality (units B / units A)" annotation(Placement(visible = true, transformation(origin = {-20, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -450), iconTransformation(origin = {100, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  parameter OutputType_A rate(final min = 0) = unspecified "Constant rate of outflow for the stock A" annotation(Dialog(enable = hasConstantRate));
  parameter Real factor(final min = 0) = 1 "Constant factor of proportionality to be multiplied with the outflow from A [base units B/base units A]" annotation(Dialog(enable = hasConstantFactor and not useExplicitRatio));
  parameter OutputType_B outputB(final min = 0) = 1 "Constant output of B to specify the conversion factor as the ratio outputB : inputA" annotation(Dialog(enable = hasConstantFactor and useExplicitRatio));
  parameter OutputType_A inputA(final min = 0) = 1 "Constant input of A to specify the conversion factor as the ratio outputB : inputA" annotation(Dialog(enable = hasConstantFactor and useExplicitRatio));
  parameter Boolean hasConstantFactor = false "= true, if the factor is to be given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantRate = false "= true, if the outflow rate for A is to be given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean useExplicitRatio = false "= true, if instead of a constant factor a constant ratio of output per input is to be entered" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  parameter Real cr = if useExplicitRatio then outputB / inputA else 1. "Explicit conversion ratio to be used instead of a factor" annotation(Dialog(tab = "Initialization", enable = false));
  Converters.Gain conversionFactor(final c = cr) annotation(Placement(visible = true, transformation(origin = {10, 5}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  SourcesOrSinks.Decline flowingOut "Outflow for stock A" annotation(Placement(visible = true, transformation(origin = {-110, -0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.PassThrough u_OutflowRate_A if not hasConstantRate "Input of outflow rate" annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parOutflowRate_A(final value = rate) if hasConstantRate "Constant rate of outflow for A" annotation(Placement(visible = true, transformation(origin = {-95, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.Product_2 inflowRate_B "Rate of inflow to stock B" annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth flowingIn "Inflow to stock B" annotation(Placement(visible = true, transformation(origin = {90, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough u_FactorOfProportionality if not hasConstantFactor "Continuous input" annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Converters.ConstantConverter parFactorOfProportionality(final value = factor) if hasConstantFactor "Constant input" annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  assert(not hasConstantRate or rate < inf, "Parameter rate needs to be specified");
  assert(inputA > 0, "InputA has to be greater than zero to specify conversion ratio");
  connect(portA, flowingOut.massPort) annotation(Line(visible = true, origin = {-140, -0}, points = {{-20, 0}, {20, -0}}, color = {128, 0, 128}));
  connect(u_OutflowRate_A.y, flowingOut.u) annotation(Line(visible = true, origin = {-87.5, 37.716}, points = {{17.5, 14.921}, {17.5, -17.716}, {-17.5, -17.716}, {-17.5, -27.716}}, color = {1, 37, 163}));
  connect(parOutflowRate_A.y, flowingOut.u) annotation(Line(visible = true, origin = {-102.5, 38.104}, points = {{7.5, 16.896}, {7.5, -18.104}, {-2.5, -18.104}, {-2.5, -28.104}}, color = {1, 37, 163}));
  connect(flowingIn.massPort, portB) annotation(Line(visible = true, origin = {130, -0}, points = {{-30, -0}, {30, 0}}, color = {128, 0, 128}));
  connect(inflowRate_B.y, flowingIn.u) annotation(Line(visible = true, origin = {73.167, 8}, points = {{-25.167, -8}, {-13.167, -8}, {-13.167, 7}, {11.833, 7}, {11.833, 2}}, color = {1, 37, 163}));
  connect(flowingOut.y2, inflowRate_B.u2) annotation(Line(visible = true, origin = {-29.375, 10}, points = {{-70.125, -15}, {9.375, -15}, {9.375, -15}, {61.375, -15}}, color = {1, 37, 163}));
  connect(flowingOut.y, y1_A) annotation(Line(visible = true, origin = {-23.333, 30.133}, points = {{-91.667, -19.733}, {-91.667, 9.867}, {183.333, 9.867}}, color = {1, 37, 163}));
  connect(flowingOut.y, y_A) annotation(Line(visible = true, origin = {-23.333, 56.8}, points = {{-91.667, -46.4}, {-91.667, 23.2}, {183.333, 23.2}}, color = {1, 37, 163}));
  connect(flowingIn.y1, y_B) annotation(Line(visible = true, origin = {125.125, -22.5}, points = {{-24.625, 17.5}, {-5.125, 17.5}, {-5.125, -17.5}, {34.875, -17.5}}, color = {1, 37, 163}));
  connect(flowingIn.y1, y1_B) annotation(Line(visible = true, origin = {125.125, -42.5}, points = {{-24.625, 37.5}, {-5.125, 37.5}, {-5.125, -37.5}, {34.875, -37.5}}, color = {1, 37, 163}));
  connect(u_factor, u_FactorOfProportionality.u) annotation(Line(visible = true, origin = {-20, 79}, points = {{0, 11}, {0, -11}}, color = {1, 37, 163}));
  connect(u_rate, u_OutflowRate_A.u) annotation(Line(visible = true, origin = {-70, 79}, points = {{0, 11}, {0, -11}}, color = {1, 37, 163}));
  connect(conversionFactor.y, inflowRate_B.u1) annotation(Line(visible = true, origin = {25, 5}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(u_FactorOfProportionality.y, conversionFactor.u) annotation(Line(visible = true, origin = {-12.667, 20.667}, points = {{-7.333, 31.333}, {-7.333, -15.667}, {14.667, -15.667}}, color = {1, 37, 163}));
  connect(parFactorOfProportionality.y, conversionFactor.u) annotation(Line(visible = true, origin = {-26, 21.333}, points = {{-14, 32.667}, {-14, -16.333}, {28, -16.333}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This is the classical structure for a broken flow from stock A to stock B, where the rate of outflow is given for stock A. A's outflow will flow into a &rarr;<a href=\"modelica://BusinessSimulation.SourcesOrSinks.Cloud\">Cloud</a>&nbsp;and accordingly, there will be an inflow to stock B which is given by:</p>
<p><em>rate of inflow to B = rate of outflow from A&nbsp;&times; factor of proportionality</em></p>
<p>Here the factor of proportionality will be given in units <em>base units of B per base units of A</em>, so that the resulting inflow to B will have proper units [base units for a flow of B].</p>
<h4>Implementation</h4>
<br>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Diagram for BrokenTransition</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/BrokenTransition/Diagram.png\" alt=\"Diagram.png\" width=\"500\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>Jim Hines [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>, p. 16] notes, that \"<em>in an aggregated model of a supply chain there will be a change of units and a conceptual break in the transition from raw materials inventory to work in progress.</em>\"</li><br>
<li>The choice of <code>OutputType_A</code> will set the type for parameter <code>rate</code>.</li><br>
<li>Great care has to be taken entering the <code>factor</code> as it needs to be given in base units of stock B per base units of stock A. If the <code>unit</code> attribute is left an empty string (default), then fitting units will automatically be deduced effectively short-circuiting unit checks.</li><br>
<li>To more robustly specify conversion factors, upon <code>useExplicitRatio = true</code> a constant ratio <code>outputB</code> per <code>inputA</code> can alternatively be given, where <code>outputB</code> and <code>inputA</code> will have units according to <code>OutputType_B</code> and <code>OutputType_A</code>, respectively.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.BrokenTransitionPull\">BrokenTransitionPull</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Transition\">Transition</a></p>
</html>", revisions = "<html>
<ul>
<li>Value for the optional parameter <code>rate</code> changed to <code>unspecified</code> in v2.1.0.</li><br>
<li>Component type for <code>parOutflowRate</code> changed to <code>ConstantConverter</code> and type for <code>factor</code> changed to <code>Real</code> in v2.2.</li><br>
<li>Added <code>useExplicitRatio</code> option for more convenience in unit conversions in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-15.783, -54.866}, textColor = {0, 0, 128}, extent = {{-34.217, -12}, {34.217, 12}}, textString = "factor", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {33.142, 17.162}, rotation = 5.35, points = {{-56.426, 30.508}, {-66.107, 22.749}, {-75.3, 9.902}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Text(visible = true, origin = {-2.331, 50}, textColor = {0, 0, 128}, extent = {{-20, -12}, {20, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Broken Transition", fontName = "Lato", textStyle = {TextStyle.Bold}), Polygon(visible = true, origin = {-41.165, 23.17}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, -9}, {-5, 5}, {5, 5}}), Line(visible = true, origin = {-45.895, -19.209}, rotation = 5.35, points = {{56.426, -30.508}, {66.107, -22.749}, {75.3, -9.902}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {28.979, -23.17}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BrokenTransition;
