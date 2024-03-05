within BusinessSimulation.UsersGuide.ReleaseNotes;

final class Version_2_0_0 "Version 2.0.0 (2021-12-06)"
  extends Modelica.Icons.ReleaseNotes;
  extends Icons.DocumentationInfo;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Some <strong>errors were fixed</strong>:</p>
<ul>
<li>As reported by @dietmarw there was a variability mismatch with regard to setting the `Boolean` flags for flows should now be fixed.</li><br>
</ul>
<p>This release <strong>adds the following classes</strong>:</p>
<ul>
<li>The package <a href = \"modelica://BusinessSimulation.CausalLoop\">CausalLoop</a> supports fast building of quantitative models from a qualitative causal loop structure.</li><br>
<li><a href = \"modelica://BusinessSimulation.MoleculesOfStructure.Policy.Allocation\">Allocation</a> allows to allocate an amount to a number of recipients according to their <em>attractiveness (i.e., priority)</em> and their maximum <em>capacity</em>.</li><br>
<li><a href = \"modelica://BusinessSimulation.Converters.SoftMax\">SoftMax</a> and <a href = \"modelica://BusinessSimulation.Converters.SoftMin\">SoftMin</a>.</li><br>
<li>
<a href = \"modelica://BusinessSimulation.Interfaces.Connectors.IntegerInput\">IntegerInput</a>, 
<a href = \"modelica://BusinessSimulation.Interfaces.Connectors.IntegerOutput\">IntegerOutput</a>,
<a href = \"modelica://BusinessSimulation.Interfaces.Connectors.IntegerMultiInput\">IntegerMultiInput</a>, and
<a href = \"modelica://BusinessSimulation.Interfaces.Connectors.IntegerMultiOutput\">IntegerMultiOutput</a> (corresponding icons were added as well →<a href = \"modelica://BusinessSimulation.Icons\">Icons</a>)
</li><br>
<li>The <code>partial package</code> <a href = \"modelica://BusinessSimulation.Interfaces.Connectors.FlexTypeSignals\">FlexTypeSignals</a> allows to provide input and output connectors of <code>replaceable type BaseType</code>.</li><br>
<li>The converter <a href = \"modelica://BusinessSimulation.Converters.Disruption\">Disruption</a> can be used to model an exogenous effect upon a flow of information.</li><br>
<li>The converters <a href = \"modelica://BusinessSimulation.Converters.PolynomialFunctionFactor\">PolynomialFunctionFactor</a> and <a href = \"modelica://BusinessSimulation.Converters.PolynomialFunctionDivisor\">PolynomialFunctionDivisor</a> make it easy, to do <em>gross to net</em> and <em>net to gross</em> calculations.</li><br>
<li>The type <code>AmountRate(unit = \"each/s\")</code> was added to enable convenient custom unit conversions for fractional rates (e.g., use <code>displayUnit = \"million/wk\"</code>).</li><br>
<li>There is a package <a href = \"modelica://BusinessSimulation.Interfaces.PartialSubsystems\">PartialSubsystems</a> with partial classes to more conveniently build <em>subsystems</em>.</li><br>
<li>Some package icons have been added to →<a href = \"modelica://BusinessSimulation.Icons\">Icons</a>.</li><br>
</ul>
<p>The following <strong>modifications</strong> were made:</p>
<ul>
<li><em>Lookup functions</em> now allow optional conversion of times and rates, so that they may be formulated more conveniently.</li><br>
<li>Where reasonable <code>smooth()</code> has been made use of to allow tools to decide upon event generation; also <code>noEvent()</code> usage has been made optional upon the structural parameter <code>strict</code> in event generating expressions.</li><br>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10})));
end Version_2_0_0;
