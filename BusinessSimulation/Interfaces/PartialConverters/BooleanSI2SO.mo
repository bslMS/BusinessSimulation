within BusinessSimulation.Interfaces.PartialConverters;

partial block BooleanSI2SO "Converter with two boolean inputs and a boolean output"
  extends BooleanSO;
  Connectors.BooleanInput u1 "Input 1" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Connectors.BooleanInput u2 "Input 2" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending from &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.BooleanSO\">BooleanSO </a>with two Boolean input converters and a single Boolean output converter.</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BooleanSI2SO;
