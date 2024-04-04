within BusinessSimulation.MoleculesOfStructure.Policy;

block SplitProportionally "Allocate an available amount according to priorities"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.Policy_MO;
  Interfaces.Connectors.RealInput u "Available amount to be allocated" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -360), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealMultiInput u_p[nout](each min = 0) "Priorities for allocation (i.e., utilities)" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Boolean shiftPriorities = false "= true, if all priorities are to be shifted to prevent negative inputs, otherwise negative inputs are simply set to zero (splitFactors.shiftInputs)";
protected
  Converters.Vector.ProportionalSplitFactors splitFactors(shiftInputs = shiftPriorities, nin = nout) "Split factors add up to one" annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Vector.ScalarMultiplication proportions(nin = nout, redeclare replaceable type OutputType = OutputType) "Total amount split up into proportions" annotation(Placement(visible = true, transformation(origin = {0, -0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(u_p, splitFactors.u) annotation(Line(visible = true, origin = {-118.25, -10}, points = {{-26.75, -10}, {-1.75, -10}, {-1.75, -10}, {30.25, -10}}, color = {0, 0, 128}));
  connect(splitFactors.y, proportions.u1) annotation(Line(visible = true, origin = {-40.009, -12.481}, points = {{-31.991, -7.519}, {0.009, -7.519}, {0.009, 7.519}, {31.971, 7.519}}, color = {1, 37, 163}));
  connect(proportions.y, y) annotation(Line(visible = true, origin = {78.75, -0}, points = {{-71.25, -0}, {71.25, 0}}, color = {1, 37, 163}));
  connect(u, proportions.u2) annotation(Line(visible = true, origin = {-58.895, 32.491}, points = {{-86.105, 27.509}, {18.895, 27.509}, {18.895, -27.491}, {22.376, -27.491}, {22.376, -27.529}, {50.857, -27.529}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output vector <strong>y</strong> is a <em>proportional split</em> (<a href = \"modelica://BusinessSimulation.Converters.Vector.ProportionalSplitFactors\">→ProportionalSplitFactors</a>) of the single input <strong>u</strong>, which may be a <em>rate</em> or simply an <em>available amount</em> of entities.</p>
<h4>Notes</h4>
<ul>
<li>The allocation or split does not account for capacity or demand restrictions, so that the allocated amount may be higher than feasible. If this is not intended, the more general <code>Allocation</code> policy component should be used.</li><br>
<li>If the <em>priorities</em> are given in the form <em>p_i = exp( f(attributes_i) )</em> this component can be used to obtain a Logit type of choice model.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.Allocation\">Allocation</a>
</p>
<h4>Revision history</h4>
<ul>
<li>Introduced in version 2.0.0</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Proportional Split", fontName = "Lato", textStyle = {TextStyle.Bold}), Rectangle(visible = true, origin = {221.044, 44.824}, fillColor = {255, 255, 255}, extent = {{-1.044, -0.553}, {1.044, 0.553}})}));
end SplitProportionally;
