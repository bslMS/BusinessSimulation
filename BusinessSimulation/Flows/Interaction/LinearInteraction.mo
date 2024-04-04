within BusinessSimulation.Flows.Interaction;

model LinearInteraction "Linear model of interaction between two stocks"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericFlow;
  extends Interfaces.Basics.Interaction4SO;
  extends Icons.Interaction;
  replaceable type TypeA = Unspecified "Type selector for stock A (default = Unspecified)" annotation(choicesAllMatching = true);
  replaceable type TypeB = Unspecified "Type selector for stock B (default = Unspecified)" annotation(choicesAllMatching = true);
  Input_Connector dataIn if not (hasConstantGrowthRates and hasConstantFractionalGrowthRates and hasConstantCouplingCoefficients) "Continuous inputs for the component" annotation(Placement(visible = true, transformation(origin = {-145, 85}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Boolean hasConstantGrowthRates = false "= true, if the linear growth rates are given by constant parameters" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantFractionalGrowthRates = false "= true, if the fractional growth rates are given by constant parameters" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantCouplingCoefficients = false "= true, if the induced growth rates are given by constant parameters" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter OutputType_A a_0 = unspecified "Constant rate of growth for stock A [OutputType_A]" annotation(Dialog(enable = hasConstantGrowthRates));
  parameter OutputType_B b_0 = unspecified "Constant rate of growth for stock B [OutputType_B]" annotation(Dialog(enable = hasConstantGrowthRates));
  parameter Rate a_A = unspecified "Constant fractional rate of growth for stock A (self-coupling)" annotation(Dialog(enable = hasConstantFractionalGrowthRates));
  parameter Rate b_B = unspecified "Constant fractional rate of growth for stock B (self-coupling)" annotation(Dialog(enable = hasConstantFractionalGrowthRates));
  parameter OutputType_A a_B = unspecified "Constant rate of growth for stock A per reference units of B (coupling B to A)" annotation(Dialog(enable = hasConstantCouplingCoefficients));
  parameter TypeB refB(min = 0) = 1 "Reference value for B, i.e., divisor for a_B";
  parameter OutputType_B b_A = unspecified "Constant rate of growth for stock B per reference units of A (coupling A to B)" annotation(Dialog(enable = hasConstantCouplingCoefficients));
  parameter TypeA refA(min = 0) = 1 "Reference value for A, i.e., divisor for b_A";

  encapsulated expandable connector Input_Connector "Data bus for inputs"
    import BusinessSimulation.Units.*;
    import ICON = BusinessSimulation.Icons.DataInPort;
    extends ICON;
    Real a_0 "Rate of growth for stock A (independent growth)";
    Real b_0 "Rate of growth for stock B (independent growth)";
    Real a_A "Fractional rate of growth for stock A (self-coupling)";
    Real b_B "Fractional rate of growth for stock B (sefl-coupling)";
    Real a_B "Rate of growth for stock A per unit of B (coupling of B to A)";
    Real b_A "Rate of growth for stock B per unit of A (coupling of A to B)";
  end Input_Connector;
protected
  Converters.ConstantConverter parGrowthRateA(final value = a_0) if hasConstantGrowthRates "Constant growth rate for A (optional)" annotation(Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parFractionalRateA(final value = a_A) if hasConstantFractionalGrowthRates "Constant fractional growth rate for A (optional)" annotation(Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parCrossFractionalRateA(final value = a_B) if hasConstantCouplingCoefficients "Constany growth rate for A per B (optional)" annotation(Placement(visible = true, transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parGrowthRateB(final value = b_0) if hasConstantGrowthRates "Constant growth rate for B (optional)" annotation(Placement(visible = true, transformation(origin = {120, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parFractionalRateB(final value = b_B) if hasConstantFractionalGrowthRates "Constant fractional growth rate for B (optional)" annotation(Placement(visible = true, transformation(origin = {80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parCrossFractionalRateB(final value = b_A) if hasConstantCouplingCoefficients "Constant growth rate for B per A (optional)" annotation(Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.Gain unitMultiplierA(final c = 1 / refB) "The factor should have units 1/[base units of B]" annotation(Placement(visible = true, transformation(origin = {-60, -25}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Converters.Gain unitMultiplierB(final c = 1 / refA) "The factor should have units of 1/[base units of A]" annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_growthRate_A if not hasConstantGrowthRates annotation(Placement(visible = true, transformation(origin = {-105, 65}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-66.667, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_fractionalGrowthRate_A if not hasConstantFractionalGrowthRates annotation(Placement(visible = true, transformation(origin = {-65, 65}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-66.667, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_growthRate_A_per_B if not hasConstantCouplingCoefficients annotation(Placement(visible = true, transformation(origin = {-25, 65}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-66.667, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_growthRate_B_per_A if not hasConstantCouplingCoefficients annotation(Placement(visible = true, transformation(origin = {20, 65}, extent = {{10, -10}, {-10, 10}}, rotation = 90), iconTransformation(origin = {-66.667, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_fractionalGrowthRate_B if not hasConstantFractionalGrowthRates annotation(Placement(visible = true, transformation(origin = {60, 65}, extent = {{10, -10}, {-10, 10}}, rotation = 90), iconTransformation(origin = {-66.667, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput u_growthRate_B if not hasConstantGrowthRates annotation(Placement(visible = true, transformation(origin = {105, 65}, extent = {{10, -10}, {-10, 10}}, rotation = 90), iconTransformation(origin = {-66.667, 77.778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange growingA1 "Linear growth" annotation(Placement(visible = true, transformation(origin = {-110, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SourcesOrSinks.ExponentialChange growingA2 "Exponential growth for A" annotation(Placement(visible = true, transformation(origin = {-110, -5}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange growingA3 "Cross-fractional growth rate for A per B" annotation(Placement(visible = true, transformation(origin = {-110, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor stockB "Amount in stock B" annotation(Placement(visible = true, transformation(origin = {136.619, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Sensors.FlowPortSensor stockA "Amount in stock A" annotation(Placement(visible = true, transformation(origin = {-137.295, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Converters.Product_2 inducedGrowthA "Rate of growth induced by stock B" annotation(Placement(visible = true, transformation(origin = {-85, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -540)));
  Converters.Add_3 totalRateA annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange growingB1 "Linear growth" annotation(Placement(visible = true, transformation(origin = {110, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExponentialChange growingB2 "Exponential growth for B" annotation(Placement(visible = true, transformation(origin = {110, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange growingB3 "Cross-fractional growth rate for B per A" annotation(Placement(visible = true, transformation(origin = {110, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 inducedGrowthB "Rate of growth induced by stock A" annotation(Placement(visible = true, transformation(origin = {75, -25}, extent = {{10, -10}, {-10, 10}}, rotation = 540)));
  Converters.Add_3 totalRateB annotation(Placement(visible = true, transformation(origin = {40, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(not hasConstantGrowthRates or a_0 < inf and b_0 < inf, "Parameters a_0 and b_0 need to be specified");
  assert(not hasConstantFractionalGrowthRates or a_A < inf and b_B < inf, "Parameters a_A and b_B need to be specified");
  assert(not hasConstantCouplingCoefficients or a_B < inf and b_A < inf, "Parameters a_B and b_A need to be specified");
  assert(refB > 0, "Reference value for B must be greater than zero");
  assert(refA > 0, "Reference value for A must be greater than zero");
  connect(growingA1.massPort, portA) annotation(Line(visible = true, origin = {-135, 15}, points = {{15, 15}, {5, 15}, {5, -15}, {-25, -15}}, color = {128, 0, 128}));
  connect(parGrowthRateA.y, growingA1.u) annotation(Line(visible = true, origin = {-117.5, 51.25}, points = {{-12.5, 13.75}, {-12.5, -1.25}, {12.5, -1.25}, {12.5, -11.25}}, color = {1, 37, 163}));
  connect(growingA2.massPort, portA) annotation(Line(visible = true, origin = {-135, -5}, points = {{15, 0}, {5, 0}, {5, 5}, {-13.334, 5}}, color = {128, 0, 128}));
  connect(parFractionalRateA.y, growingA2.u) annotation(Line(visible = true, origin = {-92.5, 21.25}, points = {{12.5, 42.75}, {12.5, -11.25}, {-12.5, -11.25}, {-12.5, -16.25}}, color = {1, 37, 163}));
  connect(growingA3.massPort, portA) annotation(Line(visible = true, origin = {-135, -25}, points = {{15, -25}, {5, -25}, {5, 25}, {-25, 25}}, color = {128, 0, 128}));
  connect(stockB.flowPort, portB) annotation(Line(visible = true, origin = {142.542, 0}, points = {{-5.922, 0}, {5.922, -0}}, color = {128, 0, 128}));
  connect(stockA.flowPort, portA) annotation(Line(visible = true, origin = {-142.815, 0}, points = {{5.519, 0}, {-5.519, -0}}, color = {128, 0, 128}));
  connect(inducedGrowthA.y, growingA3.u) annotation(Line(visible = true, origin = {-101, -33.333}, points = {{8, 3.333}, {-4, 3.333}, {-4, -6.667}}, color = {1, 37, 163}));
  connect(inducedGrowthA.u1, stockB.stock) annotation(Line(visible = true, origin = {65.445, -27}, points = {{-142.445, -8}, {71.223, -8}, {71.223, 16}}, color = {1, 37, 163}));
  connect(growingA1.y2, totalRateA.u1) annotation(Line(visible = true, origin = {-39.833, 25.87}, points = {{-59.667, -0.87}, {29.833, -0.87}, {31.833, -0.87}}, color = {1, 37, 163}));
  connect(growingA2.y2, totalRateA.u2) annotation(Line(visible = true, origin = {-34.375, 2.5}, points = {{-65.125, -12.5}, {19.375, -12.5}, {19.375, 17.5}, {26.375, 17.5}}, color = {1, 37, 163}));
  connect(growingA3.y2, totalRateA.u3) annotation(Line(visible = true, origin = {-39.375, -20}, points = {{-60.125, -35}, {14.375, -35}, {14.375, 35}, {31.375, 35}}, color = {1, 37, 163}));
  connect(totalRateA.y, y_A) annotation(Line(visible = true, origin = {49.341, 50}, points = {{-41.979, -30}, {-34.341, -30}, {-34.341, 30}, {110.659, 30}}, color = {1, 37, 163}));
  connect(totalRateA.y, y1_A) annotation(Line(visible = true, origin = {49.341, 30}, points = {{-41.978, -10}, {-34.341, -10}, {-34.341, 10}, {110.659, 10}}, color = {1, 37, 163}));
  connect(growingB1.massPort, portB) annotation(Line(visible = true, origin = {135, 15}, points = {{-15, 10}, {-5, 10}, {-5, -15}, {13.464, -15}}, color = {128, 0, 128}));
  connect(parGrowthRateB.y, growingB1.u) annotation(Line(visible = true, origin = {112.5, 51.25}, points = {{7.5, 12.75}, {7.5, -1.25}, {-7.5, -1.25}, {-7.5, -16.25}}, color = {1, 37, 163}));
  connect(parFractionalRateB.y, growingB2.u) annotation(Line(visible = true, origin = {92.5, 21.25}, points = {{-12.5, 43.75}, {-12.5, -11.25}, {12.5, -11.25}, {12.5, -16.25}}, color = {1, 37, 163}));
  connect(growingB2.massPort, portB) annotation(Line(visible = true, origin = {135, -5}, points = {{-15, 0}, {-5, 0}, {-5, 5}, {25, 5}}, color = {128, 0, 128}));
  connect(growingB3.massPort, portB) annotation(Line(visible = true, origin = {135, -25}, points = {{-15, -30}, {-5, -30}, {-5, 25}, {25, 25}}, color = {128, 0, 128}));
  connect(inducedGrowthB.y, growingB3.u) annotation(Line(visible = true, origin = {97.667, -31.667}, points = {{-14.667, 6.667}, {7.333, 6.667}, {7.333, -13.333}}, color = {1, 37, 163}));
  connect(stockA.stock, inducedGrowthB.u1) annotation(Line(visible = true, origin = {-27.58, -40.2}, points = {{-109.666, 29.2}, {-109.667, -29.8}, {67.58, -29.8}, {67.58, 10.2}, {94.58, 10.2}}, color = {1, 37, 163}));
  connect(totalRateB.y, y1_B) annotation(Line(visible = true, origin = {79.341, -40}, points = {{-31.341, 45}, {-24.341, 45}, {-24.341, -40}, {80.659, -40}}, color = {1, 37, 163}));
  connect(totalRateB.y, y_B) annotation(Line(visible = true, origin = {79.341, -20}, points = {{-31.341, 25}, {-24.341, 25}, {-24.341, -20}, {80.659, -20}}, color = {1, 37, 163}));
  connect(growingB3.y2, totalRateB.u3) annotation(Line(visible = true, origin = {45.375, -30}, points = {{54.125, -30}, {-20.375, -30}, {-20.375, 30}, {-13.375, 30}}, color = {1, 37, 163}));
  connect(growingB2.y2, totalRateB.u2) annotation(Line(visible = true, origin = {55.25, -21.667}, points = {{44.25, 11.667}, {34.75, 11.667}, {34.75, -28.333}, {-45.25, -28.333}, {-45.25, 26.667}, {-23.25, 26.667}}, color = {1, 37, 163}));
  connect(growingB1.y2, totalRateB.u1) annotation(Line(visible = true, origin = {45.375, 15}, points = {{54.125, 5}, {-20.375, 5}, {-20.375, -5}, {-13.375, -5}}, color = {1, 37, 163}));
  connect(dataIn.a_0, u_growthRate_A) annotation(Line(visible = true, origin = {-123.333, 78.333}, points = {{-21.667, 6.667}, {18.333, 6.667}, {18.333, -13.333}}, color = {0, 0, 128}));
  connect(u_growthRate_A, growingA1.u) annotation(Line(visible = true, origin = {-105, 52.5}, points = {{0, 12.5}, {0, -12.5}}, color = {1, 37, 163}));
  connect(dataIn.a_A, u_fractionalGrowthRate_A) annotation(Line(visible = true, origin = {-96.667, 78.333}, points = {{-48.333, 6.667}, {31.667, 6.667}, {31.667, -13.333}}, color = {0, 0, 128}));
  connect(u_fractionalGrowthRate_A, growingA2.u) annotation(Line(visible = true, origin = {-85.646, 21.921}, points = {{20.646, 43.079}, {20.323, 18.079}, {5.646, 18.079}, {5.646, -11.921}, {-19.354, -11.921}, {-19.354, -16.921}}, color = {1, 37, 163}));
  connect(dataIn.a_B, u_growthRate_A_per_B) annotation(Line(visible = true, origin = {-70, 78.333}, points = {{-75, 6.667}, {45, 6.667}, {45, -13.333}}, color = {0, 0, 128}));
  connect(dataIn.b_A, u_growthRate_B_per_A) annotation(Line(visible = true, origin = {-40, 78.333}, points = {{-105, 6.667}, {60, 6.667}, {60, -13.333}}, color = {0, 0, 128}));
  connect(u_fractionalGrowthRate_B, growingB2.u) annotation(Line(visible = true, origin = {81.667, 30}, points = {{-21.667, 35}, {-21.667, 15}, {-1.667, 15}, {-1.667, -20}, {23.333, -20}, {23.333, -25}}, color = {1, 37, 163}));
  connect(dataIn.b_B, u_fractionalGrowthRate_B) annotation(Line(visible = true, origin = {-13.333, 78.333}, points = {{-131.667, 6.667}, {73.333, 6.667}, {73.333, -13.333}}, color = {0, 0, 128}));
  connect(u_growthRate_B, growingB1.u) annotation(Line(visible = true, origin = {105, 50}, points = {{0, 15}, {0, -15}}, color = {1, 37, 163}));
  connect(dataIn.b_0, u_growthRate_B) annotation(Line(visible = true, origin = {16.667, 78.333}, points = {{-161.667, 6.667}, {88.333, 6.667}, {88.333, -13.333}}, color = {0, 0, 128}));
  connect(unitMultiplierA.y, inducedGrowthA.u2) annotation(Line(visible = true, origin = {-72.5, -25}, points = {{4.5, 0}, {-4.5, 0}}, color = {1, 37, 163}));
  connect(unitMultiplierA.u, parCrossFractionalRateA.y) annotation(Line(visible = true, origin = {-44, 4.667}, points = {{-8, -29.667}, {4, -29.667}, {4, 59.333}}, color = {0, 0, 128}));
  connect(u_growthRate_A_per_B, unitMultiplierA.u) annotation(Line(visible = true, origin = {-33.86, 20}, points = {{8.86, 45}, {3.86, 45}, {3.86, -45}, {-18.14, -45}}, color = {1, 37, 163}));
  connect(unitMultiplierB.y, inducedGrowthB.u2) annotation(Line(visible = true, origin = {57.5, -20}, points = {{-9.5, 0}, {9.5, 0}}, color = {1, 37, 163}));
  connect(u_growthRate_B_per_A, unitMultiplierB.u) annotation(Line(visible = true, origin = {24, 8.333}, points = {{-4, 56.667}, {-4, -28.333}, {8, -28.333}}, color = {1, 37, 163}));
  connect(parCrossFractionalRateB.y, unitMultiplierB.u) annotation(Line(visible = true, origin = {31.4, 22.8}, points = {{8.6, 41.2}, {8.6, 22.2}, {-11.4, 22.2}, {-11.4, -42.8}, {0.6, -42.8}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>LinearInteraction</em> component allows to model the interaction between two stocks <strong>A</strong> (<code>portA</code>) and <strong>B</strong> (<code>portB</code>) as linear equations:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Flows/Interaction/LinearInteraction/Formula.svg\" alt=\"Formula.svg\"></p>
<p class=\"aside\">Note: Capital letters were chosen to represent the stocks (state variables) connected at <code>portA</code> and <code>portB</code> in the formula above. Also dot notation is used for a stock's rate of flow—its first derivative with respect to time.</p>
<table width = \"600\">
<tbody>
<tr>
<th>Coefficient</th>
<th>Unit</th>
<th>Description</th>
</tr>
<tr>
<td><code>a_0</code></td>
<td>
<p>base units for flow to A (<code>OutputType_A</code>)</p>
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
<p>base units for flow to B (<code>OutputType_B</code>)</p>
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
<p>base units for flow to A (<code>OutputType_A</code>)<br>per base units of B (<code>TypeB</code>)</p>
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
<p>base units for flow to B (<code>OutputType_B</code>)<br>per base units of A (<code>TypeA</code>)</p>
</td>
<td>
<p>Rate of growth for stock B per stock A<br>(e.g., the coupling-coefficient for A towards B)</p>
</td>
</tr>
</tbody>
</table>
<p>The coefficients can be given as <em>parameters</em> or as <em>variables</em> via the expandable connector <code>dataIn</code>.</p>
<h4><br>Examples</h4>
<p>A<em> linear harmonic oscillator</em> can be modeled as&nbsp;a special case of linear interactions where the rates for the mutual influences (e.g., <em>fractionalGrowthRate_B_per_A</em> and <em>fractionalGrowthRate_A_per_B</em>) are negative. In that case, positive stock A will decrease stock B and vice versa.</p>
<p>The<em> Linear Interaction</em> can be used to model Strogatz' famous model for the dynamics of a love affair (conspicuously between \"Romeo\" and \"Juliet\") as shown in →<a href=\"modelica://BusinessSimulation.Examples.LoveHateDynamics\">LoveHateDynamics</a> [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">16</a>].</p>
<h4>Notes</h4>
<ul>
<li>The type selectors <code>OutputType_A</code> and <code>OutputType_B</code> will be used to conveniently set the types, e.g., units, of the parameters <code>a_0,a_B</code> and <code>b_0, b_A</code>.</li><br> 
<li>The coupling coefficient <code>a_B</code> might have rather convoluted units, e.g., <code>base units of A/(base units of B.s)</code>. For convenient modeling, <code>a_B</code> will be divided by <code>refB</code>, which allows to use <code>displayUnit</code> should unit conversion be required. Since <code>TypeB</code> by default is set to <code>Unspecified</code> in most cases nothing needs to be done.</li><br>
<li>This will, conversely, also apply to <code>b_A</code>.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Interaction.NonlinearInteraction\">NonlinearInteraction</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Interaction.ComplexInteraction\">ComplexInteraction</a></p>
</html>", revisions = "<html>
<ul>
<li><code>Input_Connector</code> defined as <code>encapsulated expandable connector</code> in v2.1.0.</li><br>
<li>Values for optional parameters changed to <code>unspecified</code> in v2.1.0.</li><br>
<li>Adapted types and added divisors for compliance with unit checking and convenient unit conversions in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Linear", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LinearInteraction;
