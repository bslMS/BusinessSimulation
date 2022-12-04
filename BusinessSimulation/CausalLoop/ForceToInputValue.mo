within BusinessSimulation.CausalLoop;

model ForceToInputValue "Flow is obtained as closing the gap to input value"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.RealInputToFlow;
  parameter Units.Time adjTime(min = 0) = modelSettings.dt "Time to close the gap";
  outer ModelSettings modelSettings;
protected
  MoleculesOfStructure.Policy.CloseGap rate(adjTime = adjTime) "Rate of Change" annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor currentValue "Current value of connected stock" annotation(Placement(visible = true, transformation(origin = {120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange changing annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(currentValue.flowPort, flowPort) annotation(Line(visible = true, origin = {130, 6.667}, points = {{-10, 13.333}, {-10, -6.667}, {20, -6.667}}, color = {128, 0, 128}));
  connect(changing.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(rate.y, changing.u) annotation(Line(visible = true, origin = {-13, 16.667}, points = {{-16, 3.333}, {8, 3.333}, {8, -6.667}}, color = {1, 37, 163}));
  connect(currentValue.stock, rate.u_current) annotation(Line(visible = true, origin = {39.976, 55.5}, points = {{80.073, -24.5}, {80.024, 4.5}, {-80.024, 4.5}, {-79.976, -24.5}}, color = {1, 37, 163}));
  connect(u, rate.u_reference) annotation(Line(visible = true, origin = {-89, 10}, points = {{-56, -10}, {9, -10}, {9, 10}, {38, 10}}, color = {0, 0, 128}));
  connect(changing.y, y) annotation(Line(visible = true, origin = {83.422, 37.179}, points = {{-78.422, -26.779}, {-78.422, 2.821}, {78.422, 2.821}}, color = {1, 37, 163}));
  connect(changing.y1, y1) annotation(Line(visible = true, origin = {53.146, -22.5}, points = {{-42.646, 17.5}, {-33.146, 17.5}, {-33.146, -17.5}, {108.937, -17.5}}, color = {1, 37, 163}));
  /* control */
  annotation(defaultComponentName = "c", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>force to input value notation</em> follows the one proposed by van Zijderveld [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">24</a>]. It indicates some form of <em>control</em> as the input <strong>u</strong> provides the setpoint for a process of \"<em>closing the gap</em>\" adjustment (<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.CloseGap\"><code>CloseGap</code></a>) with regard to the influenced stock connected to the component's <code>flowPort</code>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/ForceToInputValue/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<p>For more options, e.g., have control be active during limited period, use the →<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleControl\"><code>SimpleControl</code></a> component with an option input for the setpoint (<code>hasExogenousSetpoint = true</code>).</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ForceToStockValue\">ForceToStockValue</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleControl\">SimpleControl</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.PID_Control\">PID_Control</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {8, -88}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{-98, 98}, {-78, 88}, {-98, 78}}), Line(visible = true, origin = {-43.644, 0}, points = {{-50, 0}, {50, 0}}, color = {0, 0, 128}, thickness = 1)}));
end ForceToInputValue;
