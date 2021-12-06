within BusinessSimulation.Converters;

model SoftMax "Gradual approach of a floor below which output can never fall"
  import BusinessSimulation.Constants.small;
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_min "The floor" annotation(Placement(visible = true, transformation(origin = {-145, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Real k(min = small) = 4.7 "Parameter to control the closeness to a hard maximum";
  parameter Boolean useMaxOperator = false "= true, if a regular 'hard' maximum is to be used" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Min hardMin if useMaxOperator "Hard min operator" annotation(Placement(visible = true, transformation(origin = {80, -45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gain scaledInput(c = k) if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Exp expInput if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Add_2 sumExp if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {-10, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Log logSum if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {20, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gain adjustmentFactor(c = 1 / k) if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {50, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Exp expMin if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {-40, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gain scaledMin(c = k) if not useMaxOperator annotation(Placement(visible = true, transformation(origin = {-70, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(k > small or useMaxOperator, "The parameter k must greater than zero");
  connect(scaledInput.y, expInput.u) annotation(Line(visible = true, origin = {-55, 0}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(sumExp.y, logSum.u) annotation(Line(visible = true, origin = {5, 5}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(logSum.y, adjustmentFactor.u) annotation(Line(visible = true, origin = {35, 5}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(u, hardMin.u2) annotation(Line(visible = true, origin = {-83.25, -32.5}, points = {{-61.75, 32.5}, {-46.75, 32.5}, {-46.75, -17.5}, {155.25, -17.5}}, color = {0, 0, 128}));
  connect(u_min, hardMin.u1) annotation(Line(visible = true, origin = {-80.75, -5}, points = {{-64.25, 50}, {-44.25, 50}, {-44.25, -35}, {152.75, -35}}, color = {0, 0, 128}));
  connect(hardMin.y, y) annotation(Line(visible = true, origin = {112.067, -22.5}, points = {{-24.067, -22.5}, {-12.067, -22.5}, {-12.067, 22.5}, {48.201, 22.5}}, color = {1, 37, 163}));
  connect(scaledMin.y, expMin.u) annotation(Line(visible = true, origin = {-55, 45}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(u, scaledInput.u) annotation(Line(visible = true, origin = {-115.75, -2.5}, points = {{-29.25, 2.5}, {-4.25, 2.5}, {-4.25, 2.5}, {37.75, 2.5}}, color = {0, 0, 128}));
  connect(expInput.y, sumExp.u2) annotation(Line(visible = true, origin = {-25, -0}, points = {{-7, 0}, {7, -0}}, color = {1, 37, 163}));
  connect(expMin.y, sumExp.u1) annotation(Line(visible = true, origin = {-25, 27.5}, points = {{-7, 17.5}, {0, 17.5}, {0, -17.5}, {7, -17.5}}, color = {1, 37, 163}));
  connect(u_min, scaledMin.u) annotation(Line(visible = true, origin = {-111.5, 45}, points = {{-33.5, -0}, {33.5, 0}}, color = {0, 0, 128}));
  connect(adjustmentFactor.y, y) annotation(Line(visible = true, origin = {95.222, 2.5}, points = {{-37.222, 2.5}, {4.778, 2.5}, {4.778, -2.5}, {65.046, -2.5}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-60.509, -12}, {60.509, 12}}, textString = "Soft MAX", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -20}, textColor = {128, 128, 128}, extent = {{-58.305, -9}, {58.305, 9}}, textString = "Floor", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p>The output <strong>y</strong> is obtained as a <em>smooth maximum</em> with regard to the inputs <strong>u</strong> and <strong>u_min</strong>:</p>
<p><img src = \"modelica://BusinessSimulation/Resources/Images/Converters/SoftMax/Formula.svg\" alt = \"Formula.svg\"></p>
<p>The following graph shows the results for <code>u_min = 1.0</code> and <code>k &isin; {10,5,3,2}</code>:</P>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph for <code>u_min = 1.0</code></caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/SoftMax/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>The <em>soft maximum</em> is a special case of the <em>generalized f-mean</em>.</li>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.Converters.SoftMin\">SoftMin</a>
</p>
</html>", revisions = "<html><ul>
<li>Introduced in v2.0.0.</li>
</ul></html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SoftMax;
