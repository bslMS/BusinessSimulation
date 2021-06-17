within BusinessSimulation.Functions;

function janoschek "Janoschek's Growth Curve"
  extends BusinessSimulation.Icons.Function;
  input Real x "x-Value";
  input Real b "Lower asymptote";
  input Real l "Upper asymptote";
  input Real k "Growth rate";
  input Real d "Control of abscissa for the point of inflection";
  output Real y;
algorithm
  y := l - (l - b) * exp(-k * x ^ d);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This function models <em>Janoschek's growth curve</em>&nbsp;[<a href=\"modelica://BusinessSimulation.UsersGuide.References\">19</a>] given the real input <strong>x</strong> and the specifying real inputs <strong><code>b, l, k, d</code></strong>. The formula for the real output <strong>y</strong> is:</p>
<p><code>y := 1 - (l - b) * <strong>exp</strong>(-k * x ^ d);</code></p>
<h4>Syntax</h4>
<p><code>Functions.<strong>janoschek</strong>(x, b, l, k, d);</code></p>
<h4>Examples</h4>
<br>
<pre>BusinessSimulation.Functions.janoschek(2, b = 0, l = 2, k = 2, d = 1); // 1.963369</pre>
<br>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Lookup.JanoschekPositive\">JanoschekPositive</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Lookup.JanoschekNegative\">JanoschekNegative</a></p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end janoschek;
