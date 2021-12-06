within BusinessSimulation.Converters;

block Disruption "Output is the disturbed input"
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_dis "Disruptive input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Boolean isAdditive = false "= true, if disruptive effect is multiplicative" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
equation
  y = if isAdditive then u + u_dis else u * (1 + u_dis);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is given by the input <strong>u</strong> that may possibly be distorted by an <em>additive</em> or <em>multiplicative</em> term:</p>
<br>
<pre>
y = if isAdditive then u + u_dis else u * (1 + u_dis)
</pre>
<br>
<h4>Notes</h4>
<ul>
<li>Care has to be taken with the dimensionality of the disruptive input as it may be dimensionsless (<code>isAdditive = false</code>) or have the same dimensionality as the input <code>u</code> (<code>isAdditive = true</code>).</li><br>
<li>In the case of a multiplicative disruption (<code>isAdditive = false</code>)<code>u_dis</code> describes the <em>percentage change</em> with regard to the input signal <code>u</code>.</li><br>
<li>A zero valued disruption (<code>u_dis = 0</code>) will always mean, that the output is the undisturbed input (<code>y = u</code>).</li>
</ul>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-4.277, 0}, points = {{-80.493, 0}, {-15.723, 0}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0), Polygon(visible = true, origin = {8.78, 12.416}, rotation = 6.052, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, points = {{-8.001, 3.447}, {-20.034, -19.627}, {-9.533, -15.693}, {-14.718, -30.789}, {-0.975, -11.981}, {-12.073, -13.579}, {-4.041, 3.027}}), Line(visible = true, origin = {88.108, 0}, points = {{-68.108, 0}, {-15.723, 0}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Disruption;
