within BusinessSimulation.Interfaces.Connectors;

encapsulated partial package FlexTypeSignals "Partial package providing input and output connectors with replaceable type"
  import ICON = BusinessSimulation.Icons.ConnectorsPackage;
  import BusinessSimulation.Types.Reals;
  extends ICON;
  replaceable type BaseType = Reals;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>Encapsulated partial package that provides output and input connector classes, which use the <code>replaceable type BaseType</code>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Units\">Units</a>,
<a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.UnitsInBusinessSimulations\">Tutorial.UnitsInBusinessSimulations</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, pattern = LinePattern.None, extent = {{-100, -100}, {100, 100}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FlexTypeSignals;
