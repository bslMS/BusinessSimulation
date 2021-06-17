within BusinessSimulation.Converters;

block Log "Logarithm of the input to a given base"
  extends Interfaces.PartialConverters.SISO;
  import BusinessSimulation.Constants.{e,small};
  parameter Real base(min = small) = e "Base of the logarithm (default = Euler's number)" annotation(Evaluate = true);
equation
  y = log(u) / log(base);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is obtained as the logarithm of the input <strong>u</strong> to base <code>base</code> with the default base being Euler's number.</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "LOG", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Log;
