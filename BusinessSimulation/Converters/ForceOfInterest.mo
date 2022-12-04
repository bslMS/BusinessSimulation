within BusinessSimulation.Converters;

block ForceOfInterest "Calculates the force of interest (continuous compounding rate)"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
equation
  y = log(1 + u);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-54.133, -12}, {54.133, 12}}, textString = "Ln (1 + u)", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>Force of Interest</em> <strong>y</strong> is calculated according to the formula:</p>
<p><code>y &nbsp;= log( 1+ u)</code></p>
<p>It can be used to convert a periodically compounding rate to a continuously coumpounding rate.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ForceOfInterest;
