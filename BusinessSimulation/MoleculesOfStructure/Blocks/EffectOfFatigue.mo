within BusinessSimulation.MoleculesOfStructure.Blocks;

block EffectOfFatigue "Modeling the influence of excessive workloads on productivity or quality"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import BusinessSimulation.Types.InitializationOptions;
  extends Icons.SubsystemBlock;
  Interfaces.Connectors.RealInput u "Input of workload" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_ref if not hasConstantReference "Input for the reference workload (optional)" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealOutput y "Effect on Productivity given as a multiplier" annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Time timeToGetFatigued(min = 0) "Time constant for the exponential smooth of overtime in periods";
  parameter Rate referenceWorkload(min = 0.1) = 1 "Constant reference workload (optinal)" annotation(Dialog(enable = hasConstantReference));
  parameter Integer delayOrder(min = 1) = 1 "Delay order of the smooth for workload" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real effectMax(min = 1) = 1.1 "The upper bound for the effect of less work than normal on PDY (MAX >= 1)";
  parameter Real effectMin(min = 0, max = 1) = 0 "The lower bound for the effect of fatigue on PDY (MIN >= 0)";
  parameter Real steepness(min = 0) = 10 "High values indicate a steep gradient for the lookup curve (JanoschoekNegative.growthRate)";
  parameter Boolean hasConstantReference = true "= true, if the reference workload is given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean clipEffect = false "= true, if the maximum effect is to be 1.0" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real initialFatigue = 1 "Initial Output (fatigue.initialValue)" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (clippedEffect.strict)" annotation(Evaluate = true, Dialog(enable = clipEffect, tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Converters.DmnlInput normalizedWorkload(hasConstantReference = false) "Workload divided by the normal workload" annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter parRef(value = referenceWorkload, redeclare replaceable type OutputType = Rate) if hasConstantReference "Constant reference value for the workload (optional)" annotation(Placement(visible = true, transformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Lookup.JanoschekNegative effectOnOutcome(lowerBound = effectMin, upperBound = effectMax, growthRate = steepness) "The multiplicative effect of fatigue on productivity or quality" annotation(Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.SmoothN fatigue(initialValue = initialFatigue, delayTime = timeToGetFatigued, n = delayOrder, hasConstantDelayTime = true) "Fatigue is an n-th order smooth of overtime" annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Clip clippedEffect(minValue = -inf, maxValue = 1, redeclare replaceable type OutputType = Dimensionless, hasConstantLimits = true, strict = strict) if clipEffect "Clip Effect to only allow values within the closed unit interval" annotation(Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough unchangedEffect if not clipEffect "Leave the effect unchanged" annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(effectMin < effectMax, "The lower bound for the effect must be smaller than the upper bound", level = AssertionLevel.warning);
  assert(effectMax > 1, "The upper bound for the lookup must be above 1—use clipEffect to constrict the effect", level = AssertionLevel.warning);
  assert(steepness > 0, "Steepness should by greater than zero", level = AssertionLevel.warning);
  connect(fatigue.y, effectOnOutcome.u) annotation(Line(visible = true, origin = {-29, 0}, points = {{-11, 0}, {11, 0}}, color = {0, 0, 127}));
  connect(normalizedWorkload.y, fatigue.u) annotation(Line(visible = true, origin = {-70.681, 0}, points = {{-11.319, 0}, {11.319, 0}}, color = {1, 37, 163}));
  connect(u, normalizedWorkload.u) annotation(Line(visible = true, origin = {-121.5, -0}, points = {{-23.5, -0}, {23.5, 0}}, color = {0, 0, 128}));
  connect(parRef.y, normalizedWorkload.u_reference) annotation(Line(visible = true, origin = {-94.667, 29.333}, points = {{-9.333, 10.667}, {4.667, 10.667}, {4.667, -21.333}}, color = {1, 37, 163}));
  connect(u_ref, normalizedWorkload.u_reference) annotation(Line(visible = true, origin = {-108.333, 42.667}, points = {{-36.667, 17.333}, {18.333, 17.333}, {18.333, -34.667}}, color = {0, 0, 128}));
  connect(effectOnOutcome.y, unchangedEffect.u) annotation(Line(visible = true, origin = {20, 0}, points = {{-22, 0}, {22, 0}}, color = {1, 37, 163}));
  connect(unchangedEffect.y, y) annotation(Line(visible = true, origin = {109, 0}, points = {{-51, 0}, {51, 0}}, color = {1, 37, 163}));
  connect(effectOnOutcome.y, clippedEffect.u) annotation(Line(visible = true, origin = {20, -15}, points = {{-22, 15}, {0, 15}, {0, -15}, {22, -15}}, color = {1, 37, 163}));
  connect(clippedEffect.y, y) annotation(Line(visible = true, origin = {94.5, -15}, points = {{-36.5, -15}, {-14.5, -15}, {-14.5, 15}, {65.5, 15}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p><em>Fatigue</em> is modeled as a smooth of the normalized input <strong>u</strong> which is indicating the current workload with regard to capital equipment or workers. The current workload will be normalized by dividing the input <strong>u</strong> by a constant or a variable <em>reference workload</em> (<code>referenceWorkload</code> or <code>u_ref</code>, respectively). The <code>timeToGetFatigued</code> describes the time constant for the smooth and indicates the lag between beginning to work at an excessive level and the onset of the full effect on productivity (or quality).</p>
<p>Janoscheks growth curve is used to model the nonlinear effect of a prolonged work intensity. It describes a negatively sloping s-shaped curve that will pass through the reference point (1,1). The upper bound of the effect (<code>effectMax</code>) must be given slightly above 1.0 as the curve will collapse in all other cases. If the effect is to be clipped at 1.0 then the parameter <code>clipEffect</code> should be set to <code>true</code>.</p>
<h4>Notes</h4>
<ul>
<li>The <em>workload</em> (and its reference value) will typically be some rate (e.g., <code>hours worked per month</code>, <code>output per hour</code> etc.).<br><br></li>
<li>Jim Hines [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>, p. 82] uses <em>overtime</em> as the main driver of fatigue. See also on his <em>Molecules of Structure</em> website (→<a href = \"https://sdmolecules.org/index.htm#MoleculeTopics/DimensionlessInputToFunction/UnivariateAnchoringAndAdjustment/EffectOfFatigue/EffectOfFatigue.htm\">Effect of Fatigue</a>).</li><br>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialFatigue</code> to determine the initial output of the smoothed, normalized workload.</li><br>
<li><em>SteadyState</em> will set the initialFatigue to the normalized workload at the start of the simulation.</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free to find an initial value for <code>fatigue</code> using <code>initialFatigue</code> as an initial guess.</li>
</ul>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">SmoothN</a>,
<a href=\"modelica://BusinessSimulation.Converters.Lookup.JanoschekNegative\">JanoschekNegative</a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 0, 128}, extent = {{-100, -12}, {100, 12}}, textString = "Effect of Fatigue", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {3.406, -40}, textColor = {0, 0, 128}, extent = {{-53.406, -6}, {53.406, 6}}, textString = "Fatigue", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-9.184, -30}, points = {{-46.394, 0}, {77.285, 0}}, color = {128, 128, 128}, thickness = 1), Line(visible = true, origin = {-55.548, 15.857}, rotation = -270, points = {{-45.857, 0}, {34.143, 0}}, color = {128, 128, 128}, thickness = 1), Text(visible = true, origin = {-64.078, 47.363}, textColor = {0, 0, 128}, extent = {{-9.128, -6}, {9.128, 6}}, textString = "y", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-16.063, -7.873}, points = {{-39.523, 20.125}, {14.222, 20.125}, {32.628, -20.736}, {77.803, -20.736}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Line(visible = true, origin = {2.099, -2.709}, points = {{-56.948, 1.709}, {-2.099, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Line(visible = true, origin = {1.314, -32.099}, rotation = -90, points = {{-32.099, 1.709}, {-2.099, 1.709}}, color = {128, 128, 128}, pattern = LinePattern.Dot, thickness = 1), Ellipse(visible = true, origin = {3.097, -1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Ellipse(visible = true, origin = {-55.199, -1}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}}), Ellipse(visible = true, origin = {3.097, -30}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-2, -2}, {2, 2}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end EffectOfFatigue;
