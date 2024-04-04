within BusinessSimulation.UsersGuide.ReleaseNotes;

final class Version_2_2_0 "Version 2.2.0 (2024-03-04)"
  extends Modelica.Icons.ReleaseNotes;
  extends Icons.DocumentationInfo;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This build has been tested and adapted for compatibility with Open Modelica <code>v1.23.0-dev-416-g0f1ee9aef5 (64-bit)</code> (Nightly Build as of April 3, 2024) and will run smoothly in <code>v1.23.0</code>, once it has been released.</p>
<p>Some <strong>errors were fixed in the following classes</strong>:</p>
<br>
<ul>
<li><code>Examples.SimpleProductionChainIII</code></li><br>
<li><code>Converters.Power</code></li><br>
<li><code>MoleculesOfStructure.Incubators.Collector</code>.</li><br>
<li><code>Converters.DiscreteDelay.DelayInformation</li><br>
</ul>
<p>This release <strong>adds the following classes</strong>:</p>
<br>
<ul>
<li>Icons.DocumentationInfo</li><br>
<li>Units.DataCapacity</li><br>
<li>Units.DataTransferRate</li><br>
<li>Units.LaborGrowthRate</li><br>
<li>Units.MonetaryFlow</li><br>
<li>Units.MonetaryFlow_CNY</li><br>
<li>Units.MonetaryFlow_EUR</li><br>
<li>Units.MonetaryFlow_GBP</li><br>
<li>Units.MonetaryFlow_JPY</li><br>
<li>Units.MonetaryFlow_USD</li><br>
<li>Units.Money_CNY</li><br>
<li>Units.PositiveRatio</li><br>
</ul>
<p>The following <strong>modifications</strong> were made:</p>
<br>
<ul>
<li>The library is now compatible with the <code>Modelica Standard Library (MSL) 4.0</code>, which required that the references within some classes had to be adapted.</li><br>
<li>The sensor <code>DynamicStockInfo</code> has been simplified as for dynamic stocks the inflow and outflow charateristics of the ports are binding</li><br>
<li>Slight code improvements were made to functions in the <code>Functions</code> package for better performance.</li><br>
<li>The function <code>stringToTimeBase</code> now reflects the changes in the units setup for the library.</li><br>
<li>Extensive revisions to the <a href = \"modelica://BusinessSimulation.Units\"><code>Units</code></a> package to streamline the use of <code>quantity</code>, <code>unit</code>, and <code>displayUnit</code> attributes with the new unit framework in Wolfram System Modeler 14. The <a href=\"modelica://BusinessSimulation.UsersGuide.Tutorial.UnitsInBusinessSimulations\">tutorial on the use of units</a> has been completely rewritten and should be consulted as a first step to make yourself familiar with the changes.</li><br>
<li>The display unit <code>\"yr\"</code>—available in Wolfram System Modeler—is deprecated in favor of the custom derived unit <a href = \"modelica://BusinessSimulation.Units.Time_years\"><code>\"yrCal\"</code></a>,which will display as <code>y</code>, based on the average Gregorian calendar year. The definitions for <a href=\"modelica://BusinessSimulation.Units.Time_months\"><code>mo</code></a> and <a href=\"modelica://BusinessSimulation.Units.Time_quarters\"><code>qtr</code></a> have been adapted to this change.</li><br>
<li>Some icons have been updated.</li><br>
<li>Example models have been adapted for a better user experience in Open Modelica and other tools that do not support non-SI units of time and editing of top level parameters.</li><br>
</ul>
<p><strong>Known issues</strong>:
<br>
<ul>
<li>In System Modeler 14.0.0 and Wolfram Language 14.0.0, the class <code>Flows.Interaction.ComplexInteraction</code> will currently not work properly and may in certain conditions cause loss of connection to the kernel. Accordingly, the class and classes using it, e.g., <code>Flows.Interaction.LotkaVolterra</code> and <code>Examples.LotkaVolterraSystems</code>, should not be used with these versions.</li><br>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10})));
end Version_2_2_0;
