within BusinessSimulation.Interfaces.PartialCLD;

encapsulated partial model FlowPort "Single flow port with optional flow reporting"
  import BusinessSimulation.Interfaces.Connectors.FlowPort;
  import BusinessSimulation.Interfaces.Connectors.RealOutput;
  import BusinessSimulation.Interfaces.Basics.OutputTypeChoice_Rate;
  extends OutputTypeChoice_Rate;
  FlowPort flowPort "Used to represent stock and flow connections" annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Boolean hasRateOutput = false "= true, if the rate is reported via real output connectors" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  RealOutput y if hasRateOutput "Output of current rate of flow" annotation(Placement(visible = true, transformation(origin = {161.845, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  RealOutput y1 if hasRateOutput "Output of current rate of flow" annotation(Placement(visible = true, transformation(origin = {162.083, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>A single flow port with two output connectors (optional).</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FlowPort;
