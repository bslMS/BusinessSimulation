within BusinessSimulation.Functions;

function geometricMean "(Weighted) geometric mean"
  import BusinessSimulation.Constants.{inf, small};
  extends BusinessSimulation.Icons.Function;
  input Real[:] x "Vector input";
  input Real[size(x, 1)] weights = ones(size(x, 1)) "Vector of weights";
  output Real y;
protected
  Real[n] w "Normalized and clipped weights";
  Integer n = size(x, 1) "Length of the input vector";
algorithm
  // clip weights to eliminate negative values
  w := BusinessSimulation.Functions.clip(weights, {0, inf});
  y := if min(x) < small then 0 else exp(sum(log(x[i]) * w[i] for i in 1:n) / sum(w));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the <em>geometric mean</em> of the components of the input vector <strong>x</strong>. As a second argument a vector of positive weights (default = 1 for each weight) can be given to calculate the weighted geometric mean.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>geometricMean</strong>(x);</code><br>
<code>Functions.<strong>geometricMean</strong>(x, weights);</code></p>
<h4>Implementation</h4><br>
<pre>  w := BusinessSimulation.Functions.clip(weights, {0, inf});
  y := if min(x) < small then 0 else exp( sum( log(x[i]) * w[i] for i in 1:n ) / sum(w) );</pre><br>
<h4>Notes</h4>
<ul>
<li>If any component of the input vector is zero or negative, the output will be zero.<br><br></li>
<li>Any negative weight will be set to zero in order to prevent negative weights.</li>
</ul>
<h4>Examples</h4>
<br>
<pre>
Functions.geometricMean({10, 20});        // 14.1421..
Functions.geometricMean({ 0, 20});        //  0.0
Functions.geometricMean({10, 20},{1,10}); // 18.7786..
Functions.geometricMean({10, 20},{1,-1}); // 10.
</pre>
<br>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.Vector.GeometricMean\">GeometricMean</a>,
<a href=\"modelica://BusinessSimulation.Functions.arithmeticMean\">arithmeticMean</a>
</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end geometricMean;
