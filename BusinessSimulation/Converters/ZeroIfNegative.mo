within BusinessSimulation.Converters;

block ZeroIfNegative "The input will be set to zero, if it is negative"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
  parameter Boolean strict = true "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
equation
  if strict then
    y = noEvent(if u < 0 then 0 else u);
  else
    y = smooth(0, if u < 0 then 0 else u);
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong><em>y</em></strong> will be identical with the input <strong><em>u</em></strong> whenever <strong><em>u</em></strong> is greater than or equal to zero. It will be zero in all other cases.</p>
<h4>Implementation</h4>
<p>In the default setting (<code>strict = false</code>) in the Advanced tab, nonnegativity will be strictly ovserved:</p>
<pre>  if strict then
    y = noEvent(if u < 0 then 0 else u);
  else
    y = smooth(0, if u < 0 then 0 else u);
  end if;<br><br></pre>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Clip\">Clip</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ClipProcessTime\">ClipProcessTime</a></p>
</html>", revisions = "<html>
<ul>
<li>updated in v2.0.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0.484, 0}, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "0 if < 0", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ZeroIfNegative;
