within BusinessSimulation;

package MoleculesOfStructure "Pre-built components to model decision making, information processing, and subsystems in general"
  extends Icons.MoleculesPackage;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This package contains&nbsp;generic model structures widely used by the system dynamics community. Since this library makes use of acausal connectors to represent material \"mass ports\"&mdash;connectors for what would be a double arrow connecting in classical system dynamics notation&mdash;it turned out, that the organization of Molecules in this library should best be done with a focus on the <em>actual interfaces</em> (i.e., connectors) of a generic structure.</p>
<h4>Acknowledgements</h4>
<p>There exist well known generic structures in the system dynamics methodology that are reused over and over&mdash;quite independent from the actual modeling domain. <em>James \"Jim\" Hine</em>s [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">6</a>] has meticulously collected such elementary structures and coined the term \"<em>Molecules of Structure</em>\".</p>
<p>In building the Business Simulation Library the name \"Molecules of Structure\" was adapted and whenever possible it was tried to stick to the names in Jim Hines' publication as that use is widespread in the system dynamics community. Nevertheless, the object-oriented nature of Modelica allows to do what Hines has only hinted at: It can reuse components and thus truly arrive at new structure built upon existing structure.</p>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.UsersGuide.Tutorial.ElementaryBuildingBlocks\">Tutorial.ElementaryBuildingBlocks</a>,
<a href = \"https://sdmolecules.org/index.htm\">Molecules of Structure Website (maintained by Jim Hines)</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MoleculesOfStructure;
