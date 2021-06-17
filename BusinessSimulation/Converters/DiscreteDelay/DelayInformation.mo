within BusinessSimulation.Converters.DiscreteDelay;

model DelayInformation "Pipeline information delay with awareness"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.Time;
  import BusinessSimulation.Constants.{inf,small};
  extends Interfaces.PartialConverters.SmoothSISO;
  Interfaces.Connectors.RealInput u_history if hasExogenousHistory "Input of recent history (start time - initial delay time)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  Interfaces.Connectors.RealOutput y_lookupTime if hasExogenousHistory "Time for looking up historical input" annotation(Placement(visible = true, transformation(origin = {158.118, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -360)));
  Interfaces.Connectors.RealInput u_delayTime if not hasConstantDelayTime "Delay time input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -810)));
  parameter Time delayTime(min = modelSettings.dt) = 1 "Constant delay time (optional)" annotation(Dialog(enable = hasConstantDelayTime));
  parameter Time maximumDelayTime = 50 "Maximal value allowed for delay time (needed for variable delay time)" annotation(Evaluate = true, Dialog(enable = not hasConstantDelayTime));
  parameter OutputType initialValue = 0 "Initial constant output, if no exogenous history is given" annotation(Dialog(enable = not init == InitializationOptions.SteadyState and not hasExogenousHistory));
  parameter Boolean hasConstantDelayTime = true "= true, if the delay time is given by the parameter 'delayTime'" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasExogenousHistory = false "= true, if the input 'u_history' gives the output for an initial period, otherwise the initial output will remain constant until delayTime is reached" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Time samplingPeriod(min = small, max = modelSettings.dt) = modelSettings.samplingPeriod "Interval at which to check for increases in delay time" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  // variables
  parameter Real initialOutput(start = initialValue, fixed = false) "Constant output if no exogenous history is provided" annotation(Dialog(tab = "Initialization", enable = false));
  parameter Time initialDelayTime(fixed = false) "Delay time at initial time" annotation(Dialog(tab = "Initialization", enable = false));
  Time t_delayed "Time stamp for the delayed time (if less than zero => use historical input)";
  discrete Real sampledDelayedInformation "Delayed information sampled when the delay time increased";
  discrete Time t_sample "Time, when the delay time last increased";
  // components
  ConstantConverterTime parDelayTime(value = delayTime) if hasConstantDelayTime "Constant delay time (optional)" annotation(Placement(visible = true, transformation(origin = {-87.5, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  ConstantConverter parInitialOutput(value = initialOutput) if not hasExogenousHistory "Initial output if not history is given" annotation(Placement(visible = true, transformation(origin = {-77.5, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Clip clippedDelayTime(minValue = modelSettings.dt, maxValue = if not hasConstantDelayTime then maximumDelayTime else inf) "DelayTime has to be in the interval (dt, maximumDelayTime)" annotation(Placement(visible = true, transformation(origin = {-42.5, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableDelay delayedInput(delayMax = maximumDelayTime) if not hasConstantDelayTime annotation(Placement(visible = true, transformation(origin = {27.5, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PassThrough history annotation(Placement(visible = true, transformation(origin = {-7.5, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay delayedInputConstant(delayTime = delayTime) if hasConstantDelayTime "Delayed input with constant delay time" annotation(Placement(visible = true, transformation(origin = {27.5, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PassThrough delayedInformation "Delayed input to use for further processing" annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InformationSources.TimeInput clock "Provide time starting with 0" annotation(Placement(visible = true, transformation(origin = {45, 85}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gap lookupTime if hasExogenousHistory "Time that needs to be looked up in historical input data" annotation(Placement(visible = true, transformation(origin = {90, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  initialDelayTime = clippedDelayTime.y;
  if init == InitializationOptions.FixedValue then
    initialOutput = initialValue;
  elseif init == InitializationOptions.SteadyState then
    initialOutput = u;
  end if;
  pre(t_sample) = modelSettings.modelStartTime - initialDelayTime;
  pre(sampledDelayedInformation) = delayedInformation.y;
algorithm
  // check for increase in delay time at samplingPeriod-intervals
  when sample(modelSettings.modelStartTime + samplingPeriod, samplingPeriod) then
    if noEvent(pre(clippedDelayTime.y) < clippedDelayTime.y) then
      // sample delayed information and store the time of sampling
      t_sample := clock.y;
      sampledDelayedInformation := pre(delayedInformation.y);
    end if;
  end when;
  t_delayed := max(t_sample, clock.y - clippedDelayTime.y);
  // while the historical information is more recent (e.g t_delayed < 0), use it
  // otherwise decide if the last sample or the actual delayed information is more recent
  y := if t_delayed < modelSettings.modelStartTime then history.y elseif t_sample > clock.y - clippedDelayTime.y then sampledDelayedInformation else delayedInformation.y;
equation
  connect(u_delayTime, clippedDelayTime.u) annotation(Line(visible = true, origin = {-59.5, 50}, points = {{-85.5, 10}, {2, 10}, {2, 10}, {9, 10}}, color = {1, 37, 163}));
  connect(u_history, history.u) annotation(Line(visible = true, origin = {-43.25, -50}, points = {{-101.75, 10}, {5.75, 10}, {5.75, -10}, {27.75, -10}}, color = {1, 37, 163}));
  connect(parInitialOutput.y, history.u) annotation(Line(visible = true, origin = {-40.75, -70}, points = {{-31.75, -10}, {3.25, -10}, {3.25, 10}, {25.25, 10}}, color = {1, 37, 163}));
  connect(u, delayedInput.u) annotation(Line(visible = true, origin = {-43, -2.5}, points = {{-127, 2.5}, {5.5, 2.5}, {5.5, -27.5}, {58.5, -27.5}}, color = {1, 37, 163}));
  connect(u, delayedInputConstant.u) annotation(Line(visible = true, origin = {-35.923, 5}, points = {{-134.077, -5}, {-1.577, -5}, {-1.577, 5}, {51.423, 5}}, color = {1, 37, 163}));
  connect(parDelayTime.y, clippedDelayTime.u) annotation(Line(visible = true, origin = {-55.75, 50}, points = {{-26.75, -10}, {-11.75, -10}, {-11.75, 10}, {5.25, 10}}, color = {1, 37, 163}));
  connect(clippedDelayTime.y, delayedInput.delayTime) annotation(Line(visible = true, origin = {-31.606, 25.333}, points = {{-3.532, 34.667}, {31.606, 34.667}, {31.606, -49.333}, {47.106, -49.333}}, color = {1, 37, 163}));
  connect(delayedInputConstant.y, delayedInformation.u) annotation(Line(visible = true, origin = {46.875, 5}, points = {{-8.375, 5}, {-3.375, 5}, {-3.375, -5}, {15.125, -5}}, color = {1, 37, 163}));
  connect(delayedInput.y, delayedInformation.u) annotation(Line(visible = true, origin = {46.875, -15}, points = {{-8.375, -15}, {-3.375, -15}, {-3.375, 15}, {15.125, 15}}, color = {1, 37, 163}));
  connect(clock.y, lookupTime.u1) annotation(Line(visible = true, origin = {63.591, 77.5}, points = {{-11.228, 7.5}, {-3.591, 7.5}, {-3.591, -7.5}, {18.409, -7.5}}, color = {1, 37, 163}));
  connect(clippedDelayTime.y, lookupTime.u2) annotation(Line(visible = true, origin = {41.716, 62.5}, points = {{-76.853, -2.5}, {18.284, -2.5}, {18.284, -2.5}, {40.284, -2.5}}, color = {1, 37, 163}));
  connect(lookupTime.y, y_lookupTime) annotation(Line(visible = true, origin = {128.059, 65}, points = {{-30.059, 0}, {30.059, 0}}, color = {1, 37, 163}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -100}, {146.892, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 12.5}, textColor = {0, 0, 128}, extent = {{-99.005, -12}, {99.005, 12}}, textString = "DELAY", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -12.5}, textColor = {0, 0, 128}, extent = {{-100, -12}, {100, 12}}, textString = "INFORMATION", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The real output <strong>y</strong> is the real input <strong>u&nbsp;</strong>delayed by a <em>fixed delay time</em> which can be constant (<code>delayTime</code>) or variable (<code>u_delayTime</code>) during the simulation.</p>
<p><code>y[t] = u[t - delayTime]</code></p>
<p>The input signal is thus effectively <em>shifted</em>&nbsp;forward in time.</p>
<p>During an initial period (at most as long as the initial <code>delayTime</code> or the <code>maximumDelayTime</code> when the delay time can vary over time), we need to&nbsp;provide information about the historical input <strong>u</strong> (e.g. the input before the start time of the simulation).&nbsp;The historical input can either be given&nbsp;by&nbsp;a <em>constant</em> value (either the&nbsp;<code>initialValue</code> or the initial input <strong>u</strong>) or by a <em>function of time</em> (usually a <a href=\"modelica://BusinessSimulation.Converters.Lookup.TableFunction\">TableFunction</a>), that will take the output connector <code>y_timeHistory</code> &nbsp;as input and then provide the relevant historical input via the input connector&nbsp;<code>u_history</code>.</p>
<p>Given, that the delay time may be variable, we must distinguish two kinds of changes:</p>
<ul>
<li><strong>Delay time increases</strong>:<br>In this case, the delayed information shortly after the increase would be <em>older</em> than what we <em>knew</em> at the instant, the delay time increased. Instead of using older information, we will <em>hold the previous information</em> until more recent information becomes available.</li><br>
<li><strong>Delay time decreases</strong>:<br>In this case, we would <em>disregard</em> historical or older information and <em>jump towards the new level of information</em>.</li>
</ul>
<h4>Implementation</h4>
<p>Internally a <code>TimeInput</code> component is used to provide a <em>clock</em> starting at <code>modelSettings.modelStartTime</code>. Whenever the clipped delay time increases, the delayed information and the time it was sampled (<code>t_sampled</code>) will be stored. As long as <code>max(t_sampled, clock.y - clippedDelayTime.y)</code> is less than <code>modelSetting.modelStartTime</code>, the historical information (either the constant <code>initialValue</code> or the input <code>u_hist</code>) is reported as output <strong>y</strong>.</p>
<p>Once the current delayed output becomes more recent (either because time has proceeded beyond the initial delay time or the current delay time has significantly decreased), it will be used. From then on, the last stored information (e.g. information that is on hold due to an increase in delay time) will be compared with the currently delayed information output and whatever is more recent will be returned.</p>
<p>As checking for increases in the delay time can introduce a lot of events, the checks will only be done a regular time events given by the parameter <code>samplingPeriod</code> in the <em>Advanced</em> tab.&nbsp;</p>
<h4>Notes</h4>
<ul>
<li>The behavior for <code>DelayInformation</code> and <code>DelayFixed</code> are quite similiar, but there is a subtle difference:<br><br>A <code>DelayInformation</code> models the delay in perceiving information where the recipient is <span style=\"text-decoration: underline;\">aware</span> of the delay time and thus will <span style=\"text-decoration: underline;\">disregard older informatiion</span> than the one he already has.<br><br>In the case of a <code>DelayFixed</code> we will strictly delay any information given the actual delay time at any point in time and thus may receive information that is actually <span style=\"text-decoration: underline;\">older</span> than previous information when the delay time increases.</li><br>
<li>Since information is stored within the component, a rectangle is used for the component to be reminiscent of a stock.</li><br>
<li>A <code>DelayInformation</code> is an <em>information delay,</em>&nbsp;that is used to model delays in updating beliefs and perceptions; unlike a material delay matter is not conserved [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">20</a>].<em>&nbsp;</em></li><br>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a> (but <code>hasExogenousHistory = true</code> will allways have priority):<br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial output <strong>y</strong>.</li><br>
<li><em>SteadyState</em> will set the initial output <strong>y</strong> equal to the initial input <strong>u</strong>.</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free to find an initial output using <code>initialValue</code> as an initial guess.</li>
</ul>
</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.DelayFixed\">DelayFixed</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">SmoothN</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.Conveyor\">Conveyor</a></p>
</html>"));
end DelayInformation;
