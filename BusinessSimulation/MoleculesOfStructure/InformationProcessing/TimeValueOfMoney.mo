within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

block TimeValueOfMoney "Calculate the time value of money (TVM) using continuous compounding"
  extends Interfaces.PartialConverters.InformationProcessing_SO;
  import BusinessSimulation.Units.{Rate,Time};
  Interfaces.Connectors.RealInput u "Current value input" annotation(Placement(visible = true, transformation(origin = {-145, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_T(quantity = "Time", unit = "s") if not hasConstantHorizon "Time horizon(T >0 → FV, T < 0 → PV)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_r(quantity = "Rate", unit = "1/s") if not hasConstantRate "Interest rate" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Rate rate "Constant compounding rate" annotation(Dialog(enable = hasConstantRate));
  parameter Time T "Constant time horizon (T >0 → FV, T < 0 → PV)" annotation(Dialog(enable = hasConstantHorizon));
  parameter Boolean hasConstantRate = false "= true, if the discount rate is given by the constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantHorizon = false "= true, if the time horizon is given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean isCCR = true "= true, the rate does not need conversion to a continuously compounding rate" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Converters.Product_2 rate_x_T annotation(Placement(visible = true, transformation(origin = {-20, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Exp timeValueFactor annotation(Placement(visible = true, transformation(origin = {10, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 timeValue "Time value of money" annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterRate parConstantRate(value = rate) if hasConstantRate "Constant rate for compounding" annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ForceOfInterest CCR if not isCCR "Continuously compounding rate" annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough unchangedRate if isCCR annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parT(value = T) if hasConstantHorizon "Constant time into the future (time horizon)" annotation(Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_r, CCR.u) annotation(Line(visible = true, origin = {-110.547, 50}, points = {{-34.453, 10}, {10.547, 10}, {10.547, -10}, {22.547, -10}}, color = {1, 37, 163}));
  connect(parConstantRate.y, CCR.u) annotation(Line(visible = true, origin = {-101.5, 40}, points = {{-13.5, 0}, {13.5, 0}}, color = {1, 37, 163}));
  connect(u_r, unchangedRate.u) annotation(Line(visible = true, origin = {-112, 70}, points = {{-33, -10}, {12, -10}, {12, 10}, {24, 10}}, color = {1, 37, 163}));
  connect(parConstantRate.y, unchangedRate.u) annotation(Line(visible = true, origin = {-103.25, 60}, points = {{-11.75, -20}, {-1.75, -20}, {-1.75, 20}, {15.25, 20}}, color = {1, 37, 163}));
  connect(unchangedRate.y, rate_x_T.u1) annotation(Line(visible = true, origin = {-45.159, 62.5}, points = {{-27.478, 17.5}, {5.159, 17.5}, {5.159, -22.5}, {17.159, -22.5}}, color = {1, 37, 163}));
  connect(rate_x_T.y, timeValueFactor.u) annotation(Line(visible = true, origin = {-5, 35}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(CCR.y, rate_x_T.u1) annotation(Line(visible = true, origin = {-50.319, 40}, points = {{-22.319, 0}, {22.319, 0}}, color = {1, 37, 163}));
  connect(u, timeValue.u2) annotation(Line(visible = true, origin = {-51.5, -5}, points = {{-93.5, 0}, {93.5, 0}}, color = {1, 37, 163}));
  connect(timeValueFactor.y, timeValue.u1) annotation(Line(visible = true, origin = {27.5, 20}, points = {{-9.5, 15}, {-2.5, 15}, {-2.5, -15}, {14.5, -15}}, color = {1, 37, 163}));
  connect(timeValue.y, y) annotation(Line(visible = true, origin = {109, 0}, points = {{-51, 0}, {51, 0}}, color = {1, 37, 163}));
  connect(u_T, rate_x_T.u2) annotation(Line(visible = true, origin = {-63.25, -5}, points = {{-81.75, -35}, {23.25, -35}, {23.25, 35}, {35.25, 35}}, color = {0, 0, 128}));
  connect(parT.y, rate_x_T.u2) annotation(Line(visible = true, origin = {-55.5, -15}, points = {{-58.5, -45}, {15.5, -45}, {15.5, 45}, {27.5, 45}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real output <strong>y</strong> indicates the <em>nominal</em> value of the input <strong>u</strong> at the end (Future Value) or the beginning (Present Value) of a horizon of length <code>u_T</code> using the interest rate <code>u_r</code> according to the formula:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/MoleculesOfStructure/InformationProcessing/TimeValueOfMoney/Formula.svg\" alt=\"y = u^(u_r * u_T)\"></p>
<p>The given rate is assumed to be a <em>continuously compounding rate</em> (aka <em>force of interest</em>). Using the switch <code>isCCR</code> automatic conversion of a discrete rate can be activated.</p>
<h4>Notes</h4>
<ul>
<li>There is no accumulation, so the input is simply transformed at any moment given rate and time horizon values.</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing.PresentValue\">PresentValue</a>,
<a href=\"modelica://BusinessSimulation.Converters.ForceOfInterest\">ForceOfInterest</a>,
<a href=\"modelica://BusinessSimulation.Converters.AccumulationFunction\">AccumulationFunction</a>
</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -70}, {148.5, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Time Value", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "TVM", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end TimeValueOfMoney;
