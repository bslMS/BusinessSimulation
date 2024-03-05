within BusinessSimulation.Functions;

encapsulated function plCDF "Generate a piecewise linear cumulative distribution function from a piecewise linear density function"
  import BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.{normalizePLpdf, areaLineSegment};
  extends Function;
  input Real[:, 2] tuples "Piecewise linear function, i.e., { {x1,f(x1), {x2,f(x2)}, ... }";
  input Boolean rescaleQ = true "= true, if the support is to be rescaled to the unit interval";
  output Real[size(tuples, 1), 2] cdf "Piecewise linear cumulated distribution function";
protected
  Integer n = size(tuples, 1) "Number of points in the piecewise linear density function";
  Real[n, 2] pdf "Piecewise linear density function";
  Real nc "Normalization constant";
algorithm
  // normalize piecewise function if needed
  pdf := if rescaleQ then normalizePLpdf(tuples, rescaleQ = true) else normalizePLpdf(tuples, rescaleQ = false);
  // initialize cdf
  cdf[1] := {pdf[1, 1], 0};
  for i in 2:n loop
    cdf[i] := {pdf[i, 1], cdf[i - 1, 2] + areaLineSegment(pdf[i - 1], pdf[i])};
  end for;
  annotation(Documentation(info = "<html><div>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
</div>
<div>
<p>The output <strong>cdf</strong> is piecewise linear cumulative distribution function specified by a list of points <code>{{x1,F(x1)}, {x2,F(x2}}, ... ,{xn, F(xn)}</code>. The input <strong>tuples</strong> is assumed to be a piecewise linear function that by default (<code>rescaleQ= true</code>) will be normalized using <code>normalizePLpdf()</code> to come up with a piecewise linear density function that has the unit interval as its support.</p>
</div>
<div>
<h4>Syntax</h4>
</div>
<div>&nbsp;</div>
<div>
<pre>Functions.<strong>plCDF</strong>({{x1,y1},{x2,y2}, ...}); // rescaleQ= true
Functions.<strong>plCDF</strong>({{x1,y1},{x2,y2}, ...}, rescaleQ = false);</pre>
</div>
<div>&nbsp;</div>
<div>
<h4>Examples</h4>
</div>
<div>&nbsp;</div>
<div>
<pre><br />plCDF({{0,2},{5,2},{10,2}});      // {{0,0},{0.5,0.5},{1,1}}<br />plCDF({{0,1},{1,2},{2,4},{3,5}}); // {{0,0},{0.33..,0.16..},{0.66..,0.5},{1,1}}</pre>
</div>
<div>&nbsp;</div>
<div>
<h4>See also</h4>
</div>
<div>
<p><a href=\"modelica://BusinessSimulation.Functions.normalizePLpdf\">normalizePLpdf</a></p>
</div></html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end plCDF;
