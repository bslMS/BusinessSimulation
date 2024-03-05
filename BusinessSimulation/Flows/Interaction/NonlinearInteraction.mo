within BusinessSimulation.Flows.Interaction;

model NonlinearInteraction "Outflows depend upon the product of the stocks and a factor"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.Interaction4SO(redeclare replaceable type OutputType_A = Unspecified, redeclare replaceable type OutputType_B = Unspecified);
  extends Icons.Interaction;
  replaceable type TypeA = Unspecified "Type selector for stock A" annotation(choicesAllMatching = true);
  replaceable type TypeB = Unspecified "Type selector for stock B" annotation(choicesAllMatching = true);
  InputConnector dataIn if not (hasConstantFactorA and hasConstantFactorB) annotation(Placement(visible = true, transformation(origin = {-145, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Rate a_AB = unspecified "Constant fractional rate for the netflow to A per unit of B (nonlinear coupling factor)" annotation(Dialog(enable = hasConstantFactorA));
  parameter TypeB refB = 1 "Reference value for B, i.e., divisor for the fractional rate a_AB";
  parameter Rate b_AB = unspecified "Constant fractional rate for the netflow to B per unit of A (nonlinear coupling factor)" annotation(Dialog(enable = hasConstantFactorB));
  parameter TypeA refA = 1 "Reference value for A, i.e., divisor for the fractional rate b_AB";
  parameter Boolean hasConstantFactorA = false "= true, if the coupling factor for A is given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantFactorB = false "= true, if the coupling factor for B is given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));

  encapsulated expandable connector InputConnector "Data bus for inputs"
    import ICON = BusinessSimulation.Icons.DataInPort;
    extends ICON;
    Real a_AB "Fractional rate for the netflow to stock A per amount of B";
    Real b_AB "Fractional rate for the netflow to stock B per amount of B";
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
  end InputConnector;
protected
  SourcesOrSinks.ExogenousChange netFlowA "Net flow to A" annotation(Placement(visible = true, transformation(origin = {-100, -0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange netFlowB "Net flow to B" annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor levelA "Amount in stock A" annotation(Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Sensors.FlowPortSensor levelB "Amount in stock B" annotation(Placement(visible = true, transformation(origin = {130, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.Product_2 product_A_B "Product of A and B" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Converters.Product_2 netRateA "Rate of netflow A (positive = inflow)" annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Converters.Product_2 netRateB "Rate of netflow B (positive = inflow)" annotation(Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter parFactorA(value = a_AB) if hasConstantFactorA "Constant fractional rate A" annotation(Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parFactorB(value = b_AB) if hasConstantFactorB "Constant fractional rate B" annotation(Placement(visible = true, transformation(origin = {15, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealOutput u_a_AB if not hasConstantFactorA "Nonlinear coupling factor for A" annotation(Placement(visible = true, transformation(origin = {-35, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-60, 72.222}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_b_AB if not hasConstantFactorB "Nonlinear coupling factor for B" annotation(Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-60, 72.222}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Gain unitMultiplierA(final c = 1 / refA) "Constant should have units 1/UnitsA" annotation(Placement(visible = true, transformation(origin = {45, 25}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.Gain unitMultiplierB(final c = 1 / refB) "Constant should have units 1/UnitsB" annotation(Placement(visible = true, transformation(origin = {-50, 25}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
equation
  assert(not hasConstantFactorA or a_AB < inf, "Parameter a_AB needs to be specified");
  assert(not hasConstantFactorB or b_AB < inf, "Parameter b_AB needs to be specified");
  assert(refA > 0, "Reference value for A must be greater than zero");
  assert(refB > 0, "Reference value for B must be greater than zero");
  connect(portA, netFlowA.massPort) annotation(Line(visible = true, origin = {-135, -0}, points = {{-25, 0}, {25, -0}}, color = {128, 0, 128}));
  connect(netFlowB.massPort, portB) annotation(Line(visible = true, origin = {135, 0}, points = {{-25, 0}, {25, -0}}, color = {128, 0, 128}));
  connect(levelA.flowPort, portA) annotation(Line(visible = true, origin = {-145, 0}, points = {{15, 0}, {-15, 0}}, color = {128, 0, 128}));
  connect(levelB.flowPort, portB) annotation(Line(visible = true, origin = {145, 0}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(levelA.stock, product_A_B.u1) annotation(Line(visible = true, origin = {-67.476, -14.75}, points = {{-62.475, 3.75}, {-62.475, -5.25}, {62.476, -5.25}, {62.476, 6.75}}, color = {1, 37, 163}));
  connect(levelB.stock, product_A_B.u2) annotation(Line(visible = true, origin = {67.524, -14.75}, points = {{62.525, 3.75}, {62.525, -5.25}, {-62.524, -5.25}, {-62.524, 6.75}}, color = {1, 37, 163}));
  connect(product_A_B.y, netRateA.u2) annotation(Line(visible = true, origin = {-24, 12.667}, points = {{24, -4.667}, {24, 2.333}, {-48, 2.333}}, color = {1, 37, 163}));
  connect(netRateA.y, netFlowA.u) annotation(Line(visible = true, origin = {-92.667, 16.667}, points = {{4.667, 3.333}, {-2.333, 3.333}, {-2.333, -6.667}}, color = {1, 37, 163}));
  connect(product_A_B.y, netRateB.u2) annotation(Line(visible = true, origin = {20.667, 12.454}, points = {{-20.667, -4.454}, {-20.667, 2.546}, {41.333, 2.546}}, color = {1, 37, 163}));
  connect(netRateB.y, netFlowB.u) annotation(Line(visible = true, origin = {89.121, 16.667}, points = {{-11.758, 3.333}, {5.879, 3.333}, {5.879, -6.667}}, color = {1, 37, 163}));
  connect(netFlowB.y2, y_B) annotation(Line(visible = true, origin = {102.375, -22.5}, points = {{-12.875, 17.5}, {-22.375, 17.5}, {-22.375, -17.5}, {57.625, -17.5}}, color = {1, 37, 163}));
  connect(netFlowB.y2, y1_B) annotation(Line(visible = true, origin = {102.375, -42.5}, points = {{-12.875, 37.5}, {-22.375, 37.5}, {-22.375, -37.5}, {57.625, -37.5}}, color = {1, 37, 163}));
  connect(netFlowA.y, y_A) annotation(Line(visible = true, origin = {-16.667, 56.8}, points = {{-88.333, -46.4}, {-88.333, 23.2}, {176.667, 23.2}}, color = {1, 37, 163}));
  connect(netFlowA.y, y1_A) annotation(Line(visible = true, origin = {-16.667, 30.133}, points = {{-88.333, -19.733}, {-88.333, 9.867}, {176.667, 9.867}}, color = {1, 37, 163}));
  connect(dataIn.a_AB, u_a_AB) annotation(Line(visible = true, origin = {-92.366, 66.667}, points = {{-52.634, 3.333}, {57.366, 3.333}, {57.366, -16.667}}, color = {0, 0, 128}));
  connect(dataIn.b_AB, u_b_AB) annotation(Line(visible = true, origin = {-20, 66.667}, points = {{-125, 3.333}, {50, 3.333}, {50, -16.667}}, color = {0, 0, 128}));
  connect(unitMultiplierA.y, netRateB.u1) annotation(Line(visible = true, origin = {57.5, 25}, points = {{-4.5, 0}, {4.5, 0}}, color = {1, 37, 163}));
  connect(u_b_AB, unitMultiplierA.u) annotation(Line(visible = true, origin = {32.333, 33.333}, points = {{-2.333, 16.667}, {-2.333, -8.333}, {4.667, -8.333}}, color = {1, 37, 163}));
  connect(parFactorB.y, unitMultiplierA.u) annotation(Line(visible = true, origin = {22.333, 31.333}, points = {{-7.333, 12.667}, {-7.333, -6.333}, {14.667, -6.333}}, color = {1, 37, 163}));
  connect(u_a_AB, unitMultiplierB.u) annotation(Line(visible = true, origin = {-37.333, 33.333}, points = {{2.333, 16.667}, {2.333, -8.333}, {-4.667, -8.333}}, color = {1, 37, 163}));
  connect(parFactorA.y, unitMultiplierB.u) annotation(Line(visible = true, origin = {-20.667, 31.333}, points = {{10.667, 12.667}, {10.667, -6.333}, {-21.333, -6.333}}, color = {1, 37, 163}));
  connect(unitMultiplierB.y, netRateA.u1) annotation(Line(visible = true, origin = {-65, 25}, points = {{7, 0}, {-7, 0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>NonlinearInteraction</em> can be used by itself or in combination with the &rarr;<a href=\"modelica://BusinessSimulation.Flows.Interaction.LinearInteraction\">LinearInteraction </a>flow to model more complex interactions. The netflows to the connected stocks <strong>A</strong> (<code>portA</code>) and <strong>B</strong> (<code>portB</code>) are given by the following equations:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/NonlinearInteraction/Formula.svg\" alt=\"Formula.svg\"></p>
<p class=\"aside\">Note: Capital letters were chosen to represent the stocks (state variables) connected at <code>portA</code> and <code>portB</code> in the formula above. Also dot notation is used for a stock's rate of flow—its first derivative with respect to time.</p>
<table width = \"600\">
<tbody>
<tr>
<th><strong>Coefficient</th>
<th><strong>Unit</th>
<th>Description</th>
</tr>
<tr>
<td><code>a_AB</code></td>
<td>1 per second<br>per base unit of B (<code>TypeB</code>)</td>
<td>
<p>Factor used to determine the net flow to A<br>(positive rate = inflow)</p>
</td>
</tr>
<tr>
<td><code>b_AB</code></td>
<td>1 per second<br>per base unit of A (<code>TypeA<code>)</td>
<td>
<p>Factor used to determine the net flow to B<br>(positive rate = inflow)</p>
</td>
</tr>
</tbody>
</table>
<p>The coefficients can be given as <em>parameters</em> or as <em>variables</em> via the expandable connector <code>dataIn</code>.</p>
<h4>Examples</h4>
<p>A nonlinear component is typically found in predator-prey models or models of infectious diseases, where the exponential growth rate for a population depends upon the size of another population (e.g., prey or susceptible population).</p>
<h4>Notes</h4>
<ul>
<li>When this component is used with stocks that have \"simple\" units, e.g., <code>Amount [each]</code> then it is rather straight forward to enter a fractional rate per unit of A or B for the parameters <code>a_AB, b_AB</code> and we can in fact leave <code>TypeA, TypeB, refA, refB</code> at their default values.</li><br>
<li>In cases, where we want to specify a fractional rate per some <code>displayUnit</code> for one of the stocks, we can use the type selectors <code>TypeA, TypeB</code> to select the appropriate units for the connected stocks and then set the references values <code>refA, refB</code> using whatever <code>displayUnit</code> we want.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.LinearInteraction\">LinearInteraction</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Interaction.ComplexInteraction\">ComplexInteraction</a></p>
</html>", revisions = "<html>
<ul>
<li><code>InputConnector</code> defined as <code>encapsulated expandable connector</code> in v2.1.0.</li><br>
<li>Values for optional parameters changed to <code>unspecified</code> in v2.1.0.</li><br>
<li>Adapted types and added divisors for unit compliance and convenience in V2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Nonlinear", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end NonlinearInteraction;
