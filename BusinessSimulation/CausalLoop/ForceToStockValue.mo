within BusinessSimulation.CausalLoop;

model ForceToStockValue "Flow is obtained as closing the gap to input stock value"
  import BusinessSimulation.Units.*;
  extends BusinessSimulation.Interfaces.PartialCLD.StockInfoToFlow;
  parameter Units.Time adjTime(min = 0) = modelSettings.dt "Time to close the gap";
  outer ModelSettings modelSettings;
protected
  MoleculesOfStructure.Policy.CloseGap rate(adjTime = adjTime) "Rate of Change" annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.FlowPortSensor currentValue "Current value of connected stock" annotation(Placement(visible = true, transformation(origin = {120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange changing annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.AbsoluteSensor absoluteSensor annotation(Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(currentValue.flowPort, flowPort) annotation(Line(visible = true, origin = {130, 6.667}, points = {{-10, 13.333}, {-10, -6.667}, {20, -6.667}}, color = {128, 0, 128}));
  connect(changing.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(rate.y, changing.u) annotation(Line(visible = true, origin = {-13, 16.667}, points = {{-16, 3.333}, {8, 3.333}, {8, -6.667}}, color = {1, 37, 163}));
  connect(currentValue.stock, rate.u_current) annotation(Line(visible = true, origin = {39.976, 55.5}, points = {{80.073, -24.5}, {80.024, 4.5}, {-80.024, 4.5}, {-79.976, -24.5}}, color = {1, 37, 163}));
  connect(stockInfoInput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-134.5, 0}, points = {{-10.5, -0}, {10.5, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor.stock, rate.u_reference) annotation(Line(visible = true, origin = {-81.75, 12.476}, points = {{-34.25, -7.524}, {1.75, -7.524}, {1.75, 7.524}, {30.75, 7.524}}, color = {1, 37, 163}));
  connect(changing.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(changing.y1, y1) annotation(Line(visible = true, origin = {63.146, -22.5}, points = {{-52.646, 17.5}, {-23.146, 17.5}, {-23.146, -17.5}, {98.937, -17.5}}, color = {1, 37, 163}));
  /* control */
  annotation(defaultComponentName = "c", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>force to stock value notation</em> follows the one proposed by van Zijderveld [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">24</a>]. It indicates some form of <em>control</em> as the influencing stock's value—connected to the <code>stockInfoInput</code>—provides the setpoint for a process of \"<em>closing the gap</em>\" adjustment (<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.CloseGap\"><code>CloseGap</code></a>) with regard to the influenced stock connected to the component's <code>flowPort</code>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/ForceToStockValue/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>Notes</h4>
<p>For more options, e.g., have control be active during limited period, use the →<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleControl\"><code>SimpleControl</code></a> component with an optional input for the setpoint (<code>hasExogenousSetpoint = true</code>) and connnect it to the influencing stock using →<a href = \"modelica://BusinessSimulation.CausalLoop.StockInformation\"><code>StockInformation</code></a>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ForceToInputValue\">ForceToInputValue</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.SimpleControl\">SimpleControl</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.PID_Control\">PID_Control</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {8, -88}, lineColor = {128, 0, 128}, fillColor = {128, 0, 128}, fillPattern = FillPattern.Solid, points = {{-98, 98}, {-78, 88}, {-98, 78}}), Line(visible = true, origin = {-43.644, 0}, points = {{-50, 0}, {50, 0}}, color = {128, 0, 128}, thickness = 1)}));
end ForceToStockValue;
