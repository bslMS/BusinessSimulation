within BusinessSimulation.UsersGuide.Tutorial;

final class UnitsInBusinessSimulations "How to make use of the unit framework"
  extends Icons.Info;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<h4>Units in Business Simulations</h4>
<p>Units and unit checking are central to most modelers in System Dynamics and there are good reasons for this:  It is all too easy to come up with nonsensical equations and mixing \"apples and oranges\". Modelica as a <em>cyber-physical modeling language</em> clearly encourages modelers to make use of its rather elaborate unit framework that provides the attributes <code>quantity, unit</code>, and <code>displayUnit</code> for any real valued variable in models:</p>
<ul>
<li><code>quantity</code> tells us about what a measurement <em>means</em>: The same unit (say <code>N.m</code>) may be used for <em>energy</em> as well as for <em>torque</em>—so the quantity is important and the method of measurement will also be similar for identical quantities.</li><br>
<li><code>unit</code> tells us how to compare values obtained in measurements for identical quantities: 10 <code>g</code> are simply a different magnitude than 10 <code>kg</code>.</li><br>
<li><code>displayUnit</code> finally solves the issue of using a <em>standard unit</em> (typically SI-units), while allowing <em>compatible</em> units for value input and output. SystemModeler allows to enter custom unit conversions in the <code>Preferences>Global</code> menu.</li>
</ul>
<p>While the rigor of physical models cannot be fully transfered to modeling in the social sciences and ecology, there is maybe some middle ground:</p>
<ul>
<li>We realize, that <em>meaning and measurement procedures</em> (e.g., quantity) are very important and here we might strive for a bit of pragmatism, e.g., Forrester [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">2</a>] just distinguished <em>personnel, material, money, capital equipment, orders, and information</em>.</li><br>
<li>While we may have <code>types</code> with a fixed (e.g., <code>final</code>) unit, there are too many possibilities and preferences in social science modeling. Ultimately, for most non-SI units the ultimate choice of unit resides with the modeler.</li><br>
<li>Nevertheless, <strong>we should make use of <code>displayUnit</code> whenever possible, as using a standard or <em>canonical unit</em> for internal calculations avoids ambiguity and errors.</strong> We should, after all, remember that larger models are typically build in separate chunks by different teams and that—by using the functional mockup interface standard—models from different sources may be combined.</li>
</ul>
<h4>Units in the Business Simulation Library</h4>
<p>Currently, units are not used for <em>acausal</em> connectors, i.e., the variables <code>stock</code> and <code>rate</code> in a →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a> or in a →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a> are simply of the predefined type <code>Real</code> and <code>Units.Rate</code>, making them <em>unitless</em> and <em>dimensionless</em>, respectively.</p>
<p>Quantities and units are used for <em>information outputs</em> of components. In most elementary classes, there is a <code>replaceable type OutputType</code>, which can be conveniently set using a drop down list in SystemModeler; this behavior is also explicitly triggered using <code>annotation(choicesAllMatching = true)</code>. In general, the default will be one of the following types: <code>Units.Unspecified, Units.Rate</code>, or <code>Units.Time</code>.</p>
<p>Essentially, a modeler may simply stick with <code>Units.Unspecified</code>, which is identical to Modelica's predefined type <code>Real</code>, for a stock called \"personnel\" and then use the editor to <em>modify</em> the <code>quantity</code> and <code>unit</code> attributes:</p>
<pre><span style = \"background-color : lightgray\">Unspecified<strong>(quantity = \"HumanPopulation\", unit = \"people\")</strong></span></pre>
<p>Doing so would correspond with what most dedicated System Dynamics packages allow. Nevertheless, the Business Simulation Library is designed with the following recommendations:</p>
<h5>Units of Time</h5>
<p>Modelica does not allow to change the unit for the built-in variable <code>time</code>. Accordingly, the following types all have <code>unit = \"s\"</code> and all models will run in <em>seconds</em> so that there can never be any doubt when different models are coupled:</p>
<pre>Time, Time_minutes, Time_hours, Time_days, Time_weeks, Time_months, Time_quarters, Time_years</pre>
<p>The type <code>Time_years</code>, for example, has <code>displayUnit = \"yr\"</code> and allows to conveniently enter <code>5 yr</code> in setting the →<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">ConstantConverterTime</a> <code>usefulLife</code> in the model <a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">Examples.SimpleProductionChain</a>.</p>
<p>Note, that we need to add <em>custom unit conversions</em> for the units <code>wk</code>, <code>mo</code>, <code>qtr</code>, and <code>yr</code> as shown in Figure&nbsp;1. In SystemModeler, the library will automatically add these conversions.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 1: Custom Conversions for Time</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/UnitsInBusinessSimulations/CustomConversions_Time.png\" alt=\"CustomConversions_Time.png\" width=\"400\"></td>
</tr>
</tbody>
</table>
<h5>Cybernetic Units</h5>
<p>In cybernetics or control, <em>units</em> and even <em>quantities</em> will not matter, e.g., controllers are often designed to operate using dimensionless variables.</p>
<h6>Information-related Types</h6>
<p>All cybernetic types can be seen as extensions of the basic quantity <code>Information</code></em>. While <code>Information</code> has <code>unit = \"1\"</code>, making it <em>dimensionless</em>, this choice of unit is not <code>final</code> and can be modified.</p>
<pre>
  type Information = Unspecified(quantity = \"Information\", unit = \"1\");
  type Fraction = Information(min = -1, max = 1);
  type Dimensionless = Information(final unit = \"1\");
  type Ratio = Dimensionless(final min = 0);
  type Probability = Dimensionless(final min = 0, final max = 1);
</pre>
<br>
<h5>Extensive Quantities (Physical Properties I)</h5>
<p>In the physical world, quantities and units are important. In the library, <em>extensive quantities</em> are distinguished from <em>intensive quantities</em>. Extensive properties of a system vary with the <em>size</em> of the system and all of these quantities are typically collected in <em>stocks</em> (conserved quantities).</p>
<h6>Amounts—Counting Entities</h6>
<p>In a model of chemical reactions we will not find <code>unit = \"H2O\"</code> or other <em>molecule names</em>—which could be seen as the analogy to what is common practice in System Dynamics. It may not seem totally implausible to approach modeling in the social sciences a bit like a chemist and use <em>counting</em> units for some <em>amount</em> of similar entities contained in stocks, whose <em>instance name</em> very likely will reflect what is counted or measured. As the compatible units for <code>type Amount</code> below show, we may even include a chemist's <code>mol</code>:</p>
<pre>
  type Amount = ExtensiveQuantity(quantity = \"Amount\", unit = \"each\");
</pre>
<p>Using the custom unit conversions shown in Figure&nbsp;3 we can use <code>displayUnit</code> have large values be shown as <code>2 million</code> or enter small values as <code>2.5 percent</code>. The resulting value will always be a <em>pure number</em> since <code>1&nbsp;each&nbsp;=&nbsp;1</code>.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 3: Custom Conversions for Amount</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/UnitsInBusinessSimulations/CustomConversions_Amount.png\" alt=\"CustomConversions_Amount.png\" width=\"400\"></td>
</tr>
</tbody>
</table>
<h6>Monetary Value</h6>
<p>Value in economic models may be either expressed as (dimensionless) <em>utility</em> or in <em>monetary</em> terms. For the latter, the following <code>types</code> are defined in the <code>Units</code> package:
<pre>
  type Money = Amount(final quantity = \"Money\", unit = \"CU\");
  type Money_USD = Money(final unit = \"USD\");
  type Money_EUR = Money(final unit = \"EUR\");
  type Money_JPY = Money(final unit = \"JPY\");
  type Money_GBP = Money(final unit = \"GBP\");
</pre>
<br>
<h6>Ecological and Economical Quantities</h6>
<p>Even though, we may exclusively use counting units (see <code>Amount</code> above), it seems reasonable to distinguish some essential quantites and their interconnected networks of stocks and flows—similar to the way Forrester did, as mentioned before. In economic and ecological models, the following definitions may suffice for a lot of use cases:</p>
<pre> 
  type Population = Amount(quantity = \"Population\");
  type People = Population;
  type Labor = Amount(quantity = \"Labor\", unit = \"FTE\");
  type TangibleAssets = Amount(quantity = \"TangibleAssets\");
  type Material = TangibleAssets(quantity = \"Material\");
  type Goods = Material;
  type IntangibleAssets = Amount(quantity = \"IntangibleAssets\");
  type Orders = IntangibelAssets(quantity = \"Orders\");
  type UnitScaleIntangibles = IntangibleAssets(min = 0.0, max = 1.0, displayUnit = \"percent\");
</pre>
<br>
<h6>Conserved Physical Quantities</h6>
<p>In times of climate change and other global sustainability issues, the need to combine <em>ecological</em> and <em>economical</em> thinking has led to the realization that humanity and its economic system are tightly embedded within a biological and physical environment. Therefore  <em>physical</em> stocks and their in- and outflows have to be accounted for properly [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">21</a>]. It thus seems appropriate to at least introduce some important conserved physical quantities:</p>
<pre>
  type AmountOfSubstance = ExtensiveQuantity(final quantity = \"AmountOfSubstance\", final unit = \"mol\");
  type Volume = ExtensiveQuantity(final quantity = \"Volume\", final unit = \"m3\");
  type Length = ExtensiveQuantity(final quantity = \"Length\", final unit = \"m\");
  type Area = ExtensiveQuantity(final quantity = \"Area\", final unit = \"m2\");
  type Mass = ExtensiveQuantity(final quantity = \"Mass\", final unit = \"kg\");
  type Energy = ExtensiveQuantity(final quantity = \"Energy\", final unit = \"J\");
  type ElectricCharge = ExtensiveQuantity(final quantity = \"ElectricCharge, final unit = \"C\");
  type Entropy = ExtensiveQuantity(final quantity = \"Entropy\", final unit = \"J/K\");
  type Momentum = ExtensiveQuantity(final quantity = \"Momentum\", final unit = \"kg.m/s\");
  type AngularMomentum = ExtensiveQuantity(final quantity = \"AngularMomentum\", final unit = \"kg.m2/s\");
</pre>
<br>
<h5>Intensive Quantities (Physical Properties II)</h5>
<p>Contrary to extensive quantities, intensive properties of a system do not change with its size. A typical example is temperature. After dividing a certain volume of hot liquid into two identical ones, the amount of <em>entropy</em> in each half will be half that contained in the former volume, while the temperature—neglecting the cooling during the process—will have remained identical for both volumes. The library contains the following intensive quantities:</p>
<pre>
  type Density = IntensiveQuantity(final quantity = \"Density\", final unit = \"kg/m3\", displayUnit = \"g/cm3\", min = 0.0);
  type Angle = IntensiveQuantity(final quantity = \"Angle\", final unit = \"rad\", displayUnit = \"deg\");
  type Temperature = IntensiveQuantity(final quantity = \"ThermodynamicTemperature\", final unit = \"K\", start = 288.15, nominal = 300, min = 0.0, displayUnit = \"degC\");
  type TemperatureDifference = IntensiveQuantity(final quantity = \"ThermodynamicTemperature\", final unit = \"K\", displayUnit = \"degC\") annotation(absoluteValue = false);
</pre>
<br>
<h6>Rates</h6>
<p>In system dynamics, the most important intensive quantities certainly are <em>rates of flow</em>. Unlike <code>time</code>, the use of <code>displayUnit</code>—with its convenient unit conversions—is much harder to establish for arbitrary rates: We would need to have lots of unit conversions say one for <code>million FTE/yr</code> and another one for <code>million EUR/yr</code>.</p>
<p>Given that we are most of the time simply <em>counting</em> some entities, it should suffice to enter <em>dimensionless rates</em> (→<a href=\"modelica://BusinessSimulation.Units.Rate\">Units.Rate</a>) as we then only need to add custom unit conversions for for the following time reciprocals in SystemModeler: <code>1/wk, 1/mo, 1/qtr, 1/yr</code> (the ones for <code>1/min, 1/h, 1/d</code> are available by default). The unit conversions for these dimensionless rates are shown in Figure&nbsp;2.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 2: Custom Conversions for Rate</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/UnitsInBusinessSimulations/CustomConversions_Rate.png\" alt=\"CustomConversions_Rate.png\" width=\"400\"></td>
</tr>
</tbody>
</table>
<p>In the example <a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">Examples.SimpleProductionChain</a> we can set the <code>productionRate</code> in the ConstantConverter by leaving <code>ValueType = Unspecified</code> (default) and using <code>timeBaseString</code> to select \"month\", so that <code>value = 100</code> is then correctly shown as a dimensionless rate of <code>100 per month</code>. Remember, that the value used in any internal calculation will be the corresponding rate <em>per second</em>.</p>
<p>Next to dimensionless rates we can also work with <code>AmountRate</code> and correct rates for elementary physical flows, e.g., <code>VolumeFlowRate, MassFlowRate, EnergyFlowRate, MomentumFlowRate, AngularMomentumFlowRate, Velocity, EntropyFlowRate, ElectricCurrent</code>, which are defined as follows:</p>
<pre>
  type Rate = IntensiveQuantities(quantity = \"Rate\", unit = \"1/s\") \"Dimensionless rate of flow\";
  type AmountRate = Rate(quantity = \"AmountRate\", unit = \"each/s\"); 
  type VolumeFlowRate = Rate(final quantity = \"VolumeFlowRate\", final unit = \"m3/s\");
  type MassFlowRate = Rate(final quantity = \"MassFlowRate\", final unit = \"kg/s\");
  type EnergyFlowRate = Rate(final quantity = \"Power\", final unit = \"W\");
  type MomentumFlowRate = Rate(final quantity = \"MomentumFlowRate\", final unit = \"kg.m/s2\");
  type AngularMomentumFlowRate = Rate(final quantity = \"AngularMomentumFlowRate\", final unit = \"kg.m2/s2\");
  type Velocity = Rate(final quantity = \"Velocity\", final unit = \"m/s\");
  type EntropyFlowRate = Rate(final quantity = \"EntropyFlowRate\", final unit = \"J/(K.s)\");
  type ElectricCurrent = Rate(final quantity = \"ElectricCurrent\", final unit = \"A\");	
</pre> 
<br>
<p>Refer to the documentation for <a href=\"modelica://BusinessSimulation.Converters.ConstantConverterRate\">ConstantConverterRate</a> for more detail.</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>", revisions = "<html>
<ul>
<li>Changes in unit hierarchy and type definitions in v2.1.0.</li>
</ul> 
</html>"));
end UnitsInBusinessSimulations;
