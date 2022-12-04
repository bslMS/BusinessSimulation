within BusinessSimulation.Converters;

block GameInput "Enable user input, if gaming mode is activated"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SO;
  Interfaces.Connectors.RealInput u "Input to be used if modelSettings.gaming = false" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Interfaces.Connectors.RealInput u_User "User input to be used if modelSettings.gaming = true" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  outer ModelSettings modelSettings;
algorithm
  y := if modelSettings.gaming == true then u_User else u;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>This component allows to easily set up a model as to either allow for user input (i.e., <code>modelSettings.gaming = true</code>) or to work without any such input (i.e., <code>modelSettings.gaming = false</code>). The user input is to be provided using the input connector <code>u_User</code>, while the regular input needs to be connected to the input <strong>u</strong></p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-58, -58}, {58, 58}}), Text(visible = true, textColor = {128, 0, 128}, extent = {{-31.731, -40}, {31.731, 40}}, textString = "?", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GameInput;
