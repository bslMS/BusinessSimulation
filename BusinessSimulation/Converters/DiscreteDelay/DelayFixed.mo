within BusinessSimulation.Converters.DiscreteDelay;

model DelayFixed "Pipeline information delay without awareness"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.Time;
  import BusinessSimulation.Constants.inf;
  extends Interfaces.PartialConverters.SmoothSISO;
  Interfaces.Connectors.RealInput u_history if hasExogenousHistory "Historical input to be used in an initial period (up to maximumDelaytime)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  Interfaces.Connectors.RealOutput y_lookupTime if hasExogenousHistory "Time for looking up historical input" annotation(Placement(visible = true, transformation(origin = {160, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -360)));
  Interfaces.Connectors.RealInput u_delayTime if not hasConstantDelayTime "Delay time input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  parameter Time delayTime(min = modelSettings.dt) = 1 "Constant delay time (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter Time maximumDelayTime = 50 "Maximal value allowed for delay time (needed for variable delay time)" annotation(Evaluate = true, Dialog(enable = not hasConstantDelayTime));
  parameter Real initialValue = 0 "Initial constant output, if no exogenous history is given" annotation(Dialog(enable = not init == InitializationOptions.SteadyState and not hasExogenousHistory));
  parameter Boolean hasConstantDelayTime = true "= true, if the delay time is given by the parameter 'delayTime'" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasExogenousHistory = false "= true, if the input 'u_history' gives the output for an initial period, otherwise the initial output will remain constant until delayTime is reached" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  parameter Real initialOutput(start = initialValue, fixed = false) "Constant output if no exogenous history is provided; initialOutput.start = initialValue" annotation(Dialog(tab = "Initialization", enable = false));
  parameter Time initialDelayTime(fixed = false) "Delay time at initial time" annotation(Dialog(tab = "Initialization", enable = false));
  Add_2 historyHorizon "The modelStartTime plus the actual delayTime" annotation(Placement(visible = true, transformation(origin = {10, 55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverterTime parStartTime(value = modelSettings.modelStartTime) "The model's start time" annotation(Placement(visible = true, transformation(origin = {-32.804, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverterTime parDelayTime(value = delayTime) if hasConstantDelayTime "Constant delay time (optional)" annotation(Placement(visible = true, transformation(origin = {-130, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  ConstantConverter parInitialOutput(value = initialOutput) if not hasExogenousHistory "Initial output if not history is given" annotation(Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Clip clippedDelayTime(minValue = modelSettings.dt, maxValue = if not hasConstantDelayTime then maximumDelayTime else inf) "DelayTime has to be in the interval (dt, maximumDelayTime)" annotation(Placement(visible = true, transformation(origin = {-85, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableDelay delayedInput(delayMax = maximumDelayTime) if not hasConstantDelayTime annotation(Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PassThrough history annotation(Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InformationSources.TimeInput clock "Provide time since start time (=0)" annotation(Placement(visible = true, transformation(origin = {65, 95}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Logical.Less historyNeededQ "Is historical trajectory needed for output?" annotation(Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Logical.Switch switchedOutput "Either return historical value or delayed input" annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay delayedInputConstant(delayTime = delayTime) if hasConstantDelayTime "Delayed input with constant delay time" annotation(Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gap lookupTime if hasExogenousHistory "Time that needs to be looked up in historical input data" annotation(Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  initialDelayTime = clippedDelayTime.y;
  if init == InitializationOptions.FixedValue then
    initialOutput = initialValue;
  elseif init == InitializationOptions.SteadyState then
    initialOutput = u;
  end if;
equation
  connect(u_delayTime, clippedDelayTime.u) annotation(Line(visible = true, origin = {-102, 50}, points = {{-43, 10}, {2, 10}, {2, 10}, {9, 10}}, color = {1, 37, 163}));
  connect(u_history, history.u) annotation(Line(visible = true, origin = {-85.75, -50}, points = {{-59.25, 10}, {5.75, 10}, {5.75, -10}, {27.75, -10}}, color = {1, 37, 163}));
  connect(parInitialOutput.y, history.u) annotation(Line(visible = true, origin = {-83.25, -70}, points = {{-31.75, -10}, {3.25, -10}, {3.25, 10}, {25.25, 10}}, color = {1, 37, 163}));
  connect(clock.y, historyNeededQ.u1) annotation(Line(visible = true, origin = {65, 62.819}, points = {{0, 24.819}, {0, -24.819}}, color = {1, 37, 163}));
  connect(historyNeededQ.y, switchedOutput.u_cond) annotation(Line(visible = true, origin = {60.006, 15.156}, points = {{-0.006, 7.481}, {-0.006, -0.156}, {0.006, -0.156}, {0.006, -7.168}}, color = {1, 37, 163}));
  connect(delayedInput.y, switchedOutput.u2) annotation(Line(visible = true, origin = {16.25, -17.5}, points = {{-15.25, -12.5}, {-10.25, -12.5}, {-10.25, 12.5}, {35.75, 12.5}}, color = {1, 37, 163}));
  connect(switchedOutput.y, y) annotation(Line(visible = true, origin = {113.681, 0}, points = {{-46.319, 0}, {46.319, 0}}, color = {1, 37, 163}));
  connect(history.y, switchedOutput.u1) annotation(Line(visible = true, origin = {27.341, -27.5}, points = {{-69.979, -32.5}, {12.659, -32.5}, {12.659, 32.5}, {24.659, 32.5}}, color = {1, 37, 163}));
  connect(u, delayedInput.u) annotation(Line(visible = true, origin = {-85.5, -2.5}, points = {{-84.5, 2.5}, {45.5, 2.5}, {45.5, -27.5}, {63.5, -27.5}}, color = {1, 37, 163}));
  connect(u, delayedInputConstant.u) annotation(Line(visible = true, origin = {-78.423, 5}, points = {{-91.577, -5}, {38.423, -5}, {38.423, 5}, {56.423, 5}}, color = {1, 37, 163}));
  connect(delayedInputConstant.y, switchedOutput.u2) annotation(Line(visible = true, origin = {28.25, 2.5}, points = {{-27.25, 7.5}, {-8.25, 7.5}, {-8.25, -7.5}, {23.75, -7.5}}, color = {1, 37, 163}));
  connect(parDelayTime.y, clippedDelayTime.u) annotation(Line(visible = true, origin = {-98.25, 50}, points = {{-26.75, -10}, {-11.75, -10}, {-11.75, 10}, {5.25, 10}}, color = {1, 37, 163}));
  connect(clippedDelayTime.y, delayedInput.delayTime) annotation(Line(visible = true, origin = {-74.106, 25.333}, points = {{-3.532, 34.667}, {14.106, 34.667}, {14.106, -49.333}, {52.106, -49.333}}, color = {1, 37, 163}));
  connect(clippedDelayTime.y, lookupTime.u2) annotation(Line(visible = true, origin = {-31.409, 62.5}, points = {{-46.228, -2.5}, {-33.591, -2.5}, {-33.591, 2.5}, {113.409, 2.5}}, color = {1, 37, 163}));
  connect(clock.y, lookupTime.u1) annotation(Line(visible = true, origin = {70.667, 79.213}, points = {{-5.667, 8.425}, {-5.667, -4.213}, {11.333, -4.213}}, color = {1, 37, 163}));
  connect(lookupTime.y, y_lookupTime) annotation(Line(visible = true, origin = {129, 70}, points = {{-31, 0}, {31, 0}}, color = {1, 37, 163}));
  connect(parStartTime.y, historyHorizon.u2) annotation(Line(visible = true, origin = {-12.402, 50}, points = {{-14.402, -0}, {14.402, 0}}, color = {1, 37, 163}));
  connect(clippedDelayTime.y, historyHorizon.u1) annotation(Line(visible = true, origin = {-28.75, 57.5}, points = {{-48.25, 2.5}, {8.75, 2.5}, {8.75, 2.5}, {30.75, 2.5}}, color = {1, 37, 163}));
  connect(historyHorizon.y, historyNeededQ.u2) annotation(Line(visible = true, origin = {42.667, 49.333}, points = {{-24.667, 5.667}, {12.333, 5.667}, {12.333, -11.333}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-99.005, -12}, {99.005, 12}}, textString = "DELAY FIXED", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The real output <strong>y</strong> is the real input <strong>u&nbsp;</strong>delayed by a <em>fixed delay time</em> which can be constant (<code>delayTime</code>) or variable (<code>u_delayTime</code>) during the simulation.</p>
<p><code>y[t] = u[t - delayTime]</code></p>
<p>The input signal is thus effectively <em>shifted</em>&nbsp;forward in time.</p>
<p>During an initial period (at most as long as the initial <code>delayTime</code> or the <code>maximumDelayTime</code> when the delay time can vary over time), we need to&nbsp;provide information about the historical input <strong>u</strong> (e.g., the input before the start time of the simulation).&nbsp;The historical input can either be given&nbsp;by&nbsp;a <em>constant</em> value (either the&nbsp;<code>initialValue</code> or the initial input <strong>u</strong>) or by a <em>function of time</em> (usually a <a href=\"modelica://BusinessSimulation.Converters.Lookup.TableFunction\">TableFunction</a>), that will take the output connector <code>y_timeHistory</code> &nbsp;as input and then provide the relevant historical input via the input connector&nbsp;<code>u_history</code>.</p>
<h4>Notes</h4>
<ul>
<li>The behavior for <code>DelayInformation</code> and <code>DelayFixed</code> are quite similiar, but there is a subtle difference:<br><br>The <code>DelayInformation</code> models the delay in perceiving information where the recipient is <span style=\"text-decoration: underline;\">aware </span>of the delay time and thus will <span style=\"text-decoration: underline;\">disregard informatiion that is older</span> than the one he already has.<br><br>In the case of a <code>DelayFixed</code> we will strictly delay any information given the actual delay time at any point in time and thus may receive information that is actually <span style=\"text-decoration: underline;\">older</span> than previous information when the delay time increases.</li><br>
<li>Since information is stored within the component, a rectangle is used for the component to be reminiscent of a stock.</li><br>
<li>The <code>DelayFixed</code> is an <em>information delay,</em>&nbsp;that is used to model delays in updating beliefs and perceptions; unlike a material delay matter is not conserved [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">20</a>].<em>&nbsp;</em></li><br>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial output <strong>y</strong>.</li><br>
<li><em>SteadyState</em> will set the initial output <strong>y</strong> equal to the initial input <strong>u</strong>.</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free to find an initial output using <code>initialValue</code> as an initial guess.</li>
</ul>
</li>
</ul>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayInformation\">DelayInformation</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">SmoothN</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.Conveyor\">Conveyor</a></p>
</html>"));
end DelayFixed;
