within BusinessSimulation.CausalLoop;

model ComplexInteraction "Interaction with linear and nonlinear terms"
  import BusinessSimulation.Units.Rate;
  extends Interfaces.PartialCLD.Interaction(polA = "±", polB = "±");
  parameter Rate a_0 "Growth rate for A (independent)" annotation(Dialog(group = "Parameters for net flow to A"));
  parameter Rate a_A "Fractional rate of growth for A (self-coupling A)" annotation(Dialog(group = "Parameters for net flow to A"));
  parameter Rate a_B "Rate of growth for A per unit of B (coupling of B to A)" annotation(Dialog(group = "Parameters for net flow to A"));
  parameter Rate a_AB "Fractional rate of growth for A per unit of B (nonlinear coupling)" annotation(Dialog(group = "Parameters for net flow to A"));
  parameter Rate b_0 "Growth rate for B (independent)" annotation(Dialog(group = "Parameters for net flow to B"));
  parameter Rate b_B "Fractional growth rate for B (self-coupling)" annotation(Dialog(group = "Parameters for net flow to B"));
  parameter Rate b_A "Rate of growth for B per unit of A (coupling of A to B)" annotation(Dialog(group = "Parameters for net flow to B"));
  parameter Rate b_AB "Fractional growth rate for B per unit of A (nonlinear coupling)" annotation(Dialog(group = "Parameters for net flow to B"));
