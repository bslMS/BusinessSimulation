within BusinessSimulation;

encapsulated package Units "Typical quantities used in models"
  import ICON = BusinessSimulation.Icons.UnitsPackage;
  import BusinessSimulation.Types.Reals;
  extends ICON;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This package contains types to represent SI units and (some) non-SI units used in models of social and ecological systems.</p>
<h4>Notes</h4>
<ul>
<li>Non-SI units in the Business Simulation Library are used sparingly and with careful thought behind their inclusion. Their use in platforms other than Wolfram System Modeler hinges upon whether custom definitions of <em>base units</em>, such as <code>each</code> (#) for counting entities and <code>USD</code> ($) as a monetary unit, are permitted.</li><br>
<li>Convenient definitions for <em>derived units</em>, such as <code>yrCal</code> for a mean Gregorian calendar year, are especially useful in economic and ecological models.</li><br>
<li>Currently, Wolfram System Modeler seems to uniquely offer such flexibility and convenience.</li><br>
<li>Where this is not the case, modelers can always resort to what is allowed in all tools, so that dimensionless units may be used for counting instead of <code>each</code> or other non-standard base units, and times can be entered using exact day counts. Modelica as a language is constantly evolving, so hopefully, some of the innovations this library introduces might find their way into the mainstream. A <a href=\"https://github.com/modelica/ModelicaSpecification/issues/3425\">tentative proposal</a> has been made to the language group.</li><br>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.UnitsInBusinessSimulations\">Tutorial.UnitsInBusinessSimulations</a>
</p>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a> or later</p>
</html>", revisions = "<html>
<ul>
<li>Extensive revisions of the unit framework in v2.2 as to make use of Wolfem System Modeler's excellent unit framework, introduced in WSM 14.</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Units;
