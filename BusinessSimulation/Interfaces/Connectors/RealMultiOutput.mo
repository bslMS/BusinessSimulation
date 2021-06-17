within BusinessSimulation.Interfaces.Connectors;

connector RealMultiOutput = output Real "Multiple output signals" annotation(defaultComponentName = "y", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {100, 0}, {-100, -100}}), Ellipse(visible = true, origin = {-24.747, 0}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-24.747, -24.747}, {24.747, 24.747}})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {100, 0}, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 50}, {0, 0}, {-100, -50}}), Text(visible = true, origin = {0, 80}, textColor = {128, 128, 128}, extent = {{-100, -12}, {100, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>A Real <em>output</em> connector to indicate vector or list output.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealInput\">RealInput</a></p>
</html>"));
