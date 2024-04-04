within BusinessSimulation.Interfaces.PartialCLD;

partial block Performance "Evaluating a stock"
  extends Lookup;
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial class extending →<a href=\"modelica://BusinessSimulation.Interfaces.PartialCLD.Lookup\"><code>Lookup</code></a> to build performance evaluating classes.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-30, -30}, {30, 30}}), Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, lineThickness = 5, extent = {{-15, -15}, {15, 15}}), Ellipse(visible = true, origin = {-50, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-5, -5}, {5, 5}}), Text(visible = true, origin = {-50, 60}, textColor = {255, 0, 0}, extent = {{-150, -12}, {150, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Performance;
