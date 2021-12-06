within BusinessSimulation.CausalLoop;

model SketchVariable "Class to be used for comments or sketch variables"
  import NAME = BusinessSimulation.Icons.ConstantConverterName;
  extends NAME;
  /* Sketch variable */
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>A <em>sketch varible</em> can be used for quickly <em>drawing</em> a diagram for a model that is not to be simulated, but at the same time will make sure that variable names are <em>unique</em> and can be given a <em>comment</em>.</p>
<h4>Notes</h4>
<p>
While it is possible to simply use the <em>drawing tools</em> in SystemModeler to sketch causal loop diagrams, doing so has the disadvantage, that variables cannot be commented upon and that there may be dublicates.
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end SketchVariable;
