within BusinessSimulation.Converters.DiscreteDelay;

block SmoothN "N-th order exponential smooth with constant averaging time"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Constants.{inf,small,eps,e};
  extends Interfaces.PartialConverters.SmoothSISO;
  Interfaces.Connectors.RealInput u_delayTime if not hasConstantDelayTime "Delay time input" annotation(Placement(visible = true, transformation(origin = {-145, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  parameter Integer n(min = 1) = 3 "Order of the smooth" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Time delayTime(min = 0) = 1 "Constant delay time (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter OutputType initialValue = 0 "Initial Output" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter Boolean hasConstantDelayTime = true "if true, the constant parameter value is used" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Division partialDelayTime if not hasConstantDelayTime "Delay time for each smooth in the chain of smooths" annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Converters.DiscreteDelay.Smooth firstOrderSmooth[n](each hasConstantDelayTime = hasConstantDelayTime, each init = init, each initialValue = initialValue, each delayTime = delayTime / n) "Chain of n first-order exponential information delays" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter parN(value = n) if not hasConstantDelayTime "Order of the delay" annotation(Placement(visible = true, transformation(origin = {-70, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_delayTime, partialDelayTime.u1) annotation(Line(visible = true, origin = {1.5, 95.188}, points = {{-146.5, -50.188}, {-39.5, -50.188}, {-39.5, -50.188}}, color = {1, 37, 163}));
  connect(parN.y, partialDelayTime.u2) annotation(Line(visible = true, origin = {-51.5, 35}, points = {{-13.5, 0}, {13.5, 0}}, color = {1, 37, 163}));
  connect(partialDelayTime.y, firstOrderSmooth[1].u_delayTime) annotation(Line(visible = true, origin = {-7.333, 28.333}, points = {{-14.667, 11.667}, {7.333, 11.667}, {7.333, -23.333}}, color = {1, 37, 163}));
  for i in 2:n loop
    connect(partialDelayTime.y, firstOrderSmooth[i].u_delayTime);
  end for;
  connect(u, firstOrderSmooth[1].u) "Input signal" annotation(Line(visible = true, origin = {-89.681, 0}, points = {{-80.319, 0}, {80.319, 0}}, color = {1, 37, 163}));
  for i in 1:n - 1 loop
    connect(firstOrderSmooth[i].y, firstOrderSmooth[i + 1].u);
  end for;
  connect(firstOrderSmooth[n].y, y) "Output signal" annotation(Line(visible = true, origin = {84.767, 0}, points = {{-75.233, 0}, {75.233, 0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>A smooth is an&nbsp;<em>exponential information delay</em>. It is typically used to model time lags in forming an expectation or in perceiving some information. A smooth of order <code>n</code> is modeled as a cascade of <code>n</code> first-order exponential smooth components, where the output of a preceding component is the input for its successor. The delay time for each smooth in the cascade will be <code>delayTime/n</code>.</p>
<h4>Notes</h4>
<ul>
<li>The <code>delayTime</code> given (either as constant parameter or continuous signal) will effectively be clipped to a minimum value of <code>n × modelSettings.dt</code>. The delay time for any first-order smooth in the cascade can thus never become smalle than <code>dt</code>, which denotes the minimum process time anywhere in the model.</li><br>
<li>In&nbsp;the System Dynamics community a <em>smooth</em> is an <em>information delay</em> (as opposed to a <em>material delay</em>) [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">1</a>, Appendices E and H]. Information delays model the process of updating information to the actual value. Since the technical procedure is called <em>exponential smoothing</em>, the name smooth has prevailed.</li><br>
<li>Mathematically a cascade of first-order exponential delays can be modeled as a convolution of exponential delays giving an Erlang distribution; see Sterman [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">3</a>, pp. 462-476] for more details.</li><br>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial output <strong>y</strong>.</li><br>
<li><em>SteadyState</em> will set the initial output <strong>y</strong> equal to the initial input <strong>u</strong>.</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free to find an initial output using <code>initialValue</code> as an initial guess.</li>
</ul>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.AsymmetricSmoothN\">AsymmetricSmoothN</a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-60.252, -12}, {60.252, 12}}, textString = "SMOOTH  N", fontName = "Lato", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SmoothN;
