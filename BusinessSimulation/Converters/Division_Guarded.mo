within BusinessSimulation.Converters;

block Division_Guarded "Division guarded for division by zero"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SO;
  Interfaces.Connectors.RealInput u1 "Nominator input" annotation(Placement(visible = true, transformation(origin = {-145, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u2 "Denominator input" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType outputIfZero = 0 "Output, if denominator (u2) is zero (default = 0)";
equation
  // as division by zero is to be avoided at all cases event checking has to be turned off
  y = if noEvent(u2 < 0 or u2 > 0) then u1 / u2 else outputIfZero;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is obtained by <em>guarded&nbsp;division</em> of the <strong>nominator</strong> input <strong>u1</strong> and the <strong>denominator</strong> input <strong>u2:</strong></p>
<p><code>y = u1/u2<br><br></code>If <strong>u2</strong> is equal to zero, then <code>outputIfZero</code> is returned.</p>
<h4>Implementation</h4>
<p><code>y = <strong>if</strong> <strong>noEvent</strong>(u2 &lt; 0 <strong>or</strong> u2 &gt; 0) <strong>then</strong> u1 / u2 <strong>else</strong> outputIfZero;</code></p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Division\">Division</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, rotation = -45, points = {{20, 20}, {-20, -20}}, color = {0, 0, 128}, thickness = 4), Line(visible = true, origin = {-60.109, 49.884}, rotation = -990, points = {{0.116, -0.109}, {0.116, -47.528}, {-19.884, -47.528}}, color = {0, 0, 128}, thickness = 3), Line(visible = true, origin = {-33.755, -50}, rotation = -270, points = {{0, 26.245}, {0, -43.755}, {15.751, -43.755}}, color = {255, 0, 0}, thickness = 3), Text(visible = true, origin = {0, 15}, textColor = {0, 0, 128}, extent = {{-30, -12}, {30, 12}}, textString = "Nom", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0.75, -15}, textColor = {255, 0, 0}, extent = {{-29.25, -12}, {29.25, 12}}, textString = "Den", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Division_Guarded;
