within BusinessSimulation.Converters;

block ConstantConverterRate "A constant rate is turned into a constant-valued signal"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.TimeBases;
  extends Icons.ConstantConverter;
  extends Interfaces.Basics.OutputTypeChoice_Rate;
  replaceable type ValueType = Unspecified constrainedby Unspecified "Basic type for the quantity that is transported per unit of time" annotation(choicesAllMatching = true);
  RealOutput y "Constant output signal" annotation(Placement(visible = true, transformation(origin = {161.795, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter ValueType value "Constant rate given in unit and displayUnit pertaining to ValueType per time base";
  constant String timeBaseString = "second" "Time base of the rate entered (default = second)" annotation(Dialog(group = "Parameters"), choices(choice = "second", choice = "minute", choice = "hour", choice = "day", choice = "week", choice = "month", choice = "quarter", choice = "year"));
protected
  constant ValueType unitValue = 1 "Multiplicative identity with the same units as ValueType";
  constant Real unitBaseRate(unit = rateUnitInput) = 1;
  constant String rateUnitInput = BusinessSimulation.Constants.timeBaseRateUnits[timeBase] "Dimensionless rate units according to the time base entered" annotation(Evaluate = true, Dialog(tab = "Initialization", enable = false));
  constant TimeBases timeBase = Functions.stringToTimeBase(timeBaseString) "Element of the enumeration TimeBases corresponding to the timeBase given as string" annotation(Dialog(tab = "Initialization", enable = false));
  ConstantConverter rateInTimeBase(value = value / unitValue * unitBaseRate) annotation(Placement(visible = true, transformation(origin = {0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RateConversion convertRate(timeBaseA = timeBase, timeBaseB = TimeBases.seconds) "Convert the rate input to a rate per seconds" annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y = convertRate.y * unitValue;
  connect(rateInTimeBase.y, convertRate.u) annotation(Line(visible = true, origin = {34, 0}, points = {{-28, -0}, {28, 0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The parameter <code>value</code>&nbsp;is used to set the continous output <strong>y </strong>making it a <em>constant-valued signal</em>. The output will always&nbsp;give rates <em>per second</em>, but rates can be entered in non-SI-units of time using the parameter <code>timeBaseString</code>.</p>
<h4>Notes</h4>
<ul>
<li>In the default setting <code>ValueType</code> is chosen to be <code>Types.Reals</Code> so that the entered rate will be a fractional rate (<code>1 per unit of time</code>). A different choice for <code>ValueType</code> may give more convenience: Selecting <code>ValueType = Amount</code> allows to use `displayUnit = \"thousand\"` and we can enter <code>value = 1</code> and <code>timeBaseString = \"year\"</code> to come up with a rate of <code>1 thousand per year</code> nicely converted internally into an equivalent rate <em>per second</em>.</li><br>
<li>One can further use <code>ValueType</code> to select say a basic <em>physical</em> quantity like <em>energy</em> (not <em>EnergyFlowRate</em>!). With <code>value = 1000</code>, <code>displayUnit = \"kW.h\"</code>, and <code>timeBaseString = \"year\"</code> we will thus obtain a rate of <code>1000 kw.H per year</code> that is internally converted into SI-units of <code>114.155 J/s</code>.</li><br>
<li>There is no direct link between <code>OutputType</code> (default = <code>Rate</code>) and <code>ValueType</code>. The <code>value</code> entered will have <code>unit = ValueType.unit/s</code> and the selected <code>OutputType</code> should be set to make sure that <code>y.unit</code> reflects this: In the energy example above, the user should have selected <code>OutputType = EnergyFlowRate</code> to have units for input and output match.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.ConstantConverter\">ConstantConverter</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">ConstantConverterTime</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 60}, textColor = {0, 0, 128}, extent = {{-100, -6}, {100, 6}}, textString = "%value per %timeBaseString", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-20, -20}, {20, 20}}), Line(visible = true, origin = {0, -0.205}, rotation = -810, points = {{-30, 0}, {30, 0}}, color = {0, 0, 128}, thickness = 5), Text(visible = true, origin = {-50, 0}, textColor = {128, 0, 128}, extent = {{-44.917, -32.251}, {44.917, 32.251}}, textString = "%value", fontSize = 30, fontName = "Arial"), Text(visible = true, origin = {0, -56.852}, textColor = {128, 0, 128}, extent = {{-141.113, -29.508}, {141.113, 29.508}}, textString = "%name", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ConstantConverterRate;
