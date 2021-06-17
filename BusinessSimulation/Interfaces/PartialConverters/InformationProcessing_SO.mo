within BusinessSimulation.Interfaces.PartialConverters;

partial block InformationProcessing_SO "Information Processing Block"
  extends Basics.BaseInformationProcessing;
  RealOutput y "Information output signal" annotation(Placement(visible = true, transformation(origin = {160, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.BaseInformationProcessing\">BaseInformationProcessing</a>&nbsp;base class with a Real output connector. This is the base class for InformationProcessing components.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing\">MoleculesOfStructure.InformationProcessing</a></p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InformationProcessing_SO;
