within BusinessSimulation.MoleculesOfStructure;

package Incubators "Subssystems with stock ports only receiving and providing physical entities usually in a modified form"
  extends Icons.Package;
  annotation(Documentation(info = "<html>
<p class = \"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p><em>Incubators</em> are subsystems that can be seen as more aggregate versions of a stocks/reservoirs. They receive physical entities from other systems or provide entities to be \"withdrawn\". Entities stored in an incubator will typically be transformed while they are stored within the system.</p>
<p>An account which allows physical deposits and withdrawals (e.g. a checking account) can be seen as a basic example: While money is stored in the account, interest payments are received increasing the balance of the account.</p>
<br><hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {0, 5}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, lineThickness = 7, extent = {{-62.764, -53.47}, {62.764, 53.47}}), Rectangle(visible = true, origin = {-62.781, 4.645}, lineColor = {255, 255, 255}, fillColor = {76, 112, 136}, fillPattern = FillPattern.Solid, lineThickness = 7, extent = {{-10.968, -11.451}, {10.968, 11.451}}), Rectangle(visible = true, origin = {62.219, 4.645}, lineColor = {255, 255, 255}, fillColor = {76, 112, 136}, fillPattern = FillPattern.Solid, lineThickness = 7, extent = {{-10.968, -11.451}, {10.968, 11.451}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Incubators;
