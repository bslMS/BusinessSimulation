within BusinessSimulation.InformationSources;

block ConstantInput "Input signal with constant value"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.InformationSource_SO;
  parameter OutputType value "Value of constant output";
equation
  y = value;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The real <em>output</em> <strong>y</strong> is obtained by converting the constant parameter&nbsp;<code>value</code> into a continuous time signal.</p>
<h4>Notes</h4>
<p>This component is included for the sake of completeness; traditionally in system dynamics an exogenous constant signal is modeled using a <em>converter </em>(&rarr;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverter\">ConstantConverter</a>).</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInputRate\">ConstantInputRate</a>, <a href=\"modelica://BusinessSimulation.InformationSources.ConstantInputTime\">ConstantInputTime</a>, <a href=\"modelica://BusinessSimulation.Converters.ConstantConverter\">Converters.ConstantConverter</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverter\">Converters.Vector.ConstantConverter</a></p>
</html>", revisions = "<html>
<ul>
<li>Updated in v2.0.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-50, 0}, {50, 0}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0), Text(visible = true, origin = {0, 90}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value", fontName = "Lato")}));
end ConstantInput;
