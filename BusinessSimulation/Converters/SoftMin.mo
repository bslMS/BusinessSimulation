within BusinessSimulation.Converters;

model SoftMin "Gradual approach of a ceiling that cannot be exceeded"
  import BusinessSimulation.Constants.small;
  extends Interfaces.PartialConverters.SISO;
  Interfaces.Connectors.RealInput u_max "The ceiling" annotation(Placement(visible = true, transformation(origin = {-145, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Real k(min = small) = 4.7 "Parameter to control the closeness to a hard minimum";
  parameter Boolean useMinOperator = false "= true, if a regular 'hard' minimum is to be used" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean clipNegativeOutput = true "= true, if output can never be less than zero" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean strict = true "= true, if strict limits with noEvent(..) (clippedOutput.strict)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
protected
  Min hardMin if useMinOperator "Hard min operator" annotation(Placement(visible = true, transformation(origin = {80, -45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ZeroIfNegative clippedOutput(strict = strict) if clipNegativeOutput annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PassThrough unclippedOutput if not clipNegativeOutput annotation(Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Exp expMaxUtil if not useMinOperator annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gain scaledMaxUtil(c = -k) if not useMinOperator annotation(Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gain scaledInput(c = -k) if not useMinOperator annotation(Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Exp expInput if not useMinOperator annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Add_2 sumExp if not useMinOperator annotation(Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Log logSum if not useMinOperator annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gain adjustmentFactor(c = -1 / k) if not useMinOperator annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Product_2 softMin if not useMinOperator annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter maxUtilization(value = 1, redeclare replaceable type OutputType = Units.Dimensionless) if not useMinOperator "Maximum utilization" annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Division_Guarded utilization if not useMinOperator "Fraction of the maximum" annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(k > small or useMinOperator, "The parameter k must greater than zero");
  connect(scaledMaxUtil.y, expMaxUtil.u) annotation(Line(visible = true, origin = {-55, -20}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(scaledInput.y, expInput.u) annotation(Line(visible = true, origin = {-55, 20}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(sumExp.y, logSum.u) annotation(Line(visible = true, origin = {5, 0}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(logSum.y, adjustmentFactor.u) annotation(Line(visible = true, origin = {35, 0}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(u, hardMin.u2) annotation(Line(visible = true, origin = {-83.25, -32.5}, points = {{-61.75, 32.5}, {-46.75, 32.5}, {-46.75, -17.5}, {155.25, -17.5}}, color = {0, 0, 128}));
  connect(u_max, hardMin.u1) annotation(Line(visible = true, origin = {-80.75, -5}, points = {{-64.25, 50}, {-44.25, 50}, {-44.25, -35}, {152.75, -35}}, color = {0, 0, 128}));
  connect(hardMin.y, unclippedOutput.u) annotation(Line(visible = true, origin = {95, -37.5}, points = {{-7, -7.5}, {0, -7.5}, {0, 7.5}, {7, 7.5}}, color = {1, 37, 163}));
  connect(unclippedOutput.y, y) annotation(Line(visible = true, origin = {134.567, -15}, points = {{-16.567, -15}, {-4.567, -15}, {-4.567, 15}, {25.701, 15}}, color = {1, 37, 163}));
  connect(clippedOutput.y, y) annotation(Line(visible = true, origin = {139.134, 0}, points = {{-21.134, 0}, {21.134, 0}}, color = {1, 37, 163}));
  connect(hardMin.y, clippedOutput.u) annotation(Line(visible = true, origin = {95, -22.5}, points = {{-7, -22.5}, {0, -22.5}, {0, 22.5}, {7, 22.5}}, color = {1, 37, 163}));
  connect(expInput.y, sumExp.u1) annotation(Line(visible = true, origin = {-25, 12.5}, points = {{-7, 7.5}, {0, 7.5}, {0, -7.5}, {7, -7.5}}, color = {1, 37, 163}));
  connect(expMaxUtil.y, sumExp.u2) annotation(Line(visible = true, origin = {-25, -12.5}, points = {{-7, -7.5}, {0, -7.5}, {0, 7.5}, {7, 7.5}}, color = {1, 37, 163}));
  connect(u_max, softMin.u1) annotation(Line(visible = true, origin = {2.415, 35}, points = {{-147.415, 10}, {62.585, 10}, {62.585, -10}, {69.585, -10}}, color = {0, 0, 128}));
  connect(softMin.y, unclippedOutput.u) annotation(Line(visible = true, origin = {95, -5}, points = {{-7, 25}, {0, 25}, {0, -25}, {7, -25}}, color = {1, 37, 163}));
  connect(adjustmentFactor.y, softMin.u2) annotation(Line(visible = true, origin = {65, 7.5}, points = {{-7, -7.5}, {0, -7.5}, {0, 7.5}, {7, 7.5}}, color = {1, 37, 163}));
  connect(softMin.y, clippedOutput.u) annotation(Line(visible = true, origin = {95, 10}, points = {{-7, 10}, {0, 10}, {0, -10}, {7, -10}}, color = {1, 37, 163}));
  connect(maxUtilization.y, scaledMaxUtil.u) annotation(Line(visible = true, origin = {-86, -20}, points = {{-8, 0}, {8, 0}}, color = {1, 37, 163}));
  connect(u_max, utilization.u2) annotation(Line(visible = true, origin = {-128.25, 30}, points = {{-16.75, 15}, {-1.75, 15}, {-1.75, -15}, {20.25, -15}}, color = {0, 0, 128}));
  connect(utilization.y, scaledInput.u) annotation(Line(visible = true, origin = {-85, 20}, points = {{-7, 0}, {7, 0}}, color = {1, 37, 163}));
  connect(u, utilization.u1) annotation(Line(visible = true, origin = {-123.25, 12.5}, points = {{-21.75, -12.5}, {3.25, -12.5}, {3.25, 12.5}, {15.25, 12.5}}, color = {0, 0, 128}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-60.509, -12}, {60.509, 12}}, textString = "Soft MIN", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -20}, textColor = {128, 128, 128}, extent = {{-58.305, -9}, {58.305, 9}}, textString = "Ceiling", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p>The output <strong>y</strong> is obtained by applying a <em>factor</em> in the interval [0,1] to the maximum output <strong>u_max</strong> (the <em>ceiling</em>). It effectively calculates a <em>smooth minimum</em> with regard to the inputs <strong>u</strong> and <strong>u_max</strong>:</p>
<p><img src = \"modelica://BusinessSimulation/Resources/Images/Converters/SoftMin/Formula.svg\"></p>
<p>The following graph shows the results for <code>u_max = 1.0</code> and <code>k &isin; {10,5,3,2}</code>:</P>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">Graph for <code>u_max = 1.0</code></caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/SoftMin/Graph.svg\" alt=\"Graph.svg\"></td>
</tr>
</tbody>
</table>
<p>When the intended output <code>u</code> is a small fraction of the maximum output <code>u_max</code> (ceiling) the actual output <code>y</code> will be equal to the intended output. As <code>u</code> approaches the ceiling the limitations will have a gradual effect so that less than the intended output is returned. Eventually the output will be identical to the maximum value.</p>
<h4>Notes</h4>
<ul>
<li>The basic structure matches the one given by Jim Hines [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">6</a>, pp.&nbsp;95-97] in that the ratio <code>u : u_max</code> is used as input to the <em>smooth minimum</em>; John Sterman [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">3</a>, pp.&nbsp;711-713] uses the ratio <code>u_max : u</code> instead.</li><br>
<li>The typical use case for this component is the determination of a production start rate given capacity restrictions. Since production will most often be treated as an aggregate process for many different variants of a basic product, the capacity restriction will likely be felt before the aggregate capacity limit is reached.</li><br>
<li>The <em>soft minimum</em> is a special case of the <em>generalized f-mean</em>.</li>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.Converters.SoftMax\">SoftMax</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SoftMin;
