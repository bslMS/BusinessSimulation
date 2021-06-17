within BusinessSimulation.Converters;

package Vector "Converters with vector input and/or vector output"
  extends Icons.Package;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>This package ontains converters where either input or output or both can be vectors of a given dimension.</p>
<h4>Technical Notes</h4>
<p>There is currently no support in Wolfram SystemModeler for flexible array sizes (\"<code>:</code>\") for connectors used with blocks. Therefore the actual size of array inputs has to be given as a parameter upon instantiating a converter in a model.</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {255, 255, 255}, lineThickness = 8, extent = {{-30, -30}, {30, 30}}), Polygon(visible = true, origin = {-48.263, 0}, rotation = -1440, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {10, 0}, {-10, -10}, {-10, 10}}), Ellipse(visible = true, origin = {-51.403, 0}, lineColor = {255, 255, 255}, fillColor = {113, 166, 201}, fillPattern = FillPattern.Solid, extent = {{-3.32, -3.32}, {3.32, 3.32}}), Polygon(visible = true, origin = {50, 0}, rotation = -1080, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {10, 0}, {-10, -10}, {-10, 10}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Vector;
