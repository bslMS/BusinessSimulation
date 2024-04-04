within BusinessSimulation.Interfaces.Basics;

partial class ThreeSO "Generic information output for stock and rate elements"
  extends Basics.OutputTypeChoice;
  // the output y may be given a start value sometimes and accordingly is put into an Initialization tab
  RealOutput y "Level or rate information" annotation(Dialog(enable = false, tab = "Initialization"), Placement(visible = true, transformation(origin = {160, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -1350)));
  RealOutput y1 "Level or rate information" annotation(Placement(visible = true, transformation(origin = {160, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  RealOutput y2 "Level or rate information" annotation(Placement(visible = true, transformation(origin = {160, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-105, -50}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial model that extends&nbsp;&rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.OutputTypeChoice\">OutputTypeChoice </a>and has three Real output connectors. It is typically used by Stock components to report the amount inside (e.g., its state).</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Interfaces.Basics.ThreeSO_rate\">ThreeSO_rate </a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ThreeSO;
