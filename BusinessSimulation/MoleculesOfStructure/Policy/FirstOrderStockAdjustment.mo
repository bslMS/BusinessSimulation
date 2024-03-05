within BusinessSimulation.MoleculesOfStructure.Policy;

block FirstOrderStockAdjustment "Maintain a stock at a desired level"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import Modelica.Blocks.Types.LimiterHomotopy;
  extends Interfaces.PartialConverters.Policy_SO;
  Interfaces.Connectors.RealInput u_reference "Desired or reference amount in the stock under control" annotation(Placement(visible = true, transformation(origin = {-145, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_current "Current amount in the stock under control" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealInput u_outflow "Current outflow from the stock under control" annotation(Placement(visible = true, transformation(origin = {-145, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealInput u_adjTime if not hasConstantAdjTime "Variable time for adjustment (optional)" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  parameter Time adjTime(min = 0) = 1 "Time constant for the adjustment to the desired level (optional)" annotation(Dialog(enable = hasConstantAdjTime));
  parameter OutputType maxRate = inf "Maximum rate feasible (clippedRate.maxValue)" annotation(Dialog(enable = clipOutput));
  parameter Boolean hasConstantAdjTime = true "= true, if adjustment time is to be given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean clipOutput = false "= true, if the indicated rate is to clipped to not exceed limitations" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (constantLimiter.strict) (clip1.strict)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter LimiterHomotopy homotopyType = LimiterHomotopy.Linear "Simplified model for homotopy-based initialization (clip1.homotopyType)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Converters.Clip clippedRate(strict = strict, homotopyType = homotopyType, hasConstantLimits = true, minValue = 0, maxValue = maxRate) if clipOutput "Limit rate to feasible values" annotation(Placement(visible = true, transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough unchanged if not clipOutput "Leave the indicated rate unchanged" annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  CloseGap adjustment(hasConstantAdjTime = false, invertOutput = false, clipOutput = false) "Inflow needed to reach desired level of stock" annotation(Placement(visible = true, transformation(origin = {-10, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Add_2 totalAdjustment "Closing gap and compensate for outflow from stock" annotation(Placement(visible = true, transformation(origin = {40, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverterTime parAdjTime(value = adjTime) if hasConstantAdjTime "Constant time of adjustment (optional)" annotation(Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_outflow, totalAdjustment.u2) annotation(Line(visible = true, origin = {-21.75, -37.5}, points = {{-123.25, -32.5}, {41.75, -32.5}, {41.75, 32.5}, {53.75, 32.5}}, color = {0, 0, 127}));
  connect(u_reference, adjustment.u_reference) annotation(Line(visible = true, origin = {-83, 5}, points = {{-62, 0}, {62, 0}}, color = {0, 0, 128}));
  connect(u_current, adjustment.u_current) annotation(Line(visible = true, origin = {-55, 32}, points = {{-90, 8}, {45, 8}, {45, -16}}, color = {0, 0, 128}));
  connect(adjustment.y, totalAdjustment.u1) annotation(Line(visible = true, origin = {16.5, 5}, points = {{-15.5, 0}, {15.5, 0}}, color = {1, 37, 163}));
  connect(u_adjTime, adjustment.u_adjTime) annotation(Line(visible = true, origin = {-61.5, -10}, points = {{-83.5, -10}, {21.5, -10}, {21.5, 10}, {40.5, 10}}, color = {0, 0, 128}));
  connect(parAdjTime.y, adjustment.u_adjTime) annotation(Line(visible = true, origin = {-53.75, -20}, points = {{-60.25, -20}, {13.75, -20}, {13.75, 20}, {32.75, 20}}, color = {1, 37, 163}));
  connect(totalAdjustment.y, unchanged.u) annotation(Line(visible = true, origin = {65, 0}, points = {{-17, 0}, {17, 0}}, color = {1, 37, 163}));
  connect(unchanged.y, y) annotation(Line(visible = true, origin = {129, 0}, points = {{-31, 0}, {31, 0}}, color = {1, 37, 163}));
  connect(totalAdjustment.y, clippedRate.u) annotation(Line(visible = true, origin = {62.5, -10}, points = {{-14.5, 10}, {-2.5, 10}, {-2.5, -10}, {19.5, -10}}, color = {1, 37, 163}));
  connect(clippedRate.y, y) annotation(Line(visible = true, origin = {124.5, -10}, points = {{-26.5, -10}, {-4.5, -10}, {-4.5, 10}, {35.5, 10}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> indicates the rate of inflow required to keep a stock at a desired level. The (perceived) outflow from the stock will be replaced immediately to keep the stock at its current level, while the <em>gap</em>&nbsp;between the current level and the desired level will be closed using a &rarr;<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy.CloseGap\">CloseGap </a>component.</p>
<h4>Limitations</h4>
<ul>
<li>The output <strong>y</strong> can become negative to adjust the stock to a lower level; one needs to be careful in that case with using this value as we cannot always drain a stock in a production process in the same way that we fill it.</li>
</ul>
<h4>Notes</h4>
<ul>
<li>While often modelers simply adjust the outflow from a stock that is controlled by this component to <code>u_outflow</code> one should be aware of the fact, that in reality there will likely be a perception lag which may be modeled by a &rarr;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth </a>or a more elaborate structure.</li><br>
<li>Filling the stock under control may not be possible without delay, so the modeler may with to explicitly model a supply chain with explicit delays instead of connecting the output to an immediate inflow.</li><br>
<li>See [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>, pp. 38-39] or Jim Hines' <em>Molecules of Structure</em> website (→<a href=\"https://sdmolecules.org/index.htm#MoleculeTopics/CloseGap/FirstOrderSmooth/FirstOrderStockAdjustment/firstOrderStockAdjustment.htm\">First Order Stock Adjustment</a>) for more details on the use of this structure in system dynamics.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy.CloseGap\">CloseGap</a>, <a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Smooth\">Smooth</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SmoothN\">SmoothN</a></p>
<p>&nbsp;</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 12.5}, textColor = {0, 0, 128}, extent = {{-77.269, -12}, {77.269, 12}}, textString = "First-Order", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -12.5}, textColor = {0, 0, 128}, extent = {{-77.987, -12}, {77.987, 12}}, textString = "Stock Adjustment", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FirstOrderStockAdjustment;
