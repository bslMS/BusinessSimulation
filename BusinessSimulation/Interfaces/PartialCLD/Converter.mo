within BusinessSimulation.Interfaces.PartialCLD;

partial block Converter "Partial converter class for CLD+ modeling"
  extends Interfaces.PartialCLD.InfoAggregation(nin(min = 1));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This class can be used to build visually fitting <em>converter</em> classes for models using the <code>CausalLoop</code> package.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, origin = {-50, 0}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 4, extent = {{-30, -30}, {30, 30}}), Text(visible = true, origin = {-50, -60}, textColor = {64, 64, 64}, extent = {{-150, -12}, {150, 12}}, textString = "%name", fontName = "Lato")}));
end Converter;
