within BusinessSimulation.Interfaces.PartialCLD;

partial block Lookup "Partial lookup for causal loop diagramming"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.Reals;
  extends Interfaces.Basics.OutputTypeChoice;
  Connectors.StockInfoInput stockInfoInput if hasStockInfoInput annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealInput u_ref if not hasConstantReference "Reference value for stock" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  RealOutput y "Output of output type" annotation(Placement(visible = true, transformation(origin = {162.085, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter String pol = "±" "Polarity" annotation(choices(choice = "+", choice = "–", choice = "±"));
  parameter ReferenceType referenceValue(min = 0) = 1 "Constant reference value to normalize input" annotation(Dialog(enable = hasConstantReference));
  parameter Boolean hasConstantReference = true "= true, if the reference value is given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasStockInfoInput = true "= true, if the input is given by the input connector u instead of stockInfoInput" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Connectors.RealInput u if not hasStockInfoInput "Input for lookup (optional)" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
protected
  replaceable type ReferenceType = Reals "Type choice for the reference value" annotation(choices(choice(redeclare type ReferenceType = .BusinessSimulation.Units.Information "Information [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Fraction "Fraction [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Dimensionless "Dimensionless [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Probability "Probability [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Amount "Amount [each]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Money "Money [CU]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Money_USD "Money [USD]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Money_EUR "Money [EUR]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Money_JPY "Money [JPY]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Money_GBP "Money [GBP]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Population "Population [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.People "People [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Labor "Labor [FTE]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.TangibleAssets "Tangible assets [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.IntangibleAssets "Intangible assets [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Material "Material [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Goods "Goods [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Orders "Orders [1]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Volume "Volume [m3]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Mass "Mass [kg]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Energy "Energy [J]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Momentum "Momentum [kg.m/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.AngularMomentum "Angular momentum [kg.m2/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Angle "Angle [rad]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Length "Length [m]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Area "Area [m2]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time "Time [s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_minutes "Time [min]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_hours "Time [h]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_days "Time [d]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_weeks "Time [wk]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_months "Time [mo]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_quarters "Time [qtr]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Time_years "Time [yr]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Rate "Rate [1/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.AmountRate "Amount rate [each/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.VolumeFlowRate "Volume flow rate [m3/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.MassFlowRate "Mass flow rate [kg/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.EnergyFlowRate "Energy flow rate [J/s]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.MomentumFlowRate "Momentum flow rate [kg.m/s2]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.AngularMomentumFlowRate "Angular momentum flow rate [kg.m2/s2]"), choice(redeclare type ReferenceType = .BusinessSimulation.Units.Velocity "Velocity [m/s]")), Dialog(group = "Parameters"));
  Converters.DmnlInput normalizedStock(hasConstantReference = hasConstantReference, referenceValue = referenceValue) annotation(Placement(visible = true, transformation(origin = {-60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.AbsoluteSensor absoluteSensor if hasStockInfoInput annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(stockInfoInput, absoluteSensor.u_stockInfo) annotation(Line(visible = true, origin = {-124.5, 0}, points = {{-20.5, 0}, {20.5, 0}}, color = {128, 0, 128}));
  connect(absoluteSensor.stock, normalizedStock.u) annotation(Line(visible = true, origin = {-81, 2.476}, points = {{-15, 2.475}, {1, 2.475}, {1, -2.476}, {13, -2.476}}, color = {1, 37, 163}));
  connect(u_ref, normalizedStock.u_reference) annotation(Line(visible = true, origin = {-88.333, 29.333}, points = {{-56.667, 10.667}, {28.333, 10.667}, {28.333, -21.333}}, color = {0, 0, 128}));
  assert(referenceValue > 0, "The reference value for normalization needs to be larger than zero");
  connect(u, normalizedStock.u) annotation(Line(visible = true, origin = {-93.25, -20}, points = {{-51.75, -20}, {13.25, -20}, {13.25, 20}, {25.25, 20}}, color = {0, 0, 128}));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial class to be used for <em>extensions</em> within <em>lookup</em> classes.</p>
<p>The input can be given using a <code>StockInfoInput</code> connector (in which case the stock value will be used) or using the input <stong>u</strong> depending upon the structural parameter <code>hasStockInfoInput</code>.</p>
<p>The input will be <em>normalized</em>(→<a href=\"modelica://BusinessSimulation.Converters.DmnlInput\"><code>DmnlInput</code></a>) using either the parameter <code>referenceValue</code> (default = 1) or the optional input <strong>u_ref</strong>.
<h4>Notes</h4>
<p>The normalization will return zero if the reference value given (parameter or input connector) is zero.</p>
<h4>Implementation</h4>
<p>
<table width = \"600\" cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">DiagramView</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Interfaces/PartialCLD/Lookup/ModelDiagram.png\" alt=\"ModelDiagram.png\"></td>
</tr>
</tbody>
</table>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%pol", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Lookup;
