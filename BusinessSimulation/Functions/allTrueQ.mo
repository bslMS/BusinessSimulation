within BusinessSimulation.Functions;

function allTrueQ "Gives true, if all elements in a vector of Booleans are true"
  extends BusinessSimulation.Icons.Function;
  input Boolean x[:] "Vector of booleans";
  output Boolean y "True, if all elements of the input vector are true";
protected
  Integer n = size(x, 1) "Length of the input vector x";
algorithm
  y := true;
  for i in 1:n loop
    y := y and x[i];
  end for;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function takes a vector of Booleans and will return true, if all of the elements in the input vector is true, and false otherwise.</p>
<h4>Syntax</h4>
<br>
<pre>Function.<strong>allTrueQ</strong>(vec);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>Function.allTrueQ({false, false, false}); // false</pre><pre>Function.allTrueQ({true, true, true}); // true</pre>
<pre>Function.allTrueQ({false, false, true}); // false</pre>
<br>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.noneTrueQ\">Functions.noneTrueQ</a></p>
</html>"));
end allTrueQ;
