within BusinessSimulation.Functions;

encapsulated function interpolate "Interpolate in an ordered list of tuples"
  import BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.{rawInterpolate, hunt, locate};
  extends Function;
  input Real x "Value to locate in a list";
  input Real[:, 2] tuples "Ordered list of values";
  input Integer jlo = 1 "Index start value for the search";
  output Real y "Interpolated value";
  output Integer jsav "Index value used for the current interpolation";
protected
  Integer n = size(tuples, 1) "Length of the list of tuples";
  Real[n] xVals = tuples[:, 1] "Abscissa values for the list of tuples";
algorithm
  jsav := max(1, jlo);
  if jsav == 1 then
    // use locate
    jsav := locate(x, xVals);
  else
    // use hunt
    jsav := hunt(x, xVals, jsav);
  end if;
  y := rawInterpolate(x, tuples, jsav);
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the interpolated value given a list of tuples (<code>tuples = { {x1,y1}, {x2,y2}, ...}</code>) and an index value <code>jlo (default = 1)</code> to guide the search. The function will also return the actual index value <strong>jsav</strong> used for the interpolation.</p>
<h4>Syntax</h4>
<br>
<pre>
Functions.<strong>interpolate</strong>(x, tuples);  // jlo = 1
Functions.<strong>interpolate</strong>(x, tuples, jlo);
</pre>
<br>
<h4>Implementation</h4>
<p>The index value <code>jlo</code> is used to guide the further procedure: If <code>jlo == 1</code> then we assume that we are starting out a fresh search und accordingly <code>locate()</code> is used to come up with the correct index value to use for <code>rawInterpolate()</code>.</p>
<p>If <code>jlo > 1</code>, then we assume to already have searched in the list of tuples and we can use the last index value to speed up the search; accordingly <code>hunt</code> will be used to find the new index value.</p>
<h4>Examples</h4>
<br>
<pre>
interpolate(1.5, {{0,1},{1,2}, {2,4},{3,5}}); // (3.0, 2)
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.rawInterpolate\">rawInterpolate</a>,
<a href=\"modelica://BusinessSimulation.Functions.locate\">locate</a>,
<a href=\"modelica://BusinessSimulation.Functions.hunt\">hunt</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end interpolate;
