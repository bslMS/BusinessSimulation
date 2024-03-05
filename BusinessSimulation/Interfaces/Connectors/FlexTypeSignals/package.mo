within BusinessSimulation.Interfaces.Connectors;

package FlexTypeSignals "Package providing input and output connectors with replaceable type"
  import ICON = BusinessSimulation.Icons.ConnectorsPackage;
  extends ICON;
  replaceable type BaseType = Reals "Base type used by causal connectors" annotation(choicesAllMatching = true);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Package that provides output and input connector classes, which use the <code>replaceable type BaseType</code>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Units\">Units</a>,
<a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.UnitsInBusinessSimulations\">Tutorial.UnitsInBusinessSimulations</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>", revisions = "<html>
<ul>
<li>Removed prefix <code>partial</code> in v2.1.0.</li><br>
<li>Changed the constraining type for <code>BaseType</code> to <code>Unspecified</code> coupled with a simplified <code>choicesAllMatching = true</code> in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, pattern = LinePattern.None, extent = {{-100, -100}, {100, 100}})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FlexTypeSignals;
