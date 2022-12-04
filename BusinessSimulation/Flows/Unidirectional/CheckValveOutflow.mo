within BusinessSimulation.Flows.Unidirectional;

model CheckValveOutflow "Flow is only passed on if it drains the connected stock"
  import BusinessSimulation.Units.*;
  extends Icons.Outflow;
  extends Interfaces.Basics.ThreeSO_rate;
  Interfaces.Connectors.StockPort portB "Stock port to be connected to an outflow that is passed on" annotation(Placement(visible = true, transformation(origin = {148.5, -2.69}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.FlowPort portA "Flow port to pass on the outflow to a connected stock" annotation(Placement(visible = true, transformation(origin = {-148.182, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  // FlowPort (A) receives level information and passes it on to port B
  // StockPort (B) receives rate information and passes it on observing restrictions
  portB.stock = portA.stock;
  portA.rate = if portB.rate < 0 and not portA.stopOutflow then -portB.rate else 0;
  // set the boolean flags for the stock port
  portB.stopInflow = true;
  portB.stopOutflow = portA.stopOutflow "connected stock may also not allow an outflow";
  // report a positive rate
  y = portA.rate;
  y1 = y;
  y2 = y;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The <em>CheckValveOutflow </em>is actually a <em>transceiver</em> that simply passes on a connected flow if that flow drains the&nbsp;connected stock (<code>portA</code>). This will most often be relevant for more complex subsystems where the flows being connected may not be clear in advance and where this element allows to avoid unwanted filling.</p>
<h4>Implementation</h4>
<ul>
<li>The stock value received at the flow side and a potential boolean flag <em>stopOutflow</em> are also passed on to the stock port. Thus the model will behave as if the flow connected to the <em>CheckValve</em> were directly connected to the stock itself.</li>
</ul>
<ul>
<li>The reported rate is a positive value indicating rate of outflow with regard to the connected stock A.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Flows.Unidirectional.CheckValveInflow\">CheckValveInflow</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {7.939, 4.004}, points = {{-11.1, 5.996}, {11.1, -5.996}}, color = {255, 0, 0}, thickness = 2.5, arrowSize = 0), Ellipse(visible = true, origin = {-5.759, 11.642}, lineColor = {0, 128, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-4.241, -4.241}, {4.241, 4.241}}), Line(visible = true, origin = {-5.977, -9}, points = {{0, 4.985}, {0, -4.985}}, color = {255, 0, 0}, thickness = 2.5, arrowSize = 0), Text(visible = true, origin = {0, 75}, textColor = {0, 128, 0}, extent = {{-100, -12}, {100, 12}}, textString = "Check Valve Out", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end CheckValveOutflow;
