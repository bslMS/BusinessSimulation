within BusinessSimulation.CausalLoop;

block Lookup_SPositive "Positively sloping s-shaped lookup (centered at origin)"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.Lookup;
  parameter Real upperBound(min = 0) = 1 "Upper asymptote (upperBound > 0)";
  parameter Real slope(min = 1) = 2 "Slope controls gradient of curve (s > 1)";
  parameter Boolean hasConstantReference = true "= true, if the reference value for the stock is given by a constant parameter" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
equation
  connect(normalizedStock.y, lookup.u) annotation(Line(visible = true, origin = {-30, 0}, points = {{-22, 0}, {22, 0}}, color = {1, 37, 163}));
  connect(lookup.y, y) annotation(Line(visible = true, origin = {85.043, 0}, points = {{-77.043, 0}, {77.043, 0}}, color = {1, 37, 163}));
protected
  Converters.Lookup.SShapedPositive lookup(upperBound = upperBound, s = slope) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* block,  information processing */
  annotation(defaultComponentName = "b", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the lookup converter →<a href =\"modelica://BusinessSimulation.Converters.Lookup.SShapedPositive\"><code>SShapedPositive</code></a> the normalized current value of the stock, which is connected via the <code>StockInfoInput</code> connector, is used as input to the s-shaped lookup function (positively sloping) to obtain the output <strong>y</strong>.</p>
<p>The value used for the normalization is a constant by default (<code>referenceValue = 1</code>); if <code>hasConstantReference = false</code> the optional input <strong>u</strong> is used instead.</p>
<h4>Notes</h4>
<ul>
<li>The reference value for normalization should be strictly positive; the divison for normalization is protected against divison by zero and will return zero in that case.</li><br>
<li>Instead of using the current value of a connected stock, the input connector <strong>u</strong> can be used as basis by setting <code>hasStockInfoInput = false</code>.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_JPositive\">Lookup_JPositive</a>, 
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_JNegative\">Lookup_JNegative</a>, 
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_SNegative\">Lookup_SNegative</a>, 
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_Table\">Lookup_Table</a>
<a href=\"modelica://BusinessSimulation.CausalLoop.Lookup_TableOnFile\">Lookup_TableOnFile</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-28.654, -9.146}, points = {{13.937, 32.823}, {-9.408, 32.823}, {-23.387, -7.757}, {-51.346, -7.757}}, color = {0, 0, 128}, thickness = 3, smooth = Smooth.Bezier), Ellipse(visible = true, origin = {-46.903, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Lookup_SPositive;
