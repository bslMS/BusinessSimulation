within BusinessSimulation.MoleculesOfStructure.Policy;

block PID "Limited PID controller"
  extends Interfaces.PartialConverters.Policy_SO;
  import BusinessSimulation.Constants.{small,inf,eps};
  import BusinessSimulation.Units.Time;
  import Modelica.Blocks.Types.InitPID;
  import Modelica.Blocks.Types.Init;
  import Modelica.Blocks.Types.SimpleController;
  Interfaces.Connectors.RealInput u_desiredValue "The goal to meet (setpoint)" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Interfaces.Connectors.RealInput u_currentValue "The measured state of the system under control" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
  Interfaces.Connectors.RealInput u_feedForward if hasFeedForward "An optional feedforward input" annotation(Placement(visible = true, transformation(origin = {-145, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
  parameter .Modelica.Blocks.Types.SimpleController controllerType = Modelica.Blocks.Types.SimpleController.PID "Type of controller" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasFeedForward = false "Use feed-forward input? (PID.withFeedForward)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real k(min = 0) = 1 "Gain of controller";
  parameter Modelica.SIunits.Time Ti(min = small) = 0.5 "Time constant of Integrator block" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PI or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Modelica.SIunits.Time Td(min = 0) = 0.1 "Time constant of Derivative block" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real yMax = inf "Upper limit of output";
  parameter Real yMin = -yMax "Lower limit of output";
  parameter Real wp(min = 0) = 1 "Set-point weight for Proportional block (0..1)";
  parameter Real wd(min = 0) = 0 "Set-point weight for Derivative block (0..1)" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Ni(min = 100 * eps) = 0.9 "Ni*Ti is time constant of anti-windup compensation" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PI or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Nd(min = 100 * eps) = 10 "The higher Nd, the more ideal the derivative block" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real kFF = 1 "Gain of feed-forward input" annotation(Dialog(enable = withFeedForward));
  parameter .Modelica.Blocks.Types.InitPID initType = .Modelica.Blocks.Types.InitPID.DoNotUse_InitialIntegratorState "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real xi_start = 0 "Initial or guess value for integrator output (= integrator state)" annotation(Dialog(group = "Initialization", enable = controllerType == .Modelica.Blocks.Types.SimpleController.PI or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real xd_start = 0 "Initial or guess value for state of derivative block" annotation(Dialog(group = "Initialization", enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real y_start = 0 "Initial value of output" annotation(Dialog(enable = initType == .Modelica.Blocks.Types.InitPID.InitialOutput, group = "Initialization"));
  parameter Modelica.Blocks.Types.LimiterHomotopy homotopyType = Modelica.Blocks.Types.LimiterHomotopy.Linear "Simplified model for homotopy-based initialization" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Boolean strict = false "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, choices(checkBox = true), Dialog(tab = "Advanced"));
  parameter Boolean limitsAtInit = true "Has no longer an effect and is only kept for backwards compatibility (the implementation uses now the homotopy operator)" annotation(Dialog(tab = "Dummy"), Evaluate = true, choices(checkBox = true));
protected
  Modelica.Blocks.Continuous.LimPID PID(controllerType = Modelica.Blocks.Types.SimpleController.PID, withFeedForward = hasFeedForward, Ti = Ti, k = k, Td = Td, yMax = yMax, yMin = yMin, wp = wp, wd = wd, Ni = Ni, Nd = Nd, kFF = kFF, xi_start = xi_start, xd_start = xd_start, y_start = y_start, homotopyType = homotopyType) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_desiredValue, PID.u_s) annotation(Line(visible = true, origin = {-78.5, 0}, points = {{-66.5, 0}, {66.5, 0}}, color = {0, 0, 127}));
  connect(u_currentValue, PID.u_m) annotation(Line(visible = true, origin = {-48.333, -30.667}, points = {{-96.667, -9.333}, {48.333, -9.333}, {48.333, 18.667}}, color = {0, 0, 127}));
  connect(PID.y, y) annotation(Line(visible = true, origin = {85.5, 0}, points = {{-74.5, 0}, {74.5, 0}}, color = {0, 0, 127}));
  connect(u_feedForward, PID.u_ff) annotation(Line(visible = true, origin = {-44.333, -44}, points = {{-100.667, -16}, {50.333, -16}, {50.333, 32}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This element makes use of the →<a href=\"modelica://Modelica.Blocks.Continuous.LimPID\">LimPID</a>&nbsp;element in the Modelica Standard Library. The controller is a very flexible component which allows to model P, PI, PD, PID controllers as needed.</p>
<p>A PID controller continually calculates the error <code>e(t) = u_desiredValue - u_currentValue</code> and then applies a correction based upon  <em>proportional</em> (P), <em>integral</em> (I), and <em>derivatice</em> (D) terms.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-77.269, -12}, {77.269, 12}}, textString = "P I D", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PID;
