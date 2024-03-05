within BusinessSimulation.Functions;

encapsulated function locate "Find left index in an ordered list of values"
  import BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.bitShiftRight;
  extends Function;
  input Real x "Value to locate in a list";
  input Real[:] xVals "Ordered list of values";
  output Integer res "Index for the list so that xVals[res] <= x <= xVals[res+1]";
protected
  Integer n = size(xVals, 1) "Length of the list of values";
  Boolean ascendingQ "= true, if the list is ascending";
  Integer jl, jm, ju "Index values for the search";
  Boolean cond "Partial condition in a nested Boolean expression";
algorithm
  // initialize the search
  ascendingQ := xVals[n] >= xVals[1];
  jl := 1;
  ju := n;
  // while we are not yet done iterate
  while ju - jl > 1 loop
    // find mid point for ju and jl
    jm := bitShiftRight(ju + jl);
    // replace either the lower or the upper limit as appropriate
    cond := x >= xVals[jm];
    if cond == ascendingQ then
      jl := jm;
    else
      ju := jm;
    end if;
  end while;
  // return jl
  res := jl;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>res</strong> is an index value for the ordered (either ascending or descending) list <strong>xVals</strong> so that for any <strong>x</strong> with <code>min(xVals) <= max(xVals)</code> the condition <code>xVals[res] <= x <= xVals[res+1]</code>.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>locate</strong>(x, {x1, x2, x3, ... xn});</code></p>
<h4>Implementation</h4>
<p>The implementation closely follows that given in Press et al. [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">26</a>, pp. 114f.]</p>
<h4>Examples</h4>
<br>
<pre>
locate(1.9, {0,1,2,3,4}); // 2
locate(2.5, {3,2,1,0});   // 1
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.hunt\">hunt</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end locate;
