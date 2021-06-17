within BusinessSimulation.Converters.DiscreteDelay;

block Smooth "First-order exponential smooth"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.Time;
  extends Interfaces.PartialConverters.SmoothSISO;
  Interfaces.Connectors.RealInput u_delayTime if not hasConstantDelayTime "Delay time" annotation(Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  parameter Time delayTime = 1 "Constant delay time (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter OutputType initialValue = 0 "Output at startTime" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean hasConstantDelayTime = true "= true, if delayTime is given by the parameter instead of the input" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  outer ModelSettings modelSettings;
protected
  parameter Real initialOutput(start = initialValue, fixed = false) "Value to be used for initialization of the implicit stock" annotation(Dialog(enable = false, tab = "Initialization"));
  SourcesOrSinks.ExogenousChange changingPerception annotation(Placement(visible = true, transformation(origin = {-50, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gap gap "Difference between acutal information and perceived information" annotation(Placement(visible = true, transformation(origin = {-107.215, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Division_Guarded rateOfChange(outputIfZero = 0) "Rate of change in perceived information" annotation(Placement(visible = true, transformation(origin = {-68.12, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel perceivedInformation(initialValue = initialOutput, init = BusinessSimulation.Types.InitializationOptions.FixedValue) "Smoothed information" annotation(Placement(visible = true, transformation(origin = {0, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ClipProcessTime positiveDelayTime "Delay time shall never be less than dt" annotation(Placement(visible = true, transformation(origin = {-70, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ConstantConverterTime parDelayTime(value = delayTime) if hasConstantDelayTime "Constant delay time (optional)" annotation(Placement(visible = true, transformation(origin = {-35, 95}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
initial equation
  if init == InitializationOptions.FixedValue then
    initialOutput = initialValue;
  elseif init == InitializationOptions.SteadyState then
    initialOutput = u;
  end if;
equation
  connect(u, gap.u1) annotation(Line(visible = true, origin = {-130.661, 22.5}, points = {{-39.339, -22.5}, {10.446, -22.5}, {10.446, 22.5}, {15.446, 22.5}}, color = {0, 0, 127}));
  connect(gap.y, rateOfChange.u1) annotation(Line(visible = true, origin = {-87.986, 50}, points = {{-11.866, 0}, {11.866, 0}}, color = {0, 0, 127}));
  connect(rateOfChange.y, changingPerception.u) annotation(Line(visible = true, origin = {-56.919, 35}, points = {{-3.838, 10}, {1.919, 10}, {1.919, -20}}, color = {0, 0, 127}));
  connect(changingPerception.massPort, perceivedInformation.inflow) annotation(Line(visible = true, origin = {-25, 5}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(perceivedInformation.y, gap.u2) annotation(Line(visible = true, origin = {-69.643, 53.124}, points = {{74.643, -37.724}, {74.643, 11.876}, {-50.357, 11.876}, {-50.357, 1.876}, {-45.572, 1.876}}, color = {0, 0, 127}));
  connect(perceivedInformation.y1, y) annotation(Line(visible = true, origin = {62.625, -2.5}, points = {{-52.125, 2.5}, {-22.625, 2.5}, {-22.625, 2.5}, {97.375, 2.5}}, color = {1, 37, 163}));
  connect(positiveDelayTime.y, rateOfChange.u2) annotation(Line(visible = true, origin = {-83.371, 62.5}, points = {{5.371, 17.5}, {-6.629, 17.5}, {-6.629, -22.5}, {7.251, -22.5}}, color = {1, 37, 163}));
  connect(parDelayTime.y, positiveDelayTime.u) annotation(Line(visible = true, origin = {-44, 83}, points = {{9, 6}, {9, -3}, {-18, -3}}, color = {1, 37, 163}));
  connect(u_delayTime, positiveDelayTime.u) annotation(Line(visible = true, origin = {-20.667, 86.667}, points = {{20.667, 13.333}, {20.667, -6.667}, {-41.333, -6.667}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>A smooth is a <em>first-order exponential information delay</em>. It is typically used to model time lags in forming an expectation or in perceiving some information.</p>
<p>Inside the converter there actually is a stock <em>x</em> that stores the perceived or expected value of the information input <strong><em>u</em></strong>. The output <strong><em>y</em></strong> is derived immediately from <em>x </em>as can be seen<em>&nbsp;</em>from these equations where&nbsp;<em>&tau;</em> denotes the <code>delayTime</code>:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/DiscreteDelay/Smooth/Formula.svg\" alt=\"y=x\"></p>
<h4>Notes</h4>
<ul>
<li>The <code>delayTime</code> given (either as constant parameter or continuous signal) will be clipped to a minimum value of <code>modelSettings.dt</code>, which denotes the smallest possible process time anywhere in the model. The time of delay for the process of information perception or expectation formation can thus never be zero or negative.</li>
</ul>
<ul>
<li>In&nbsp;the System Dynamics community a <em>smooth</em> is an <em>information delay</em> (as opposed to a <em>material delay</em>) [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">1</a>, Appendices E and H]. Information delays model the process of updating information to the actual value. Since the technical procedure is called <em>exponential smoothing</em>, the name smooth has prevailed.</li><br>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial output <strong>y</strong>.</li><br>
<li><em>SteadyState</em> will set the initial output <strong>y</strong> equal to the initial input <strong>u</strong>.</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free to find an initial output using <code>initialValue</code> as an initial guess.</li>
</ul>
</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">SmoothN</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Decay\">Decay</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-99.005, -12}, {99.005, 12}}, textString = "SMOOTH", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Smooth;
