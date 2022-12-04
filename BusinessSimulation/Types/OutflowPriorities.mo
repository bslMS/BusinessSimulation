within BusinessSimulation.Types;

type OutflowPriorities = enumeration(FIFO "First in, first out", LIFO "Last in, last out", Random "Random selection of entities, i.e., proportional draining") "Policies for processing queues and draining discrete delays" annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {76, 112, 136}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Text(visible = true, textColor = {76, 112, 136}, extent = {{-90, -50}, {90, 50}}, textString = "1..n", fontName = "Lato", textStyle = {TextStyle.Bold})}), Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"));
