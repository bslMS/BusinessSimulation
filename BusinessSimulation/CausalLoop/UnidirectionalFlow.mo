within BusinessSimulation.CausalLoop;

model UnidirectionalFlow "Interaction with linear and nonlinear terms"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.Flow;
  parameter Rate rate = 1 "Base rate of flow from A to B";
protected
  Converters.Product_2 actualRate "Rate of flow" annotation(Placement(visible = true, transformation(origin = {-5, 25}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Flows.Unidirectional.Transition flowingFromAToB annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter baseRate(redeclare type OutputType = Rate, value = rate) "Base rate of flow" annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(portA, flowingFromAToB.portA) annotation(Line(visible = true, origin = {-80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(flowingFromAToB.portB, portB) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(actualRate.y, flowingFromAToB.u) annotation(Line(visible = true, origin = {-4.227, 11.03}, points = {{-0.773, 5.97}, {-0.773, -2.985}, {-0.773, -1.03}}, color = {1, 37, 163}));
  connect(one, actualRate.u2) annotation(Line(visible = true, origin = {-55, 37.667}, points = {{-90, 2.333}, {45, 2.333}, {45, -4.667}}, color = {0, 0, 128}));
  connect(u, actualRate.u2) annotation(Line(visible = true, origin = {-55, 51}, points = {{-90, 9}, {45, 9}, {45, -18}}, color = {0, 0, 128}));
  connect(baseRate.y, actualRate.u1) annotation(Line(visible = true, origin = {11.333, 51}, points = {{22.667, 9}, {-11.333, 9}, {-11.333, -18}}, color = {1, 37, 163}));
  connect(flowingFromAToB.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(flowingFromAToB.y1, y1) annotation(Line(visible = true, origin = {63.146, -22.5}, points = {{-52.646, 17.5}, {-23.146, 17.5}, {-23.146, -17.5}, {98.937, -17.5}}, color = {1, 37, 163}));
  /* flow */
  annotation(defaultComponentName = "f", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using →<a href = \"modelica://BusinessSimulation.Flows.Unidirectional.Transition\"><code>Transition</code></a> this component allows to model a transition from stock <strong>A</strong> (connected to <code>portA</code>) to stock <strong>B</strong> (connected to <code>portB</code>) at a rate given by the parameter <code>rate</code>. The parameter <code>rate</code> is multiplied either with 1 (<code>hasFactor = false</code>) or an exogenous factor <strong>u</strong> (<code>hasFactor = true</code>). Upon setting <code>hasRateOutput = true</code> the component will report the current rate of flow via an output connector (<code>y</code>).</p>
<h4>Notes</h4>
<ul>
<li>Using <code>rate = 1</code> and <code>hasFactor = true</code> a <em>unidirectional flow</em></a> can be modeled, whose rate is given by the input <strong>u</strong>. Note that negative values will be clipped to zero as only flows from   <strong>A</strong> to <strong>B</strong> are permitted.</li><br>
<li>The parameters <code>polA</code> and <code>polB</code> allow to give visual cues with regard to polarity in the diagram.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.CausalLoop.ComplexInteraction\">ComplexInteraction</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li><br>
<li>Fixed that <code>rate</code> was not used in v2.1.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 25}, textColor = {0, 0, 128}, extent = {{-50, -6}, {50, 6}}, textString = "%rate", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end UnidirectionalFlow;
