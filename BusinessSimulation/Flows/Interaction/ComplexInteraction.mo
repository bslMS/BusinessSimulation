within BusinessSimulation.Flows.Interaction;

model ComplexInteraction "Combined linear and nonlinear interaction"
  import BusinessSimulation.Units.*;
  extends Icons.Interaction;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.Interaction4SO;
  InputConnector dataIn "Expandable connector for continuous input" annotation(Placement(visible = true, transformation(origin = {-150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  encapsulated expandable connector InputConnector "Data bus for inputs"
    import ICON = BusinessSimulation.Icons.DataInPort;
    import BusinessSimulation.Units.*;
    extends ICON;
    // coefficients for net flow equations A
    Rate a_0 "Growth rate for A (independent)";
    Rate a_A "Fractional rate of growth for A (self-coupling A)";
    Rate a_B "Rate of growth for A per unit of B (coupling of B to A)";
    Rate a_AB "Fractional rate of growth for A per unit of B (nonlinear coupling)";
    // coefficients for net flow equation B
    Rate b_0 "Growth rate for B (independent)";
    Rate b_B "Fractional growth rate for B (self-coupling)";
    Rate b_A "Rate of growth for B per unit of A (coupling of A to B)";
    Rate b_AB "Fractional growth rate for B per unit of A (nonlinear coupling)";
  end InputConnector;
protected
  LinearInteraction linearInteraction "Linear interaction between A and B" annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  NonlinearInteraction nonlinearInteraction "Nonlinear interaction between A and B" annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.Add_2 netRate_B annotation(Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Add_2 netRate_A annotation(Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput a_0 "Growth rate for A (independent)" annotation(Placement(visible = true, transformation(origin = {-120, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput a_A "Fractional rate of growth for A (self-coupling A)" annotation(Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput a_B "Rate of growth for A per unit of B (coupling of B to A)" annotation(Placement(visible = true, transformation(origin = {-120, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput a_AB "Fractional rate of growth for A per unit of B (nonlinear coupling)" annotation(Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput b_0 "Growth rate for B (independent)" annotation(Placement(visible = true, transformation(origin = {-120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput b_B "Fractional growth rate for B (self-coupling)" annotation(Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput b_A "Rate of growth for B per unit of A (coupling of A to B)" annotation(Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput b_AB "Fractional growth rate for B per unit of A (nonlinear coupling)" annotation(Placement(visible = true, transformation(origin = {-120, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-80.808, 87.354}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.DataBus dataBus annotation(Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60.606, 49.959}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(portA, linearInteraction.portA) annotation(Line(visible = true, origin = {-62.5, 20}, points = {{-97.5, -20}, {22.5, -20}, {22.5, 20}, {52.5, 20}}, color = {128, 0, 128}));
  connect(linearInteraction.portB, portB) annotation(Line(visible = true, origin = {62.5, 20}, points = {{-52.5, 20}, {-22.5, 20}, {-22.5, -20}, {97.5, -20}}, color = {128, 0, 128}));
  connect(portA, nonlinearInteraction.portA) annotation(Line(visible = true, origin = {-62.5, -20}, points = {{-97.5, 20}, {22.5, 20}, {22.5, -20}, {52.5, -20}}, color = {128, 0, 128}));
  connect(nonlinearInteraction.portB, portB) annotation(Line(visible = true, origin = {62.5, -20}, points = {{-52.5, -20}, {-22.5, -20}, {-22.5, 20}, {97.5, 20}}, color = {128, 0, 128}));
  // inputConnector to connectors
  connect(dataIn.a_0, a_0) annotation(Line(visible = true, origin = {-142.078, 65}, points = {{-7.922, -25}, {2.078, -25}, {2.078, 25}, {22.078, 25}}, color = {0, 0, 128}));
  connect(dataIn.a_A, a_A) annotation(Line(visible = true, origin = {-142.078, 55}, points = {{-7.922, -15}, {2.078, -15}, {2.078, 15}, {22.078, 15}}, color = {0, 0, 128}));
  connect(dataIn.a_B, a_B) annotation(Line(visible = true, origin = {-142.078, 45}, points = {{-7.922, -5}, {2.078, -5}, {2.078, 5}, {22.078, 5}}, color = {0, 0, 128}));
  connect(dataIn.a_AB, a_AB) annotation(Line(visible = true, origin = {-142.078, 35}, points = {{-7.922, 5}, {2.078, 5}, {2.078, -5}, {22.078, -5}}, color = {0, 0, 128}));
  connect(dataIn.b_0, b_0) annotation(Line(visible = true, origin = {-142.078, 25}, points = {{-7.922, 15}, {2.078, 15}, {2.078, -15}, {22.078, -15}}, color = {0, 0, 128}));
  connect(dataIn.b_B, b_B) annotation(Line(visible = true, origin = {-142.078, 15}, points = {{-7.922, 25}, {2.078, 25}, {2.078, -25}, {22.078, -25}}, color = {0, 0, 128}));
  connect(dataIn.b_A, b_A) annotation(Line(visible = true, origin = {-142.078, 5}, points = {{-7.922, 35}, {2.078, 35}, {2.078, -35}, {22.078, -35}}, color = {0, 0, 128}));
  connect(dataIn.b_AB, b_AB) annotation(Line(visible = true, origin = {-142.078, -5}, points = {{-7.922, 45}, {2.078, 45}, {2.078, -45}, {22.078, -45}}, color = {0, 0, 128}));
  // connectors to interior inputConnectors
  connect(a_0, dataBus.a_0) annotation(Line(visible = true, origin = {-110, 80}, points = {{-10, 10}, {0, 10}, {0, -10}, {20, -10}}, color = {1, 37, 163}));
  connect(a_A, dataBus.a_A) annotation(Line(visible = true, origin = {-105, 70}, points = {{-15, 0}, {15, 0}}, color = {1, 37, 163}));
  connect(a_B, dataBus.a_B) annotation(Line(visible = true, origin = {-110, 60}, points = {{-10, -10}, {0, -10}, {0, 10}, {20, 10}}, color = {1, 37, 163}));
  connect(a_AB, dataBus.a_AB) annotation(Line(visible = true, origin = {-110, 50}, points = {{-10, -20}, {0, -20}, {0, 20}, {20, 20}}, color = {1, 37, 163}));
  connect(b_0, dataBus.b_0) annotation(Line(visible = true, origin = {-110, 40}, points = {{-10, -30}, {0, -30}, {0, 30}, {20, 30}}, color = {1, 37, 163}));
  connect(b_B, dataBus.b_B) annotation(Line(visible = true, origin = {-110, 30}, points = {{-10, -40}, {0, -40}, {0, 40}, {20, 40}}, color = {1, 37, 163}));
  connect(b_A, dataBus.b_A) annotation(Line(visible = true, origin = {-110, 20}, points = {{-10, -50}, {0, -50}, {0, 50}, {20, 50}}, color = {1, 37, 163}));
  connect(b_AB, dataBus.b_AB) annotation(Line(visible = true, origin = {-110, 10}, points = {{-10, -60}, {0, -60}, {0, 60}, {20, 60}}, color = {1, 37, 163}));
  // other connections
  connect(linearInteraction.y_A, netRate_A.u1) annotation(Line(visible = true, origin = {20.667, 60.133}, points = {{-25.667, -9.733}, {-25.667, 4.867}, {51.333, 4.867}}, color = {1, 37, 163}));
  connect(nonlinearInteraction.y1_A, netRate_A.u2) annotation(Line(visible = true, origin = {1.408, 10}, points = {{-11.908, -45}, {-29.342, -45}, {-29.342, 45}, {70.592, 45}}, color = {1, 37, 163}));
  connect(netRate_A.y, y_A) annotation(Line(visible = true, origin = {121.841, 70}, points = {{-34.478, -10}, {-1.841, -10}, {-1.841, 10}, {38.159, 10}}, color = {1, 37, 163}));
  connect(netRate_A.y, y1_A) annotation(Line(visible = true, origin = {121.841, 50}, points = {{-34.478, 10}, {-1.841, 10}, {-1.841, -10}, {38.159, -10}}, color = {1, 37, 163}));
  connect(nonlinearInteraction.y_B, netRate_B.u2) annotation(Line(visible = true, origin = {27.333, -60.133}, points = {{-22.333, 9.733}, {-22.333, -4.867}, {44.667, -4.867}}, color = {1, 37, 163}));
  connect(linearInteraction.y1_B, netRate_B.u1) annotation(Line(visible = true, origin = {30.625, -10}, points = {{-20.125, 45}, {-10.625, 45}, {-10.625, -45}, {41.375, -45}}, color = {1, 37, 163}));
  connect(netRate_B.y, y_B) annotation(Line(visible = true, origin = {121.841, -50}, points = {{-34.478, -10}, {-1.841, -10}, {-1.841, 10}, {38.159, 10}}, color = {1, 37, 163}));
  connect(netRate_B.y, y1_B) annotation(Line(visible = true, origin = {121.841, -70}, points = {{-34.478, 10}, {-1.841, 10}, {-1.841, -10}, {38.159, -10}}, color = {1, 37, 163}));
  connect(linearInteraction.dataIn, dataBus) annotation(Line(visible = true, origin = {-30, 63.333}, points = {{30, -13.333}, {30, 6.667}, {-60, 6.667}}, color = {0, 0, 128}));
  connect(nonlinearInteraction.dataIn, dataBus) annotation(Line(visible = true, origin = {-45, -25}, points = {{45, -25}, {45, -35}, {-45, -35}, {-45, 95}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>ComplexInteraction</em> component combines <em>linear </em>and <em>nonlinear</em> interaction between two stocks <strong>A</strong> (<code>portA</code>) and <strong>B</strong> (<code>portB</code>):</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/ComplexInteraction/Formula.svg\" alt=\"Formula.svg\"></p>
<p class=\"aside\">Note: Capital letters were chosen to represent the stocks (state variables) connected at <code>portA</code> and <code>portB</code> in the formula above. Also dot notation is used for a stock's rate of flow—its first derivative with respect to time.</p>
<table>
<tbody>
<tr>
<th>Coefficient
</th>
<th>Unit
</th>
<th>Description
</th>
</tr>
<tr>
<td><code>a_0</code></td>
<td>
<p>amount of A per second</p>
</td>
<td>
<p>Rate of growth for stock A</p>
</td>
</tr>
<tr>
<td>
<p><code>b_0</code></p>
</td>
<td>
<p>amount of B per second</p>
</td>
<td>
<p>Rate of growth for stock B</p>
</td>
</tr>
<tr>
<td>
<p><code>a_A</code></p>
</td>
<td>
<p>1/s</p>
</td>
<td>
<p>Fractional rate of growth for stock A<br>(e.g., the self-coupling coefficient for A)</p>
</td>
</tr>
<tr>
<td>
<p><code>b_B</code></p>
</td>
<td>
<p>1/s</p>
</td>
<td>
<p>Fractional rate of growth for stock B<br>(e.g., the self-coupling coefficient for B)</p>
</td>
</tr>
<tr>
<td>
<p><code>a_B</code></p>
</td>
<td>
<p>amount of A per amount of B per second</p>
</td>
<td>
<p>Rate of growth for stock A per stock B<br>(e.g., the coupling-cofficient for B towards A)</p>
</td>
</tr>
<tr>
<td>
<p><code>b_A</code></p>
</td>
<td>
<p>amount of B per amount of A per second</p>
</td>
<td>
<p>Rate of growth for stock B per stock A<br>(e.g., the coupling-coefficient for A towards B)</p>
</td>
</tr>
<tr>
<td><code>a_AB</code></td>
<td>1 per second per amount of B</td>
<td>
<p>Factor used to determine the net flow to A<br>(e.g., nonlinear coupling factor for A)</p>
</td>
</tr>
<tr>
<td><code>b_AB</code></td>
<td>1 per second per amount of A</td>
<td>
<p>Factor used to determine the net flow to B<br>(e.g., nonlinear coupling factor for B)</p>
</td>
</tr>
</tbody>
</table>
<p>The coefficients can be given as <em>parameters</em> or as <em>variables</em> via the expandable connector <code>dataIn</code>.</p>
<h4>Examples</h4>
<p>The classical <a href=\"modelica://BusinessSimulation.Flows.Interaction.LotkaVolterra\">Lotka-Volterra-Model</a>&nbsp;of predator-prey-dynamics can be derived from this model using the following parameterization:</p>
<p style=\"padding-left: 30px;\"><code>a_0 = 0, a_A =&nbsp;&alpha;, a_B = 0, a_AB = -&beta;, b_0 = 0, b_B = -&gamma;, b_A = 0, b_AB =&nbsp;&delta;</code></p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.LinearInteraction\">LinearInteraction</a>, <a href=\"modelica://BusinessSimulation.Flows.Interaction.ComplexInteraction\">ComplexInteraction</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Interaction.LotkaVolterra\">LotkaVolterra</a></p>
</html>", revisions = "<html>
<ul>
<li><code>InputConnector</code> defined as <code>encapsulated expandable connector</code> in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Linear & Nonlinear", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end ComplexInteraction;
