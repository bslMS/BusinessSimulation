within BusinessSimulation.Types;

final type TimeBases = enumeration(seconds "Standard unit of time", minutes "60 s", hours "3'600 s", days "86'400 s", weeks "604'800 s (7 days)", months "2'629'746 s (1/12 year)", quarters "7'889'238 s (3 months)", years "31'556'952 s (365.2425 days)") "Time bases for business simulations" annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Text(visible = true, textColor = {76, 112, 136}, extent = {{-90, -50}, {90, 50}}, textString = "1..n", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(revisions = "<html>
<ul>
<li><code>years</code> and derived time bases thereof (<code>months</code>, <code>quarters</code>) have been changed to average Gregorian years for better compatibility with calendar dates in v2.2.</li><br>
</ul>
</html>"));
