within BusinessSimulation.Converters;

block Clip "Clips input signal so that it remains within a given interval"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import Modelica.Blocks.Types.{LimiterHomotopy,VariableLimiterHomotopy};
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_max if not hasConstantLimits "Upper limit input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_min if not hasConstantLimits "Lower limit input" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  parameter Real maxValue = inf "Maximum value (default = infinity)" annotation(Dialog(enable = hasConstantLimits));
  parameter Real minValue = -maxValue "Minimum value (default = - infinity)" annotation(Dialog(enable = hasConstantLimits));
  parameter Boolean hasConstantLimits = true "= true, if the limits are constant" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (constantLimiter.strict)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter LimiterHomotopy homotopyType = LimiterHomotopy.Linear "Simplified model for homotopy-based initialization (constantLimiter.homotopyType)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter VariableLimiterHomotopy variableHomotopyType = VariableLimiterHomotopy.Linear "Simplified model for homotopy-based initialization (variableLimiter.homotopyType)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
protected
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter(strict = strict, homotopyType = variableHomotopyType) if not hasConstantLimits "Clip input to variable limits" annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter constantLimiter(uMax = maxValue, uMin = minValue, strict = strict, homotopyType = homotopyType) if hasConstantLimits "Clip input to constant limits" annotation(Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, constantLimiter.u) annotation(Line(visible = true, origin = {-76.75, 15}, points = {{-68.25, -15}, {16.75, -15}, {16.75, 15}, {64.75, 15}}, color = {0, 0, 128}));
  connect(constantLimiter.y, y) annotation(Line(visible = true, origin = {75.317, 15}, points = {{-64.317, 15}, {4.683, 15}, {4.683, -15}, {84.951, -15}}, color = {1, 37, 163}));
  connect(u, variableLimiter.u) annotation(Line(visible = true, origin = {-69.25, -10}, points = {{-75.75, 10}, {9.25, 10}, {9.25, -10}, {57.25, -10}}, color = {0, 0, 128}));
  connect(u_max, variableLimiter.limit1) annotation(Line(visible = true, origin = {-78.845, 14}, points = {{-66.155, 26}, {-1.155, 26}, {-1.155, -26}, {66.845, -26}}, color = {0, 0, 128}));
  connect(u_min, variableLimiter.limit2) annotation(Line(visible = true, origin = {-79.25, -34}, points = {{-65.75, -6}, {-0.75, -6}, {-0.75, 6}, {67.25, 6}}, color = {0, 0, 128}));
  connect(variableLimiter.y, y) annotation(Line(visible = true, origin = {82.817, -10}, points = {{-71.817, -10}, {-2.817, -10}, {-2.817, 10}, {77.451, 10}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The input <strong>u</strong>&nbsp;will be <em>clipped</em> to make sure that it is within the interval <code>[minValue, maxValue]</code> before it is given as output <strong>y</strong>. Alternatively, variable inputs can be used to set the limits (<code>hasConstantLimits = false</code>).</p>
<h4><strong>Implementation</strong></h4>
<p>The component internally uses the →<a href=\"modelica://Modelica.Blocks.Nonlinear.Limiter\">Limiter</a> and the →<a href=\"modelica://Modelica.Blocks.Nonlinear.VariableLimiter\">VariableLimiter</a> from the Modelica Standard Library.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.clip\">Functions.clip</a>, <a href=\"modelica://BusinessSimulation.Converters.Vector.Clip\">Vector.Clip</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ClipProcessTime\">ClipProcessTime</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ZeroIfNegative\">ZeroIfNegative&nbsp;</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-36.812, -12}, {36.812, 12}}, textString = "CLIP", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Clip;
