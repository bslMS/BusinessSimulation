within BusinessSimulation.Functions;

encapsulated function hunt "Find left index in an ordered list of value given a start index value"
  import BusinessSimulation.Icons.Function;
  import BusinessSimulation.Functions.bitShiftRight;
  extends Function;
  input Real x "Value to locate in a list";
  input Real[:] xVals "Ordered list of values";
  input Integer jsav = 1 "Start index value for the search";
  output Integer res "Index for the list so that xVals[res] <= x <= xVals[res+1]";
protected
  Integer n = size(xVals, 1) "Length of the list of values";
  Boolean ascendingQ "= true, if the list is ascending";
  Integer jl, jm, ju "Index values for the search";
  Integer inc "Increment";
  Boolean cond "Partial condition in a nested Boolean expression";
algorithm
  // initialize the hunt
  ascendingQ := xVals[n] >= xVals[1];
  inc := 1;
  jl := jsav;
  if jl < 1 or jl > n then
    // if the initial guess is not useful go to bisection immediately
    jl := 1;
    ju := n;
  else
    // either hunt up or down
    cond := x >= xVals[jl];
    if cond == ascendingQ then
      // hunt up
      while true loop
        ju := jl + inc;
        if ju >= n then
          // then off end of list
          ju := n;
          break;
        else
          cond := x < xVals[ju];
          if cond == ascendingQ then
            // found bracket
            break;
          else
            // not done, so double the increment and try again
            jl := ju;
            inc := inc + inc;
          end if;
        end if;
      end while;
    else
      // hunt down
      ju := jl;
      while true loop
        jl := jl - inc;
        if jl <= 1 then
          // end of table
          jl := 1;
          break;
        else
          cond := x >= xVals[jl];
          if cond == ascendingQ then
            // found bracket
            break;
          else
            // not done, so double the increment and try again
            ju := jl;
            inc := inc + inc;
          end if;
        end if;
      end while;
    end if;
  end if;
  // hunt is done, so begin final bisection phase
  while ju - jl > 1 loop
    jm := bitShiftRight(ju + jl);
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
<br>
<pre>
Functions.<strong>hunt</strong>(x, {x1, x2, x3, ... xn}); // jsav = 1
Functions.<strong>hunt</strong>(x, {x1, x2, x3, ... xn}, jsav);
</pre>
<br>
<h4>Implementation</h4>
<p>The implementation closely follows that given in Press et al. [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">26</a>, pp. 115-117]</p>
<h4>Examples</h4>
<br>
<pre>
hunt(1.9, {0,1,2,3,4}, 1); // 2
hunt(2.5, {3,2,1,0}, 1);   // 1
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.locate\">locate</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end hunt;
