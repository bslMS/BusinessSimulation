within BusinessSimulation.Interfaces.Basics;

encapsulated partial class OutputTypeChoice_Time "Partial model to set output type to some derivative of time"
  import BusinessSimulation.Units.*;
  replaceable type OutputType = Time constrainedby Time "Type choice" annotation(choicesAllMatching = true);
  connector RealOutput = output OutputType "Output time signal" annotation(defaultComponentName = "y",IconMap(primitivesVisible = false), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {100, 0}, {-100, -100}})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 50}, {0, 0}, {-100, -50}}), Text(visible = true, origin = {0, 80}, textColor = {128, 128, 128}, extent = {{-100, -12}, {100, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>A Real <em>output</em> connector.</p></html>"));
  connector RealMultiOutput = output OutputType "Output signal" annotation(defaultComponentName = "y", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {100, 0}, {-100, -100}}), Ellipse(visible = true, origin = {-24.747, 0}, lineColor = {255, 255, 255}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, extent = {{-24.747, -24.747}, {24.747, 24.747}})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {100, 0}, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 50}, {0, 0}, {-100, -50}}), Text(visible = true, origin = {0, 80}, textColor = {128, 128, 128}, extent = {{-100, -12}, {100, 12}}, textString = "%name", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>A Real <em>output</em> connector to indicate vector or list output.</p></html>"));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial class that enables the redeclaration of <code>type OutputType</code> which by default is set to <code>Units.Time</code>. This class is only used for extensions and contains two <code>connector</code> classes (<code>RealOutput</code> and <code>RealMultiOutput</code>) that can be used for reporting the chosen <code>OutputType</code>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Units.Time\">Units.Time</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Units\">Units</a></p>
</html>", revisions = "<html>
<ul>
<li>Updated in v2.0.0.</li><br>
<li>Added <code>choicesAllmatching = true</code> in v2.1.0, which makes a long list of <code>choices</code> unnecessary.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, pattern = LinePattern.None, extent = {{-100, -100}, {100, 100}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end OutputTypeChoice_Time;
