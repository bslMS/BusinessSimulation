within BusinessSimulation.Interfaces.PartialConverters;

partial block BooleanSISO "Converter with single input and single output"
  extends BooleanSO;
  Connectors.BooleanInput u "Input" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial block extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.PartialConverters.BooleanSO\">BooleanSO </a>class with a Boolean output and a Boolean input connector.</p></html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BooleanSISO;
