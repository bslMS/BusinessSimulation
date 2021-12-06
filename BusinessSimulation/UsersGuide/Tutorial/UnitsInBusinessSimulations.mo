within BusinessSimulation.UsersGuide.Tutorial;

final class UnitsInBusinessSimulations "How to make use of the unit framework"
  extends Icons.Info;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<h4>Units in Business Simulations</h4>
<p>Units and unit checking are central to most modelers in System Dynamics and there are good reasons for this:  It is all too easy to come up with nonsensical equations and mixing \"apples and oranges\". Modelica as a <em>cyber-physical modeling language</em> clearly encourages modelers to make use of its rather elaborate unit framework that provides the attributes <code>quantity, unit</code>, and <code>displayUnit</code> for any real valued variable in models:</p>
<ul>
<li><code>quantity</code> tells us about what a measurement <em>means</em>: The same unit (say <code>N.m</code>) may be used for <em>energy</em> as well as for <em>torque</em>—so the quantity is very important.</li><br>
<li><code>unit</code> tells us how to compare values obtained in measurements for identical quantities: 10 <code>g</code> are simply a different magnitude than 10 <code>kg</code>.</li><br>
<li><code>displayUnit</code> finally solves the issue of using a <em>standard unit</em> (typically SI-units), while allowing <em>compatible</em> units for value input and output.</li>
</ul>
<p>While the rigor of physical models cannot be fully transfered to modeling in the social sciences and ecology, there is maybe some middle ground:</p>
<ul>
<li>We realize, that <em>meaning</em> (e.g., quantity) is very important and here we might strive for a bit of pragmatism, e.g., Forrester [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">2</a>] just distinguished <em>personnel, material, money, capital equipment, orders, and information</em>.</li><br>
<li>While we may have <code>types</code> with a fixed (e.g., <code>final</code>) unit, there are too many possibilities and preferences in social science modeling, so we may often leave the choice of unit to the modeler.</li><br>
<li>Nevertheless, we would like to make use of <code>displayUnit</code> whenever possible, as using a standard unit for calculations, while compatible units can be used for input and output, takes care of a significant source of error. SystemModeler allows to enter custom unit converions in the <code>Tools>Options</code> menu.</li>
</ul>
<h4>Units in the Business Simulation Library</h4>
<p>Currently, units are not used for <em>acausal</em> connectors, i.e., the <em>stock</em> and the <em>rate</em> in a →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a> or in a →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a> are simply of the predefined type <code>Real</code> with <code>quantity = \"\"</code> and <code>unit = \"1\"</code>, making them <em>dimensionless</em>.</p>
<p>Quantities and units are used for the <em>information outputs</em> of components. In most elementary classes there is a <code>replaceable type OutputType</code> which can be conveniently set using a drop down list in SystemModeler. In general, the default will be one of the following types: <code>Types.Reals, Units.Rate</code>, or <code>Units.Time</code>.</p>
<p>A modeler may simply stick with say <code>Types.Reals</code>, which is identical to Modelica's predefined type <code>Real</code>, for a stock called \"personnel\" and then use the editor to <em>modify</em> the <code>quantity</code> and <code>unit</code> attributes:</p>
<pre><span style = \"background-color : lightgray\">Types.Reals<strong>(quantity = \"HumanPopulation\", unit = \"people\")</strong></span></pre>
<p>Doing so would correspond with what most dedicated System Dynamics packages allow. Nevertheless, the Business Simulation Library is designed with the following recommendations:</p>
<h5>Units of Time</h5>
<p>Modelica does not allow to change the unit for the built-in variable <code>time</code>. Accordingly, the following types all have <code>unit = \"s\"</code> and all models will run in <em>seconds</em> so that there can never be any doubt when different models are coupled:</p>
<pre>Time, Time_minutes, Time_hours, Time_days, Time_weeks, Time_months, Time_quarters, Time_years</pre>
<p>The type <code>Time_years</code>, for example, has <code>displayUnit = \"yr\"</code> and allows to conveniently enter <code>5 yr</code> in setting the →<a href=\"modelica://BusinessSimulation.Converters.ConstantConverterTime\">ConstantConverterTime</a> <code>usefulLife</code> in the model <a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">Examples.SimpleProductionChain</a>.</p>
<p>Note, that we need to add <em>custom unit conversions</em> for the units <code>wk, mo, qtr, yr</code> as shown in Figure&nbsp;1—but we only need to do this once.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 1: Custom Conversions for Time</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/UnitsInBusinessSimulations/CustomConversions_Time.png\" alt=\"CustomConversions_Time.png\" width=\"400\"></td>
</tr>
</tbody>
</table>
<h5>Setting Rates</h5>
<p>Using <code>displayUnit</code> for time is very convenient—unfortunately this flexibility is harder to transfer to entering rates: We would need to have lots of unit conversions say one for <code>people/yr</code> and another one for <code>EUR/yr</code>.</p>
<p>Given that we are most of the time simply <em>counting</em> some entities (like a chemist is counting different molecules) it should suffice to enter <em>fractional rates</em> (→<a href=\"modelica://BusinessSimulation.Units.Rate\">Units.Rate</a>). Then we only need to add custom unit conversions for <code>1/wk, 1/mo, 1/qtr, 1/yr</code> in SystemModeler as shown in Figure&nbsp;2.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 2: Custom Conversions for Rate</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/UnitsInBusinessSimulations/CustomConversions_Rate.png\" alt=\"CustomConversions_Rate.png\" width=\"400\"></td>
</tr>
</tbody>
</table>
<p>In the example <a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\">Examples.SimpleProductionChain</a> we can set the <code>productionRate</code> in the ConstantConverter by leaving <code>ValueType = Types.Reals</code> (default) and using <code>timeBaseString</code> to select \"month\", so that <code>value = 100</code> is then correctly shown as a fractional rate of <code>100 per month</code>. Remember, that the value used in any calculations will be the corresponding rate <em>per second</em>.</p>
<p>Next to fractional rates we can also work with correct rates for some physical flows, e.g., <code>VolumeFlowRate, MassFlowRate, EnergyFlowRate, MomentumFlowRate, AngularMomentumFlowRate, Velocity</code>, which are defined as follows:</p>
<pre>
  type Rate = Types.Reals(quantity = \"Rate\", unit = \"1/s\") \"Fractional rate per unit of time\";
  type VolumeFlowRate = Rate(quantity = \"VolumeFlowRate\", unit = \"m3/s\") \"Volume flow rate measured in m3/s\";
  type MassFlowRate = Rate(quantity = \"MassFlowRate\", unit = \"kg/s\") \"Mass flow rate measured in kg/s\";
  type EnergyFlowRate = Rate(quantity = \"Power\", unit = \"W\") \"Rate of energy transfer (power) usually measured in watt (W) or joule per second (J/s)\";
  type MomentumFlowRate = Rate(quantity = \"MomentumFlowRate\", unit = \"kg.m/s2\") \"Momentum flow rate (aka force) measured in kg.m/s2\";
  type AngularMomentumFlowRate = Rate(quantity = \"AngularMomentumFlowRate\", unit = \"kg.m2/s2\") \"Angular momentum flow rate (aka torque) measured in kg.m2/s2\";
  type Velocity = Rate(quantity = \"Velocity\", unit = \"m/s\") \"Velocity given in m/s\";
</pre> 
<p>Refer to the documentation for <a href=\"modelica://BusinessSimulation.Converters.ConstantConverterRate\">ConstantConverterRate</a> for more detail.</p>
<h5>Other Units</h5>
<p>Next to rates and times we will need appropriate units for entities accounted for in stocks and information processing in general. In the Business Simulation Library the available <code>types</code>, which all <code>extend Types.Reals</code>, can be grouped as follows:</p>
<h6>Information-related Types</h6>
<p>Strictly speaking, everything in a model might be considered <em>information</em> and thus the following definitions seem rather evident:
<pre>
  type Information = Types.Reals(quantity = \"Information\") \"Information that may have an arbitrary unit (base unit = '1')\";
  type Fraction = Information(min = 0, max = 1) \"Information given as a fraction between zero and one\";
  type Dimensionless = Information(unit = \"1\") \"Information that is dimensionless (e.g., utility)\";
  type Probability = Dimensionless(min = 0, max = 1) \"Probability between zero and one\";
</pre>
<br>
<h6>Counting Units</h6>
<p>In a model of chemical reactions we will not find <code>unit = \"H2O\"</code> or other <em>molecules</em>—which could be seen as the analogy to what is common practice in System Dynamics counting <em>amounts of similar entities</em>. So, it may not seem totally implausible to somewhat approach modeling in the social sciences a bit like a chemist and use <em>counting</em> units for some <em>amount</em> of similar entities contained in stocks whose <em>instance name</em> very likely will reflect what is counted inside. As the definition for <code>type Amount</code> below shows, we may even include a chemist's <code>mol</code>:</p>
<pre>
  type Amount = Types.Reals(quantity = \"Amount\", unit = \"each\") \"Counting amounts of entities or substance (base unit = 'each')\";
</pre>
<p>Using the custom unit conversions shown in Figure&nbsp;3 we can use <code>displayUnit</code> have large values be shown as <code>2 million</code> or enter small values as <code>2.5 percent</code>. The resulting value will always be a <em>pure number</em> since <code>1 each = 1</code>.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 3: Custom Conversions for Amount</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/UnitsInBusinessSimulations/CustomConversions_Amount.png\" alt=\"CustomConversions_Amount.png\" width=\"400\"></td>
</tr>
</tbody>
</table>
<P>Verison 2 of the Business Simulation library introduces <code>AmountRate</code>:</p>
<pre>
type AmountRate = Rate(quantity = \"AmountRate\", unit = \"each/s\") \"Rate of flow for some amount measured in each per second\";
</pre>
<h6>Monetary Value</h6>
<p>Value in economic models may be either expressed as (dimensionless) <em>utility</em> or in <em>monetary</em> terms. For the latter, the following <code>types</code> are defined in the <code>Units</code> package:
<pre>
  type Money = Types.Reals(quantity = \"Money\", unit = \"CU\") \"Cash and other forms of financial capital accounted for in currency units [CU]\";
  type Money_USD = Money(unit = \"USD\") \"Money accounted for in USD\";
  type Money_EUR = Money(unit = \"EUR\") \"Money accounted for in EUR\";
  type Money_JPY = Money(unit = \"JPY\") \"Money accounted for in JPY\";
  type Money_GBP = Money(unit = \"GBP\") \"Money accounted for in GBP\";
</pre>
<br>
<h6>Ecological and Economical Quantities</h6>
<p>Even though, we may use counting units (see <code>Amount</code> above), it seems to make a lot of sense to distinguish some essential quantites and their interconnected networks of stocks and flows—similar to the way Forrester did, as mentioned before. In economic and ecological models, the following definitions may suffice for a lot of use cases:</p>
<pre> 
  type Population = Types.Reals(quantity = \"Population\") \"A population of individuals or organisms belonging to the same group or species\";
  type People = Population(quantity = \"HumanPopulation\") \"Some human population (#people)\";
  type Labor = Types.Reals(quantity = \"Labor\", unit = \"FTE\") \"Labor as production factor measured in FTE\";
  type TangibleAssets = Types.Reals(quantity = \"TangibleAssets\") \"Tangible assets like buildings and structure, machinery and equipment, and cultivated assets\";
  type IntangibleAssets = Types.Reals(quantity = \"IntangibleAssets\") \"Intangible assets like computerized information, R & D, economic competencies, and other innovative properties\";
  type Material = Types.Reals(quantity = \"Material\") \"Primary commodities and unprocessed material\";
  type Goods = Material \"Finished or intermediary goods\";
  type Orders = Types.Reals(quantity = \"Orders\") \"Orders are an operational stock used to model the delay between a stated need and its fulfillment\";
</pre>
<br>
<h6>Conserved Physical Quantities</h6>
<p>In times of climate change and other questions touching global sustainability the need to combine <em>ecological</em> and <em>economical</em> thinking has led to the realization that humanity and its economic system is tightly embedded in a biological and physical environment. Therefore  <em>physical</em> stocks and their in- and outflows have to be accounted for properly [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">21</a>]. It thus seems appropriate to at least introduce some important conserved physical quantities:</p>
<pre>
  type Volume = Types.Reals(quantity = \"Volume\", unit = \"m3\") \"Volume measured in m3\";
  type Mass = Types.Reals(quantity = \"Mass\", unit = \"kg\") \"Mass measured in kg\";
  type Energy = Types.Reals(quantity = \"Energy\", unit = \"J\") \"Energy measured in Joule (W.s)\";
  type Momentum = Types.Reals(quantity = \"Momentum\", unit = \"kg.m/s\") \"Momentum measured in kg.m/s\";
  type AngularMomentum = Types.Reals(quantity = \"AngularMomentum\", unit = \"kg.m2/s\") \"Angular momentum measured in kg.m2/s\";
</pre>
<br>
<h6>Other Physical Quantities</h6>
<p>Next to the physical quantites listed above, we conclude with just these additions:</p>
<pre>
  type Angle = Types.Reals(quantity = \"Angle\", unit = \"rad\", displayUnit = \"deg\") \"Angle in rad, entered and displayed in deg)\";
  type Length = Types.Reals(quantity = \"Length\", unit = \"m\") \"Length (or width/breadth, height/depth) measured in m\";
  type Area = Types.Reals(quantity = \"Area\", unit = \"m2\") \"Area measured in m2\";
</pre>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"));
end UnitsInBusinessSimulations;
