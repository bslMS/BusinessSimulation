within BusinessSimulation.Interfaces.PartialConverters;

partial block Policy_MO "Policy block with multiple outputs"
  extends Basics.BasePolicy_MO;
  RealMultiOutput[nout] y "Vector of policy output signals" annotation(Placement(visible = true, transformation(origin = {150, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.BasePolicy_MO\">BasePolicy_MO</a>&nbsp;base class with multiple Real output connectors. This is the base class for Policy components used to model decision making with multiple outputs.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy\">MoleculesOfStructure.Policy</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Policy_MO;
