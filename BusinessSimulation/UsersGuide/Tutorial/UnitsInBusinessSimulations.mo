within BusinessSimulation.UsersGuide.Tutorial;

final class UnitsInBusinessSimulations "How to make use of the unit framework"
  extends Icons.Info;
  extends Icons.DocumentationInfo;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<h4>Understanding Units in Business Simulations</h4>
<p>In business simulations, unit consistency is crucial for model verification. Modelica, being a <em>cyber-physical modeling language</em>, offers the attributes <code>quantity</code>, <code>unit</code>, and <code>displayUnit</code> to ensure accurate unit application in your models:</p>
<ul>
<li><code>quantity</code> specifies what the measurement signifies. For instance, the unit <code>N.m</code> could represent either <em>energy</em> or <em>torque</em>. Understanding the quantity provides context and guides measurement methods.</li><br>
<li><code>unit</code> is the scale for measurement comparison. For example, comparing 10 <code>g</code> and 10 <code>kg</code> demonstrates different magnitudes, while seconds [<code>s</code>] and meters [<code>m</code>] are incompatible units.</li><br>
<li><code>displayUnit</code> allows using <em>compatible</em> units for ease of value input and output, while the internal calculations use a standard <em>base unit</em> (often SI units).</li>
</ul>
<p>While the strict SI unit adherence in physical models might not fully translate to the \"softer\" sciences, adopting a balanced approach can be beneficial:</p>
<ul>
<li>The significance of <em>meaning and measurement procedures</em> (like quantity) cannot be overstated. For instance, Forrester [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">2</a>] identified the following six main quantities <em>personnel, material, money, capital equipment, orders, and information</em>.</li><br>
<li>In social science modeling, where preferences and possibilities are numerous, modelers often have the final say in non-SI unit choices.</li><br>
<li>However, employing <code>displayUnit</code> is highly recommended for clarity and error minimization. Remember, in large-scale models developed by different teams, consistent unit use is essential for accurate integration of various model components.</li>
</ul>
   <h4>Unit Application in the Business Simulation Library</h4>
    <p>In the BSL, assigning units to a variable, like <code>x</code>, automatically applies these units to related variables (e.g., <code>y</code>) in equations such as <code>x = y</code>. This principle ensures consistency in unit determination, akin to the numerical value derivation from known values and equations. A well-constructed model will systematically derive the units of output variables from the input units, guaranteeing a coherent unit system and enhancing model reliability. An output with incorrect units is an indicator of potential equation errors.</p>
    <p>Most elementary classes in our library include a <code>replaceable type OutputType</code>. This can be set easily via a dropdown in SystemModeler, facilitating user-friendly selection of <code>displayUnit</code> or <code>unit</code> next to a predefined <code>quantity</code>. This early setup aids in quick identification and resolution of any unit discrepancies. In some components <code>OutputType</code> is also used to define parameters.</p>
    <p>Modelers might still simply opt for <code>Units.Unspecified</code>, equivalent to Modelica's <code>Real</code>, and customize the <code>quantity</code> and <code>unit</code> attributes as needed. Nevertheless, we recommend to follow some guidelines for using the Business Simulation Library effectively.</p>
<p>In the following, we will categorize predefined <code>types</code> into four separate categories: Time units, cybernetic- and information-related quantities, extensive and intensive properties of systems, and finally rates of change with regard to the before mentioned quantities.</p>
<h5>Time Units in the Library</h5>
<p>Modelica's <code>time</code> variable is unchangeable and <em>always in seconds</em>, ensuring unambiguity across different model integrations. Consequently, all time-related types in the BSL use <code>unit = \"s\"</code>.</p>
    <p>For convenient input and output, we define time units like <a href = \"modelica://BusinessSimulation.Units.Time_years\"><code>yrCal</code></a> (the mean <a href = \"https://en.wikipedia.org/wiki/Gregorian_calendar\">Gregorian calendar year</a> will display as <code>y</code> in System Modeler), <a href=\"modelica://BusinessSimulation.Units.Time_months\"><code>mo</code></a> (Gregorian month), and <a href =\"modelica://BusinessSimulation.Units.Time_quarters\"><code>qtr</code></a> (Gregorian quarter year), which will minimize deviations in long-term simulations (see Notes below). Other units of time are less ambiguous and also available, e.g., <a href=\"modelica://BusinessSimulation.Units.Time_weeks\"><code>wk</code></a> (week), <a href=\"modelica://BusinessSimulation.Units.Time_days\"><code>d</code></a> (day), <a href=\"modelica://BusinessSimulation.Units.Time_hours\"><code>h</code></a> (hour), and <a href=\"modelica://BusinessSimulation.Units.Time_minutes\"><code>min</code></a> (minutes). These exact units of time can be used, should this kind of precision really be required in a simulation.</p>
<h5>Cybernetic and Information-related Units</h5>
    <p>In <a href=\"https://www.britannica.com/science/cybernetics\">cybernetics</a>, units and quantities often become irrelevant, with many controllers using dimensionless variables—typically normalizing values so that the units in the resulting ratio cancel out. The following types can be understood in this fashion:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.Dimensionless\"><code>Dimensionless</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Ratio\"><code>Ratio</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.PositiveRatio\"><code>PositiveRatio</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Fraction\"><code>Fraction</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Probability\"><code>Probability</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Information\"><code>Information</code></a>
</ul>
<p>Modelers can adapt these types to a wide range of cybernetic and control applications. Note that only <code>Information</code> will have a non-empty quantity attribute, all other types in this section are purely numeric quantities (<code>quantity = \"\"</code>).</p>
<h5>Extensive Properties of Systems</h5>
<p>While we will be modeling at a much higher level of abstraction, it seems helpful to observe thermodynamic reasoning in making a distinction between <em>extensive quantities</em> and <em>intensive quantities</em>. Extensive properties of a system vary with its <em>size</em> and all of these quantities are typically collected in <em>stocks</em>, which earns them the label \"conserved quantities.\" In the library, we will have all conserved quantities known to physics next to some extensions all of which extend from the basic type <a href = \"modelica://BusinessSimulation.Units.ExtensiveQuantity\"><code>ExtensiveQuantity</code></a>.</p>
<h6>Conserved Physical Quantities (SI units)</h6>
<p>Humanity and its economic system are tightly embedded within a biological and physical environment. Therefore  <em>physical</em> stocks and their in- and outflows should be accounted for properly [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">21</a>]. The library follows the Modelica Standard Library in explicity accounting for these important conserved physical quantities as defined by the <a href = \"https://www.britannica.com/science/International-System-of-Units\">International System of Units</a> (SI):</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.AmountOfSubstance\"><code>AmountOfSubstance</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Volume\"><code>Volume</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Length\"><code>Length</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Area\"><code>Area</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Mass\"><code>Mass</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Energy\"><code>Energy</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Entropy\"><code>Entropy</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Momentum\"><code>Momentum</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.AngularMomentum\"><code>AngularMomentum</code></a>
</ul>
<p>Unfortunately, as far as SI is concerned everything that is \"counted\" is considered to be <em>dimensionless</em>, i.e., the base unit is simply <code>1</code>. This fails to distinguish <em>integer-valued counts</em> of elementary entities from <em>real-valued ratios</em> like <code>rad, m/m</code> etc. Following Flater's recommendations [<a href = \"modelica://BusinessSimulation.UsersGuide.References\">29</a>], we will distinguish <em>counts</em> from dimensionless <em>ratios</em> by introducing <strong>new base units</strong> for counts of elementary quantities, data capacity, labor, and monetary value.</p>
<h6>Amounts—Counting Entities</h6>
<p>In the Business Simulation library, we will take the liberty to introduce a new base unit <a href = \"wsm:/units/BusinessSimulation#each\"><code>each</code></a> for counting the number <code>N</code> of \"elementary entities, individuals, or systems.\" The type <a href = \"modelica://BusinessSimulation.Units.Amount\"><code>Amount</code></a> thus is an immediate analogue to the way a chemist uses <code>mol</code> to <em>count</em> amount of substance.</p>
<p>The base unit <code>each</code> will be represented by <code>#</code> in System Modeler to clearly distinguish a count from ratios and other dimensionless quantities. It has the following derived units: <code>pair</code>, <code>dozen(doz)</code>, <code>score</code>, <code>gross</code>, <code>ream</code>, <code>thousand(k)</code>, <code>million(M)</code>, <code>billion(B)</code>, and <code>trillion(T)</code>. Since the SI prefixes <code>k</code>, <code>M</code>, and <code>T</code> cannot be used for dimensionless quantities with unit <code>1</code>, there will be no ambiguity regarding their use as counting units.</p>
<h6>Ecological and Economical Quantities</h6>
<p>The chemist's mole is a <em>parametric</em> quantity. Unless we are told what is being counted, e.g., certain molecules, atoms or particles, the given amount is useless information. Since Modelica does not know parametric quantities, we should either use a variable's (or component's) <em>name</em> or its <code>quantity</code> attribute to clearly indicate what we are counting. In the latter case, it seems reasonable to distinguish the following essential quantites in economic and ecological models:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.Population\"><code>Population</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.People\"><code>People</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Labor\"><code>Labor</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.TangibleAssets\"><code>TangibleAssets</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Material\"><code>Material</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Goods\"><code>Goods</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.IntangibleAssets\"><code>IntangibleAssets</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Orders\"><code>Orders</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.UnitScaleIntangibles\"><code>UnitScaleIntangibles</code></a>
</ul>
<p>All of these quantities will have <code>unit = \"each\"</code> with two notable exceptions. <em>Labor</em> will be accounted for using the newly defined base unit <a href=\"wsm:/units/BusinessSimulation#FTE\"><code>FTE</code></a>, while <em>UnitScaleIntangibles</em> are a special kind of intangible assets normalized to the unit range.</p>
<h6>Data Capacity</h6>
<p>Above, we already introduced cybernetic and information-related quantities, which are essentially dimensionless. In some lose analogy, we might talk about \"weighing\" whatever information we have. This naturally leads to the new base unit <a href=\"wsm:/units/BusinessSimulation#bit\"><code>bit</code></a> and its derived unit <a href=\"wsm:/units/BusinessSimulation#byte\"><code>byte</code></a>—both of which can be used with SI prefixes to measure <a href = \"modelica://BusinessSimulation.Units.DataCapacity\"><code>DataCapacity</code></a>.<p>
<h6>Monetary Value</h6>
<p>Value in economic models may be either expressed as (dimensionless) <em>utility</em> or in <em>monetary</em> terms. For the latter, the following <code>types</code> are defined in the <code>Units</code> package:
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.Money\"><code>Money</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Money_USD\"><code>Money_USD</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Money_EUR\"><code>Money_EUR</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Money_JPY\"><code>Money_JPY</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Money_GBP\"><code>Money_GBP</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Money_CNY\"><code>Money_CNY</code></a>
</ul>
<p>All of these monetary units are defined as <em>base units</em> using three letter codes according to ISO 4217 as unit names: <a href=\"wsm:/units/BusinessSimulation#XXX\"><code>XXX</code></a>, <a href=\"wsm:/units/BusinessSimulation#USD\"><code>USD</code></a>, <a href=\"wsm:/units/BusinessSimulation#EUR\"><code>EUR</code></a>, <a href=\"wsm:/units/BusinessSimulation#GBP\"><code>GBP</code></a>, <a href=\"wsm:/units/BusinessSimulation#JPY\"><code>JPY</code></a>, <a href=\"wsm:/units/BusinessSimulation#CNY\"><code>CNY</code></a>. While all monetary units use <code>quantity = \"Money\"</code>, a modeler needs to specify how different currencies are to be exchanged—there is obviously no static conversion factor.</p>
<h5>Intensive Properties of Systems</h5>
<p>Contrary to extensive quantities, intensive properties of a system (base type: <a href = \"modelica://BusinessSimulation.Units.IntensiveQuantity\"><code>IntensiveQuantity</code></a>) do not change with its size. A typical example is temperature. After dividing a certain volume of hot liquid into two identical ones, the amount of <em>entropy</em> in each half will be half that contained in the original volume, while the temperature—neglecting the cooling during the process—will have remained identical for both volumes.</p>
<p>The library contains the following intensive (physical) quantities:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.Density\"><code>Density</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Angle\"><code>Angle</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Temperature\"><code>Temperature</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.TemperatureDifference\"><code>TemperatureDifference</code></a>
</ul>
<h5>Process Quantities</h5>
<p>With the exception of <code>time</code> we have so far talked about properties of systems—either accounted for by its states or functions thereof. To specify flows in system dynamics we need to introduce <em>process quantities</em> pertaining to processes changing the states of a system.</p>
<p>In correspondence with the main physical quantities that are conserved, the following physical flows are defined in the library:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.VolumeFlowRate\"><code>VolumeFlowRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.MassFlowRate\"><code>MassFlowRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.EnergyFlowRate\"><code>EnergyFlowRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.MomentumFlowRate\"><code>MomentumFlowRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.AngularMomentumFlowRate\"><code>AngularMomentumFlowRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.Velocity\"><code>Velocity</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.EntropyFlowRate\"><code>EntropyFlowRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.ElectricCurrent\"><code>ElectricCurrent</code></a>
</ul>
<p>Our non-physical extensions necessitate the definition of corresponding flows as well:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Units.Rate\"><code>Rate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.AmountRate\"><code>AmountRate (quantity = \"Throughput\")</code></a> 
<li><a href = \"modelica://BusinessSimulation.Units.LaborGrowthRate\"><code>LaborGrowthRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.DataTransferRate\"><code>DataTransferRate</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.MonetaryFlow\"><code>MonetaryFlow</code></a>
<li><a href = \"modelica://BusinessSimulation.Units.MonetaryFlow_USD\"><code>MonetaryFlow_USD</code></a>
<li> ... 
</ul>
<h4>Notes</h4>
<ul>
<li>Some links provided for base units, derived units, and quantity-related display unit definitions of the library will only work \"in product\", i.e., for users having Wolfram System Modeler (WSM) and the Business Simulation Library (BSL) installed.</li><br>
<li>The use of non-SI units requires definition of custom <em>derived</em> and <em>base units</em>. Presently, only Wolfram System Modeler 14 is tested to allow this flexibility and convenience. Modelers may always take recourse to using standard SI units with the BSL, which are supported by all Modelica tools.</li><br>
<li>Whenever we speak about \"years\" within the BSL, we will always mean <em>average calendar years</em> (365.2425 days). The reason for this choice is that in Modelica time will always be accounted for in seconds; we might accordingly want to use the amount of seconds that most closely represents an average year over arbitrary time spans. Using average calendar years will thus maximize the chance that adding the amount of seconds to an actual start date will result in the correct end date for a simulation that spans several years—the mean absolute error for using <code>yrCal</code> will typically be less than 0.5 days.</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Units\">Units</a>
</p>
<br> 
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>", revisions = "<html>
<ul>
<li>Changes in unit hierarchy and type definitions in v2.1.0 and v2.2.</li>
</ul> 
</html>"));
end UnitsInBusinessSimulations;
