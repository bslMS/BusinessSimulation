within BusinessSimulation.Converters.Vector;

block Total "Gives the sum over all components of a vector"
  extends Interfaces.PartialConverters.MISO;
equation
  y = sum(u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The scalar output <strong>y</strong> is obtained by <em>adding all components</em> of the input vector <strong>u</strong>:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/Total/Formula.svg\" alt=\"y_i = sum(u_i)\"></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2, 6}, textColor = {0, 0, 128}, extent = {{-22.881, -36.024}, {22.881, 36.024}}, textString = "∑", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Total;
