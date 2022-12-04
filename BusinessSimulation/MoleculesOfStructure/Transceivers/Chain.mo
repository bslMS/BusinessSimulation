within BusinessSimulation.MoleculesOfStructure.Transceivers;

model Chain "A chain of serially connected reservoirs"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  import BusinessSimulation.Types.InitializationOptions;
  extends Icons.SubsystemTransceiver;
  extends Interfaces.Basics.OutputTypeChoice;
  Interfaces.Connectors.StockPort stockPort "Inflow-side of the chain" annotation(Placement(visible = true, transformation(origin = {-148.207, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.FlowPort flowPort if hasFlowPort "Outflow side of the chain conditional upon `endWithCloud` switch" annotation(Placement(visible = true, transformation(origin = {148.053, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealMultiInput[n] u "Vector input of transition rates" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  RealMultiOutput[n] y "Amounts contained in the stocks" annotation(Placement(visible = true, transformation(origin = {150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Interfaces.Connectors.StockInfoOutput[n] y_stockInfo if hasStockInfoOutput "Optional StockInfoOutput" annotation(Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  parameter Integer n(min = 2) = 2 "The number of stocks in the chain" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Real[n] initialValue = zeros(n) "Vector of initial values for the stocks in the chain";
  parameter OutputType[n] maxValue = fill(inf, n) "Maximum admissable value";
  parameter OutputType[n] minValue = fill(-inf, n) "Minimum admissable value";
  parameter Boolean hasFlowPort = true "= true, if the outflow from the stock will go to a flow port instead of a cloud" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean useAssert = false "= true, if  leaving the admissable range is to cause an error or warning" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean causeError = true "= true, if leaving the admissable range is to cause an error instead of simply a warning" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  parameter Boolean hasStockInfoOutput = false "= true, if a StockInfoOutput should be added to the stock" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
protected
  Reservoir reservoir[n](initialValue = initialValue, maxValue = maxValue, minValue = minValue, each hasStockInfoOutput = hasStockInfoOutput, each useAssert = useAssert, each causeError = causeError) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.Cloud cloud if not hasFlowPort annotation(Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(stockPort, reservoir[1].stockPort) annotation(Line(visible = true, origin = {-79.103, 0}, points = {{-69.103, 0}, {69.103, 0}}, color = {128, 0, 128}));
  // connect the outflow from reservoir i to the stock port (inflow) of reservoir i+1
  for i in 1:n - 1 loop
    connect(reservoir[i].flowPort, reservoir[i + 1].stockPort);
  end for;
  // connect the outflow from the last reservoir to the flow port of the chain
  connect(reservoir[end].flowPort, flowPort) annotation(Line(visible = true, origin = {79.026, 0}, points = {{-69.026, 0}, {69.026, 0}}, color = {128, 0, 128}));
  connect(reservoir[end].flowPort, cloud.massPort) "alternative end of chain" annotation(Line(visible = true, origin = {41.14, -10}, points = {{-31.14, 10}, {6.14, 10}, {6.14, -10}, {18.86, -10}}, color = {128, 0, 128}));
  connect(u, reservoir.u) annotation(Line(visible = true, origin = {-51.667, 30}, points = {{-93.333, 10}, {46.667, 10}, {46.667, -20}}, color = {0, 0, 127}));
  connect(reservoir.y, y) annotation(Line(visible = true, origin = {53.333, 30.133}, points = {{-48.333, -19.733}, {-48.333, 9.867}, {96.667, 9.867}}, color = {1, 37, 163}));
  connect(reservoir.y_stockInfo, y_stockInfo) annotation(Line(visible = true, origin = {73.2, -21.92}, points = {{-65.2, 32.32}, {-65.2, 41.92}, {26.8, 41.92}, {26.8, -58.08}, {76.8, -58.08}}, color = {128, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>A <em>chain</em> (aka <em>cascade</em>) consists of a series of →<a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Transceivers.Reservoir\">reservoirs</a> that are connected in a sequence. Depending upon the Boolean parameter <code>hasFlowPort</code> the component will either end in a →<a href=\"modelica://BusinessSimulation.SourcesOrSinks.Cloud\">Cloud</a> or in a →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>.</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {0, -20.02}, textColor = {128, 128, 128}, extent = {{-38.625, -5.02}, {38.625, 5.02}}, textString = "array of reservoirs in a chain", fontSize = 16)}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-34.16, -0.234}, points = {{0, 0}, {28.109, 0}}, color = {0, 128, 0}, thickness = 5), Rectangle(visible = true, origin = {-44.948, 0}, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-10, -10}, {10, 10}}), Ellipse(visible = true, origin = {-20.022, 0}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}}), Polygon(visible = true, origin = {-5.547, -0.275}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Text(visible = true, origin = {0, 75}, textColor = {76, 112, 136}, extent = {{-100, -12}, {100, 12}}, textString = "Chain", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, origin = {21.84, -0.234}, points = {{0, 0}, {28.109, 0}}, color = {0, 128, 0}, thickness = 5), Ellipse(visible = true, origin = {35.978, 0}, lineColor = {0, 128, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-4.138, -4.138}, {4.138, 4.138}}), Rectangle(visible = true, origin = {11.052, 0}, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-10, -10}, {10, 10}}), Polygon(visible = true, origin = {50.453, -0.275}, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-2.773, 3.823}, {-2.773, -3.863}, {5.547, 0.041}}), Text(visible = true, origin = {0, -70}, extent = {{-97.365, -6}, {97.365, 6}}, textString = "n = %n", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end Chain;
