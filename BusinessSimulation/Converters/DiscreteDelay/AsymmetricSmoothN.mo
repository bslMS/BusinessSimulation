within BusinessSimulation.Converters.DiscreteDelay;

block AsymmetricSmoothN "Higher order smooth with different delay times for positive and negative changes"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SmoothSISO;
  Interfaces.Connectors.RealInput u_negDelayTime "Delay time for negative changes" annotation(Placement(visible = true, transformation(origin = {-145, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {-50, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  Interfaces.Connectors.RealInput u_posDelayTime "Delay time for positive changes" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {50, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  parameter Integer n(min = 1) = 3 "Order of the smooth" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter OutputType initialValue = 0 "Initial Output" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  AsymmetricSmooth smooth[n] annotation(Placement(visible = true, transformation(origin = {-0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter parN(value = n) annotation(Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Division partialPosDelayTime "Positive delay time for each smooth in the chain of smooths" annotation(Placement(visible = true, transformation(origin = {-80, -25}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Division partialNegDelayTime "Negative delay time for each smooth in the chain of smooths" annotation(Placement(visible = true, transformation(origin = {-80, -65}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
equation
  connect(u, smooth[1].u) annotation(Line(visible = true, origin = {-77.181, 0}, points = {{-67.819, 0}, {67.819, 0}}, color = {0, 0, 128}));
  connect(smooth[1:n - 1].y, smooth[2:n].u) annotation(Line(visible = true, origin = {0.106, -6.667}, points = {{9.894, 6.667}, {19.894, 6.667}, {19.894, -13.333}, {-20.106, -13.333}, {-20.106, 6.667}, {-9.469, 6.667}}, color = {1, 37, 163}));
  connect(smooth[n].y, y) annotation(Line(visible = true, origin = {85, 0}, points = {{-75, 0}, {75, 0}}, color = {1, 37, 163}));
  connect(parN.y, partialPosDelayTime.u2) annotation(Line(visible = true, origin = {-103, -35}, points = {{-11, -5}, {-2, -5}, {-2, 5}, {15, 5}}, color = {1, 37, 163}));
  connect(parN.y, partialNegDelayTime.u2) annotation(Line(visible = true, origin = {-103, -55}, points = {{-11, 15}, {-2, 15}, {-2, -15}, {15, -15}}, color = {1, 37, 163}));
  connect(u_posDelayTime, partialPosDelayTime.u1) annotation(Line(visible = true, origin = {-116.5, -20}, points = {{-28.5, -0}, {28.5, 0}}, color = {0, 0, 128}));
  connect(u_negDelayTime, partialNegDelayTime.u1) annotation(Line(visible = true, origin = {-116.5, -60}, points = {{-28.5, 0}, {28.5, 0}}, color = {0, 0, 128}));
  connect(partialPosDelayTime.y, smooth[1].u_posDelayTime) annotation(Line(visible = true, origin = {-36.4, -1}, points = {{-35.6, -24}, {-23.6, -24}, {-23.6, 21}, {41.4, 21}, {41.4, 6}}, color = {1, 37, 163}));
  connect(partialNegDelayTime.y, smooth[1].u_negDelayTime) annotation(Line(visible = true, origin = {-32.4, -21}, points = {{-39.6, -44}, {-7.6, -44}, {-7.6, 31}, {27.4, 31}, {27.4, 26}}, color = {1, 37, 163}));
  for i in 2:n loop
    connect(partialPosDelayTime.y, smooth[i].u_posDelayTime);
    connect(partialNegDelayTime.y, smooth[i].u_negDelayTime);
  end for;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This converter behaves like a conventional <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">→SmoothN</a> but allows to give separate <em>delay times</em> for <em>positive</em> and <em>negative</em> information changes.</p>
<h4>Notes</h4>
<ul>
<li>There is no <code>Clip</code> inside this component to make sure that delay times are strictly positive.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.AsymmetricSmooth\">AsymmetricSmooth</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">SmoothN</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-99.005, -12}, {99.005, 12}}, textString = "SMOOTH N", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {50, 25.514}, textColor = {0, 0, 128}, extent = {{-21.181, -20}, {21.181, 20}}, textString = "+", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-50, 30}, textColor = {255, 0, 0}, extent = {{-15.402, -20}, {15.402, 20}}, textString = "‒", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end AsymmetricSmoothN;
