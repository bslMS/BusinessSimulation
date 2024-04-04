within BusinessSimulation.Converters;

block Rescale "Rescales input to run from y_min to y_max over the range u_min to u_max"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
  parameter Real u_min "Minimum value for the original range [u_min, u_max]";
  parameter Real u_max "Maximum value for the original range [u_min, u_max]";
  parameter Real y_min = 0 "Minimum value for the transformed range [y_min, y_max]";
  parameter Real y_max = 1 "Maximum value for the transformed range [y_min, y_max]";
equation
  assert(u_min < u_max, "Minimum value must be less than maximum");
  y = Functions.rescale(u, {u_min, u_max}, {y_min, y_max});
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The input <strong>u</strong>&nbsp;will be <em>rescaled&nbsp;</em>to run from <code>y_min</code> to <code>y_max</code> over the range <code>u_min</code> to <code>u_max</code> to obtain the&nbsp;output <strong>y.</strong></p>
<h4><strong>Implementation</strong></h4>
<br>
<pre>y = Functions.rescale( x, {u_min,u_max}, {y_min, y_max});</pre>
<h4>See also &nbsp;</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.rescale\">Functions.rescale</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40, -12}, {40, 12}}, textString = "RESCALE", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Rescale;
