within BusinessSimulation.InformationSources;

block ConstantInputRate "Input signal with constant rate information"
  import BusinessSimulation.Units.Rate;
  import BusinessSimulation.Types.TimeBases;
  extends Icons.Converter;
  extends Icons.InformationSourceIndicator;
  extends Interfaces.Basics.OutputTypeChoice(redeclare replaceable type OutputType = Rate);
  parameter Real value = 1 "Value of constant rate per time base given";
  parameter String timeBaseString = "second" "Time base of the rate entered (default = second)" annotation(choices(choice = "second", choice = "minute", choice = "hour", choice = "day", choice = "week", choice = "month", choice = "quarter", choice = "year"));
  RealOutput y annotation(Placement(visible = true, transformation(origin = {161.717, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  final parameter TimeBases timeBase = Functions.stringToTimeBase(timeBaseString) "Element of the enumeration TimeBases corresponding to the timeBase given as string" annotation(Dialog(tab = "Initialization", enable = false));
  Converters.RateConversion convertRate(timeBaseA = timeBase, timeBaseB = TimeBases.seconds) "Convert the rate input to a rate per seconds" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  convertRate.u = value;
  // connect equations
  connect(convertRate.y, y) annotation(Line(visible = true, origin = {87.259, -2.118}, points = {{-79.259, 2.118}, {74.457, 2.118}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The real <em>output</em> <strong>y</strong> is obtained by converting the constant rate&nbsp;<code>value</code> into a continuous signal. The output will always&nbsp;give rates <em>per second</em>&nbsp;<code>[1/s]</code>, but rates can be entered using non-SI-units of time.</p>
<h4>Notes</h4>
<p>This component is included for the sake of completeness; traditionally in System Dynamics an exogenous constant signal is modeled using a <em>converter </em>(&rarr;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterRate\">ConstantConverterRate</a>).</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.InformationSources.ConstantInput\">ConstantInput</a>, <a href=\"modelica://BusinessSimulation.InformationSources.ConstantInputTime\">ConstantInputTime</a>, <a href=\"modelica://BusinessSimulation.Converters.ConstantConverterRate\">Converters.ConstantConverterRate</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.ConstantConverterRate\">Converters.Vector.ConstantConverterRate</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-50, 0}, {50, 0}}, color = {255, 255, 255}, thickness = 4, arrowSize = 0), Text(visible = true, origin = {0, 90}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value per %timeBaseString", fontName = "Lato")}));
end ConstantInputRate;
