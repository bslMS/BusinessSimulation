within BusinessSimulation.Types;

type PriorityProfiles = enumeration(uniform "Uniform distribution", triangular "Triangular distribution", normal "Normal distribution", extremeValue "Extreme value distribution") "Distributions used to describe priority profiles used to allocate scare resources" annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Text(visible = true, textColor = {76, 112, 136}, extent = {{-90, -50}, {90, 50}}, textString = "1..n", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"));
