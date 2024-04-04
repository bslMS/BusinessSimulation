within BusinessSimulation.CausalLoop;

model PID_Control "Directly influencing a stock to keep it at setpoint value"
  import BusinessSimulation.Units.*;
  import Modelica.Blocks.Types.Init;
  import BusinessSimulation.Constants.{small, inf};
  extends BusinessSimulation.Interfaces.PartialCLD.Control;
  outer ModelSettings modelSettings;
  replaceable type GainType = Unspecified constrainedby Unspecified "Type choice for controller gain" annotation(choicesAllMatching = true);
  parameter GainType k(min = 0) = 1 "Gain of controller [GainType]";
  parameter Time Ti(min = small, start = 0.5) = inf "Time constant of integrator (i.e., gain for integrator = 1/Ti)";
  parameter Time Td(min = 0, start = 0.1) = 0 "Derivative gain (i.e., time span for error prediction)";
  parameter Init initType = Init.NoInit "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)" annotation(Evaluate = true, Dialog(tab = "Initialization"));
  parameter Real Nd(min = small) = 10 "The higher Nd, the more ideal the derivative block" annotation(Dialog(tab = "Advanced"));
  parameter Fraction xi_start = 0 "Initial or guess value for integrator output (= integrator state)" annotation(Dialog(tab = "Initialization"));
  parameter Fraction xd_start = 0 "Initial or guess value for state of derivative block" annotation(Dialog(tab = "Initialization"));
  parameter OutputType y_start = 0 "Initial value of output" annotation(Dialog(enable = initType == Init.InitialOutput, tab = "Initialization"));
protected
  Modelica.Blocks.Continuous.PID PID(k = k, Ti = Ti, Td = Td, initType = initType, Nd = Nd, xi_start = xi_start, xd_start = xd_start, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Gap error "Gap between setpoint and current stock value" annotation(Placement(visible = true, transformation(origin = {-62.168, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 360)));
  SourcesOrSinks.ExogenousChange changing "Flow to adjust the stock" annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 actualRate "Actual rate, which becomes zero when control is turned off" annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(changing.massPort, flowPort) annotation(Line(visible = true, origin = {105, 0}, points = {{-45, 0}, {45, -0}}, color = {128, 0, 128}));
  connect(onOff.y, actualRate.u2) annotation(Line(visible = true, origin = {-32.5, -12.5}, points = {{-49.5, -7.5}, {12.5, -7.5}, {12.5, 27.5}, {24.5, 27.5}}, color = {1, 37, 163}));
  connect(permanent.y, actualRate.u2) annotation(Line(visible = true, origin = {-33, -22.5}, points = {{-51, -17.5}, {13, -17.5}, {13, 37.5}, {25, 37.5}}, color = {1, 37, 163}));
  connect(actualRate.y, changing.u) annotation(Line(visible = true, origin = {32.667, 16.667}, points = {{-24.667, 3.333}, {12.333, 3.333}, {12.333, -6.667}}, color = {1, 37, 163}));
  connect(changing.y, y) annotation(Line(visible = true, origin = {90.615, 30.133}, points = {{-35.615, -19.733}, {-35.615, 9.867}, {71.23, 9.867}}, color = {1, 37, 163}));
  connect(changing.y1, y1) annotation(Line(visible = true, origin = {95.646, -22.5}, points = {{-35.146, 17.5}, {-15.646, 17.5}, {-15.646, -17.5}, {66.437, -17.5}}, color = {1, 37, 163}));
  connect(PID.y, actualRate.u1) annotation(Line(visible = true, origin = {-14.625, 32.5}, points = {{-4.375, 7.5}, {-0.375, 7.5}, {-0.375, -7.5}, {6.625, -7.5}}, color = {1, 37, 163}));
  connect(error.y, PID.u) annotation(Line(visible = true, origin = {-50.542, 50}, points = {{-3.626, 10}, {0.542, 10}, {0.542, -10}, {8.542, -10}}, color = {1, 37, 163}));
  connect(setpoint.y, error.u1) annotation(Line(visible = true, origin = {-74.292, 47.5}, points = {{-7.708, -7.5}, {-0.708, -7.5}, {-0.708, 7.5}, {4.124, 7.5}}, color = {1, 37, 163}));
  connect(currentValue.stock, error.u2) annotation(Line(visible = true, origin = {3.986, 64.2}, points = {{116.063, -33.2}, {116.063, 15.8}, {-78.986, 15.8}, {-78.986, 0.8}, {-74.154, 0.8}}, color = {1, 37, 163}));
  connect(u, error.u1) annotation(Line(visible = true, origin = {-91.292, 27.5}, points = {{-53.708, -27.5}, {16.292, -27.5}, {16.292, 27.5}, {21.124, 27.5}}, color = {0, 0, 128}));
  /* control */
  annotation(defaultComponentName = "c", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This component uses a →<a href=\"modelica:/Modelica.Blocks.Continuous.PID\"><code>PID</code></a> controller to arrive at a rate of flow that is needed to move a connected stock \"under management\" to a given <em>setpoint</em>, i.e., goal. The PID controller here follows the typical <em>standard form</em> implementation where the <em>error e(t)</em> is defined as the difference between the <em>setpoint SP(t)</em> and the current stock value <em>S(t)</em>: <em>e(t) = SP(t) - S(t)</em>. The <em>control u(t)</em> accordingly is the rate affecting the stock:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/PID_Control/Formula.svg\" alt=\"y(t) = ... \"></p>
<p>There is <strong><em>proportional</em></strong> control <em>k e(t)</em> that is immediately acting upon any deviation between stock value and setpoint. The controller also has an <strong><em>integral</em></strong> component that is aiming at correcting the accumulated error within a time span of <code>Ti</code> units of time. Finally, the controller has a <strong><em>derivative</em></strong> component that uses the current rate of change in the error to predict the error <code>Td</code> units of time into the future.</p>
<p>The control's <em>setpoint</em> can be provided either by an embedded →<a href=\"modelica://BusinessSimulation.InformationSources.RampInput\"><code>RampInput</code></a> or by an exogenous input <strong>u</strong>. In case of a <em>ramp input</em> the setpoint will move from <code>initialSetpoint</code> to <code>finalSetpoint</code> in linear fashion for a period given by <code>duration</code> starting at <code>startTime</code>.</p>
<p>The controller by default is active over the whole simulation run, but can be restricted to an <em>on-off period</em> using <code>tc = TimingChoices.period</code> and the parameters <code>onTime</code> and <code>offTime</code>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/PID_Control/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleControl\">SimpleControl</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.InputControl\">InputControl</a>,
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy.PID\">PID</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li><br>
<li>Class adapted as to be compliant with MSL 4.0.0 in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PID_Control;
