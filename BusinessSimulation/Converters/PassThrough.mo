within BusinessSimulation.Converters;

block PassThrough "Output is identical to input"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SISO;
equation
  y = u;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The output <strong>y</strong> is identical to the input <strong>u</strong>.</p>
<h4>Notes</h4>
<p>This component is most often useful as a conditional component: Graphical components and their connections are automatically removed when the component is not active, so the PassThrough component can be used to switch bewtween different structural configurations inside a component (e.g., have an input be modified or unmodified according to some switch as is done in <a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialGrowth#diagram\">BusinessSimulation.SourcesOrSinks.ExponentialGrowth</a>&nbsp;where the input rate is turned to a force of interest or left unchanged according to a structural parameter).</p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-4.277, 0}, points = {{-80.493, 0}, {80.493, 0}}, color = {0, 0, 128}, thickness = 2.5, arrowSize = 0)}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end PassThrough;
