within BusinessSimulation.Flows.Bidirectional;

model Switching "An exchange of matter between two stocks at an exogenous rate"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialFlows.BidirectionalFlow;
  Interfaces.Connectors.RealInput u "Rate input" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  A_rate = u;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This is the classical example for an exchange of \"matter\" (conserved quantities either matter, energy, or information) between two stocks, where the flow may go in either direction.</p>
<h4>Notes</h4>
<ul>
<li>A <em>positive rate</em> indicates a flow from stock A to stock B.</li><br>
<li>A <em>negative rate</em>&nbsp;indicates the&nbsp;reverse flow from stock B to stock A.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Transition\">Transition</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Flows.Bidirectional.ProportionalSwitching\">ProportionalSwitching</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-8.257, -76.886}, textColor = {0, 0, 128}, extent = {{-25.827, -12}, {25.827, 12}}, textString = "rate", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Switching", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {-42.154, -19.63}, rotation = 5.306, points = {{36.522, -45.771}, {43.438, -34.535}, {45.906, -7.964}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0, smooth = Smooth.Bezier), Polygon(visible = true, origin = {4, -26.925}, lineColor = {0, 0, 128}, fillColor = {0, 0, 128}, fillPattern = FillPattern.Solid, points = {{0, 9}, {5, -5}, {-5, -5}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Switching;
