within BusinessSimulation.Converters;

model SoftMax "Gradual approach of a floor below which output can never fall"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_min "The floor" annotation(Placement(visible = true, transformation(origin = {-145, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Real k(min = small) = 4.7 "Parameter to control the closeness to a hard maximum";
  parameter Boolean useMaxOperator = false "= true, if a regular 'hard' maximum is to be used" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  Gap u_min_shifted annotation(Placement(visible = true, transformation(origin = {-100, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gap u_shifted annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Logical.Switch switch annotation(Placement(visible = true, transformation(origin = {110, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Logical.ConstantConverterBoolean useHardMaxQ(value = useMaxOperator) annotation(Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Add_2 softmin_shifted annotation(Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Max hardMax "Hard max operator" annotation(Placement(visible = true, transformation(origin = {-125, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  connect(u, hardMax.u2) annotation(Line(visible = true, origin = {-83.25, -32.5}, points = {{-61.75, 32.5}, {-56.75, 32.5}, {-56.75, 52.5}, {-49.75, 52.5}}, color = {0, 0, 128}));
  connect(u_min, hardMax.u1) annotation(Line(visible = true, origin = {-80.75, -5}, points = {{-64.25, 50}, {-59.25, 50}, {-59.25, 35}, {-52.25, 35}}, color = {0, 0, 128}));
  connect(scaledMin.y, expMin.u) annotation(Line(visible = true, origin = {-55, 45}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(expInput.y, sumExp.u2) annotation(Line(visible = true, origin = {-25, -0}, points = {{-7, 0}, {7, -0}}, color = {1, 37, 163}));
  connect(expMin.y, sumExp.u1) annotation(Line(visible = true, origin = {-25, 27.5}, points = {{-7, 17.5}, {0, 17.5}, {0, -17.5}, {7, -17.5}}, color = {1, 37, 163}));
  connect(hardMax.y, u_min_shifted.u2) annotation(Line(visible = true, origin = {-112.5, 32.5}, points = {{-4.5, -7.5}, {0, -7.5}, {0, 7.5}, {4.5, 7.5}}, color = {1, 37, 163}));
  connect(hardMax.y, u_shifted.u2) annotation(Line(visible = true, origin = {-112.5, 15}, points = {{-4.5, 10}, {0, 10}, {0, -10}, {4.5, -10}}, color = {1, 37, 163}));
  connect(u_min, u_min_shifted.u1) annotation(Line(visible = true, origin = {-131.209, 47.5}, points = {{-13.791, -2.5}, {-8.791, -2.5}, {-8.791, 2.5}, {23.209, 2.5}}, color = {0, 0, 128}));
  connect(u_min_shifted.y, scaledMin.u) annotation(Line(visible = true, origin = {-85, 45}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(u, u_shifted.u1) annotation(Line(visible = true, origin = {-131.209, -2.5}, points = {{-13.791, 2.5}, {-8.791, 2.5}, {-8.791, -2.5}, {23.209, -2.5}}, color = {0, 0, 128}));
  connect(u_shifted.y, scaledInput.u) annotation(Line(visible = true, origin = {-85, 0}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(hardMax.y, switch.u1) annotation(Line(visible = true, origin = {27.5, 26.667}, points = {{-144.5, -1.667}, {-27.5, -1.667}, {-27.5, 8.333}, {62.5, 8.333}, {62.5, -6.667}, {74.5, -6.667}}, color = {1, 37, 163}));
  connect(useHardMaxQ.y, switch.u_cond) annotation(Line(visible = true, origin = {92.008, 40.996}, points = {{-36.008, 9.004}, {18.004, 9.004}, {18.004, -18.008}}, color = {190, 52, 178}));
  connect(switch.y, y) annotation(Line(visible = true, origin = {132.067, 7.5}, points = {{-14.067, 7.5}, {-7.067, 7.5}, {-7.067, -7.5}, {28.201, -7.5}}, color = {1, 37, 163}));
  connect(hardMax.y, softmin_shifted.u1) annotation(Line(visible = true, origin = {18.75, 20}, points = {{-135.75, 5}, {11.25, 5}, {11.25, -5}, {53.25, -5}}, color = {1, 37, 163}));
  connect(softmin_shifted.y, switch.u2) annotation(Line(visible = true, origin = {95, 10}, points = {{-7, 0}, {7, -0}}, color = {1, 37, 163}));
  connect(logSum.y, adjustmentFactor.u) annotation(Line(visible = true, origin = {35, 5}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(adjustmentFactor.y, softmin_shifted.u2) annotation(Line(visible = true, origin = {65, 5}, points = {{-7, -0}, {7, 0}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-60.509, -12}, {60.509, 12}}, textString = "Soft MAX", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -20}, textColor = {128, 128, 128}, extent = {{-58.305, -9}, {58.305, 9}}, textString = "Floor", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
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
<li>Introduced in v2.0.0.</li><br>
<li>Fixed <code>hardMax</code> and numerical stability issues in v2.1.0.</li><br>
</ul></html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SoftMax;
