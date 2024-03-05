within BusinessSimulation.Interfaces.Basics;

partial model GenericFlow_Special "Flow Template with a FlowPort_Special (portA)"
  Connectors.FlowPort_Special portA "Flow from/to Stock A (stock signals the rate)" annotation(Placement(visible = true, transformation(origin = {-148.205, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.FlowPort portB "Flow to/from Stock B" annotation(Placement(visible = true, transformation(origin = {148.205, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial model class with a &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort_Special\">FlowPort_Special</a> (<code>portA</code>) and a regular &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a> (<code>portB</code>).</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GenericFlow_Special;
