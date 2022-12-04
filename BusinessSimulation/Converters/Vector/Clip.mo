within BusinessSimulation.Converters.Vector;

block Clip "Clips input vector so that all components remain within a given interval"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.PartialConverters.MIMO_nin;
  parameter Real minValue = -inf "Minimum value (default = - infinity)";
  parameter Real maxValue = inf "Maximum value (default = infinity)";
algorithm
  y := Functions.clip(u, {minValue, maxValue});
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The input vector&nbsp;<strong>u</strong>&nbsp;will be <em>clipped</em> to make sure that its components remain within the interval <code>[minValue, maxValue]</code> before it is given as output vector&nbsp;<strong>y</strong>&nbsp;having the same dimensions.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.clip\">Functions.clip</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-36.812, -12}, {36.812, 12}}, textString = "CLIP", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Clip;
