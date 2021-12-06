within BusinessSimulation.CausalLoop;

model LogisticGrowth "S-shaped logistic growth process"
  import BusinessSimulation.Types.Reals;
  extends Interfaces.PartialCLD.SourceOrSink;
  parameter CapacityType carryingCapacity "Carrying capacity" annotation(Dialog(enable = hasConstantCapacity));
  parameter Boolean hasConstantCapacity = true "= true, if the carrying capacity given is given by a constant parameter" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Dialog(group = "Structural Parameters"));
  Interfaces.Connectors.RealInput u_K if not hasConstantCapacity "Carrying capacity" annotation(Placement(visible = true, transformation(origin = {-145, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter parK(value = carryingCapacity) if hasConstantCapacity "Constant carrying capacity" annotation(Placement(visible = true, transformation(origin = {40, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
protected
  replaceable type CapacityType = Reals "Type choice for capacity parameter" annotation(choices(choice(redeclare type CapacityType = .BusinessSimulation.Units.Information "Information [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Fraction "Fraction [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Dimensionless "Dimensionless [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Probability "Probability [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Amount "Amount [each]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Money "Money [CU]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Money_USD "Money [USD]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Money_EUR "Money [EUR]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Money_JPY "Money [JPY]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Money_GBP "Money [GBP]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Population "Population [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.People "People [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Labor "Labor [FTE]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.TangibleAssets "Tangible assets [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.IntangibleAssets "Intangible assets [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Material "Material [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Goods "Goods [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Orders "Orders [1]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Volume "Volume [m3]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Mass "Mass [kg]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Energy "Energy [J]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Momentum "Momentum [kg.m/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.AngularMomentum "Angular momentum [kg.m2/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Angle "Angle [rad]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Length "Length [m]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Area "Area [m2]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time "Time [s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_minutes "Time [min]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_hours "Time [h]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_days "Time [d]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_weeks "Time [wk]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_months "Time [mo]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_quarters "Time [qtr]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Time_years "Time [yr]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Rate "Rate [1/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.AmountRate "Amount rate [each/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.VolumeFlowRate "Volume flow rate [m3/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.MassFlowRate "Mass flow rate [kg/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.EnergyFlowRate "Energy flow rate [J/s]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.MomentumFlowRate "Momentum flow rate [kg.m/s2]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.AngularMomentumFlowRate "Angular momentum flow rate [kg.m2/s2]"), choice(redeclare type CapacityType = .BusinessSimulation.Units.Velocity "Velocity [m/s]")));
  SourcesOrSinks.LogisticGrowth logisticallyGrowing(isCCR = isCCR, hasConstantInputs = false) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(actualRate.y, logisticallyGrowing.u[1]) annotation(Line(visible = true, origin = {-14, 20}, points = {{-18, 5}, {9, 5}, {9, -10}}, color = {1, 37, 163}));
  connect(u_K, logisticallyGrowing.u[2]) annotation(Line(visible = true, origin = {-51.667, 56.667}, points = {{-93.333, 23.333}, {46.667, 23.333}, {46.667, -46.667}}, color = {0, 0, 128}));
  connect(parK.y, logisticallyGrowing.u[2]) annotation(Line(visible = true, origin = {8, 50}, points = {{26, 20}, {-13, 20}, {-13, -40}}, color = {1, 37, 163}));
  connect(logisticallyGrowing.massPort, flowPort) annotation(Line(visible = true, origin = {80, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(logisticallyGrowing.y, y) annotation(Line(visible = true, origin = {57.282, 30.133}, points = {{-52.282, -19.733}, {-52.282, 9.867}, {104.563, 9.867}}, color = {1, 37, 163}));
  connect(logisticallyGrowing.y1, y1) annotation(Line(visible = true, origin = {63.146, -22.5}, points = {{-52.646, 17.5}, {-23.146, 17.5}, {-23.146, -17.5}, {98.937, -17.5}}, color = {1, 37, 163}));
  /* process */
  annotation(defaultComponentName = "p", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the →<a href=\"modelica://BusinessSimulation.SourcesOrSinks.LogisticGrowth\"><code>LogisticGrowth</code></a> component from the <code>SourcesOrSinks</code> package, this component allows to model a process of s-shaped growth given a constant maximum fractional growth rate <code>rate</code> and a constant carrying capacity (<code>carryingCapacity</code>). Instead of using constant parameters, it is also possible to use variable inputs (<code>u_rate, u_K</code>).</p>
<p>The process by default is active over the whole simulation run, but can be restricted to an <em>on-off period</em> using <code>tc = TimingChoices.period</code> and the parameters <code>startTime</code> and <code>stopTime</code>. Any given rate—<code>rate</code> or <code>u_rate</code>—can be <em>modified</em> by multiplication with an optionally given input <strong>u</strong>.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/CausalLoop/LogisticGrowth/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.ExponentialChange\">ExponentialChange</a>,
<a href=\"modelica://BusinessSimulation.CausalLoop.LinearChange\">LinearChange</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-40, 14}, textColor = {0, 128, 0}, extent = {{-20, -12}, {20, 12}}, textString = "log", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LogisticGrowth;
