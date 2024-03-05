within BusinessSimulation.Interfaces.PartialConverters;

partial block InformationSource_SO "Generic Information Source"
  extends SO;
  extends Icons.InformationSourceIndicator;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.SO\">SO</a> partial converter class with a Real output connector. This is the base class for InformationSource components.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources\">InformationSources</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {76, 112, 136}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-58, -58}, {58, 58}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InformationSource_SO;
