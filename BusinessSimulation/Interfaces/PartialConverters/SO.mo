within BusinessSimulation.Interfaces.PartialConverters;

encapsulated partial block SO "Generic converter for signals"
  import BusinessSimulation.Interfaces.Basics.BaseConverter;
  extends BaseConverter;
  RealOutput y annotation(Placement(visible = true, transformation(origin = {160.268, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.BaseConverter\">BaseConverter</a> class with one Real output connector.</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SO;
