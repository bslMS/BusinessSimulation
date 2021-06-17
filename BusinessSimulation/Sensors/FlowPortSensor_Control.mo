within BusinessSimulation.Sensors;

model FlowPortSensor_Control "Level information for an outside FlowPort"
  Interfaces.Connectors.FlowPort flowPort annotation(Placement(visible = true, transformation(origin = {0, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput stock "Current amount in connected stock" annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0.488, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Interfaces.Connectors.BooleanOutput stopInflow "Report the signal received" annotation(Placement(visible = true, transformation(origin = {150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Connectors.BooleanOutput stopOutflow "Report the signal received" annotation(Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -540)));
initial equation
  // properly initialize discret vars with fixed = false
  pre(stopInflow) = flowPort.stopInflow;
  pre(stopOutflow) = flowPort.stopOutflow;
equation
  // no flow for this component
  flowPort.rate = 0;
  stock = flowPort.stock;
  stopInflow = flowPort.stopInflow;
  stopOutflow = flowPort.stopOutflow;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This component is typically used to build submodels where the information regarding the amount in a connected stock needs to be extracted from an outside <code>FlowPort</code>.</p>
<p>For example, the <em>FlowPortSensor</em> is used inside the <em>SourceOrSink</em> component <a href=\"modelica://BusinessSimulation.SourcesOrSinks.ExponentialGrowth#diagram\">ExponentialGrowth</a>, where the level information is needed for the stock as it will be multiplied with a fractional rate to obtain the actual rate for the component's flow into the stock.</p>
<h4>Notes</h4>
<p>While the FlowPortSensor only reports the rate of flow, this component additionally reports the Boolean signals (<code>stopInflow, stopOutflow</code>) received at the outside <code>FlowPort</code>.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Sensors.FlowPortSensor\">FlowPortSensor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Sensors.StockPortSensor\">StockPortSensor</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {0, 33.849}, points = {{0, -33.849}, {0, 33.849}}, color = {128, 0, 128}, thickness = 3), Ellipse(visible = true, origin = {0, 70}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {76, 112, 136}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-20.708, -20.708}, {20.708, 20.708}}), Line(visible = true, origin = {-14.33, 77.5}, rotation = -300, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {-8.5, 83.33}, rotation = 30, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {0.219, 86.375}, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {-2.624, 73.453}, rotation = -300, points = {{2.435, 4.688}, {-2.435, -4.688}}, color = {255, 0, 0}, thickness = 1), Line(visible = true, origin = {13.857, 78.141}, rotation = 660, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {7.922, 84.346}, rotation = -30, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {-16, 70}, rotation = -270, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {16, 70}, rotation = -270, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Text(visible = true, origin = {0, 60}, textColor = {255, 255, 255}, extent = {{-12.617, -10}, {12.617, 10}}, textString = "S", fontSize = 30, fontName = "Arial", textStyle = {TextStyle.Bold}), Ellipse(visible = true, origin = {0.097, 70}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Text(visible = true, origin = {1.113, -50.492}, textColor = {0, 0, 128}, extent = {{-141.113, -29.508}, {141.113, 29.508}}, textString = "%name", fontSize = 100, fontName = "Arial", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FlowPortSensor_Control;
