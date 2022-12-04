within BusinessSimulation.UsersGuide.ReleaseNotes;

final class Version_2_1_0 "Version 2.1.0 (2022-12-03)"
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>Some <strong>errors were fixed</strong>:</p>
<ul>
<li><code>CausalLoop.UnidirectionalFlow</code> did not use <code>rate</code> parameter.</li><br>
<li>Fixed missing connect equations for <code>Stock.oven</code> and removed conditionaliy for expandable connetor <code>dataIn</code>.</li><br>
<li><code>Functions.boole</code> documentation examples had <code>notZeroQ</code> instead of <code>boole</code>.</li><br>
<li>Class for <code>Icons.SimulationModel</code> changed from <code>partial package</code> to <code>partial model</code> to allow extensions.</li><br>
<li>Fixed some unit-related errors in the <code>Examples</code> package.</li><br>
<li>The <code>replaceable stock</code> in the <code>MoleculesOfStructure.Incubators.Collector</code> class was moved into the <code>public</code> section so that replacement-modifications are actually allowed.</li><br>
<li>Fixed some issues in the <code>Stocks.Oven</code> class.</li><br>
<li>Use of hard maximum within <code>Converters.SoftMax</code> is now fixed.</li><br>
</ul>
<p>This release <strong>adds the following classes</strong>:</p>
<ul>
<li><code>Converters.DiscreteDelay.AsymmetricSmooth</code></li><br>
<li><code>Converters.DiscreteDelay.AsymmetricSmoothN</code></li><br>
<li><code>Converters.GameInput</code></li><br>
<li><code>MoleculesOfStructure.Blocks.ExperienceCurve</code></li><br>
<li><code>Functions.areaLineSegment</code></li><br>
<li><code>Functions.bitShiftRight</code></li><br>
<li><code>Functions.hunt</code></li><br>
<li><code>Functions.interpolate</code></li><br>
<li><code>Functions.locate</code></li><br>
<li><code>Functions.normalizationConstant</code></li><br>
<li><code>Functions.normalizePLpdf</code></li><br>
<li><code>Functions.plCDF</code></li><br>
<li><code>Functions.rawInterpolate</code></li><br>
<li><code>Types.OutflowPriorities</code></li><br>
</ul>
<p>The following <strong>modifications</strong> were made:</p>
<ul>
<li>The font <code>Lato BLack</code> has been replaced by <code>Lato</code> throughout.</li><br>
<li>The <code>Units</code> package has been put in a clearer hierarchy extending from <code>Units.Unspecified</code> instead of <code>Types.Reals</code> with many additional changes.</li><br>
<li>The <code>Tutorial.UnitsInBusinessSimulation</code> has been completely revised to account for these changes.</li><br>
<li>The constants <code>unspecified</code> and <code>unspec</code> have been introduced as aliases for <code>inf</code> and <code>zero</code>, repectively. They are useful to assign values to optional parameters and then have <code>assert</code> statements catch missing user specifications, should the parameters have be \"switched on\".</li><br>
<li><code>annotation(Inline = true)</code> was added to some functions in the <code>Functions</code> package.</li><br>
<li>Simplified implementation for <code>Functions.rescaleVector</code>.</li><br>
<li>The prefix <code>partial</code> was removed for <code>Interfaces.Connectors.FlexTypeSignals</code> and the constraining type was changed to <code>Units.Unspecified</code>.</li><br>
<li><code>Icons.SimulationModel</code> with new look.</li><br>
<li>Display of <code>%initialValue</code> within the icons of stock classes now established by partial class <code>Icons.Stock</code>.</li><br>
<li>Expandable connectors, e.g., used in many <code>Interaction</code> flow classes, have now been changed to be <code>encapsulated expandable connector</code> classes as to prevent illegal lookup issues.</li><br>
<li>Inputs for <code>Converters.SoftMax</code> are now shifted before taking exponentials as to prevent numerical issues.</li><br> 
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, lineColor = {56, 56, 56}, fillColor = {246, 246, 246}, fillPattern = FillPattern.Solid, points = {{-80, -100}, {-80, 100}, {20, 100}, {20, 40}, {80, 40}, {80, -100}, {-80, -100}}), Polygon(visible = true, lineColor = {56, 56, 56}, fillColor = {230, 230, 230}, fillPattern = FillPattern.Solid, points = {{20, 100}, {80, 40}, {20, 40}, {20, 100}}), Line(visible = true, points = {{2, -12}, {50, -12}}, color = {56, 56, 56}), Line(visible = true, points = {{2, -60}, {50, -60}}, color = {56, 56, 56}), Ellipse(visible = true, origin = {-35, -60}, lineColor = {56, 56, 56}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-12.5, -12.5}, {12.5, 12.5}}), Ellipse(visible = true, origin = {-35, -12.5}, lineColor = {56, 56, 56}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-12.5, -12.5}, {12.5, 12.5}})}));
end Version_2_1_0;
