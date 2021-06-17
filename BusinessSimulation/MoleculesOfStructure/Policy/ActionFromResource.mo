within BusinessSimulation.MoleculesOfStructure.Policy;

block ActionFromResource "Flow (action) is proportional to resource level"
  extends Interfaces.PartialConverters.Policy_SO(redeclare replaceable type OutputType = Units.Rate);
  Interfaces.Connectors.RealInput u_res "Level of available resources" annotation(Placement(visible = true, transformation(origin = {-145, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-115, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_prod "Ability of resources to create a flow (productivity)" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-115, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Converters.Product_2 flowFromResource "Action (flow) from resource" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_res, flowFromResource.u1) annotation(Line(visible = true, origin = {-51.75, 12.5}, points = {{-93.25, 7.5}, {31.75, 7.5}, {31.75, -7.5}, {43.75, -7.5}}, color = {0, 0, 127}));
  connect(u_prod, flowFromResource.u2) annotation(Line(visible = true, origin = {-51.75, -12.5}, points = {{-93.25, -7.5}, {31.75, -7.5}, {31.75, 7.5}, {43.75, 7.5}}, color = {0, 0, 127}));
  connect(flowFromResource.y, y) annotation(Line(visible = true, origin = {84, 0}, points = {{-76, 0}, {76, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the <em>product</em> of the amount of some resource (<code>u_res</code>) and its ability to generate a flow/action (i.e. its productivity <code>u_prod</code>).</p>
<p><code>y[1/s] = u_res[1] &middot; u_prod[1/s] </code></p>
<h4>Acknowledgements</h4>
<p>Additonal information can be found in [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>, p. 109] and on Jim Hines's <em>Molecules of Structure</em> website: →<a href=\"https://sdmolecules.org/index.htm#MoleculeTopics/FlowFromResource/flowFromResource.htm\">Flow From Resource</a>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy.CloseGap\">CloseGap</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 12.5}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Action From", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -12.5}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Resource", fontName = "Lato Black", textStyle = {TextStyle.Bold})}));
end ActionFromResource;
