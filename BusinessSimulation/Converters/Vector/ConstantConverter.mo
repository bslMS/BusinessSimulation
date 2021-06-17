within BusinessSimulation.Converters.Vector;

block ConstantConverter "A list of constant values is turned into a constant vector of signals"
  extends Icons.ConstantConverter;
  extends Interfaces.Basics.OutputTypeChoice;
  RealMultiOutput[size(value, 1)] y annotation(Placement(visible = true, transformation(origin = {152.114, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType[:] value = {0} "List of constant values";
equation
  y = value;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The parameter <code>value</code>&nbsp;(a vector) is used to set the continous output <strong>y </strong>making it a vector of&nbsp;<em>constant-valued signals</em>.</p>
<h4>Notes</h4>
<ul>
<li>Wolfram System Modeler 12.2 currently does not allow to use <code>displayUnit</code> for entering vectors. Nevessary conversions have thus to be made before entering a value that needs to reflect the assigned <code>unit</code> for the chosen <code>OutputType</code>.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.ConstantConverter\">ConstantConverter</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterRate\">ConstantConverterRate</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">ConstantConverterTime</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Logical.ConstantConverterBoolean\">ConstantConverterBoolean</a></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 60}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value", fontName = "Lato")}));
end ConstantConverter;
