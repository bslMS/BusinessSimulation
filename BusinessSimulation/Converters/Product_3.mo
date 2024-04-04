within BusinessSimulation.Converters;

block Product_3 "Inputs are multiplied"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SI3SO;
equation
  y = u1 * u2 * u3;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is the product of the inputs <strong>u1</strong>, <strong>u2</strong>, and <strong>u3</strong>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Product_2\">Product_2</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.Product\">Vector.Product</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0), Line(visible = true, rotation = -270, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Product_3;
