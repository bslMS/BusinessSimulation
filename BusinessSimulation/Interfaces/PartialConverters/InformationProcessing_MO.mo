within BusinessSimulation.Interfaces.PartialConverters;

partial block InformationProcessing_MO "Information processing block with multiple outputs"
  extends Basics.BaseInformationProcessing_MO;
  RealMultiOutput[nout] y "Vector of information output signals" annotation(Placement(visible = true, transformation(origin = {150, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.BaseInformationProcessing_MO\">BaseInformationProcessing_MO</a>&nbsp;base class with nmultiple Real output connectors. This is the base class for InformationProcessing components with multiple outputs.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing\">MoleculesOfStructure.InformationProcessing</a></p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InformationProcessing_MO;
