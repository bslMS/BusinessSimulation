within BusinessSimulation.Interfaces.PartialConverters;

encapsulated partial block SISO_Conversion "Partial SISO converter class with input and output conversions for lookup functions"
  import BusinessSimulation.Interfaces.Connectors;
  import Modelica.Utilities.Files.loadResource;
  import BusinessSimulation.Converters.{RateConversion, PassThrough, TimeConversion};
  import BusinessSimulation.Types.TimeBases;
  import BusinessSimulation.ModelSettings;
  import BusinessSimulation.Interfaces.PartialConverters.SISO;
  import BusinessSimulation.Units.*;
  extends SISO;
  replaceable type InputType = Unspecified "The type of the input" annotation(choicesAllMatching = true);
  parameter Boolean convertInput = false "= true, if the input value is a rate or time variable that needs to be converted" annotation(Dialog(group = "Time Conversion"));
  parameter Boolean inputIsRate = false "= true, if the input is given in units of time, otherwise it is assumed to be a rate" annotation(Dialog(group = "Time Conversion", enable = convertInput));
  parameter Boolean convertOutput = false "= true, if the output value is a rate or time variable that needs to be converted" annotation(Dialog(group = "Time Conversion"));
  parameter Boolean outputIsRate = false "= true, if the output is given in units of time, otherwise it is assumed to be a rate" annotation(Dialog(group = "Time Conversion", enable = convertOutput));
  constant TimeBases timeBaseInput = TimeBases.seconds "TimeBase to convert from (default = seconds)" annotation(Dialog(enable = convertInput, group = "Time Conversion"));
  constant TimeBases timeBaseTableIn = modelSettings.modelDisplayTimeBase "TimeBase used for the lookup function input (default = modelDisplayTimeBase)" annotation(Dialog(enable = convertInput, group = "Time Conversion"));
  constant TimeBases timeBaseTableOut = modelSettings.modelDisplayTimeBase "TimeBase assumed for the lookup function output (default = modelSettings.modelDisplayTimeBase)" annotation(Dialog(enable = convertOutput, group = "Time Conversion"));
  constant TimeBases timeBaseOutput = TimeBases.seconds "TimeBase used for the output (default = seconds)" annotation(Dialog(enable = convertOutput, group = "Time Conversion"));
  outer ModelSettings modelSettings;
protected
  RateConversion rateConversionIn(timeBaseA = timeBaseInput, timeBaseB = timeBaseTableIn) if convertInput and inputIsRate "Convert the input (rate) to another time base" annotation(Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PassThrough noConversionIn if not convertInput "Use input as is" annotation(Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TimeConversion timeConversionIn(timeBaseA = timeBaseInput, timeBaseB = timeBaseTableIn) if convertInput and not inputIsRate "Convert the input to another time base" annotation(Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PassThrough noConversionOut if not convertOutput "Use output as is" annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RateConversion rateConversionOut(timeBaseA = timeBaseTableOut, timeBaseB = timeBaseOutput) if convertOutput and outputIsRate "Convert the output (rate) to 1/s" annotation(Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TimeConversion timeConversionOut(timeBaseA = timeBaseTableOut, timeBaseB = timeBaseOutput) if convertOutput and not outputIsRate "Convert the output to seconds" annotation(Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealOutput u_c "Input after conversion" annotation(Placement(visible = true, transformation(origin = {-70, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50.505, 1.953}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealOutput y_c "Output before conversion" annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50.505, 1.953}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, noConversionIn.u) annotation(Line(visible = true, origin = {-154, 0}, points = {{9, 0}, {36, 0}}, color = {1, 37, 163}));
  connect(u, rateConversionIn.u) annotation(Line(visible = true, origin = {-147, 15}, points = {{2, -15}, {7, -15}, {7, 15}, {29, 15}}, color = {1, 37, 163}));
  connect(u, timeConversionIn.u) annotation(Line(visible = true, origin = {-147, -15}, points = {{2, 15}, {7, 15}, {7, -15}, {29, -15}}, color = {1, 37, 163}));
  connect(noConversionOut.y, y) annotation(Line(visible = true, origin = {114, 0}, points = {{-46, 0}, {46, 0}}, color = {1, 37, 163}));
  connect(timeConversionOut.y, y) annotation(Line(visible = true, origin = {107, -15}, points = {{-39, -15}, {-7, -15}, {-7, 15}, {53, 15}}, color = {1, 37, 163}));
  connect(rateConversionOut.y, y) annotation(Line(visible = true, origin = {107, 13.531}, points = {{-39, 16.469}, {-7, 16.469}, {-7, -13.531}, {53.268, -13.531}}, color = {1, 37, 163}));
  connect(rateConversionIn.y, u_c) annotation(Line(visible = true, origin = {-88, 15}, points = {{-14, 15}, {-2, 15}, {-2, -15}, {18, -15}}, color = {1, 37, 163}));
  connect(noConversionIn.y, u_c) annotation(Line(visible = true, origin = {-86, -0}, points = {{-16, 0}, {16, -0}}, color = {1, 37, 163}));
  connect(timeConversionIn.y, u_c) annotation(Line(visible = true, origin = {-88, -15}, points = {{-14, -15}, {-2, -15}, {-2, 15}, {18, 15}}, color = {1, 37, 163}));
  connect(y_c, noConversionOut.u) annotation(Line(visible = true, origin = {46, 0}, points = {{-6, 0}, {6, 0}}, color = {1, 37, 163}));
  connect(y_c, rateConversionOut.u) annotation(Line(visible = true, origin = {45.5, 13.531}, points = {{-5.5, -13.531}, {-0.5, -13.531}, {-0.5, 16.469}, {6.5, 16.469}}, color = {1, 37, 163}));
  connect(y_c, timeConversionOut.u) annotation(Line(visible = true, origin = {45.5, -15}, points = {{-5.5, 15}, {-0.5, 15}, {-0.5, -15}, {6.5, -15}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This partial class is intended for a more convenient development of <em>lookup</em> functions as users can choose to convert input and output using →<a href=\"modelica://BusinessSimulation.Converters.RateConversion\"><code>RateConversion</code></a> and →<a href=\"modelica://BusinessSimulation.Converters.TimeConversion\"><code>TimeConversion</code></a>.</p></html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li><br>
<li>Added type choice for <code>type InputType</code> in v2.2.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SISO_Conversion;
