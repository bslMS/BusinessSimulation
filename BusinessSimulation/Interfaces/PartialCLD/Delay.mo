within BusinessSimulation.Interfaces.PartialCLD;

partial model Delay "Partial model of a delay for CLD+ modeling"
  import BusinessSimulation.Constants.eps;
  import BusinessSimulation.Types.Reals;
  import BusinessSimulation.Units.Time;
  Connectors.StockPort portA annotation(Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.FlowPort portB annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealInput u if hasFactor "Factor input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  parameter Time delayTime = 1 "Time of delay";
  parameter Boolean subtractDelayedOutflow = true "= true, if a delayed outflow is to be deducted before it actually leaves the stock" annotation(Enable = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasFactor = false "= true, if coefficients are to be multiplied with input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasStockInfoOutput = false "= true, if information from the internal 'in process' stock is to be made accessible" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter MaterialType IDI = 0 "Initial material in the process of flowing into the connected stock" annotation(Dialog(tab = Initialization));
  parameter MaterialType IDO = 0 "Initial material in the process of flowing into the connected stock" annotation(Dialog(tab = Initialization));
  Connectors.StockInfoOutput stockInfoOutput if hasStockInfoOutput annotation(Placement(visible = true, transformation(origin = {151.784, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  replaceable type MaterialType = Reals "Type choice for material flowing in and out of the connected stock" annotation(choices(choice(redeclare type MaterialType = .BusinessSimulation.Units.Information "Information [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Fraction "Fraction [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Dimensionless "Dimensionless [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Probability "Probability [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Amount "Amount [each]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Money "Money [CU]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Money_USD "Money [USD]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Money_EUR "Money [EUR]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Money_JPY "Money [JPY]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Money_GBP "Money [GBP]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Population "Population [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.People "People [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Labor "Labor [FTE]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.TangibleAssets "Tangible assets [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.IntangibleAssets "Intangible assets [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Material "Material [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Goods "Goods [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Orders "Orders [1]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Volume "Volume [m3]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Mass "Mass [kg]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Energy "Energy [J]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Momentum "Momentum [kg.m/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.AngularMomentum "Angular momentum [kg.m2/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Angle "Angle [rad]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Length "Length [m]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Area "Area [m2]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time "Time [s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_minutes "Time [min]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_hours "Time [h]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_days "Time [d]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_weeks "Time [wk]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_months "Time [mo]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_quarters "Time [qtr]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Time_years "Time [yr]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Rate "Rate [1/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.AmountRate "Amount rate [each/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.VolumeFlowRate "Volume flow rate [m3/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.MassFlowRate "Mass flow rate [kg/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.EnergyFlowRate "Energy flow rate [J/s]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.MomentumFlowRate "Momentum flow rate [kg.m/s2]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.AngularMomentumFlowRate "Angular momentum flow rate [kg.m2/s2]"), choice(redeclare type MaterialType = .BusinessSimulation.Units.Velocity "Velocity [m/s]")));
protected
  parameter Real k2 = if subtractDelayedOutflow then -1 else 0 "Gain of outflowing elements of stock B being delayed" annotation(Evaluate = true, Dialog(enable = false, tab = "Initialization"));
  Sensors.FlowPortSensor stockB annotation(Placement(visible = true, transformation(origin = {135, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 adjustedDelayTime annotation(Placement(visible = true, transformation(origin = {-70, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealOutput one = 1.0 if not hasFactor "Default factor" annotation(Placement(visible = true, transformation(origin = {-135, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -720), iconTransformation(origin = {-42, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Converters.ConstantConverterTime parDelayTime(value = delayTime) annotation(Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealOutput growthRate "Indicated rate of growth" annotation(Placement(visible = true, transformation(origin = {-135, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealOutput declineRate "Indicated rate of decline" annotation(Placement(visible = true, transformation(origin = {-135, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add actualStockB(k2 = k2) annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
equation
  // set stock port variables
  portA.stopInflow = portB.stopInflow;
  portA.stopOutflow = portB.stopOutflow;
  portA.stock = actualStockB.y;
  // set rate inputs
  growthRate = if portA.rate >= 0 then abs(portA.rate) else 0;
  declineRate = if growthRate > 0 then 0 else abs(portA.rate);
  // connect equations
  connect(one, adjustedDelayTime.u1) annotation(Line(visible = true, origin = {-106.5, 40}, points = {{-28.5, 0}, {28.5, 0}}, color = {0, 0, 128}));
  connect(u, adjustedDelayTime.u1) annotation(Line(visible = true, origin = {-105.75, 50}, points = {{-39.25, 10}, {5.75, 10}, {5.75, -10}, {27.75, -10}}, color = {0, 0, 128}));
  connect(parDelayTime.y, adjustedDelayTime.u2) annotation(Line(visible = true, origin = {-91, 30}, points = {{-13, 0}, {13, -0}}, color = {1, 37, 163}));
  connect(stockB.flowPort, portB) annotation(Line(visible = true, origin = {142.5, -0}, points = {{-7.5, -0}, {7.5, 0}}, color = {128, 0, 128}));
  connect(actualStockB.u1, stockB.stock) annotation(Line(visible = true, origin = {117.366, 26.333}, points = {{-35.366, 7.667}, {17.683, 7.667}, {17.683, -15.333}}, color = {1, 37, 163}));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is a fairly elaborate class serving as a building block for <em>delay</em> components. Since inflows to and outflows from a stock should be modeled using the same component, the class provides machinery to either deduct outflowing material at once or after it has left the stock (at the end of the delay process).</p>
<p>The <code>delayTime</code> is given by a parameter, that is (optionally) multiplied by an exogenous input <strong>u</strong> as to enable exogenous input of delay times (e.g., <code>delayTime = 1</code> and <code>hasFactor = true</code>) or have the time of delay be modified by other variables.</p>
<p>The stock value reported at the stock port <code>portA</code> is  determined from the choices made with regard to outflowing material (deducted or not), while the flags are immediately copied from the flow port <code>portB</code>.
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Interfaces/PartialCLD/Delay/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
<pre>
  <...> 
protected
  parameter Real k2 = if subtractDelayedOutflow then -1 else 0 \\
      \"Gain of outflowing elements of stock B being delayed\";
  <...>
equation
  // set stock port variables
  portA.stopInflow = portB.stopInflow;
  portA.stopOutflow = portB.stopOutflow;
  portA.stock = actualStockB.y;
  // set rate inputs
  growthRate = if portA.rate >= 0 then portA.rate else 0;
  declineRate = if portA.rate < 0 then -portA.rate else 0;
  <...>
</pre>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-5, -6.667}, points = {{0, 16.667}, {0, -3.333}}, color = {128, 0, 128}, thickness = 2), Line(visible = true, origin = {5, -6.667}, points = {{0, 16.667}, {0, -3.333}}, color = {128, 0, 128}, thickness = 2), Line(visible = true, origin = {-73.5, -48.828}, points = {{123.5, 48.828}, {23.5, 48.828}}, color = {128, 0, 128}, thickness = 2)}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Delay;
