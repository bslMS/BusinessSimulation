within BusinessSimulation.CausalLoop;

model LoopIndicator_CW "Loopindicator for clockwise feedback loop"
  import ICON = BusinessSimulation.Icons.ClockwiseLoop;
  import NAME = BusinessSimulation.Icons.ConstantConverterName;
  extends ICON;
  extends NAME;
  parameter String pol = "+" "Loop polarity" annotation(choices(choice = "+", choice = "–", choice = "±"));
  /* Loop indicator */
  annotation(defaultComponentName = "L", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>clockwise loop indicator</em> can be used to inidcate a <em>feedback loop</em> of polarity <code>pol</code> in a diagram. The component will not introduce any equations and is intended for diagramming purposes only.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.LoopIndicator_CCW\">LoopIndicator_CCW</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {64, 64, 64}, extent = {{-45, -6}, {45, 6}}, textString = "%pol", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end LoopIndicator_CW;
