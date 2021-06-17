within BusinessSimulation.Interfaces.Basics;

partial block BaseInformationProcessing_MO "Basic information processing class with multiple outputs"
  extends Icons.InformationProcessing;
  extends OutputTypeChoice;
  parameter Integer nout(min = 1) = 2 "Number of outputs" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from Icons.InformationProcessing and &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.OutputTypeChoice\">OutputTypeChoice</a>. This is the base class for InformationProcessing-related components with multiple outputs.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing\">MoleculesOfStructure.InformationProcessing</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BaseInformationProcessing_MO;
