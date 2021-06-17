within BusinessSimulation.MoleculesOfStructure;

package Actuators "Subsystems that will only have flow ports to pull or push physical entities from other subsystems"
  extends Icons.Package;
  annotation(Documentation(info = "<html>
<p class = \"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p><em>Actuators</em>&nbsp;in general are systems that <em>push</em> and/or <em>pull</em> physical entities (\"mass\") to and from other systems while receiving and/or transmitting information (usually regarding the material process). Examples would be a mining company extracting resources from the ground and delivering raw materials to producers or a temporary employment agency sending workers to companies in need of temporary reinforcements of their labor force. Note, that in the latter example the flow of workers will be controlled by that subsystem, e.g. temporary workers will be sent and retracted by order of the employment agency.</p>
<p>On a lower level, we may think of processes modeled as a subsystem, e.g. the diffusion of a new product via word of mouth.</p>
<br><hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {0, 5}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, lineThickness = 7, extent = {{-62.764, -53.47}, {62.764, 53.47}}), Rectangle(visible = true, origin = {-62.781, 4.645}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 7, extent = {{-10.968, -11.451}, {10.968, 11.451}}), Rectangle(visible = true, origin = {62.219, 4.645}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 7, extent = {{-10.968, -11.451}, {10.968, 11.451}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Actuators;
