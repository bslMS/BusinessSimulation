within BusinessSimulation;

package MoleculesOfStructure "Pre-built components to model decision making, information processing, and subsystems in general"
  extends Icons.Package;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This package contains&nbsp;generic model structure widely used by the System Dynamics community. Since this library makes use of acausal connectors to represent \"mass ports\"&mdash;connectors for what would be a double arrow connecting in classical System Dynamics notation&mdash;it turned out, that the organization of Molecules in this library should best be done with a focus on the <em>actual interfaces</em> (i.e. connectors) of a generic structure.</p>
<h4>Acknowledgements</h4>
<p>There exist well known generic structures in the System Dynamics methodology that are reused over and over&mdash;quite independent from the actual modeling domain. <em>James \"Jim\" Hine</em>s [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>] has meticulously collected such elementary structures and coined the term \"<em>Molecules of Structure</em>\".</p>
<p>In building the Business Simulation Library the name \"Molecules of Structure\" was adapted and whenever possible it was tried to stick to the names in Jim Hines' publication as that use is widespread in the System Dynamics community. Nevertheless, the object-oriented nature of Modelica allows to do what Hines has only hinted at: It can reuse components and thus truly arrive at new structure built upon existing structure.</p>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.UsersGuide.Tutorial.ElementaryBuildingBlocks\">Tutorial.ElementaryBuildingBlocks</a>,
<a href = \"https://sdmolecules.org/index.htm\">Molecules of Structure Website (maintained by Jim Hines)</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, origin = {-39.037, 49.037}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20.963, -20.963}, {20.963, 20.963}}), Ellipse(visible = true, origin = {-20, -47.43}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20.963, -20.963}, {20.963, 20.963}}), Ellipse(visible = true, origin = {49.037, 19.037}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20.963, -20.963}, {20.963, 20.963}}), Line(visible = true, origin = {27.649, -23.009}, points = {{-67.649, 75.352}, {-47.649, -29.74}, {22.351, 46.555}}, color = {255, 255, 255}, thickness = 3), Line(visible = true, origin = {35.649, -31.009}, points = {{-67.649, 75.352}, {11.756, 51.009}}, color = {255, 255, 255}, thickness = 3)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MoleculesOfStructure;
