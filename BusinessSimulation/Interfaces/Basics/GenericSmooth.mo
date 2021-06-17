within BusinessSimulation.Interfaces.Basics;

partial block GenericSmooth "Partial smooth-like converter class"
  extends Icons.Smooth;
  extends OutputTypeChoice;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from Icons.Smooth and &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.OutputTypeChoice\">OutputTypeChoice</a>. This is the base class for Smooth-like Converters.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GenericSmooth;
