within BusinessSimulation.SourcesOrSinks;

model LogisticGrowth "Logistic growth model"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.Basics.GenericSourceOrSink;
  extends Icons.Source;
  Interfaces.Connectors.RealMultiInput u[2] if not hasConstantInputs "[1] maximum fractional growth rate [2] carrying capacity" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter OutputType r(min = 0) = unspecified "Maximum fractional growth rate" annotation(Dialog(enable = hasConstantInputs));
  parameter CapacityType K(min = 0) = unspecified "Carrying capacity or maximum sustainable amount for the connected stock (>0)" annotation(Dialog(enable = hasConstantInputs));
  parameter Boolean isCCR = true "= true, if the maximum fractional rate given is assumed to be a continuously compounding rate else the rate will be converted" annotation(Dialog(group = "Structural Parameters"));
  parameter Boolean hasConstantInputs = false "= true, if constant parameters aure to be used instead of the real inputs u[1] and u[2]" annotation(Dialog(group = "Structural Parameters"));
  replaceable type CapacityType = Amount constrainedby Unspecified "Type for carrying capacity K" annotation(choicesAllMatching = true);
protected
  Sensors.FlowPortSensor population "Current level of the connected stock" annotation(Placement(visible = true, transformation(origin = {120, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Cloud cloud "System boundary" annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Bidirectional.Switching growing "Process of logistic growth" annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 fractionalGrowthRate "Actual fractional rate of growth" annotation(Placement(visible = true, transformation(origin = {-5, 51.657}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.Division_Guarded relativePopulation(outputIfZero = 1) "Population as percentage of carrying capacity" annotation(Placement(visible = true, transformation(origin = {47.913, 95}, extent = {{-10, 10}, {10, -10}}, rotation = 540)));
  Converters.Gap residualCapacity "Percentage of the carrying capacity left for growth" annotation(Placement(visible = true, transformation(origin = {10, 77.089}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Converters.ConstantConverter one(value = 1) "100 percent" annotation(Placement(visible = true, transformation(origin = {-52.239, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.Product_2 growthRate "Rate of growth" annotation(Placement(visible = true, transformation(origin = {5, 22.515}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Converters.ConstantConverter carryingCapacity(value = K) if hasConstantInputs "Constant carrying capacity (optional)" annotation(Placement(visible = true, transformation(origin = {-107.784, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter maxFractionalGrowthRate(value = r) if hasConstantInputs "Constant maximum rate of growth (optional)" annotation(Placement(visible = true, transformation(origin = {-120, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ForceOfInterest convertedRate if not isCCR "Discrete compounding rate being converted to CCR" annotation(Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.PassThrough identicalRate if isCCR "Use indicated rate if it is continuously compounding" annotation(Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(relativePopulation.u2 > 0, "Carrying capacity must be larger than zero");
  assert(not hasConstantInputs or r < inf and K < inf, "Parameters r and K need to be specified");
  connect(population.flowPort, massPort) annotation(Line(visible = true, origin = {146.667, 10}, points = {{-26.667, 5}, {1.667, 5}, {1.667, -10}}, color = {128, 0, 128}));
  connect(cloud.massPort, growing.portA) annotation(Line(visible = true, origin = {-10, 0}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(growing.y1, y2) annotation(Line(visible = true, origin = {65.125, -27.5}, points = {{-44.625, 22.5}, {-25.125, 22.5}, {-25.125, -22.5}, {94.875, -22.5}}, color = {1, 37, 163}));
  connect(growing.y1, y) annotation(Line(visible = true, origin = {65.125, 12.5}, points = {{-44.625, -17.5}, {-25.125, -17.5}, {-25.125, 17.5}, {94.875, 17.5}}, color = {1, 37, 163}));
  connect(growing.y1, y1) annotation(Line(visible = true, origin = {65.125, 32.5}, points = {{-44.625, -37.5}, {-25.125, -37.5}, {-25.125, 37.5}, {94.875, 37.5}}, color = {1, 37, 163}));
  connect(growing.portB, massPort) annotation(Line(visible = true, origin = {90, 0}, points = {{-70, 0}, {70, 0}}, color = {128, 0, 128}));
  connect(residualCapacity.y, fractionalGrowthRate.u1) annotation(Line(visible = true, origin = {5, 64.89}, points = {{5, 4.836}, {5, 0.199}, {-5, 0.199}, {-5, -5.234}}, color = {1, 37, 163}));
  connect(relativePopulation.y, residualCapacity.u2) annotation(Line(visible = true, origin = {23.517, 91.696}, points = {{17.034, 3.304}, {-8.517, 3.304}, {-8.517, -6.607}}, color = {1, 37, 163}));
  connect(one.y, residualCapacity.u1) annotation(Line(visible = true, origin = {-12.926, 88.363}, points = {{-35.852, 1.637}, {17.926, 1.637}, {17.926, -3.274}}, color = {1, 37, 163}));
  connect(population.stock, relativePopulation.u1) annotation(Line(visible = true, origin = {98.67, 75.333}, points = {{21.379, -49.333}, {21.379, 24.667}, {-42.757, 24.667}}, color = {1, 37, 163}));
  connect(fractionalGrowthRate.y, growthRate.u2) annotation(Line(visible = true, origin = {-2.5, 38.531}, points = {{-2.5, 5.764}, {-2.5, 1.126}, {2.5, 1.126}, {2.5, -8.015}}, color = {1, 37, 163}));
  connect(population.stock, growthRate.u1) annotation(Line(visible = true, origin = {65.024, 36.629}, points = {{55.025, -10.629}, {55.025, 13.371}, {-55.024, 13.371}, {-55.024, -6.114}}, color = {1, 37, 163}));
  connect(growthRate.y, growing.u) annotation(Line(visible = true, origin = {5, 12.576}, points = {{0, 2.576}, {0, -2.576}}, color = {1, 37, 163}));
  connect(u[2], relativePopulation.u2) "Carrying capacity" annotation(Line(visible = true, origin = {-48.011, 8.75}, points = {{-96.989, -8.75}, {-91.989, -8.75}, {-91.989, -28.75}, {-31.989, -28.75}, {-31.989, -43.75}, {128.011, -43.75}, {128.011, 81.25}, {103.924, 81.25}}, color = {1, 37, 163}));
  connect(carryingCapacity.y, relativePopulation.u2) annotation(Line(visible = true, origin = {26.094, 10.637}, points = {{-130.417, -45.637}, {-41.863, -45.637}, {53.906, -45.637}, {53.906, 79.363}, {29.819, 79.363}}, color = {1, 37, 163}));
  connect(maxFractionalGrowthRate.y, convertedRate.u) annotation(Line(visible = true, origin = {-108.635, 77.5}, points = {{-7.904, -12.5}, {-1.365, -12.5}, {-1.365, 12.5}, {10.635, 12.5}}, color = {1, 37, 163}));
  connect(convertedRate.y, fractionalGrowthRate.u2) annotation(Line(visible = true, origin = {-46.528, 75.931}, points = {{-36.11, 14.069}, {-18.472, 14.069}, {-18.472, -5.931}, {36.528, -5.931}, {36.528, -16.274}}, color = {1, 37, 163}));
  connect(maxFractionalGrowthRate.y, identicalRate.u) annotation(Line(visible = true, origin = {-106.135, 57.5}, points = {{-10.404, 7.5}, {1.135, 7.5}, {1.135, -7.5}, {8.135, -7.5}}, color = {1, 37, 163}));
  connect(identicalRate.y, fractionalGrowthRate.u2) annotation(Line(visible = true, origin = {-46.528, 59.931}, points = {{-36.11, -9.931}, {-18.472, -9.931}, {-18.472, 10.069}, {36.528, 10.069}, {36.528, -0.274}}, color = {1, 37, 163}));
  connect(u[1], identicalRate.u) "Continuous input of maximum fractional growth rate" annotation(Line(visible = true, origin = {-117, 25}, points = {{-28, -25}, {12, -25}, {12, 25}, {19, 25}}, color = {1, 37, 163}));
  connect(u[1], convertedRate.u) "Continuous input of fractional growth rate that needs to be converted" annotation(Line(visible = true, origin = {-117, 45}, points = {{-28, -45}, {12, -45}, {12, 45}, {19, 45}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p><em>LogisticGrowth</em> describes the growth of some population that is limited by the availability of some finite resource. While the population starts to grow exponentially at first at a given fractional rate of growth (either given by the constant parameter <code>r</code> or by the time-variant input <code>u[1]</code>), its growth rate will continously diminish until the population reaches its sustainable level (either given by the constant parameter <code>K</code> or the time-variant input <code>u[2]</code>), which is called the <em>carrying capacity</em>.</p>
<p>The rate of inflow to a connected stock is given by the so called <em>Verhulst&nbsp;</em>equation:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/SourcesOrSinks/LogisticGrowth/Formula.svg\" alt=\"dx/dt = r x ( 1 - x/K )\"></p>
<p>&nbsp;The diagram below shows the s-shaped growth for a population x for different rates of growth:</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"bottom\">LogisticGrowth for Different Rates r (x0 = 0.1)</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/SourcesOrSinks/LogisticGrowth/Plot.svg\" alt=\"Plot.svg\"></td>
</tr>
</tbody>
</table>
<h4>Notes</h4>
<ul>
<li>By default it is assumed, that the rate given is a continously compounding rate (<code>isCCR = true</code>). If this is not case, the rate will be converted using the &rarr;<a href=\"modelica://BusinessSimulation.Converters.ForceOfInterest\">ForceOfInterest </a>converter.</li><br>
<li>While the component refers to <em>growth</em>&nbsp;it can easily be seen from the equation above, that for negative rates or for <code>K &lt; x</code> the inflow to the stock can become negative. This is allowed and the modeler has to take care that the input or parameter values make sense for the process being modeled.</li>
</ul>
<h4>Acknowledgements</h4>
<p>The logistic growth equation is originally due to the Belgian mathematican <em>Pierre-Fran&ccedil;ois Verhulst</em> (1804 - 1849).</p>
</html>", revisions = "<html>
<ul>
<li>Added type choice for <code>K</code> and defaulted optional constant parameters to <code>unspecified</code>.</li><br>
</ul>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Logistic Growth", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {60, -80}, textColor = {0, 0, 128}, extent = {{-16.681, -12}, {16.681, 12}}, textString = "K", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-40, -68.863}, textColor = {0, 0, 128}, extent = {{-5.153, -12}, {5.153, 12}}, textString = "r", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {63.558, -10.273}, rotation = -5.306, points = {{32.722, 10.515}, {13.878, -30.192}, {-15.693, -37.076}, {-32.22, -15.961}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{9.831, -44.191}, {31.025, -33.382}, {47.07, -12.788}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {31.134, -25.316}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}}), Polygon(visible = true, origin = {5.5, -27.794}, rotation = -30, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}}), Line(visible = true, origin = {-31.891, -23.609}, points = {{77.861, -51.711}, {56.151, -35.748}, {51.602, -8.364}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {20, -29}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {-5, -5}, {5, -5}})}));
end LogisticGrowth;
