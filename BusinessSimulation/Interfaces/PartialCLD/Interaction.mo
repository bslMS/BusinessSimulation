within BusinessSimulation.Interfaces.PartialCLD;

partial model Interaction "Partial interaction for causal loop diagramming"
  Connectors.FlowPort portA annotation(Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.FlowPort portB annotation(Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.RealInput u if hasFactor "Factor input" annotation(Placement(visible = true, transformation(origin = {-145, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  replaceable type OutputType_A = Rate constrainedby Rate "Type choice for Rate A" annotation(choicesAllMatching = true);
  replaceable type OutputType_B = Rate constrainedby Rate "Type choice for Rate B" annotation(choicesAllMatching = true);
  parameter String polA = "±" "Polarity portA" annotation(choices(choice = "+", choice = "–", choice = "±"));
  parameter String polB = "±" "Polarity portB" annotation(choices(choice = "+", choice = "–", choice = "±"));
  parameter Boolean hasFactor = false "= true, if coefficients are to be multiplied with input u" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean hasRateOutput = false "= true, if the rate is reported via real output connectors" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  ATypeConnectors.RealOutput y_A if hasRateOutput "Output of current rate of flow for port A" annotation(Placement(visible = true, transformation(origin = {-162.562, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  BTypeConnectors.RealOutput y_B if hasRateOutput "Output of current rate of flow for port B" annotation(Placement(visible = true, transformation(origin = {161.921, 40}, extent = {{10, -10}, {-10, 10}}, rotation = -180), iconTransformation(origin = {80, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
protected
  Connectors.RealOutput one = 1.0 if not hasFactor "Default factor" annotation(Placement(visible = true, transformation(origin = {-135, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -720), iconTransformation(origin = {-42, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  package ATypeConnectors = Interfaces.Connectors.FlexTypeSignals(redeclare type BaseType = OutputType_A);
  package BTypeConnectors = Interfaces.Connectors.FlexTypeSignals(redeclare type BaseType = OutputType_B);
  annotation(Documentation(revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>", info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial class with two flow ports to model <em>interaction</em> flows.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {38.72, 0}, rotation = -90, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{-10, -7.744}, {10, -7.744}, {0, 1.28}}), Polygon(visible = true, origin = {-38.72, 0}, rotation = 90, lineColor = {0, 128, 0}, fillColor = {0, 128, 0}, fillPattern = FillPattern.Solid, points = {{10, -7.744}, {-10, -7.744}, {0, 1.28}}), Line(visible = true, origin = {-15, 0}, points = {{-20, 0}, {10, 0}, {10, 0}}, color = {0, 128, 0}, thickness = 1), Line(visible = true, origin = {25, 0}, points = {{-20, 0}, {10, 0}, {10, 0}}, color = {0, 128, 0}, thickness = 1), Text(visible = true, origin = {0, 2}, textColor = {0, 128, 0}, extent = {{-20, -12}, {20, 12}}, textString = "|", fontName = "Lato"), Text(visible = true, origin = {-30, 30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%polA", fontName = "Lato"), Text(visible = true, origin = {31.15, -30}, textColor = {0, 0, 128}, extent = {{-45, -6}, {45, 6}}, textString = "%polB", fontName = "Lato")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Interaction;
