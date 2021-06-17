within BusinessSimulation.Converters;

package Lookup "Table- or Lookup-Functions"
  extends Icons.Package;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p><em>Table</em>- or <em>Lookup-Functions</em> usually map some variable (usually normalized as a dimensionless input) onto a real number by either providing a <em>parametric funcion</em> or a<em> table of values</em> which is then used for interpolation. Typically lookup functions are <em>nonlinear</em> functions and introduce nonlinearity to dynamic models [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">3</a>, Ch. 14].</p>
<h4>Acknowledgements</h4>
<p>The parametric lookup functions presented in this package are to a great part inspired by an article written by Khalid Saeed and Arit Irmaridiris [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">4</a>]. They either directly use the proposed functional form from that&nbsp;article or were slightly modified by the author of the Business Simulation Library using Wolfram Mathematica.</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {8.727, -28.173}, points = {{-53.606, 0}, {47.157, 0}}, color = {255, 255, 255}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(visible = true, origin = {-40, 11.52}, rotation = -270, points = {{-48.025, 0}, {9.546, 0}, {38.48, 0}}, color = {255, 255, 255}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(visible = true, origin = {11.346, -8.899}, points = {{13.937, 32.823}, {-9.408, 32.823}, {-23.387, -7.757}, {-51.346, -7.757}}, color = {255, 255, 255}, thickness = 5, smooth = Smooth.Bezier)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Lookup;
