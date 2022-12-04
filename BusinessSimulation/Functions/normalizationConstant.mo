within BusinessSimulation.Functions;

encapsulated function normalizationConstant "Calculate the normalization constant for a distribution given by a piecewise linear density function"
  import ICON = BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.areaLineSegment;
  extends ICON;
  input Real[:, 2] plPDF "Piecewise linear probability density function, i.e., { p1, p2, ... }";
  output Real y "Area under the probability density function";
protected
  Integer n = size(plPDF, 1) "Number of points in the piecewise linear density function";
algorithm
  y := sum(array(areaLineSegment(plPDF[i], plPDF[i + 1]) for i in 1:n - 1));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the <em>area</em> under a piecewise linear probability distribution function specified by a list of points <strong>p1, p2, ... pn</strong>.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>normalizationConstant</strong>({{x1,y1},{x2,y2}, ...});</code></p>
<h4>Implementation</h4><br>
<pre>y := sum(array(areaLineSegment(plPDF[i], plPDF[i + 1]) for i in 1:n - 1));</pre><br>
<h4>Examples</h4>
<br>
<pre>
normalizationConstant({{1,1},{2,2}});    // 1.5
normalizationConstant({{0,1},{10,1}});   // 10.0
</pre>
<br>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end normalizationConstant;
