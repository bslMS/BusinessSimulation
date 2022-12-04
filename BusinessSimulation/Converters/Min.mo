within BusinessSimulation.Converters;

block Min "Return the smallest value"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SI2SO;
equation
  y = min(u1, u2);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is the <em>minimum</em> of the inputs <strong>u1</strong> and <strong>u2</strong>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Vector.Min\">Vector.Min</a></p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "MIN", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Min;
