within BusinessSimulation.CausalLoop;

model MatFlowIndicator "Directional indicator for material flows in a diagram"
  import ICON = BusinessSimulation.Icons.MatFlowIndicatorDiagram;
  extends ICON;
  /* label */
  annotation(defaultComponentName = "lab", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>material flow indicator</em> can be used to clarify direction of material flows where appropriate in more complex diagrams. The component will not introduce any equations and is intended for diagramming purposes only.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.InfoFlowIndicator\">InfoFlowIndicator</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end MatFlowIndicator;
