within BusinessSimulation.Functions;

encapsulated function areaLineSegment "Calculate the area under a line segment"
  import BusinessSimulation.Icons.Function;
  extends Function;
  input Real[2] p1, p2 "Points whose ordinates have the same sign";
  output Real y "Area between the abscissa and the line within the closed interval [p1[1], p2[1]]";
algorithm
  y := abs((p2[1] - p1[1]) * (p1[2] + p2[2]) / 2);
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the <em>area</em> under a line given by two points <strong>p1, p2</strong> which are assumed to be either both above or both below the abscissa, i.e., the ordinates of the points have the same sign.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>areaLineSegment</strong>(p1, p2);</code></p>
<h4>Implementation</h4><br>
<pre>y := abs((p2[1] - p1[1]) * (p1[2] + p2[2]) / 2);</pre><br>
<h4>Examples</h4>
<br>
<pre>
areaLineSegment({1,1},{2,1}); // 1.0
areaLineSegment({1,1},{2,2}); // 1.5
</pre>
<br>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end areaLineSegment;
