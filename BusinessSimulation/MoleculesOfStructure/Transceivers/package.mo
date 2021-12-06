within BusinessSimulation.MoleculesOfStructure;

package Transceivers "Subsystems with a mix of stock and flow ports"
  extends Icons.TransceiversPackage;
  annotation(Documentation(info = "<html>
<p class = \"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>Transceivers are the most general type of subsystem as they will be receptors as well as actuators with regard to physical entities (\"mass\"). Typically all manufacturing in an economy (seconday sector) can by seen as a transceiver, receiving raw material while pushing onward finished goods to distributors. Note, that when order flows are modeled explicitly even subsystems of the primary sector (e.g., mining, fishing, and agriculture) may be modeled as transceivers.</p>
<p>On a lower level of aggregation we may simply conceive of transceivers as subsystems that start with a stock port on one end while transmitting stuff via a flow port on the other end.</p>
<br><hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Transceivers;
