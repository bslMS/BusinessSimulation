within BusinessSimulation.Converters;

block ClipProcessTime "Limit any time input to be no smaller than dt"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO(redeclare replaceable type OutputType = Time);
  parameter Boolean strict = true "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
protected
  outer ModelSettings modelSettings;
equation
  if strict then
    y = noEvent(if u < modelSettings.dt then modelSettings.dt else u);
  else
    y = smooth(0, if u < modelSettings.dt then modelSettings.dt else u);
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The global parameter <code>modelSettings.dt</code>&nbsp;gives the smallest possible average duration for any explicitly modeled process within a model (e.g., the shortest possible <em>delay time</em>). The time input <strong>u</strong> (usually a duration) will thus be <em>clipped&nbsp;</em>so that the output <strong>y</strong> will<em>&nbsp;</em>never be smaller than <code>dt</code>.</p>
<h4>Implementation</h4>
<p>In the default setting (<code>strict = true</code>) in the Advanced tab no events will be generated:</p>
<pre>if strict then
    y = smooth(0, noEvent(if u < modelSettings.dt then modelSettings.dt else u));
  else
    y = smooth(0, if u < modelSettings.dt then modelSettings.dt else u);
  end if;</pre><br>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Clip\">Clip</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ZeroIfNegative\">ZeroIfNegative</a></p></html>", revisions = "<html>
<ul>
<li>Updated in v2.0.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-58.305, -12}, {58.305, 12}}, textString = "CLIP", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -20}, textColor = {128, 128, 128}, extent = {{-58.305, -9}, {58.305, 9}}, textString = "Process Time", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ClipProcessTime;
