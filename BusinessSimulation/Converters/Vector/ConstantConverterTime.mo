within BusinessSimulation.Converters.Vector;

block ConstantConverterTime "A list of constant time values is turned into a vector of constant time signals"
  import BusinessSimulation.Units.Time;
  import BusinessSimulation.Types.TimeBases;
  extends Icons.ConstantConverter;
  extends Interfaces.Basics.OutputTypeChoice_Time(redeclare final type OutputType = Time);
  RealMultiOutput[nout] y annotation(Placement(visible = true, transformation(origin = {151.87, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real[:] value = {0} "List of constant time values";
  constant String unitTime = "s" "Unit of time for the values entered (default = 's')" annotation(Dialog(group = "Parameters"), choices(choice = "s", choice = "m", choice = "h", choice = "d", choice = "wk", choice = "mo", choice = "qtr", choice = "yr"));
protected
  parameter Integer nout = size(value, 1) "Length of vector" annotation(Evaluate = true, Dialog(tab = "Initialization", enable = false));
  constant TimeBases timeBase = Functions.stringToTimeBase(unitTime) "Element of the enumeration TimeBases corresponding to the unit of time given as string" annotation(Dialog(tab = "Initialization", enable = false));
  ConstantConverter timesInUnitTime(value = value) annotation(Placement(visible = true, transformation(origin = {-0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TimeConversion[nout] convertTime(each timeBaseA = timeBase, each timeBaseB = TimeBases.seconds) "Convert the time input to seconds" annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(convertTime.y, y) annotation(Line(visible = true, origin = {114.935, 0}, points = {{-36.935, 0}, {36.935, -0}}, color = {1, 37, 163}));
  connect(timesInUnitTime.y, convertTime.u) annotation(Line(visible = true, origin = {34, -0}, points = {{-28, -0}, {28, 0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The parameter <code>value</code>&nbsp;(a vector) is used to set the continous output <strong>y </strong>making it a vector of&nbsp;<em>constant-valued signals</em>. The output will always give times in <em>seconds</em> <code>[s]</code>, but values can be entered in non-SI-units of time using the parameter <code>unitTime</code>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverter\">ConstantConverter</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverterRate\">ConstantConverterRate</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 60}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value %unitTime", fontName = "Lato")}));
end ConstantConverterTime;
