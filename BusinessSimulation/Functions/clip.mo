within BusinessSimulation.Functions;

function clip "Clip values so they do not extend beyond a given interval"
  extends BusinessSimulation.Icons.Function;
  input Real x[:] "List of values to be clipped";
  input Real[2] interval = {-1, 1} "Interval [min,max] given as a list (default = {-1,1})";
  output Real y[size(x, 1)] "Clipped values";
protected
  Integer n = size(x, 1) "Length of the input vector x";
algorithm
  for i in 1:n loop
    y[i] := if x[i] < interval[1] then interval[1] elseif x[i] > interval[2] then interval[2] else x[i];
  end for;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The function will <em>clip</em> a list of input values <code>x</code> so that any component <code>x_i</code> of <code>x</code> will be <code>x_i</code> for <code>min &le; x_i &le; max</code>, <code>min</code> for <code>x_i &lt; min</code>, and <code>max</code> for <code>x_i &gt; max</code>.&nbsp;</p>
<h4>Syntax</h4>
<br>
<pre>Function.<strong>clip</strong>(x);&nbsp;              // {min, max} = {-1,1}<br>Function.<strong>clip</strong>(x, {min, max});&nbsp;                </pre>
<h4>Examples</h4>
<br>
<pre>Function.clip({-3,-2,-1,0,1,2,3});        // {-1,-1,-1,0,1,1,1} <br>Function.clip({-3,-2,-1,0,1,2,3},{-2,2}); // {-2,-2,-1,0,1,2,2}</pre>
<h4>Notes</h4>
<p>This function is closely modeled to <a href=\"https://reference.wolfram.com/language/ref/Clip.html\"><code>Clip</code></a>&nbsp;in the Wolfram Languag<em>e</em>.</p></html>", revisions = "<html>
<ul>
<li>Added <code>Inline = true</code> in v2.1.0.</li>
</ul>
<html>"));
end clip;
