within BusinessSimulation.Converters;

block RateConversion "Converts a rate given per time base A to a rate per time base B"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.TimeBases;
  extends Icons.Converter;
  Interfaces.Connectors.RealInput u annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y annotation(Placement(visible = true, transformation(origin = {160, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  constant TimeBases timeBaseA = modelSettings.modelDisplayTimeBase "TimeBase to convert from" annotation(Dialog(group = "Structural Parameters"));
  constant TimeBases timeBaseB = TimeBases.seconds "TimeBase to convert to (default = seconds)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  constant Real oneInput(unit = unitInput) = 1;
  constant Real oneOutput(unit = unitOutput) = 1;
  constant String unitOutput = BusinessSimulation.Constants.timeBaseRateUnits[timeBaseB] "Unit for the output" annotation(Evaluate = true, Dialog(tab = "Initialization", enable = false));
  constant String unitInput = BusinessSimulation.Constants.timeBaseRateUnits[timeBaseA] "Unit for the input" annotation(Evaluate = true, Dialog(tab = "Initialization", enable = false));
equation
  y / oneOutput = u / oneInput * 1 / BusinessSimulation.Constants.timeBaseConversionFactors[timeBaseA, timeBaseB];
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <em><strong>y</strong></em> is derived from converting the input <strong><em>u</em></strong> assumed to be given as a rate in units of <code>timeBaseA</code> to a rate given in units of&nbsp;<code>timeBaseB</code>.&nbsp;</p>
<h4>Notes</h4>
<ul>
<li>The best way to work with time in Modelica is to use the SI unit [<code>s</code>] for all internal representations and calculations, while making use of <code>displayUnit</code> to convert input and output to and from another unit of time preferred by the modeler. That way models and components will be compatible with each other.</li><br>
<li>Nevertheless, there may be use cases where <em>internally</em> working with other timeBases is required. This converter allows to convert rates from one time base to another.</li><br>
<li>The numerical conversion will only relate to the units of time and modelers must be aware that any other unit will typically be represented by its base unit. For example, entering a rate of <code>7 km/wk</code>, using a constant converter, and converting it from time base \"seconds\" to the time base \"days\" will provide an output of <code>1000 [m/d]</code>.</li><br>
<li>Not all Modelica tools allow non-SI units of time to appear in models. So far, the function has only been tested with Wolfram System Modeler 14.</li><br>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.TimeConversion\">TimeConversion</a></p>
</html>", revisions = "<html>
<ul>
<li>Slightly modified in v2.0.0 to pass unit checking.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 25}, textColor = {128, 128, 128}, extent = {{-56.96, -9}, {56.96, 9}}, textString = "RATE", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, textColor = {0, 0, 128}, extent = {{-58.48, -12}, {58.48, 12}}, textString = "TIME BASE", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {128, 128, 128}, extent = {{-56.96, -9}, {56.96, 9}}, textString = "A → B", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end RateConversion;
