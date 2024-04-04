within BusinessSimulation.Sensors;

model StockPortSensor_Control "Rate of flow information from stock ports"
  Interfaces.Connectors.RealOutput netFlow(quantity = "Rate", unit = "1/s") "Current netflow" annotation(Placement(visible = true, transformation(origin = {160, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0.237, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Interfaces.Connectors.StockPort stockPort annotation(Placement(visible = true, transformation(origin = {-148.083, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.FlowPort flowPort annotation(Placement(visible = true, transformation(origin = {147.868, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {97.643, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.BooleanInput u_stopOutflow "Boolean signal to prevent outflow from the component" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {49.994, 99.994}, extent = {{-9.994, -9.994}, {9.994, 9.994}}, rotation = -90)));
  Interfaces.Connectors.BooleanInput u_stopInflow "Boolean signal to prevent inflow into the component" annotation(Placement(visible = true, transformation(origin = {-145, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.BooleanOutput stopInflow "Report the signal received at the flow port side" annotation(Placement(visible = true, transformation(origin = {150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Connectors.BooleanOutput stopOutflow "Report the signal received at the flow port side" annotation(Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -540)));
initial equation
  // properly initialize discrete vars with fixed = false
  pre(stopInflow) = flowPort.stopInflow;
  pre(stopOutflow) = flowPort.stopOutflow;
  pre(stockPort.stopInflow) = u_stopInflow;
  pre(stockPort.stopOutflow) = u_stopOutflow;
equation
  netFlow = stockPort.rate;
  stockPort.stock = flowPort.stock;
  flowPort.rate = -stockPort.rate;
  // report signals received at flow port side
  stopInflow = flowPort.stopInflow;
  stopOutflow = flowPort.stopOutflow;
  // boolean signals are set according to the explicitly given inputs
  stockPort.stopInflow = u_stopInflow;
  stockPort.stopOutflow = u_stopOutflow;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This component is typically used to build submodels where the information regarding the rate of flow needs to be extracted from the outside <code>StockPort</code>. In this component the Boolean flags <code>stopInflow</code> and <code>stopOutflow</code> can be explicitly set using the Boolean input connectors and the input values will override the signals received at the <code>FlowPort</code>, which will typically be connected to the inside <code>StockPort</code> which would normally be directly connected to the outside one.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Sensors.StockPortSensor\">StockPortSensor</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Sensors.FlowPortSensor\">FlowPortSensor</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {0, 33.849}, points = {{0, -33.849}, {0, 33.849}}, color = {128, 0, 128}, thickness = 3), Ellipse(visible = true, origin = {0, 70}, rotation = 30, lineColor = {0, 0, 128}, fillColor = {76, 112, 136}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-20.708, -20.708}, {20.708, 20.708}}), Line(visible = true, origin = {-14.33, 77.5}, rotation = -300, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {-8.5, 83.33}, rotation = 30, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {0.219, 86.375}, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {-2.624, 73.453}, rotation = -300, points = {{2.435, 4.688}, {-2.435, -4.688}}, color = {255, 0, 0}, thickness = 1), Line(visible = true, origin = {13.857, 78.141}, rotation = 660, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {7.922, 84.346}, rotation = -30, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {-16, 70}, rotation = -270, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Line(visible = true, origin = {16, 70}, rotation = -270, points = {{0, 3}, {0, -3}}, color = {255, 255, 255}, thickness = 1), Text(visible = true, origin = {0, 60}, textColor = {255, 255, 255}, extent = {{-12.617, -10}, {12.617, 10}}, textString = "F", fontSize = 30, fontName = "Arial", textStyle = {TextStyle.Bold}), Ellipse(visible = true, origin = {0.097, 70}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -3}, {3, 3}}), Line(visible = true, origin = {0.848, 0}, points = {{-99.152, 0}, {99.152, 0}}, color = {128, 0, 128}, thickness = 3), Ellipse(visible = true, origin = {0.202, 0.791}, rotation = 5.118, lineColor = {128, 0, 128}, fillColor = {128, 0, 128}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-2.202, -2.202}, {2.202, 2.202}}), Text(visible = true, origin = {1.113, -50.492}, textColor = {0, 0, 128}, extent = {{-141.113, -29.508}, {141.113, 29.508}}, textString = "%name", fontSize = 100, fontName = "Arial", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end StockPortSensor_Control;
