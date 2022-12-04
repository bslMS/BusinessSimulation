within BusinessSimulation.Converters.Vector;

block Min "Min function for vectors"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.MISO;
equation
  y = min(u);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The scalar output <strong>y</strong> is obtained as the <em>minimum&nbsp;</em>of all components in the input vector <strong>u.</strong></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "MIN", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Min;
