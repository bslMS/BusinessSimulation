within BusinessSimulation.Interfaces.PartialCLD;

partial model Flow "Partial interaction for causal loop diagramming"
  Connectors.FlowPort portA annotation(Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.FlowPort portB annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealInput u if hasFactor "Factor input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  parameter Boolean hasFactor = false "= true, if coefficients are to be multiplied with input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasRateOutput = false "= true, if the rate is reported via real output connectors" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Connectors.RealOutput y(quantity = "Rate", unit = "1/s") if hasRateOutput "Output of current rate of flow" annotation(Placement(visible = true, transformation(origin = {161.845, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Connectors.RealOutput y1(quantity = "Rate", unit = "1/s") if hasRateOutput "Output of current rate of flow" annotation(Placement(visible = true, transformation(origin = {162.083, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
protected
  Connectors.RealOutput one = 1.0 if not hasFactor "Default factor" annotation(Placement(visible = true, transformation(origin = {-135, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -720), iconTransformation(origin = {-42, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This class has two flow ports and is intended to work like regular <em>unidirectional</em> flow components. There is an output connector <code>one</code> to provide a constant <em>factor</em> of 1 and an optional input connector <strong>u</strong> for exogenous factor input.</p>
<p>Upon <code>hasRateOutput = true</code> the component will activate two optional outputs <code>(y, y1)</code> for rate information reporting.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {38.72, 0}, rotation = -90, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-10, -7.744}, {10, -7.744}, {0, 1.28}}), Line(visible = true, origin = {-6.667, 0}, points = {{-33.333, 0}, {40.667, 0}}, color = {0, 128, 0}, thickness = 1)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Flow;
