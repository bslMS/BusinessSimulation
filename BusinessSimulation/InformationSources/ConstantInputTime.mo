within BusinessSimulation.InformationSources;

block ConstantInputTime "Input signal with constant time information"
  import BusinessSimulation.Units.*;
  extends Icons.Converter;
  extends Icons.InformationSourceIndicator;
  extends Interfaces.Basics.OutputTypeChoice_Time;
  RealOutput y "Constant value of time in the time base given" annotation(Placement(visible = true, transformation(origin = {161.795, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType value "Constant value of time";
equation
  y = value;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The real <em>output</em> <strong>y</strong> is obtained by converting the time&nbsp;<em>parameter</em> <code>value</code> into a continuous time signal. The output will always be given in seconds <code>[s]</code>, but values can be entered using non-SI-units of time.</p>
<h4>Notes</h4>
<p>This component is included for the sake of completeness; traditionally in system dynamics an exogenous constant signal is modeled using a <em>converter </em>(&rarr;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">ConstantConverterTime</a>).</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInput\">ConstantInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.ConstantInputRate\">ConstantInputRate</a>, <a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">Converters.ConstantConverterTime</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverterTime\">Converters.Vector.ConstantConverterTime</a></p>
</html>", revisions = "<html>
<ul>
<li>Updated in v2.0.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-50, 0}, {50, 0}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0), Text(visible = true, origin = {0, 90}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value", fontName = "Lato")}));
end ConstantInputTime;
