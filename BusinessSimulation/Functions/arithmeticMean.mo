within BusinessSimulation.Functions;

function arithmeticMean "(Weighted) arithmetic mean"
  import BusinessSimulation.Constants.inf;
  extends BusinessSimulation.Icons.Function;
  input Real[:] x "Vector input";
  input Real[size(x, 1)] weights = ones(size(x, 1)) "Vector of weights";
  output Real y;
protected
  Real[n] w "Normalized and clipped weights";
  constant Integer n = size(x, 1) "Length of the input vector";
algorithm
  // clip weights to eliminate negative values
  w := BusinessSimulation.Functions.clip(weights, {0, inf});
  y := sum(x[i] * w[i] for i in 1:n) / sum(w);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the <em>arithmetic mean</em> of the components of the input vector <strong>x</strong>. As a second argument a vector of positive weights (default = 1 for each weight) can be given to calculate the weighted arithmetic mean.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>arithmeticMean</strong>(x);</code><br>
<code>Functions.<strong>arithmeticMean</strong>(x, weights);</code></p>
<h4>Implementation</h4><br>
<pre>  w := BusinessSimulation.Functions.clip(weights, {0, inf});
  y := sum(x[i] * w[i] for i in 1:n) / sum(w);</pre><br>
<h4>Notes</h4>
<ul>
<li>Any negative weight will be set to zero in order to prevent negative weights.</li>
</ul>
<h4>Examples</h4>
<br>
<pre>
Functions.arithmeticMean({ 10, 20});        // 15.0
Functions.arithmeticMean({-20, 20});        //  0.0
Functions.arithmeticMean({ 10, 20},{1,10}); // 19.09..
Functions.arithmeticMean({ 10, 20},{1,-1}); // 10.
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.Vector.ArithmeticMean\">ArithmeticMean</a>,
<a href=\"modelica://BusinessSimulation.Functions.geometricMean\">geometricMean</a>
</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end arithmeticMean;
