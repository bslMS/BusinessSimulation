within BusinessSimulation.Converters;

model Abs "Return the absolute value of input"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
equation
  y = abs(u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong>&nbsp;is given as the <em>absolute value</em> of the input <strong>u</strong>.</p>
<h4>Implementation</h4>
<p>The function <strong><code>abs()</code></strong> is used to compute the absolute value so no event will be generated.</p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "ABS", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Abs;
