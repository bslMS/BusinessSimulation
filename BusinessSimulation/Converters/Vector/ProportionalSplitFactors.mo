within BusinessSimulation.Converters.Vector;

block ProportionalSplitFactors "Convert a vector of weights to a vector of fractions adding to one"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.*;
  extends Interfaces.PartialConverters.MIMO_nin(redeclare replaceable type OutputType = Fraction);
  parameter Boolean shiftInputs = true "= true, if all values are to be shifted to prevent negative inputs, otherwise negative inputs are simply set to zero";
protected
  Real shift = if shiftInputs then min(0., min(u)) else 0. "The lowest negative weight or zero";
  Real u_adj[nin] = if shiftInputs then u .- shift else Functions.clip(u, {0., inf}) "All weights are shifted or clipped, so that no weight is below zero";
  Real totalWeight = sum(u_adj) "Sum over adjusted weights";
equation
  // assume uniform split if weights add up to zero
  y = if totalWeight > 0 then u_adj / totalWeight else fill(1 / nin, nin);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Given a vector <strong>u<em>&nbsp;</em></strong>of weights, the converter will give an output vector <strong>y</strong> of fractions so that:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/ProportionalSplitFactors/Formula.svg\" alt=\"y_i = u_i/sum(u_i)\"></p>
<p>If the weights do add up to zero equal proportions are assumed:</p>
<p><img src=\"modelica://BusinessSimulation/Resources/Images/Converters/Vector/ProportionalSplitFactors/Formula2.svg\" alt=\"y_i = 1/nin\"></p>
<h4>Notes</h4>
<ul>
<li>The weights are <em>shifted</em> (<code>shiftInputs = true</code>) or <em>clipped</em> (<code>shiftInputs = false</code>), so that no weight will be less than&nbsp;zero.</li><br>
<li>The sum of the output vector components will always add up to one, i.e., the L1 Norm of <strong>y</strong> is one.</li><br>
<li>A typical usecase is the allocation of some resource to a demand where we have to guarantee, that no more than is available will be allocated.</li>
</ul></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-0.699, 21}, textColor = {0, 0, 128}, extent = {{-20.133, -12}, {20.133, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-13.119, -22}, textColor = {0, 0, 128}, extent = {{-22.881, -24}, {22.881, 24}}, textString = "∑", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {8.009, 13}, textColor = {0, 0, 128}, extent = {{-6.991, -6}, {6.991, 6}}, textString = "i", fontName = "Lato", textStyle = {TextStyle.Bold}), Line(visible = true, rotation = -45, points = {{20, 20}, {-20, -20}}, color = {0, 0, 128}, thickness = 4), Text(visible = true, origin = {12.301, -27}, textColor = {0, 0, 128}, extent = {{-20.133, -12}, {20.133, 12}}, textString = "u", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {21.009, -35}, textColor = {0, 0, 128}, extent = {{-6.991, -6}, {6.991, 6}}, textString = "i", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ProportionalSplitFactors;
