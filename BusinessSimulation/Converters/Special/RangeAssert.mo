within BusinessSimulation.Converters.Special;

block RangeAssert "Do assert() checks to monitor an admissable range of values"
  import BusinessSimulation.Constants.*;
  extends Icons.Converter;
  Interfaces.Connectors.RealInput u "Real input" annotation(Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real maxValue = inf "Upper value for admissable range";
  parameter Real minValue = -inf "Lower value for admissable range";
  parameter Boolean causeError = true "= true, if level = AssertionLevel.error" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
equation
  if causeError then
    assert(u <= maxValue, "Value out of range (too high)", level = AssertionLevel.error);
    assert(u >= minValue, "Value out of range (too low)", level = AssertionLevel.error);
  else
    assert(u <= maxValue, "Value out of range (too high)", level = AssertionLevel.warning);
    assert(u >= minValue, "Value out of range (too low)", level = AssertionLevel.warning);
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The component will set up the following <code>assert</code> functions:</p>
<pre>assert(u &lt;= maxValue, \"Value out of range (too high)\", level = AssertionLevel.error);<br>assert(u &gt;= minValue, \"Value out of range (too low)\", level = AssertionLevel.error);</pre>
<br>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Special.VariableRangeAssert\">VariableRangeAssert</a></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 1.656}, textColor = {255, 0, 0}, extent = {{-56.96, -12}, {56.96, 12}}, textString = "assert", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {128, 128, 128}, extent = {{-56.96, -9}, {56.96, 9}}, textString = "min ≤ u ≤ max", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end RangeAssert;
