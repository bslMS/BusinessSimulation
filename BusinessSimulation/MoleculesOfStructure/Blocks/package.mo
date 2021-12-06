within BusinessSimulation.MoleculesOfStructure;

package Blocks "Subsystems with input and output connectors only (Control and/or information processing)"
  extends Icons.BlocksPackage;
  annotation(Documentation(info = "<html>
<p class = \"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p><em>Blocks</em> are <em>information processing systems</em> or (on a lower level of aggregation) processes with information inputs and outputs only. Typical examples will be management seen as a subsystem of a company receiving information from&nbsp;production systems, processing them and sending out information according to decision making policies. On a lower level a simple transformation of information may be modeled as a block.</p>
<h4>Notes</h4>
<ul>
<li>Given the origin of System Dynamics in electrical engineering the term \"<em>block</em>\" is a clear reference to signal-flow processing and control engineering, where such systems are represented in a <a href=\"https://en.wikipedia.org/wiki/Block_diagram\">block-diagram</a>.</li><br>
<li>All other subsystems (e.g., incubators, transceivers, actuators) will also have input and output connectors, so blocks are exceptional in the absence of mass flow connectors (e.g., there are no stock or flow ports).</li>
</ul>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Blocks;
