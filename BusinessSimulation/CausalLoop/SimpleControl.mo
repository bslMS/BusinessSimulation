within BusinessSimulation.CausalLoop;

model SimpleControl "Directly influencing a stock to keep it at setpoint value"
  import BusinessSimulation.Units.Time;
  extends BusinessSimulation.Interfaces.PartialCLD.Control;
  parameter Time adjTime(min = modelSettings.dt) = 1 "Time constant for stock control";
  outer ModelSettings modelSettings;
protected
  MoleculesOfStructure.Policy.CloseGap rate(adjTime = adjTime, clipOutput = false) "Rate of Change" annotation(Placement(visible = true, transformation(origin = {-40, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange changing "Flow to adjust the stock" annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 actualRate "Actual rate, which becomes zero when control is turned off" annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(changing.massPort, flowPort) annotation(Line(visible = true, origin = {105, 0}, points = {{-45, 0}, {45, -0}}, color = {128, 0, 128}));
  connect(rate.y, actualRate.u1) annotation(Line(visible = true, origin = {-19.25, 12.5}, points = {{-9.75, 12.5}, {-0.75, 12.5}, {-0.75, 12.5}, {11.25, 12.5}}, color = {1, 37, 163}));
  connect(onOff.y, actualRate.u2) annotation(Line(visible = true, origin = {-32.5, -12.5}, points = {{-49.5, -7.5}, {12.5, -7.5}, {12.5, 27.5}, {24.5, 27.5}}, color = {1, 37, 163}));
  connect(permanent.y, actualRate.u2) annotation(Line(visible = true, origin = {-33, -22.5}, points = {{-51, -17.5}, {13, -17.5}, {13, 37.5}, {25, 37.5}}, color = {1, 37, 163}));
  connect(actualRate.y, changing.u) annotation(Line(visible = true, origin = {32.667, 16.667}, points = {{-24.667, 3.333}, {12.333, 3.333}, {12.333, -6.667}}, color = {1, 37, 163}));
  connect(currentValue.stock, rate.u_current) annotation(Line(visible = true, origin = {40.024, 46.75}, points = {{80.024, -15.75}, {80.024, 13.25}, {-80.024, 13.25}, {-80.024, -10.75}}, color = {1, 37, 163}));
  connect(setpoint.y, rate.u_reference) annotation(Line(visible = true, origin = {-63.25, 32.5}, points = {{-18.75, 7.5}, {3.25, 7.5}, {3.25, -7.5}, {12.25, -7.5}}, color = {1, 37, 163}));
  connect(u, rate.u_reference) annotation(Line(visible = true, origin = {-79, 12.5}, points = {{-66, -12.5}, {19, -12.5}, {19, 12.5}, {28, 12.5}}, color = {0, 0, 128}));
  connect(changing.y, y) annotation(Line(visible = true, origin = {90.615, 30.133}, points = {{-35.615, -19.733}, {-35.615, 9.867}, {71.23, 9.867}}, color = {1, 37, 163}));
  connect(changing.y1, y1) annotation(Line(visible = true, origin = {95.646, -22.5}, points = {{-35.146, 17.5}, {-15.646, 17.5}, {-15.646, -17.5}, {66.437, -17.5}}, color = {1, 37, 163}));
  /* control */
  annotation(preferredView = "diagram", defaultComponentName = "c", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>SimpleControl</em> uses a →<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy.CloseGap\"><code>CloseGap</code></a> component to arrive (naively) at a flow that is needed to move a connected stock \"under management\" to a given <em>setpoint</em>, i.e., goal. The strength of the flow, i.e., the speed of the adjustment, is controlled by the parameter <code>adjTime</code>.</p>
<p>The control's <em>setpoint</em> can be provided either by a →<a href=\"modelica://BusinessSimulation.InformationSources.RampInput\"><code>RampInput</code></a> or by an exogenous input <strong>u</strong>. In case of a <em>ramp input</em> the setpoint will move from <code>initialSetpoint</code> to <code>finalSetpoint</code> in linear fashion for a period given by <code>duration</code> starting at <code>startTime</code>.</p>
<p>The controller by default is active over the whole simulation run, but can be restricted to an <em>on-off period</em> using <code>tc = TimingChoices.period</code> and the parameters <code>onTime</code> and <code>offTime</code>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/SimpleControl/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.PID_Control\">PID_Control</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.InputControl\">InputControl</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SimpleControl;
