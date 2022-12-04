within BusinessSimulation.Flows.Interaction;

model LotkaVolterra "The Lotka-Volterra equations to model predator-prey-dynamics"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.Interaction4SO;
  extends Icons.Interaction;
  InputConnector dataIn if not (hasConstantAlpha and hasConstantBeta and hasConstantGamma and hasConstantDelta) "Inputs for predator-prey model" annotation(Placement(visible = true, transformation(origin = {-145, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Rate alpha = unspecified "Fractional growth rate of prey population (A)" annotation(Dialog(enable = hasConstantAlpha));
  parameter Rate beta = unspecified "Fractional rate of decline for prey population (A) per predator" annotation(Dialog(enable = hasConstantBeta));
  parameter Rate gamma = unspecified "Fractional rate of decline for predator population (B)" annotation(Dialog(enable = hasConstantGamma));
  parameter Rate delta = unspecified "Fractional rate of growth for predator population (B) per prey" annotation(Dialog(enable = hasConstantDelta));
  parameter Boolean hasConstantAlpha = false "= true, if the constant parameter value is to be used instead of the input connector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantBeta = false "= true, if the constant parameter value is to be used instead of the input connector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantGamma = false "= true, if the constant parameter value is to be used instead of the input connector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantDelta = false "= true, if the constant parameter value is to be used instead of the input connector" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));

  encapsulated expandable connector InputConnector "DataBus for inputs"
    import ICON = BusinessSimulation.Icons.DataInPort;
    import BusinessSimulation.Units.*;
    extends ICON;
    Rate alpha "Fractional growth rate of prey population (A)";
    Rate beta "Fractional rate of decline for prey population (A) per predator";
    Rate delta "Fractional rate of growth for predator population (B) per prey";
    Rate gamma "Fractional rate of decline for predator population (B)";
    annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>alpha, beta, gamma, delta</p></html>"));
  end InputConnector;
protected
  ComplexInteraction complexInteraction annotation(Placement(visible = true, transformation(origin = {0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterRate zeroRate(value = 0) "Zero rate input" annotation(Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Gain fractionalGrowthRatePredator(c = -1) "Convert rate of delince to growth rate" annotation(Placement(visible = true, transformation(origin = {21.803, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -540)));
  Converters.Gain couplingFactorForPrey(c = -1) "Convert rate of delince to growth rate" annotation(Placement(visible = true, transformation(origin = {-45, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Converters.ConstantConverterRate parAlpha(value = alpha) if hasConstantAlpha "Constant alpha (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterRate parBeta(value = beta) if hasConstantBeta "Constant beta (optional)" annotation(Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterRate parGamma(value = gamma) if hasConstantGamma "Constant gamma (optional)" annotation(Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverterRate parDelta(value = delta) if hasConstantDelta "Constant delta (optional)" annotation(Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealOutput u_alpha if not hasConstantAlpha annotation(Placement(visible = true, transformation(origin = {-95, 55}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-50, 66.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_beta if not hasConstantBeta annotation(Placement(visible = true, transformation(origin = {-30, 55}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-50, 66.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_gamma if not hasConstantGamma annotation(Placement(visible = true, transformation(origin = {30, 55}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-50, 66.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_delta if not hasConstantDelta annotation(Placement(visible = true, transformation(origin = {90, 55}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-50, 66.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.DataBus dataBus annotation(Placement(visible = true, transformation(origin = {-80, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-43.333, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(not hasConstantAlpha or alpha < inf, "Parameter alpha needs to be specified");
  assert(not hasConstantBeta or beta < inf, "Parameter beta needs to be specified");
  assert(not hasConstantGamma or gamma < inf, "Parameter gamma needs to be specified");
  assert(not hasConstantDelta or delta < inf, "Parameter delta needs to be specified");
  connect(dataIn.alpha, u_alpha) annotation(Line(visible = true, origin = {-116.667, 63.333}, points = {{-28.333, 6.667}, {21.667, 6.667}, {21.667, -8.333}}, color = {0, 0, 128}));
  connect(dataIn.beta, u_beta) annotation(Line(visible = true, origin = {-73.333, 65}, points = {{-71.667, 5}, {43.333, 5}, {43.333, -10}}, color = {0, 0, 128}));
  connect(dataIn.gamma, u_gamma) annotation(Line(visible = true, origin = {-33.333, 65}, points = {{-111.667, 5}, {63.333, 5}, {63.333, -10}}, color = {0, 0, 128}));
  connect(dataIn.delta, u_delta) annotation(Line(visible = true, origin = {6.667, 65}, points = {{-151.667, 5}, {83.333, 5}, {83.333, -10}}, color = {0, 0, 128}));
  connect(portA, complexInteraction.portA) annotation(Line(visible = true, origin = {-37.698, -23.214}, points = {{-110.636, 23.214}, {27.698, 23.214}}, color = {128, 0, 128}));
  connect(complexInteraction.portB, portB) annotation(Line(visible = true, origin = {79.232, 0}, points = {{-69.232, 0}, {69.232, 0}}, color = {128, 0, 128}));
  connect(complexInteraction.y1_B, y1_B) annotation(Line(visible = true, origin = {82.625, -42.5}, points = {{-72.125, 37.5}, {-2.625, 37.5}, {-2.625, -37.5}, {77.375, -37.5}}, color = {1, 37, 163}));
  connect(complexInteraction.y1_B, y_B) annotation(Line(visible = true, origin = {82.625, -22.5}, points = {{-72.125, 17.5}, {-2.625, 17.5}, {-2.625, -17.5}, {77.375, -17.5}}, color = {1, 37, 163}));
  connect(complexInteraction.y_A, y_A) annotation(Line(visible = true, origin = {50, 56.8}, points = {{-55, -46.4}, {-55, 23.2}, {110, 23.2}}, color = {1, 37, 163}));
  connect(complexInteraction.y_A, y1_A) annotation(Line(visible = true, origin = {78, 50.08}, points = {{-83, -39.68}, {-83, 29.92}, {42, 29.92}, {42, -10.08}, {82, -10.08}}, color = {1, 37, 163}));
  connect(complexInteraction.dataIn, dataBus) annotation(Line(visible = true, origin = {-26.667, 13.333}, points = {{26.667, -3.333}, {26.667, 1.667}, {-53.333, 1.667}}, color = {0, 0, 128}));
  connect(u_beta, couplingFactorForPrey.u) annotation(Line(visible = true, origin = {-32.333, 38.333}, points = {{2.333, 16.667}, {2.333, -8.333}, {-4.667, -8.333}}, color = {1, 37, 163}));
  connect(parBeta.y, couplingFactorForPrey.u) annotation(Line(visible = true, origin = {-39.4, 35}, points = {{-10.6, 9}, {-10.6, 5}, {9.4, 5}, {9.4, -5}, {2.4, -5}}, color = {1, 37, 163}));
  connect(parGamma.y, fractionalGrowthRatePredator.u) annotation(Line(visible = true, origin = {25.961, 37}, points = {{-15.961, 7}, {-15.961, 3}, {14.039, 3}, {14.039, -7}, {3.842, -7}}, color = {1, 37, 163}));
  connect(u_gamma, fractionalGrowthRatePredator.u) annotation(Line(visible = true, origin = {33.961, 39}, points = {{-3.961, 16}, {-3.961, 1}, {6.039, 1}, {6.039, -9}, {-4.158, -9}}, color = {1, 37, 163}));
  // feeding the dataBus
  connect(u_alpha, dataBus.a_A) annotation(Line(visible = true, origin = {-90, 28.333}, points = {{-5, 26.667}, {-5, -13.333}, {10, -13.333}}, color = {1, 37, 163}));
  connect(parAlpha.y, dataBus.a_A) annotation(Line(visible = true, origin = {-100, 25}, points = {{-10, 20}, {-10, -10}, {20, -10}}, color = {1, 37, 163}));
  connect(couplingFactorForPrey.y, dataBus.a_AB) annotation(Line(visible = true, origin = {-68.25, 22.5}, points = {{15.25, 7.5}, {-1.75, 7.5}, {-1.75, -7.5}, {-11.75, -7.5}}, color = {1, 37, 163}));
  connect(fractionalGrowthRatePredator.y, dataBus.b_B) annotation(Line(visible = true, origin = {-26.549, 22.5}, points = {{40.352, 7.5}, {6.549, 7.5}, {6.549, -7.5}, {-53.451, -7.5}}, color = {1, 37, 163}));
  connect(parDelta.y, dataBus.b_AB) annotation(Line(visible = true, origin = {20, 25}, points = {{50, 20}, {50, -10}, {-100, -10}}, color = {1, 37, 163}));
  connect(u_delta, dataBus.b_AB) annotation(Line(visible = true, origin = {33.333, 28.333}, points = {{56.667, 26.667}, {56.667, -13.333}, {-113.333, -13.333}}, color = {1, 37, 163}));
  // setting parameters a_0,b_0,a_B,b_A to zero
  connect(zeroRate.y, dataBus.a_0) annotation(Line(visible = true, origin = {-88.333, -8.333}, points = {{-16.667, -11.667}, {8.333, -11.667}, {8.333, 23.333}}, color = {1, 37, 163}));
  connect(zeroRate.y, dataBus.a_B) annotation(Line(visible = true, origin = {-88.333, -8.333}, points = {{-16.667, -11.667}, {8.333, -11.667}, {8.333, 23.333}}, color = {1, 37, 163}));
  connect(zeroRate.y, dataBus.b_0) annotation(Line(visible = true, origin = {-88.333, -8.333}, points = {{-16.667, -11.667}, {8.333, -11.667}, {8.333, 23.333}}, color = {1, 37, 163}));
  connect(zeroRate.y, dataBus.b_A) annotation(Line(visible = true, origin = {-88.333, -8.333}, points = {{-16.667, -11.667}, {8.333, -11.667}, {8.333, 23.333}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>These are the classical Lotka-Volterra equations describing predator-prey-dynamics in an idealized way [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">17</a>]. The dynamics for the <strong>prey population</strong> (<code>portA</code>) and the <strong>predator population</strong> (<code>portB</code>) are given by the following equations:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/LotkaVolterra/Formula.svg\" alt=\"Formula.svg\"></p>
<p class=\"aside\">Note: Capital letters were chosen to represent the stocks (state variables) connected at <code>portA</code> and <code>portB</code> in the formula above. Also dot notation is used for a stock's rate of flow—its first derivative with respect to time.</p>
<table width = \"600\">
<tbody>
<tr>
<th>Coefficient</th>
<th>Unit</th>
<th>Description</th>
</tr>
<tr>
<td><code>alpha</code></td>
<td>1 per second</td>
<td>
<p>fractional growth rate for prey population</p>
</td>
</tr>
<tr>
<td><code>beta</code></td>
<td>1 per second per amount of B</td>
<td>
<p>fractional rate of decline for prey population per predator</p>
</td>
</tr>
<tr>
<td><code>gamma</code></td>
<td>1 per second</td>
<td>
<p>fractional rate of decline for predator population</p>
</td>
</tr>
<tr>
<td>
<p><code>delta</code></p>
</td>
<td>1 per second per amount of A</td>
<td>fractional rate of groth for predator population per prey</td>
</tr>
</tbody>
</table>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.ComplexInteraction\">ComplexInteraction</a></p>
</html>", revisions = "<html>
<ul>
<li><code>InputConnector</code> defined as <code>encapsulated expandable connector</code> in v2.1.0.</li><br>
<li>Values for optional parameters changed to <code>unspecified</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-35.498, 33.689}, textColor = {128, 128, 128}, extent = {{-34.502, -12}, {34.502, 12}}, textString = "Prey", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {17.887, -46.189}, textColor = {128, 128, 128}, extent = {{-44.005, -12}, {44.005, 12}}, textString = "Predator", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Lotka-Volterra", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-123.379, 7.594}, textColor = {192, 192, 192}, extent = {{-16.621, -9.24}, {16.621, 9.24}}, textString = "PREY", fontSize = 18, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {119.167, 7.28}, textColor = {192, 192, 192}, extent = {{-20.833, -9.24}, {20.833, 9.24}}, textString = "PREDATOR", fontSize = 18, horizontalAlignment = TextAlignment.Right), Text(visible = true, origin = {-90, -34.24}, textColor = {192, 192, 192}, extent = {{-40, -9.24}, {40, 9.24}}, textString = "a_0 = b_0 = a_B = b_A = 0", fontSize = 18, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {-90.879, 75}, textColor = {192, 192, 192}, extent = {{-24.121, -9.24}, {24.121, 9.24}}, textString = "a_A = alpha", fontSize = 18, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {-29.121, 75}, textColor = {192, 192, 192}, extent = {{-24.121, -9.24}, {24.121, 9.24}}, textString = "a_AB = - beta", fontSize = 18, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {29.121, 75}, textColor = {192, 192, 192}, extent = {{-24.121, -9.24}, {24.121, 9.24}}, textString = "b_B = - gamma", fontSize = 18, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {89.121, 75}, textColor = {192, 192, 192}, extent = {{-24.121, -9.24}, {24.121, 9.24}}, textString = "b_AB = delta", fontSize = 18, horizontalAlignment = TextAlignment.Left)}));
end LotkaVolterra;
