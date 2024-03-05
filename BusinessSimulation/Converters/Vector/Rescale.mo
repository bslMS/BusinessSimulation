within BusinessSimulation.Converters.Vector;

block Rescale "Rescales the components of input vector u to run from y_min to y_max over the range u_min to u_max"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.PartialConverters.MIMO_nin;
  parameter Real u_min = -inf "Minimum value of the original range [u_min, u_max]" annotation(Dialog(enable = enterInputRange));
  parameter Real u_max = inf "Maximum value of the original range [u_min, u_max]" annotation(Dialog(enable = enterInputRange));
  parameter Real y_min = 0 "Minimum value of the transformed range [y_min, y_max]";
  parameter Real y_max = 1 "Maximum value of the transformed range [y_min, y_max]";
  parameter Boolean enterInputRange = false "= true, if instead of using {min(u),max(u)} the range {u_min, u_max} is to be explicitly given" annotation(Dialog(group = "Structural Parameters"));
equation
  y = if enterInputRange then Functions.rescaleVector(u, {u_min, u_max}, {y_min, y_max}) else Functions.rescaleVector(u, {min(u), max(u)}, {y_min, y_max});
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The vector output <strong>y</strong> is obtained by <em>rescaling </em>all components of the input vector <strong>u</strong> to run from <code>y_min</code> to <code>y_max</code> over the range <code>min</code> to <code>max</code>.</p>
<h4>Notes</h4>
<p>Care has to be taken if <code>enterInputRange = false</code>, as then a vector of identical values will cause division by zero.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Rescale\">Rescale</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Functions.rescaleVector\">Functions.rescaleVector</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-53.405, -12}, {53.405, 12}}, textString = "RESCALE", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Rescale;
