within BusinessSimulation.CausalLoop;

model LogisticGrowth "S-shaped logistic growth process"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialCLD.SourceOrSink;
  replaceable type CapacityType = Unspecified constrainedby Unspecified "Type choice for capacity parameter" annotation(choicesAllMatching = true);
  parameter CapacityType carryingCapacity "Carrying capacity" annotation(Dialog(enable = hasConstantCapacity));
  parameter Boolean hasConstantCapacity = true "= true, if the carrying capacity given is given by a constant parameter" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Dialog(group = "Structural Parameters"));
  Interfaces.Connectors.RealInput u_K if not hasConstantCapacity "Carrying capacity" annotation(Placement(visible = true, transformation(origin = {-145, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Converters.ConstantConverter parK(value = carryingCapacity) if hasConstantCapacity "Constant carrying capacity" annotation(Placement(visible = true, transformation(origin = {40, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
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
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
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
