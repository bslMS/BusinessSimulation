package BusinessSimulation "A library for modeling & simulation of dynamical systems in the social sciences, e.g. business/economics, and ecology using the System Dynamics metaphor."
  annotation(version = "1.0.1", versionDate = "2021-02-02", revisionId = "", uses(Modelica(version = "3.2.3")), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>The <span style=\"color: #000080;\"><strong>BUSINESS SIMULATION LIBRARY (BSL)</strong></span> supports modeling &amp; simulation in the social sciences and ecology. Following John Sterman&nbsp;[<a href=\"modelica://BusinessSimulation.UsersGuide.References\">3</a>] the name \"Busines Simulation\" was chosen in a rather broad sense since ultimately modeling in these domains is concerned with \"control\", \"decision making\", and \"management\".</p>
<p>The <span style=\"color: #000080;\"><strong>BSL</strong> </span>follows the widespread <span style=\"color: #000080;\"><strong>System Dynamics</strong></span> metaphor and modeling approach introduced by Jay W. Forrester [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">1</a>], [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">2</a>].&nbsp;System Dynamics offers a very general, low-level modeling paradigm, that lends itself perfectly to model, simulate, and analyze strategic business or public policy issues.</p>
<p>Unlike existing aproaches the <span style=\"color: #000080;\"><strong>BSL</strong> </span>makes use of Modelica's acausal connectors to better distinguish&nbsp;<em>material/mass</em>&nbsp;flows from instantaneous&nbsp;<em>information</em>&nbsp;signal flows (causal connections). The approach has the additional benefit of allowing the modeler to build rather&nbsp;compact models in a fast and reliable fashion.</p>
<p>To get started with the library, it is recommended to have a look at:</p>
<ul>
<li><strong><a href=\"modelica://BusinessSimulation.UsersGuide\">UsersGuide</a><br><br></strong></li>
<li><strong><a href=\"modelica://BusinessSimulation.Examples\">Examples<br><br></a></strong></li>
</ul>
<hr>
<h4><span style=\"color: #000080;\">Corresponding Author</span></h4>
<p>
<a href=\"modelica://BusinessSimulation.UsersGuide.Contact\">
<img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Contact/ContactInformation.png\" alt=\"ContactInformation.png\" width=\"400\">
</a></p>
<br>
<hr>
<h4><span style=\"color: #000080;\">Releases</span></h4>
<ul>
<li><span style=\"color: #000080;\"><a href=\"modelica://BusinessSimulation.UsersGuide.ReleaseNotes.Version_1_0_1\">Version 1.0.1 &nbsp;(2021-02-02)</a></span></li>
<li><span style=\"color: #000080;\"><a href=\"modelica://BusinessSimulation.UsersGuide.ReleaseNotes.Version_1_0_0\">Version 1.0.0 &nbsp;(2020-11-29)</a></span></li>
</ul>
<hr>
<p><span style=\"color: #000080;\"><strong>Copyright &copy; 2020 Guido Wolf Reichert</strong></span><br>Licensed unter the European Union Public Licence (EUPL), Version 1.2 or later (the \"License\")</p>
<p>You may not use this work except in compliance with the License. You may obtain a copy of the License at:<br> <a href=\"https://eur-lex.europa.eu/eli/dec_impl/2017/863/oj\">https://eur-lex.europa.eu/eli/dec_impl/2017/863/oj</a>&nbsp;(the English text for&nbsp;<a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;is included in the <a href=\"modelica://BusinessSimulation.UsersGuide\">UsersGuide</a>)</p>
<p>Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either expressed or implied. See the License for the specific language governing permissions and limitations under the License.</p>
<p><strong>Modelica&copy; </strong>is a registered trademark of the Modelica Association.</p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {76, 112, 136}, fillColor = {113, 166, 201}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 4, extent = {{-100, -100}, {100, 100}}, radius = 25), Rectangle(visible = true, origin = {0.142, -2.447}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, lineThickness = 10, extent = {{-62.191, -62.447}, {62.191, 62.447}}), Text(visible = true, origin = {0, -30}, textColor = {255, 255, 255}, extent = {{-60, -30}, {60, 30}}, textString = "BSL", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Polygon(visible = true, origin = {25.123, 60}, rotation = -990, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {10, 0}, {-10, -10}, {-10, 10}}), Polygon(visible = true, origin = {-23.947, 60}, rotation = -1170, lineColor = {255, 255, 255}, fillColor = {76, 112, 136}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {10, 0}, {-10, -10}, {-10, 10}}), Rectangle(visible = true, origin = {-63.017, -0.581}, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-8.5, -9.419}, {8.5, 9.419}}), Rectangle(visible = true, origin = {61.5, 0}, lineColor = {255, 255, 255}, fillColor = {76, 112, 136}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-8.5, -9.419}, {8.5, 9.419}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BusinessSimulation;
