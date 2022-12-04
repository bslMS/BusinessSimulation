within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

block PresentValue "Calculates the present value of a stream of cash flows"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.InformationProcessing_SO;
  Interfaces.Connectors.RealInput u "Cash stream input" annotation(Placement(visible = true, transformation(origin = {-145, 85}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_r if not hasConstantRate "Discount rate input" annotation(Placement(visible = true, transformation(origin = {-145, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter OutputType initialValue = 0 "Initial PV at start time";
  parameter Rate rate = 0.05 "Constant discount rate per period (optional)" annotation(Dialog(enable = hasConstantRate));
  parameter Boolean hasConstantRate = false "If true the discount rate is a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean isCCR = true "If false the given rate is transformed to a continuously compounding rate" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Converters.AccumulationFunction futureValueFactor(isCCR = isCCR, redeclare replaceable type OutputType = Dimensionless) "Accumulation function a(t)" annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Division discountedStream "Discounted stream of cash flows" annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel PV(initialValue = initialValue, init = BusinessSimulation.Types.InitializationOptions.FixedValue) "Present Value for stream of cash flows" annotation(Placement(visible = true, transformation(origin = {90, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth increasingPV "Present value is accumulation of discounted CF-stream" annotation(Placement(visible = true, transformation(origin = {50, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterRate parRate(value = rate) if hasConstantRate "Discount rate" annotation(Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(increasingPV.massPort, PV.inflow) annotation(Line(visible = true, origin = {70, 5}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(PV.y1, y) annotation(Line(visible = true, origin = {112.625, 21.5}, points = {{-12.125, -21.5}, {7.375, -21.5}, {7.375, -21.5}, {47.375, -21.5}}, color = {0, 0, 127}));
  connect(u_r, futureValueFactor.u) annotation(Line(visible = true, origin = {-106.5, 20}, points = {{-38.5, 0}, {38.5, 0}}, color = {0, 0, 128}));
  connect(parRate.y, futureValueFactor.u) annotation(Line(visible = true, origin = {-98, 5}, points = {{-26, -15}, {-2, -15}, {-2, 15}, {30, 15}}, color = {1, 37, 163}));
  connect(u, discountedStream.u1) annotation(Line(visible = true, origin = {-76.5, 85}, points = {{-68.5, 0}, {68.5, 0}}, color = {0, 0, 128}));
  connect(futureValueFactor.y, discountedStream.u2) annotation(Line(visible = true, origin = {-25, 47.5}, points = {{-27, -27.5}, {-5, -27.5}, {-5, 27.5}, {17, 27.5}}, color = {1, 37, 163}));
  connect(discountedStream.y, increasingPV.u) annotation(Line(visible = true, origin = {32.667, 58.333}, points = {{-24.667, 21.667}, {12.333, 21.667}, {12.333, -43.333}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>PresentValue</em> component will <em>accumulate a discounted cash flow stream</em>. The discount factor at any time is given by the <em>accumulation function a(t)</em> for a given interest rate, that may be either a constant (<code>rate</code>) or a variable input (<code>u_r</code>).</p><h4>Acknowledgements</h4>
<p>Additional information can be found on Jim Hines' <em>Molecules of Structure</em> website: →<a href = \"https://sdmolecules.org/index.htm#MoleculeTopics/CloseGap/GoToZero/Decay/PresentValue/presentValue.htm\">Present Value</a>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.TimeValueOfMoney\">TimeValueOfMoney</a>,
<a href=\"modelica://BusinessSimulation.Converters.AccumulationFunction\">AccumulationFunction</a>,
<a href=\"modelica://BusinessSimulation.Converters.ForceOfInterest\">ForceOfInterest</a>
</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -35}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Present Value", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "PV", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end PresentValue;
