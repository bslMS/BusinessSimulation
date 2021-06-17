within BusinessSimulation.Functions;

function rescaleVector "Rescale a list of values from one range to another"
  extends BusinessSimulation.Icons.Function;
  input Real x[:] "List of values (vector) to be rescaled";
  input Real x_range[2] = {min(x), max(x)} "Original range [min,max] given as a list (default = {min(x), max(x)})";
  input Real y_range[2] = {0, 1} "Rescaled range [y_min, y_max] given as a list (default = {0,1})";
  output Real y[size(x, 1)] "Rescaled value to run from y_min to y_max over the range min to max";
protected
  Integer n = size(x, 1) "Length of the input vector x";
algorithm
  y := array(BusinessSimulation.Functions.rescale(x[i], x_range, y_range) for i in 1:n);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The function will <em>rescale</em> the input vector to a vector whose elements run from range <code>y_min</code> to <code>y_max</code> over the range <code>min</code> to <code>max</code>.</p>
<h4>Syntax</h4>
<br>
<pre>Function.<strong>rescale</strong>(vec);&nbsp;                            // {min, max} = {min(vec), max(vec)};{y_min, y_max} = {0,1}<br>Function.<strong>rescale</strong>(vec, {min, max});&nbsp;                // {y_min,y_max} = {0,1}<br>Function.<strong>rescale</strong>(vec, {min, max}, {y_min, y_max});</pre>
<h4>Examples</h4>
<br>
<pre>Function.rescale({0,1,2,3,4,5,6,7,8,9,10});        // {0.,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0} <br>Function.rescale({4,5,6},{0, 10});                 // {0.4, 0.5, 0.6}<br>Function.rescale({4,5,6},{0,10},{10,20});          // {14.,15.,16.}</pre>
<h4>Notes</h4>
<p>This function is closely modeled to <a href=\"https://reference.wolfram.com/language/ref/Rescale.html\"><code>Rescale</code> </a>in the Wolfram Languag<em>e</em>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.rescale\">Functions.rescale</a></p></html>", revisions = ""));
end rescaleVector;
