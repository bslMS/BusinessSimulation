within BusinessSimulation.MoleculesOfStructure.Policy;

block CloseGap "Determine the rate of flow (action) to close a gap between a quantity and its desired value"
  import BusinessSimulation.Units.{Time,Rate};
  import BusinessSimulation.Constants.inf;
  import Modelica.Blocks.Types.LimiterHomotopy;
  extends Interfaces.PartialConverters.Policy_SO(redeclare replaceable type OutputType = Units.Rate);
  Interfaces.Connectors.RealInput u_reference "Desired or reference value for the controlled quantity (i.e. the goal)" annotation(Placement(visible = true, transformation(origin = {-145, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Interfaces.Connectors.RealInput u_current "Current value of controlled quantity" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -450)));
  Interfaces.Connectors.RealInput u_adjTime if not hasConstantAdjTime "Time to close the gap" annotation(Placement(visible = true, transformation(origin = {-145, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Time adjTime(min = 0) = 1 "Time to close the gap" annotation(Dialog(enable = hasConstantAdjTime));
  parameter Rate maxRate = inf "Maximum rate feasible" annotation(Dialog(enable = clipOutput));
  parameter Rate minRate = 0 "Minimum rate feasible" annotation(Dialog(enable = clipOutput));
  parameter Boolean hasConstantAdjTime = true "= true, if the time to close the gap is a constant paramater" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean invertOutput = false "= true, if the output is to be multiplied with (-1)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean clipOutput = false "= true, if the indicated rate is to clipped to not exceed limitations" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (constantLimiter.strict) (clip1.strict)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter LimiterHomotopy homotopyType = LimiterHomotopy.Linear "Simplified model for homotopy-based initialization (constantLimiter.homotopyType) (clip1.homotopyType)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Converters.PassThrough unchanged1 if not invertOutput "Use the calculated net rate of flow" annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Gain invertedAction(c = -1) if invertOutput "This will turn negative rates to positive ones (for use with an outflow)" annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough unchanged2 if not clipOutput "Use the calculated net rate of flow" annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Clip clip1(maxValue = maxRate, minValue = minRate, hasConstantLimits = true, strict = strict, homotopyType = homotopyType) if clipOutput annotation(Placement(visible = true, transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parAdjTime(final value = adjTime) if hasConstantAdjTime "Constant time to close the gap (optional)" annotation(Placement(visible = true, transformation(origin = {-100, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Gap gap "Difference between the goal and the current value" annotation(Placement(visible = true, transformation(origin = {-40, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Division_Guarded actionToCloseGap(final outputIfZero = 0) "Rate of (net) flow to close the gap" annotation(Placement(visible = true, transformation(origin = {-2.412, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_reference, gap.u1) annotation(Line(visible = true, origin = {-70.25, 30.075}, points = {{-74.75, 19.925}, {17.25, 19.925}, {17.25, -20.075}, {22.25, -20.075}}, color = {0, 0, 127}));
  connect(u_current, gap.u2) annotation(Line(visible = true, origin = {-96.5, 0}, points = {{-48.5, 0}, {48.5, 0}}, color = {0, 0, 127}));
  connect(gap.y, actionToCloseGap.u1) annotation(Line(visible = true, origin = {-21.206, 5}, points = {{-10.794, 0}, {10.794, 0}}, color = {0, 0, 127}));
  connect(u_adjTime, actionToCloseGap.u2) annotation(Line(visible = true, origin = {-44.191, -32.5}, points = {{-100.809, -27.5}, {24.191, -27.5}, {24.191, 27.5}, {33.779, 27.5}}, color = {0, 0, 127}));
  connect(parAdjTime.y, actionToCloseGap.u2) annotation(Line(visible = true, origin = {-36.103, -20}, points = {{-57.897, -15}, {16.103, -15}, {16.103, 15}, {25.691, 15}}, color = {1, 37, 163}));
  connect(actionToCloseGap.y, unchanged1.u) annotation(Line(visible = true, origin = {18.794, 0}, points = {{-13.206, 0}, {13.206, 0}}, color = {1, 37, 163}));
  connect(actionToCloseGap.y, invertedAction.u) annotation(Line(visible = true, origin = {15.691, -10}, points = {{-10.103, 10}, {-3.103, 10}, {-3.103, -10}, {16.309, -10}}, color = {1, 37, 163}));
  connect(unchanged1.y, unchanged2.u) annotation(Line(visible = true, origin = {65, 0}, points = {{-17, 0}, {17, 0}}, color = {1, 37, 163}));
  connect(unchanged2.y, y) annotation(Line(visible = true, origin = {129, 0}, points = {{-31, 0}, {31, 0}}, color = {1, 37, 163}));
  connect(invertedAction.y, unchanged2.u) annotation(Line(visible = true, origin = {60, -10}, points = {{-12, -10}, {0, -10}, {0, 10}, {22, 10}}, color = {1, 37, 163}));
  connect(unchanged1.y, clip1.u) annotation(Line(visible = true, origin = {62.5, -10}, points = {{-14.5, 10}, {2.5, 10}, {2.5, -10}, {19.5, -10}}, color = {1, 37, 163}));
  connect(invertedAction.y, clip1.u) annotation(Line(visible = true, origin = {65, -20}, points = {{-17, 0}, {17, 0}}, color = {1, 37, 163}));
  connect(clip1.y, y) annotation(Line(visible = true, origin = {124.5, -10}, points = {{-26.5, -10}, {-4.5, -10}, {-4.5, 10}, {35.5, 10}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is given by the expression:</p>
<p><code>y = (u_reference - u_current) / u_adjTime</code></p>
<p>where the <em>time to close the gap</em> (<code>u_adjTime</code>) can alternatively be a constant (<code>adjTime</code>). If the <em>adjustement time</em> is zero, then the output <strong>y</strong> will be zero as well.</p>
<h4>Limitations</h4>
<ul>
<li>The adjustment time must not be negative. Negative values will be caught by an assert statement and will cause the simulation to stop.</li><br>
<li>Catching a division by zero (e.g.<em>adjustement time</em> is zero) by&nbsp;returning a zero output&nbsp;will not be an adequate structure if some kind of discrete behavior is what is wanted:&nbsp; Adjustement time being zero may then mean that the stock should change immediately which usually only makes sense at defined events. If such discrete behavior is intended this structure should not be used.</li>
</ul>
<h4>Notes</h4>
<ul>
<li>The output may be multiplied with (-1) in order to use the output to control an outflow.<br><br></li>
<li>See [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>, p. 30] or Jim Hines' <em>Molecules of Structure</em> website (→<a href= \"https://sdmolecules.org/index.htm#MoleculeTopics/CloseGap/closeGap.htm\">Close Gap</a>) for more details on the use of this structure within System Dynamics.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -0.409}, textColor = {0, 0, 128}, extent = {{-77.269, -12}, {77.269, 12}}, textString = "Close Gap", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end CloseGap;
