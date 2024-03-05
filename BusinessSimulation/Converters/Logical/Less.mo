within BusinessSimulation.Converters.Logical;

block Less "True, if u1 is less than u2"
  extends Interfaces.PartialConverters.SI2BooleanSO;
equation
  y = u1 < u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The boolean output <strong>y</strong> will be <code>true</code>, if the real input <strong>u1</strong> is <em>less than</em> the real input <strong>u2</strong> and otherwise be <code>false</code>.</p></html>", revisions = ""), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {190, 52, 178}, extent = {{-36.812, -20}, {36.812, 20}}, textString = "<", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-33.755, -50}, rotation = -270, points = {{0, 53.755}, {0, -56.344}, {40, -56.344}}, color = {0, 0, 128}, thickness = 3), Line(visible = true, origin = {-59.824, 50}, rotation = -990, points = {{0, 27.51}, {0, -35.039}, {-40, -35.039}}, color = {0, 0, 128}, thickness = 3), Ellipse(visible = true, origin = {-66.537, 0}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{32, -10}, {52, 10}}), Ellipse(visible = true, origin = {-19.543, 0}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{32, -10}, {52, 10}})}));
end Less;
