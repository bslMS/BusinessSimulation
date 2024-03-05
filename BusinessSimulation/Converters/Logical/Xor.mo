within BusinessSimulation.Converters.Logical;

block Xor "Logical 'xor'"
  extends Interfaces.PartialConverters.BooleanSI2SO;
equation
  y = (u1 or u2) and not (u1 and u2);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The boolean output <strong>y</strong> is <code>true</code>, if <em>either (but not both) </em> boolean inputs <strong>u1</strong> and <strong>u2</strong> are <code>true</code>, and <code>false</code> else.&nbsp;</p></html>", revisions = ""), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {190, 52, 178}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "XOR", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end Xor;
