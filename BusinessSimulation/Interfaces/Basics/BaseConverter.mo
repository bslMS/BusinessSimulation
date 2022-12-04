within BusinessSimulation.Interfaces.Basics;

encapsulated partial block BaseConverter "Basic converter class"
  import BusinessSimulation.Icons.Converter;
  import BusinessSimulation.Interfaces.Basics.OutputTypeChoice;
  import BusinessSimulation.Units.*;
  extends Converter;
  extends OutputTypeChoice;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from Icons.Converter and &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.OutputTypeChoice\">OutputTypeChoice</a>. This is the base class for Converter components.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BaseConverter;
