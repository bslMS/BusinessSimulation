within BusinessSimulation.Functions;

function noneTrueQ "Gives true, if no element in a vector of Booleans is true"
  extends BusinessSimulation.Icons.Function;
  input Boolean x[:] "Vector of booleans";
  output Boolean y "True, if no element of the input vector is true";
protected
  Integer n = size(x, 1) "Length of the input vector x";
algorithm
  y := true;
  for i in 1:n loop
    y := y and not x[i];
  end for;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function takes a vector of Booleans and will return true, if none of the elements in the input vector is true, and false otherwise.</p>
<h4>Syntax</h4>
<br>
<pre>Function.<strong>noneTrueQ</strong>(vec);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>Function.noneTrueQ({false, false, false}); // true</pre><pre>Function.noneTrueQ({true, false, false}); // false</pre>
<pre>Function.noneTrueQ({false, false, true}); // false</pre>
<br>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.allTrueQ\">Functions.allTrueQ</a></p>
</html>"));
end noneTrueQ;
