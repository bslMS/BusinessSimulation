within BusinessSimulation.Converters;

block Gap "Compare goal (u1) and current value (u2) to determine gap"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SI2SO;
equation
  y = u1 - u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is obtained by subtracting input <strong>u2</strong> from input <strong>u1</strong>:</p>
<pre>&nbsp;y = u1 - u2;</pre></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-32.809, -50}, rotation = -990, points = {{-0, 27.191}, {-0, 1.074}}, color = {255, 0, 0}, thickness = 3), Line(visible = true, origin = {-21.062, -30}, rotation = -270, points = {{-20, 14.231}, {20, -14.231}}, color = {255, 0, 0}, thickness = 3, arrowSize = 10), Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {5, 5, 125}, fillPattern = FillPattern.Solid, extent = {{-11.872, -11.872}, {11.872, 11.872}}), Line(visible = true, origin = {-19.639, 27.324}, points = {{-14.516, 20.778}, {14.516, -20.778}}, color = {5, 5, 125}, thickness = 3, arrowSize = 10), Line(visible = true, origin = {33.017, 0}, rotation = -270, points = {{0, 25.332}, {0, -25.332}}, color = {5, 5, 125}, thickness = 3, arrowSize = 10), Line(visible = true, origin = {-29.824, 50}, rotation = -990, points = {{-0, 30.176}, {-0, 4.373}}, color = {0, 0, 128}, thickness = 3), Text(visible = true, origin = {1.181, 42.115}, textColor = {0, 0, 128}, extent = {{-21.181, -20}, {21.181, 20}}, textString = "+", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {1.402, -36}, textColor = {255, 0, 0}, extent = {{-15.402, -20}, {15.402, 20}}, textString = "‒", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Gap;
