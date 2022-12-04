within BusinessSimulation.Converters;

block AccumulationFunction "Determing the time value of money for an investment of 1"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.InitializationOptions;
  extends Interfaces.PartialConverters.SISO(redeclare replaceable type OutputType = Dimensionless);
  parameter Boolean isCCR = true "= true, if the factional rate given is assumed to be a continuously compounding rate else the rate will be converted (growing.isCCR)" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  SourcesOrSinks.ExponentialGrowth growing(hasConstantRate = false, isCCR = isCCR) annotation(Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel accumulationFunction(initialValue = 1, redeclare replaceable type OutputType = Dimensionless, init = InitializationOptions.FixedValue) "Growth factor according to the accumulation function" annotation(Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(growing.massPort, accumulationFunction.inflow) annotation(Line(visible = true, origin = {-10, -30}, points = {{-10, 0}, {10, 0}}, color = {128, 0, 128}));
  connect(accumulationFunction.y, y) annotation(Line(visible = true, origin = {63.423, -6.533}, points = {{-48.423, -13.067}, {-48.423, 6.533}, {96.845, 6.533}}, color = {1, 37, 163}));
  connect(u, growing.u) annotation(Line(visible = true, origin = {-71.667, -6.667}, points = {{-73.333, 6.667}, {36.667, 6.667}, {36.667, -13.333}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real output <strong>y</strong> is the value of the <em>accumulation function</em> at any time <em>t</em> in the simulation given the variable rate of interest according to input <strong>u</strong>. By definition the accumulation function will give the factor to determing the future value <em>A(t)</em> for an investment with a present value <em>A(0)</em> of 1 monetary units:</p>
<p><em>A(t) = A(0) · a(t) = 1 · a(t)</em></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "a(t)", fontName = "Lato", textStyle = {TextStyle.Bold, TextStyle.Italic})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end AccumulationFunction;
