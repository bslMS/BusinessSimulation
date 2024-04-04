within BusinessSimulation.Converters.DiscreteDelay;

block AsymmetricSmooth "A smooth with different delay times for positive and negative changes"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SmoothSISO;
  Interfaces.Connectors.RealInput u_negDelayTime "Delay time for negative changes" annotation(Placement(visible = true, transformation(origin = {-145, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-50, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  Interfaces.Connectors.RealInput u_posDelayTime "Delay time for positive changes" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {50, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  parameter OutputType initialValue = 0 "Output at startTime" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Logical.Switch actDelayTime "Actual delay time" annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Logical.Threshold positiveQ(threshold = 0) annotation(Placement(visible = true, transformation(origin = {-75, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real initialOutput(start = initialValue, fixed = false) "Value to be used for initialization of the implicit stock" annotation(Dialog(enable = false, tab = "Initialization"));
  SourcesOrSinks.ExogenousChange changingPerception annotation(Placement(visible = true, transformation(origin = {40, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gap gap "Difference between acutal information and perceived information" annotation(Placement(visible = true, transformation(origin = {-107.215, 35}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Division_Guarded rateOfChange(outputIfZero = 0) "Rate of change in perceived information" annotation(Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel perceivedInformation(initialValue = initialOutput, init = InitializationOptions.FixedValue) "Smoothed information" annotation(Placement(visible = true, transformation(origin = {90, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  if init == InitializationOptions.FixedValue then
    initialOutput = initialValue;
  elseif init == InitializationOptions.SteadyState then
    initialOutput = u;
  end if;
equation
  connect(u, gap.u1) annotation(Line(visible = true, origin = {-130.661, 22.5}, points = {{-14.339, -22.5}, {10.446, -22.5}, {10.446, 7.5}, {15.446, 7.5}}, color = {0, 0, 127}));
  connect(gap.y, rateOfChange.u1) annotation(Line(visible = true, origin = {-48.608, 35}, points = {{-50.608, 0}, {50.608, 0}}, color = {0, 0, 127}));
  connect(rateOfChange.y, changingPerception.u) annotation(Line(visible = true, origin = {29.333, 25}, points = {{-11.333, 5}, {5.667, 5}, {5.667, -10}}, color = {0, 0, 127}));
  connect(changingPerception.massPort, perceivedInformation.inflow) annotation(Line(visible = true, origin = {65, 5}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(perceivedInformation.y, gap.u2) annotation(Line(visible = true, origin = {-69.643, 53.124}, points = {{164.643, -37.724}, {164.643, 11.876}, {-50.357, 11.876}, {-50.357, -13.124}, {-45.572, -13.124}}, color = {0, 0, 127}));
  connect(perceivedInformation.y1, y) annotation(Line(visible = true, origin = {137.625, -2.5}, points = {{-37.125, 2.5}, {-17.625, 2.5}, {-17.625, 2.5}, {22.375, 2.5}}, color = {1, 37, 163}));
  connect(gap.y, positiveQ.u) annotation(Line(visible = true, origin = {-92.758, 19.042}, points = {{-6.457, 15.958}, {-2.242, 15.958}, {-2.242, -19.042}, {9.758, -19.042}}, color = {1, 37, 163}));
  connect(positiveQ.y, actDelayTime.u_cond) annotation(Line(visible = true, origin = {-62.325, -10.671}, points = {{-4.675, 10.671}, {2.337, 10.671}, {2.337, -21.341}}, color = {190, 52, 178}));
  connect(u_posDelayTime, actDelayTime.u1) annotation(Line(visible = true, origin = {-113.25, -27.5}, points = {{-31.75, 7.5}, {-6.75, 7.5}, {-6.75, -7.5}, {45.25, -7.5}}, color = {0, 0, 128}));
  connect(u_negDelayTime, actDelayTime.u2) annotation(Line(visible = true, origin = {-112.777, -52.5}, points = {{-32.223, -7.5}, {-7.223, -7.5}, {-7.223, 7.5}, {44.777, 7.5}}, color = {0, 0, 128}));
  connect(actDelayTime.y, rateOfChange.u2) annotation(Line(visible = true, origin = {-32.5, -7.5}, points = {{-19.5, -32.5}, {-7.5, -32.5}, {-7.5, 32.5}, {34.5, 32.5}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This converter behaves like a conventional <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">→Smooth</a> but allows to give separate <em>delay times</em> for <em>positive</em> and <em>negative</em> information changes.</p>
<h4>Notes</h4>
<ul>
<li>There is no <code>Clip</code> inside this component to make sure that delay times are strictly positive.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.AsymmetricSmoothN\">AsymmetricSmoothN</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth</a>
</p>
</ul>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-99.005, -12}, {99.005, 12}}, textString = "SMOOTH", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {50, 25.514}, textColor = {0, 0, 128}, extent = {{-21.181, -20}, {21.181, 20}}, textString = "+", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-50, 30}, textColor = {255, 0, 0}, extent = {{-15.402, -20}, {15.402, 20}}, textString = "‒", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end AsymmetricSmooth;
