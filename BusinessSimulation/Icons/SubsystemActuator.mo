within BusinessSimulation.Icons;

partial class SubsystemActuator "Icon for subsystems with flow ports"
  extends ComponentName;
  constant String iconLabel = "";
  annotation(Documentation(revisions = "<html>
<ul>
<li><code>iconLabel</code> added in v2.0.0.</li><br>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>By modifying <code>constant String iconLabel = \"\";</code> an icon label will show in the Icon View with a matching color.</p>
<h4>Notes</h4>
<p>In Wolfram SystemModeler the value given for <code>Font size</code> in the menu <em>Tools > Options... > Model Center > Graphical Class Views > General > Component Text</em> will override any local settings for the display of <code>iconLabel</code>.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-100, -100}, {100, 100}}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "%iconLabel", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SubsystemActuator;
