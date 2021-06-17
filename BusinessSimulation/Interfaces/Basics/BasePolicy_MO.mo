within BusinessSimulation.Interfaces.Basics;

partial block BasePolicy_MO "Basic policy class with multiple outputs"
  extends Icons.Policy;
  extends OutputTypeChoice;
  parameter Integer nout(min = 1) = 2 "Number of outputs" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from Icons.Policy and &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.OutputTypeChoice\">OutputTypeChoice_MO</a>. This is the base class for Policy-related components with multiple outputs.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy\">MoleculesOfStructure.Policy</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BasePolicy_MO;
