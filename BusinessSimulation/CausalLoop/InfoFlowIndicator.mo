within BusinessSimulation.CausalLoop;

model InfoFlowIndicator "Directional indicator for information flows in a diagram"
  import ICON = BusinessSimulation.Icons.InfoFlowIndicatorDiagram;
  extends ICON;
  /* label */
  annotation(defaultComponentName = "lab", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>information flow indicator</em> can be used to clarify direction of information flows where appropriate in more complex diagrams. The component will not introduce any equations and is intended for diagramming purposes only.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.MatFlowIndicator\">MatFlowIndicator</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end InfoFlowIndicator;
