within BusinessSimulation.CausalLoop;

model PipelineDelay "Fixed or pure delay of input flow"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Constants.small;
  extends Interfaces.PartialCLD.Delay;
  parameter Time maxDelayTime = 10 "Maximum delay time" annotation(Evaluate = true);
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Time samplingPeriod(min = small, max = modelSettings.dt) = modelSettings.samplingPeriod "Sampling period for discrete behavior (should be smaller than dt/2)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  Flows.Unidirectional.OutflowDynamicStock delayedOutflow annotation(Placement(visible = true, transformation(origin = {-30, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Stocks.PureDelay outflowDelay(initialValue = IDO, hasConstantDelayTime = false, maxDelayTime = maxDelayTime, init = init, samplingPeriod = samplingPeriod, strict = strict, redeclare final type OutputType = MaterialType) annotation(Placement(visible = true, transformation(origin = {10, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Stocks.PureDelay inflowDelay(hasConstantDelayTime = false, hasStockInfoOutput = hasStockInfoOutput, initialValue = IDI, maxDelayTime = maxDelayTime, init = init, samplingPeriod = samplingPeriod, strict = strict, redeclare final type OutputType = MaterialType) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth growing annotation(Placement(visible = true, transformation(origin = {-30, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Unidirectional.OutflowDynamicStock actuallyGrowing annotation(Placement(visible = true, transformation(origin = {50, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Growth shrinking annotation(Placement(visible = true, transformation(origin = {50, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SourcesOrSinks.Cloud cloud1 annotation(Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Decline actuallyShrinking annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(actuallyGrowing.portB, portB) annotation(Line(visible = true, origin = {102.5, -5}, points = {{-42.5, 5}, {-2.5, 5}, {-2.5, 5}, {47.5, 5}}, color = {128, 0, 128}));
  connect(actuallyShrinking.massPort, portB) annotation(Line(visible = true, origin = {122.5, -35}, points = {{-32.5, 15}, {-2.5, 15}, {-2.5, 35}, {27.5, 35}}, color = {128, 0, 128}));
  connect(growthRate, growing.u) annotation(Line(visible = true, origin = {-68, 2}, points = {{-77, -22}, {8, -22}, {8, 18}, {33, 18}, {33, 8}}, color = {0, 0, 128}));
  connect(declineRate, shrinking.u) annotation(Line(visible = true, origin = {-11.667, -43.333}, points = {{-133.333, 3.333}, {66.667, 3.333}, {66.667, -6.667}}, color = {0, 0, 128}));
  connect(cloud1.massPort, delayedOutflow.portB) annotation(Line(visible = true, origin = {-50, -60}, points = {{-10, 0}, {10, -0}}, color = {128, 0, 128}));
  connect(delayedOutflow.y, actuallyShrinking.u) annotation(Line(visible = true, origin = {20, -42.4}, points = {{-55, -7.2}, {-55, -2.6}, {55, -2.6}, {55, 12.4}}, color = {1, 37, 163}));
  connect(outflowDelay.outflow, delayedOutflow.portA) annotation(Line(visible = true, origin = {-10, -60}, points = {{10, 0}, {-10, 0}}, color = {255, 0, 0}));
  connect(outflowDelay.inflow, shrinking.massPort) annotation(Line(visible = true, origin = {30, -60}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(inflowDelay.outflow, actuallyGrowing.portA) annotation(Line(visible = true, origin = {30, 0}, points = {{-10, 0}, {10, 0}}, color = {255, 0, 0}));
  connect(inflowDelay.inflow, growing.massPort) annotation(Line(visible = true, origin = {-10, 0}, points = {{10, 0}, {-10, 0}}, color = {128, 0, 128}));
  connect(inflowDelay.y_stockInfo, stockInfoOutput) annotation(Line(visible = true, origin = {62.595, 43.467}, points = {{-44.595, -33.067}, {-44.595, 16.533}, {89.189, 16.533}}, color = {128, 0, 128}));
  connect(adjustedDelayTime.y, inflowDelay.u) annotation(Line(visible = true, origin = {-17.333, 26.667}, points = {{-44.667, 8.333}, {22.333, 8.333}, {22.333, -16.667}}, color = {1, 37, 163}));
  connect(adjustedDelayTime.y, outflowDelay.u) annotation(Line(visible = true, origin = {-10.4, -6}, points = {{-51.6, 41}, {0.4, 41}, {0.4, -19}, {25.4, -19}, {25.4, -44}}, color = {1, 37, 163}));
  connect(actualStockB.u2, outflowDelay.y2) annotation(Line(visible = true, origin = {60.417, -31.333}, points = {{21.583, 77.333}, {39.583, 77.333}, {39.583, -43.667}, {-30.417, -43.667}, {-30.417, -33.667}, {-39.917, -33.667}}, color = {1, 37, 163}));
  /* delay */
  annotation(defaultComponentName = "d", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The →<a href=\"modelica://BusinessSimulation.Stocks.PureDelay\"><code>PureDelay</code></a> is used to model a <em>pipeline delay</em>. The aggregate nature of causal loop modeling requires to make a clear distinction between delaying an <em>inflow</em> as opposed to an <em>outflow</em> to the stock connected to the <code>flowPort</code>: A delayed inflow will <em>reach</em> the stock with a delay, while a delayed outflow will <em>leave</em> the stock with a delay.</p>
<p>While modeling a delayed inflow is uncontroversial, modeling a delayed outflow imposes choices: Setting <code>subtractDelayedOutflow = true</code> will report the current amount in the stock less the amount that is in the process of being delayed at the <code>stockPort</code>. Accordingly, a process of <em>exponential decay</em> will not drain the stock below zero.</p>
<p>If this is not wanted, setting <code>subtractDelayedOutflow = false</code> will report the actual stock level, i.e., any material that has not yet left the stock will be considered a still <em>active</em> member of the stock in the process . Accordingly, a delayed process of exponential decay could drain the stock below zero.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/PipelineDelay/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<ul>
<li>The deduction of material in the process of leaving the stock (<em>delayed outflow</em>) is only relevant for the flow that is connected to the <code>stockPort</code>. Other flows connected to the stock, that is connected to the <code>stockPort</code> of the component will see the stock value without any \"premature\" deductions, i.e., material will only be deducted from the stock once it as truly left the stock.</li><br>
<li>Even though a delayed flow may potentially drain a stock below zero, constraints imposed by the stock will be observed, e.g., a →<a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\"><code>MaterialStock</code></a> cannot be drained below zero.</li><br>
<li><code>inflowDelay</code> and <code>outflowDelay</code> are by default initialized with zero elements in the process of flowing into and out of the connected stock. This can be changed by changing the values for the parameters <code>IDO</code> and <code>IDI</code> in the <code>Initialization</code> tab.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ExponentialDelay\">ExponentialDelay</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Polygon(visible = true, origin = {76.604, -32.5}, lineColor = {128, 128, 128}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-81.604, -2.5}, {-81.604, -2.5}, {-81.604, -47.5}, {73.396, -47.5}, {73.396, 52.5}, {53.396, 52.5}, {53.396, -2.5}}), Text(visible = true, origin = {105, -60}, textColor = {255, 255, 255}, extent = {{-38.763, -11.532}, {38.763, 11.532}}, textString = "Notional—Part of Stock Connected To portB"), Text(visible = true, origin = {-95, 0}, textColor = {128, 128, 128}, extent = {{-46.911, -3}, {46.911, 3}}, textString = "report stock value as actualStockB.y", fontName = "Lato", horizontalAlignment = TextAlignment.Left)}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%delayTime", fontName = "Lato")}));
end PipelineDelay;
