within BusinessSimulation.CausalLoop;

model Total "Sum all inputs"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.InfoAggregation;
protected
  Converters.Vector.Total total(nin = nin) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, total.u) annotation(Line(visible = true, origin = {-76.5, 0}, points = {{-68.5, 0}, {68.5, 0}}, color = {0, 0, 128}));
  connect(total.y, y) annotation(Line(visible = true, origin = {85.043, 0}, points = {{-77.043, 0}, {77.043, 0}}, color = {1, 37, 163}));
  /* block,  information processing */
  annotation(defaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the <em>sum</em> of <code>nin</code> information inputs <strong>u</strong><code>[nin]</code>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.Vector.Total\">Converters.Vector.Total</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.Product\">Product</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-81.403, 0}, points = {{-11.403, 0}, {11.403, 0}}, color = {0, 0, 128}, thickness = 1), Text(visible = true, origin = {-52, 6}, textColor = {0, 0, 128}, extent = {{-22.881, -36.024}, {22.881, 36.024}}, textString = "∑", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-11.652, 0}, points = {{-18.348, 0}, {18.348, 0}}, color = {0, 0, 128}, thickness = 1)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Total;
