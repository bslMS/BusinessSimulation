within BusinessSimulation.Interfaces.PartialConverters;

partial block InformationSource_MO "Information Source with multiple outputs"
  extends MO;
  extends Icons.InformationSourceIndicator;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.MO\">MO</a> partial converter class with multiple Real output connectors. This is the base class for InformationSource components with multiple outputs.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources\">InformationSources</a></p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InformationSource_MO;
