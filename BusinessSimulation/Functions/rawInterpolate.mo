within BusinessSimulation.Functions;

encapsulated function rawInterpolate "Interpolate in a list of tuples given the index value for the index value to the left"
  import BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.bitShiftRight;
  extends Function;
  input Real x "Value to locate in a list";
  input Real[:, 2] tuples "Ordered list of values";
  input Integer jlo "Index value to the left of x";
  output Real y "Interpolated value";
protected
  Integer n = size(tuples, 1) "Length of the list of tuples";
  Real[n] xVals = tuples[:, 1] "Abscissa values for the list of tuples";
  Boolean ascendingQ "= true, if the list of xVals is ascending";
  Boolean cond "Partial condition in a nested Boolean expression";
algorithm
  ascendingQ := xVals[n] >= xVals[1];
  cond := x < xVals[jlo];
  if cond == ascendingQ then
    // return the left side table value
    y := tuples[jlo, 2];
  else
    cond := x > xVals[jlo + 1];
    if cond == ascendingQ then
      // return right table value
      y := tuples[jlo + 1, 2];
    else
      // x is within the interval [ xVals[jlo], xVals[jlo+1] ]
      y := tuples[jlo, 2] + (tuples[jlo + 1, 2] - tuples[jlo, 2]) / (xVals[jlo + 1] - xVals[jlo]) * (x - xVals[jlo]);
    end if;
  end if;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the interpolated value given a list of tuples (<code>tuples = { {x1,y1}, {x2,y2}, ...}</code>) and the index value <code>jlo</code> as a result from the functions <code>hunt()</code> or <code>locate()</code>.</p>
<h4>Syntax</h4>
<br>
<pre>
Functions.<strong>rawInterpolate</strong>(x, tuples, jlo);
</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
rawInterpolate(1.5, {{0,1},{1,2}, {2,4},{3,5}}, 2); // 3.0
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.interpolate\">interpolate</a>,
<a href=\"modelica://BusinessSimulation.Functions.locate\">locate</a>,
<a href=\"modelica://BusinessSimulation.Functions.hunt\">hunt</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end rawInterpolate;
