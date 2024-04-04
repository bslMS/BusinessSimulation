within BusinessSimulation.Converters.Vector;

block Product "Gives the product of all components of the input vector"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.MISO;
equation
  y = product(u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <em><strong>y</strong></em> is derived as a multiplication of n inputs <strong><em>u</em>&nbsp;</strong>given as a vector:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/Product/Formula.svg\" alt=\"y_i = prod(u_i)\"></p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Product_2\">Product_2</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Product_3\">Product_3</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2, 6}, textColor = {0, 0, 128}, extent = {{-22.881, -36.024}, {22.881, 36.024}}, textString = "∏", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Product;