protected
  Flows.Interaction.ComplexInteraction complexInteraction annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.ScalarMultiplication actualCoefficients(nin = 8, redeclare replaceable type OutputType = Rate) annotation(Placement(visible = true, transformation(origin = {-0, 65}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.Vector.ConstantConverter constantCoefficients(value = {a_0, a_A, a_B, a_AB, b_0, b_B, b_A, b_AB}) annotation(Placement(visible = true, transformation(origin = {60, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_a0 annotation(Placement(visible = true, transformation(origin = {-50, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Interaction.ComplexInteraction.InputConnector dataIn annotation(Placement(visible = true, transformation(origin = {-0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {0, 22.222}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_aA annotation(Placement(visible = true, transformation(origin = {-40, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_aB annotation(Placement(visible = true, transformation(origin = {-30, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_aAB annotation(Placement(visible = true, transformation(origin = {-20, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_b0 annotation(Placement(visible = true, transformation(origin = {20, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_bA annotation(Placement(visible = true, transformation(origin = {30, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_bB annotation(Placement(visible = true, transformation(origin = {40, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y_bAB annotation(Placement(visible = true, transformation(origin = {50, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90), iconTransformation(origin = {-41.575, 16.667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(portA, complexInteraction.portA) annotation(Line(visible = true, origin = {-80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(complexInteraction.portB, portB) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(constantCoefficients.y, actualCoefficients.u1) annotation(Line(visible = true, origin = {21.308, 77.679}, points = {{32.692, 2.321}, {-16.346, 2.321}, {-16.346, -4.641}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[1], y_a0) annotation(Line(visible = true, origin = {-16.667, 57.179}, points = {{16.667, 0.321}, {16.667, -7.179}, {-33.333, -7.179}, {-33.333, -22.179}}, color = {1, 37, 163}));
  connect(u, actualCoefficients.u2) annotation(Line(visible = true, origin = {-78.985, 70.608}, points = {{-66.015, -10.608}, {-41.015, -10.608}, {-41.015, 9.392}, {74.023, 9.392}, {74.023, 2.43}}, color = {0, 0, 128}));
  connect(one, actualCoefficients.u2) annotation(Line(visible = true, origin = {-78.985, 62.608}, points = {{-66.015, -22.608}, {-41.015, -22.608}, {-41.015, 17.392}, {74.023, 17.392}, {74.023, 10.43}}, color = {0, 0, 128}));
  connect(dataIn, complexInteraction.dataIn) annotation(Line(visible = true, origin = {-0, 15}, points = {{-0, 5}, {0, -5}}, color = {0, 0, 128}));
  connect(y_a0, dataIn.a_0) annotation(Line(visible = true, origin = {-20, 33.75}, points = {{-30, 1.25}, {-30, -3.75}, {20, -3.75}, {20, -13.75}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[2], y_aA) annotation(Line(visible = true, origin = {-20, 48.125}, points = {{20, 9.375}, {20, 1.875}, {-20, 1.875}, {-20, -13.125}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[3], y_aB) annotation(Line(visible = true, origin = {-15, 45.625}, points = {{15, 11.875}, {15, 4.375}, {-15, 4.375}, {-15, -10.625}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[4], y_aAB) annotation(Line(visible = true, origin = {-10, 48.125}, points = {{10, 9.375}, {10, 1.875}, {-10, 1.875}, {-10, -13.125}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[5], y_b0) annotation(Line(visible = true, origin = {10, 48.125}, points = {{-10, 9.375}, {-10, 1.875}, {10, 1.875}, {10, -13.125}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[7], y_bA) annotation(Line(visible = true, origin = {15, 48.981}, points = {{-15, 8.519}, {-15, 1.019}, {15, 1.019}, {15, -13.981}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[6], y_bB) annotation(Line(visible = true, origin = {20, 48.125}, points = {{-20, 9.375}, {-20, 1.875}, {20, 1.875}, {20, -13.125}}, color = {1, 37, 163}));
  connect(actualCoefficients.y[8], y_bAB) annotation(Line(visible = true, origin = {25, 48.125}, points = {{-25, 9.375}, {-25, 1.875}, {25, 1.875}, {25, -13.125}}, color = {1, 37, 163}));
  connect(y_b0, dataIn.b_0) annotation(Line(visible = true, origin = {10, 28.75}, points = {{10, 6.25}, {10, 1.25}, {-10, 1.25}, {-10, -8.75}}, color = {1, 37, 163}));
  connect(y_aA, dataIn.a_A) annotation(Line(visible = true, origin = {-20, 28.75}, points = {{-20, 6.25}, {-20, 1.25}, {20, 1.25}, {20, -8.75}}, color = {1, 37, 163}));
  connect(y_aB, dataIn.a_B) annotation(Line(visible = true, origin = {-15, 29.621}, points = {{-15, 5.379}, {-15, 0.379}, {15, 0.379}, {15, -9.621}}, color = {1, 37, 163}));
  connect(y_aAB, dataIn.a_AB) annotation(Line(visible = true, origin = {-10, 29.837}, points = {{-10, 5.163}, {-10, 0.163}, {10, 0.163}, {10, -9.837}}, color = {1, 37, 163}));
  connect(y_bA, dataIn.b_A) annotation(Line(visible = true, origin = {15, 28.75}, points = {{15, 6.25}, {15, 1.25}, {-15, 1.25}, {-15, -8.75}}, color = {1, 37, 163}));
  connect(y_bB, dataIn.b_B) annotation(Line(visible = true, origin = {20, 28.75}, points = {{20, 6.25}, {20, 1.25}, {-20, 1.25}, {-20, -8.75}}, color = {1, 37, 163}));
  connect(y_bAB, dataIn.b_AB) annotation(Line(visible = true, origin = {25, 28.75}, points = {{25, 6.25}, {25, 1.25}, {-25, 1.25}, {-25, -8.75}}, color = {1, 37, 163}));
  connect(complexInteraction.y_B, y_B) annotation(Line(visible = true, origin = {82.369, 24.08}, points = {{-77.369, -13.68}, {-77.369, -9.08}, {37.631, -9.08}, {37.631, 15.92}, {79.476, 15.92}}, color = {1, 37, 163}));
  connect(complexInteraction.y1_A, y_A) annotation(Line(visible = true, origin = {-63.354, -22.5}, points = {{52.854, 17.5}, {23.354, 17.5}, {23.354, -17.5}, {-99.563, -17.5}}, color = {1, 37, 163}));
  /* flow */
  annotation(defaultComponentName = "f", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using →<a href = \"modelica://BusinessSimulation.Flows.Interaction.ComplexInteraction\"><code>ComplexInteraction</code></a> this component allows to logically connect two flows influencing two stocks <strong>A</strong> (connected to <code>portA</code>) and <strong>B</strong> (connected to <code>portB</code>). The formula for the resulting flows (using <a href=\"https://wiki2.org/en/Newton%27s_notation+Brights.4#Newton's_notation\">Newton's dot notation</a>) has <em>linear</em> and <em>nonlinear</em> terms:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/ComplexInteraction/Formula.svg\" alt=\"Formula.svg\"></p>
<p>The coefficients are given by parameters, which are multiplied either with 1 (<code>hasFactor = false</code>) or an exogenous factor <strong>u</strong> (<code>hasFactor = true</code>). Upon setting <code>hasRateOutput = true</code> the component will report the current rate of flows via output connectors (<code>y_A, y_B</code>).</p>
<h4>Notes</h4>
<ul>
<li>Using <code>a_0 = -1, b_0 = 1</code> (other coefficients set to zero), and <code>hasFactor = true</code> a <a href=\"modelica://BusinessSimulation.Flows.Bidirectional\"><em>bidirectional flow</em></a> can be modeled, whose rate is given by the input <strong>u</strong> (positive inputs indicate a flow from <strong>A</strong> to <strong>B</strong>).</li><br>
<li>Using <code>a_0 = -1, b_0 = f</code> (other coefficients set to zero), and <code>hasFactor = true</code> a <a href=\"modelica://BusinessSimulation.Flows.Interaction.BrokenTransition\"><em>broken transition</em></a> can be modeled, with the proportionality factor <em>f</em> indicating units of <strong>B</strong> per unit of <strong>A</strong>.</li><br>
<li>The parameters <code>polA</code> and <code>polB</code> allow to give visual cues with regard to polarity in the diagram.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.CausalLoop.UnidirectionalFlow\">UnidirectionalFlow</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ComplexInteraction;
