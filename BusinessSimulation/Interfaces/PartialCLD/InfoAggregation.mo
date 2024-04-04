within BusinessSimulation.Interfaces.PartialCLD;

partial block InfoAggregation "Partial lookup for causal loop diagramming"
  extends Interfaces.Basics.OutputTypeChoice;
  Connectors.RealMultiInput[nin] u "Information inputs" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RealOutput y "Output of output type" annotation(Placement(visible = true, transformation(origin = {162.085, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Integer nin(min = 2) = 2 "Number of inputs" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial class with a vector of real input  and a single output connctors to allow aggregation of multiple inputs.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InfoAggregation;
