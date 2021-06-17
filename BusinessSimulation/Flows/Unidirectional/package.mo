within BusinessSimulation.Flows;

package Unidirectional "Transition from one stock to another"
  extends Icons.Package annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>This package contains unidirectional flows of the System Dynamics method that can be used to model a <em>transition</em> from one stock to another. A transition can be understood as the continuous movement of some form of mass from one state to another at a specific rate.</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-2.596, -11.973}, points = {{-72.3, 0}, {72.3, 0}}, color = {255, 255, 255}, thickness = 5), Line(visible = true, origin = {-1.216, 11.777}, points = {{-73.637, 0}, {73.637, 0}}, color = {255, 255, 255}, thickness = 5), Polygon(visible = true, origin = {72.114, -0.25}, rotation = -450, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-22.295, -7.943}, {22.191, -7.943}, {0.104, 15.886}}), Ellipse(visible = true, origin = {1.899, 0}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-15.107, -15.107}, {15.107, 15.107}})}));
end Unidirectional;
