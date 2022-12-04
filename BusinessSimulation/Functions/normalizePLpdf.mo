within BusinessSimulation.Functions;

encapsulated function normalizePLpdf "Normalize a piecewise linear density function given by a list of points"
  import BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.{rescaleVector,areaLineSegment,normalizationConstant};
  extends Function;
  input Real[:, 2] plPDF "Piecewise linear probability density function, i.e., { p1, p2, ... }";
  input Boolean rescaleQ = true "= true, if support is to be rescaled to the unit interval";
  output Real[size(plPDF, 1), 2] y "Normalized distribution density function with support [0,1]";
protected
  Integer n = size(plPDF, 1) "Number of points in the piecewise linear density function";
  Real[n] support "Support for the PDF";
  Real nc "Normalization constant";
algorithm
  support := if rescaleQ then rescaleVector(plPDF[:, 1]) else plPDF[:, 1];
  y := transpose({support, plPDF[:, 2]});
  nc := normalizationConstant(y);
  y := if nc > 0 then transpose({support, plPDF[:, 2] ./ nc}) else plPDF;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is a normalized piecewise linear probability distribution function specified by a list of points <code>{{x1,f(x1)}, {x2,f(x2}}, ... ,{xn, f(xn)}</code>, where the <em>support</em> may be rescaled to the unit interval (<code>rescaleQ = true</code>) and the area under the curve is equal to one.</p>
<h4>Notes</h4>
<p>If the normalization constant is not greater than zero, the function will simply return the input, albeit with possibly rescaled first dimension.</p>
<h4>Syntax</h4>
<pre>
Functions.<strong>normalizePLpdf</strong>({{x1,y1},{x2,y2}, ...});          // rescaleQ = true
Functions.<strong>normalizePLpdf</strong>({{x1,y1},{x2,y2}, ...}, rescaleQ = false);
</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
normalizePLpdf({{0,2},{5,2},{10,2}});         // {{0,1},{0.5,1},{1,1}}
normalizePLpdf({{0,0},{5,1},{10,0}});         // {{0,0},{0.5,2},{1,0}}
normalizePLpdf({{0,2},{5,2},{10,2}}, false);  // {{0,0.1},{5,0.1},{10,0.1}}
</pre>
<br>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end normalizePLpdf;
