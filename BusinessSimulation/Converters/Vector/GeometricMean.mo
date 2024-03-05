within BusinessSimulation.Converters.Vector;

block GeometricMean "(Weighted) geometric mean"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.MISO;
  parameter Real[nin] weights = ones(nin) "Weights to be used for inputs" annotation(Dialog(enable = useWeights and hasConstantWeights));
  parameter Boolean useWeights = false "= true, if the output is to be a weighted geometric mean" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantWeights = true "= true, if the weights are constant" annotation(Dialog(group = "Structural Parameters", enable = useWeights));
  Interfaces.Connectors.RealMultiInput u_weights[nin] if useWeights and not hasConstantWeights "Input of weights" annotation(Placement(visible = true, transformation(origin = {-145, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Interfaces.Connectors.RealMultiInput[nin] constWeights = weights if not useWeights or hasConstantWeights;
  Interfaces.Connectors.RealMultiOutput[nin] w;
equation
  connect(constWeights, w);
  connect(u_weights, w);
  y = Functions.geometricMean(u, w);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The scalar output <strong>y</strong> is obtained as the <em>geometric  mean</em> of the components of the input vector <strong>u</strong>. Optionally weights can be given, either as constants (<code>weights</code>) or as variable inputs (<code>u_weights</code>).</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/GeometricMean/Formula.svg\" alt=\"y = (sum_i x_i^w_i)^(1/sum_i w_i)\"></p>
<h4>Notes</h4>
<br>
<ul>
<li>If <code>useWeights = false</code> then all weights are assumed to be one.</li><br>
<li>If any of the components of <strong>u</strong> is less than or equal to zero, the output <strong>y</strong> will be zero. </li><br>
<li>Negative weights will be set to zero.</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Functions.geometricMean\">geometricMean</a>,
<a href=\"modelica://BusinessSimulation.Converters.Vector.ArithmeticMean\">ArithmeticMean</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "MEAN", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -20}, textColor = {128, 128, 128}, extent = {{-40.484, -9}, {40.484, 9}}, textString = "Geometric", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GeometricMean;
