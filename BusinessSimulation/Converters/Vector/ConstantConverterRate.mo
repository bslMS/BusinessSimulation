within BusinessSimulation.Converters.Vector;

block ConstantConverterRate "A list of constant rates is turned into a vector of rate signals"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.'1second';
  import BusinessSimulation.Types.TimeBases;
  extends Icons.ConstantConverter;
  extends Interfaces.Basics.OutputTypeChoice_Rate(redeclare replaceable type OutputType = Rate);
  RealMultiOutput[nout] y annotation(Placement(visible = true, transformation(origin = {151.657, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real[:] value = {0} "Vector of constant rates given in the unit pertaining to OutputType [y.unit * s] per time base";
  constant String timeBaseString = "second" "Time base of the rates entered (default = per second)" annotation(Dialog(group = "Parameters"), choices(choice = "second", choice = "minute", choice = "hour", choice = "day", choice = "week", choice = "month", choice = "quarter", choice = "year"));
protected
  parameter Integer nout = size(value, 1) "Length of the vector" annotation(Evaluate = true, Dialog(tab = "Initialization", enable = false));
  constant TimeBases timeBase = Functions.stringToTimeBase(timeBaseString) "Element of the enumeration TimeBases corresponding to the timeBase given as string" annotation(Dialog(tab = "Initialization", enable = false));
  final RateConversion[nout] convertRate(each timeBaseA = timeBase, each timeBaseB = TimeBases.seconds) "Convert the rate input to a rate per seconds" annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter ratesInTimeBase(value = value) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(convertRate.y, y) annotation(Line(visible = true, origin = {119.829, 0}, points = {{-31.829, 0}, {31.829, -0}}, color = {1, 37, 163}));
  connect(ratesInTimeBase.y, convertRate.u) annotation(Line(visible = true, origin = {39, 0}, points = {{-33, 0}, {33, 0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The parameter <code>value</code>&nbsp;(a vector) is used to set the continous output <strong>y </strong>making it a vector of&nbsp;<em>constant-valued signals</em>. The output will always&nbsp;give rates <em>per second</em>, but rates can be entered in non-SI-units of time using the parameter <code>timeBaseString</code>.</p>
<h4>Notes</h4>
<ul>
<li>In the default setting <code>OutputType = Rate</code> the entered rates will be fractional rates (<code>1 per unit of time</code>).</li><br>
<li>Wolfram System Modeler 12.2 currently does not allow to use <code>displayUnit</code> for entering vectors. Nevessary conversions have thus to be made before: Any value entered should have <code>unit = y.unit * s/time base</code>, so that the converted values will have <code>unit = y.unit</code>.</li>
</ul>
<h4>Examples</h4>
<p>Given <code>OutputType = Units.VolumeFlowRate, value = {1,2,3}, timeBase = \"minute\"</code> will result in the output <code>y = {0.0166 [m3/s], 0.0333 [m3/s], 0.05 [m3/s]}</code>, thus the input wil be interpreted as base units ofr <code>Volume</code> per minute. </p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverter\">ConstantConverter</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverterTime\">ConstantConverterTime</a></p>
</html>", revisions = "<html>
<ul>
<li><code>OutputType</code> changed to default <code>Rate</code> in v2.2 as documented.</li><br>
<ul>
<html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 60}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value per %timeBaseString", fontName = "Lato")}));
end ConstantConverterRate;
