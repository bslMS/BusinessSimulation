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
    if y == false then
      return;
    end if;
  end for;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The function takes a vector of Booleans and will return true, if all of the elements in the input vector is true, and false otherwise.</p>
<h4>Syntax</h4>
<br>
<pre>Functions.<strong>allTrueQ</strong>(vec);</pre>
<br>
<h4>Examples</h4>
<br>
<pre>
Functions.allTrueQ({false, false, false}); // false
Functions.allTrueQ({true, true, true}); // true
Functions.allTrueQ({false, false, true}); // false
</pre>
<br>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.noneTrueQ\">Functions.noneTrueQ</a></p>
</html>", revisions = "<html>
<ul>
<li>Changed to shortcircuit evaluation and added <code>inline = true</code> in v2.2.</li><br>
</ul>
</html>"), inline = true);
end allTrueQ;
