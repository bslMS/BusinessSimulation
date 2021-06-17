within BusinessSimulation.Converters;

block Add_3 "Total of three inputs"
  extends Interfaces.PartialConverters.SI3SO;
equation
  y = u1 + u2 + u3;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is calculated as the <em>sum</em> of the inputs <strong>u1</strong>, <strong>u2</strong>, and <strong>u3</strong>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Add_2\">Add_2</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Converters.Vector.Total\">Total</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, rotation = -225, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0), Line(visible = true, rotation = -315, points = {{15, 15}, {-15, -15}}, color = {0, 0, 128}, thickness = 4, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Add_3;
