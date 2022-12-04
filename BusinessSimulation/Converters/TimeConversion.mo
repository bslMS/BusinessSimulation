within BusinessSimulation.Converters;

block TimeConversion "Converts a time signal from time base A to time base B"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.TimeBases;
  extends Icons.Converter;
  Interfaces.Connectors.RealInput u annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y(quantity = "Time", unit = unitOutput) annotation(Placement(visible = true, transformation(origin = {160, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  constant TimeBases timeBaseA = modelSettings.modelDisplayTimeBase "TimeBase to convert from" annotation(Dialog(group = "Structural Parameters"));
  constant TimeBases timeBaseB = TimeBases.seconds "TimeBase to convert to (default = seconds)" annotation(Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  constant String unitInput = BusinessSimulation.Constants.timeBaseUnits[timeBaseA] "Unit for the input";
  constant String unitOutput = BusinessSimulation.Constants.timeBaseUnits[timeBaseB] "Unit for the output";
  constant Real oneInput(unit = unitInput) = 1;
  constant Real oneOutput(unit = unitOutput) = 1;
equation
  y / oneOutput = u / oneInput * BusinessSimulation.Constants.timeBaseConversionFactors[timeBaseA, timeBaseB];
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <em><strong>y</strong></em> is derived from converting the input <strong><em>u</em></strong> assumed to be given in units of <code>timeBaseA</code> to <code>timeBaseB</code>.&nbsp;</p>
<h4>Notes</h4>
<p>The best way to work with time in Modelica is to use the SIunit [<code>s</code>] for all internal representations and calculations while making use of <code>displayUnit</code> to convert input and output to and from <code>s</code> to another unit of time preferred by the modeler. That way models will be compatible with models from other domains.</p>
<p>Nevertheless, there may be use cases where within the model working with other timeBases will be necessary. Thus there may be need to convert from one time base to another which this converter fulfills.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.RateConversion\">RateConversion</a></p>
</html>", revisions = "<html>
<ul>
<li>Slight modification to pass unit checking in v2.0.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 1.656}, textColor = {0, 0, 128}, extent = {{-56.96, -12}, {56.96, 12}}, textString = "TIME BASE", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {128, 128, 128}, extent = {{-56.96, -9}, {56.96, 9}}, textString = "A → B", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TimeConversion;
