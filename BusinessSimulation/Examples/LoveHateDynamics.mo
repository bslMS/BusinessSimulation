within BusinessSimulation.Examples;

model LoveHateDynamics "Romeo and Juliet model as introduced by Strogatz"
  extends Icons.Example;
  Stocks.InformationLevel romeo(initialValue = romeoInitial) annotation(Placement(visible = true, transformation(origin = {-50, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel juliet(initialValue = julietInitial) annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Flows.Interaction.LinearInteraction loving(a_A = romeoIntrinsic, b_B = julietIntrinsic, a_B = romeoExtrinsic, b_A = julietExtrinsic, hasConstantGrowthRates = true, hasConstantFractionalGrowthRates = true, hasConstantCouplingCoefficients = true, a_0 = 0, b_0 = 0) "Interacting forces of love" annotation(Placement(visible = true, transformation(origin = {0.275, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real romeoInitial = 1 "Initial level (should be different from 0 to find non-trivial steady state solution) (romeo.initialValue)";
  parameter Real julietInitial = 0 "Initial level (should be different from 0 to find non-trivial steady state solution) (juliet.initialValue)";
  parameter Units.Rate romeoIntrinsic = 0 "Gain for Romeo's feelings independent from Juliet";
  parameter Units.Rate julietIntrinsic = 0 "Gain for Juliet's feelings independent from Romeo";
  parameter Units.Rate romeoExtrinsic = -1 "Gain for Romeo's love aroused by Juliet";
  parameter Units.Rate julietExtrinsic = 1 "Gain for Juliet's love aroused by Romeo";
  inner ModelSettings modelSettings annotation(Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(loving.portA, romeo.outflow) annotation(Line(visible = true, origin = {-24.863, -0}, points = {{15.138, 0}, {-15.137, -0}}, color = {128, 0, 128}));
  connect(loving.portB, juliet.inflow) annotation(Line(visible = true, origin = {25.137, 0}, points = {{-14.862, -0}, {14.863, 0}}, color = {128, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Using the →<a href = \"modelica://BusinessSimulation.Flows.Interaction.LinearInteraction\">LinearInteraction</a> we can model Steven H. Strogatz' differential equation model for the dynamics in a love affair—conspiciously between Juliet and Romeo [.</p>
<p>In his example—given in 1988—Strogatz described Romeo as a \"<em>fickle</em>\" lover who is turned off the more Juliet starts to warm up to him. On the other hand, the more Juliet dislikes him, the more he starts to approach Juliet. Juliet in comparison is a rather \"regular\" lover: The more Romeo loves her, the more she will love him and, conversely, the more he hates her, the more she hates him.</p>
<p>To put this in mathematical form, we use stocks to account for Romeo's (<code>reomeo</code>) and Juliet's feelings (<code>reomeo</code>) at any time in the simulation. We define, that <code>1</code> is to describe the highest possible degree of love, while <code>-1</code>  is to express the highest possible degree of hate. Initially, Romeo is fully in love with Juliet (i.e.<code>romeoInitial&nbsp;=&nbsp;1</code>), while Juliet does not care about him (i.e.<code>julietInitial&nbsp;=&nbsp;1</code>).</p>
<p>The relationship's dynamics arise from <em>coupled</em> differential equations, which can be compactly expressed using an → <a href = \"modelica://BusinessSimulation.Flows.Interaction\">Interaction</a> flow. Using a bit of shorthand notation, the system is described more generally by the following equations:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/LoveHateDynamics/Formula.svg\" alt=\"Formula.svg\"></p>
<p>The change in the states for Romeo (R) and Juliet (J) depends upon <em>coupling coefficients</em>. Both lovers have an <em>intrinsic</em> and and <em>extrinsic</em> coupling coefficient. In our example, there is no <em>intrinsic</em> coupling (i.e. <code>romeoIntrinsic&nbsp;= julietIntrinsic&nbsp;=&nbsp;0</code>). The <em>extrinsic</em> coupling factors given according to the above description are: <code>romeoExtrinsic&nbsp;=&nbsp;-1, julietExtrinsic&nbsp;=&nbsp;1</code>:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Examples/LoveHateDynamics/Formula2.svg\" alt=\"Formula.svg\"></p>
<p>Simulating the example quickly shows, why the technical term for this system is <em>harmonic oscillator</em>.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, 80}, textColor = {76, 112, 136}, extent = {{-140, -6}, {140, 6}}, textString = "Dynamics of Love and Hate", fontName = "Lato Black")}), __Wolfram(PlotSet(plots = {Plot(name = "PhasePlot", identifier = "phaseplot", preferred = true, subPlots = {SubPlot(curves = {Curve(x = romeo.y, y = juliet.y)})}), Plot(name = "LoveDynamics", identifier = "timeseries", subPlots = {SubPlot(curves = {Curve(x = time, y = juliet.y), Curve(x = time, y = romeo.y)})})})), experiment(StartTime = 0, StopTime = 10));
end LoveHateDynamics;
