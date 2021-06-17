within BusinessSimulation.Converters.Vector;

block ArithmeticMean "(Weighted) arithmetic mean"
  extends Interfaces.PartialConverters.MISO;
  parameter Real[nin] weights = ones(nin) "Weights to be used for inputs" annotation(Dialog(enable = useWeights and hasConstantWeights));
  parameter Boolean useWeights = false "= true, if the output is to be a weighted arithmetic mean" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantWeights = true "= true, if the weights are constant" annotation(Dialog(group = "Structural Parameters", enable = useWeights));
  Interfaces.Connectors.RealMultiInput u_weights[nin] if useWeights and not hasConstantWeights "Input of weights" annotation(Placement(visible = true, transformation(origin = {-145, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Interfaces.Connectors.RealMultiInput[nin] constWeights = weights if not useWeights or hasConstantWeights;
  Interfaces.Connectors.RealMultiOutput[nin] w;
equation
  connect(constWeights, w);
  connect(u_weights, w);
  y = Functions.arithmeticMean(u, w);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The scalar output <strong>y</strong> is obtained as a <em>convex combination</em> of the components of the input vector <strong>u</strong>:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/ArithmeticMean/Formula.svg\" alt=\"y = sum_i u[i] w[i]\"></p>
<h4>Notes</h4>
<ul>
<li>If <code>useWeights = false</code> then all weights are assumed to be one.</li><br>
<li>Weights will be normalized to add up to one; negative weights will be set to zero.</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.arithmeticMean\">arithmeticMean</a>,
<a href=\"modelica://BusinessSimulation.Converters.Vector.GeometricMean\">GeometricMean</a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "MEAN", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -20}, textColor = {128, 128, 128}, extent = {{-43.883, -9}, {43.883, 9}}, textString = "Arithmetic", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ArithmeticMean;
