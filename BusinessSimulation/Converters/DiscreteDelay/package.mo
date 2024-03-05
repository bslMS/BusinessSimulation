within BusinessSimulation.Converters;

package DiscreteDelay "Discrete or delay converters"
  extends Icons.Package;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This package contains <em>converters</em> which have an internal stock or state—exemplified by rectangular icons. This can be <em>discrete processes</em> of information collection as in the <code>Sampler</code> or <code>SampleIfTrue</code> converters, or it can be <em>information delays</em> where the perceived or reported information will follow the actual information with some lag.</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, lineThickness = 4, extent = {{-50, -30}, {50, 30}}), Polygon(visible = true, origin = {67.809, 0}, rotation = -1080, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {10, 0}, {-10, -10}, {-10, 10}}), Polygon(visible = true, origin = {-64.857, 0}, rotation = -1440, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {10, 0}, {-10, -10}, {-10, 10}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DiscreteDelay;
