within BusinessSimulation.UsersGuide.Tutorial;

final class ElementaryBuildingBlocks "A quick tour introducing the library's main classes"
  extends Icons.Info;
  extends Icons.DocumentationInfo;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<h4>Elementary Building Blocks for Dynamic Models</h4>
<p>The Business Simulation Library (BSL) provides the following elementary classes to build dynamic models:</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Main Class</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Stocks.svg\" alt=\"Stocks.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.Stocks\"><strong>Stocks</strong></a></td>
<td>
<p>Stocks describe the <em>states</em> of a system, such as a measurable quantity that could, in principle, be measured even if the system were hypothetically \"frozen.\"</p>
</td>
</tr>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Flows.svg\" alt=\"Flows.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.Flows\"><strong>Flows</strong></a></td>
<td>
<p>Flows are <em>aggregate processes</em> that change the states of a system by filling or draining stocks at a certain rate.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/SourcesOrSinks.svg\" alt=\"SourcesOrSinks.svg\" width= \"200\"></td>
<td><a href=\"modelica://BusinessSimulation.SourcesOrSinks\"><strong>Sources or Sinks</strong></a></td>
<td>
<p>Sources or Sinks act as <em>stocks with infinite capacity</em> (\"clouds\") at a system's boundary, from or into which elements flow. The BSL broadens the definition to include <em>the combination of a stock with infinite capacity and a connected flow</em> to model processes of <em>growth or decline</em> from external influences.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Converters.svg\" alt=\"Converters.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.Converters\"><strong>Converters</strong></a></td>
<td>
<p>Converters model <em>information processing</em> on a fundamental level, transforming information input into information output immediately.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/InformationSources.svg\" width = \"200\" alt=\"InformationSources.svg\"></td>
<td><a href=\"modelica://BusinessSimulation.InformationSources\"><strong>Information Sources</strong></a></td>
<td>
<p>Information sources provide inputs from external \"information processors\" or \"controllers\" that lie outside a system's boundary.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/MoleculesOfStructure.svg\" alt=\"MoleculesOfStructure.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.MoleculesOfStructure\"><strong>Molecules of&nbsp;Structure</strong></a></td>
<td>
<p>These are pre-built components for modeling <em>information processing, decision-making</em>, or <em>subsystems</em> more generally.</p>
</td>
</tr>
</tbody>
</table>
<p>
→<a href = \"#Flows\">Flows</a><br>
→<a href = \"#SourcesOrSinks\">Sources or Sinks</a><br>
→<a href = \"#Converters\">Converters</a><br>
→<a href = \"#MoleculesOfStructure\">Molecules of Structure</a>
<br>
</p>
<h4><a name = \"Stocks\">Stocks</a></h4>
<h5>Information Levels, Material Stocks, and Capacity Restricted Stocks</h5>
<p>In the system dynamics community, the terms <em>stock</em> and <em>level</em> (sometimes also referred to as <em>reservoir</em>) are used synonymously to describe compartments that store a measurable quantity during a simulation [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">20</a>]. Generally, these compartments can be <em>filled</em> and <em>drained over time</em> by flows operating at a certain rate. In the BSL, we distinguish <em>three basic types of stocks</em>:</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/InformationLevel.svg\" alt=\"InformationLevel.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\"><strong>Information Level</strong></a></td>
<td>
<p><em>Information Levels</em> store information that changes over time due to the flow of information. We may use an information level to model a company's assets, liabilities, and shareholders' equity.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/MaterialStock.svg\" alt=\"MaterialStock.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\">Material Stock</a></strong></td>
<td>
<p><em>Material Stocks</em> represent physical quantities, such as living beings and people, raw material, finished goods, or capital equipment, that change due to material flows. Unlike information levels, material stocks can never become negative. If a flow tries to drain an empty material stock, it will be set to zero.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/CapacityRestrictedStock.svg\" alt=\"CapacityRestrictedStock.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.CapacityRestrictedStock\">Capacity Restricted Stock</a></strong></td>
<td>
<p><em>Capacity Restricted Stocks</em> are material stocks with additional capacity restriction. They may have <em>maximum</em> and a <em>minimum</em> levels (&ge; 0).</p>
</td>
</tr>
</tbody>
</table>
<p>Stocks—hereafter referred to simply as stocks/levels in general—have an <em>inflow</em> and an <em>outflow</em> port (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>) through which they can receive in- and outflows from connected flow components. This is indicated by the pairs of grey arrows within the stock icon. It's important to note, however, that this indication and naming are generally suggestive, as stocks may be filled or drained <em>via both ports</em>. Whenever possible, inflows and outflows should be connected to the appropriate port of a stock component to avoid incorrect stock information reporting by →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutputs</a>.</p>
<p>All stock components report the quantity that currently resides in the component via <em>information outputs</em> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>).</p>
<h5>Keeping Track of Mean Qualities</h5>
<p>It is often desirable to track some <em>mean quality</em> for entities contained in a stock, such as the experience level of new employees or their wage level, which may vary during a simulation. A <em>coflow</em> is typically applied in these cases and can be modeled compactly using the →<a href=\"modelica://BusinessSimulation.Stocks.HinesCoflow\">HinesCoflow</a>.</p>
<h5>Dynamic Stocks—Stocks With Delayed or Discrete Outflows</h5>
<p>Next to the elementary types of stock, there are special kinds of stock which can best be thought of as <em>dynamic stocks</em>. Dynamic stocks contain internal processes, which we will not model in more detail. They have a special stock port (red) on their outflow side (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort_Special\">StockPort_Special</a>) as the rate of outflow is determined <em>internally</em>. This was already described by Forrester [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">2</a>, pp.&nbsp;86&nbsp;ff.] for delays.</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td>&nbsp;<img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/DelayN.svg\" alt=\"DelayN.svg\" width=\"200\"></td>
<td>&nbsp;<strong><a href=\"modelica://BusinessSimulation.Stocks.DelayN\">DelayN</a></strong></td>
<td>
<p>An n-th order <em>exponential delay</em> will delay its inflow so that the actual times of residence will be distributed around the indicated (mean) <em>delay time</em>. The variation for the distribution of residence times will decrease with higher delay orders (a delay of infinite order will behave exactly like a <em>PureDelay</em>).</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/PureDelay.svg\" alt=\"PureDelay.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.PureDelay\">Pure Delay</a></strong></td>
<td>
<p>A material delay with <em>fixed delay time</em> that may change over time. Any changes in the delay time will only affect incoming material, so that new material may flow out earlier than material already in the stock.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/SimpleConveyor.svg\" alt=\"SimpleConveyor.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.SimpleConveyor\">Simple Conveyor</a></strong></td>
<td>
<p>As in an <em>ideal conveyor belt</em>, everything that enters is delayed by a fixed amount of time, which cannot change during the simulation.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Conveyor.svg\" alt=\"Conveyor.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.Conveyor\">Conveyor</a></strong></td>
<td>
<p>This stock also models an <em>ideal conveyor</em>, but the discretely modeled component allows the <em>delay time to change</em> during the simulation. Unlike a PureDelay, the order of inflow is preserved so that material may leave the belt at the same time, but never ahead of material that has entered earlier.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Oven.svg\" alt=\"Oven.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.Oven\">Oven</a></strong></td>
<td>
<p>The Oven (aka batch delay) is an ideal model of a <em>batch production process</em>: &nbsp;Material will flow into the oven until its capacity is reached (or the load time is exceeded). The material will then be processed for some process time and will then be unloaded. During the processing material can neither flow in nor out of the stock.</p>
</td>
</tr>
</tbody>
</table>
<p>All dynamic stocks are material stocks and there can never be negative amounts inside a process. Dynamic stocks may have additional input ports in case process or delay times are chaning during a simulation.</p>
<p>It is important to mention that <strong>for dynamic stocks the ports' designations are binding.</strong> Accordingly, they can only be filled via the inflow port and can only be drained via the outflow port. Only the →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.OutflowDynamicStock\">OutflowDynamicStock</a>&nbsp;and the →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\">SplitOutFlowDynamicStock</a>&nbsp;components have a corresponding <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort_Special\">FlowPort_Special</a> that can be connected to the outflow port of dynamic stocks.</p>
<h4><a name =\"Flows\">Flows</a></h4>
<p>Flow components are mainly responsible for dynamic behavior as they <em>fill or drain</em> static stocks over time. There are three basic types of flows:</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/UnidirectionalFlow.svg\" alt=\"UnidirectionalFlow.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Flows.Unidirectional\">Unidirectional</a></strong></td>
<td>
<p><em>Unidirectional flows</em> drain the stock connected to their <code>portA</code> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>) and fill the stock connected to their <code>portB</code> at an identical rate. The rate needs to be positive  and will be set to zero if it is negative, as the direction of flow cannot change during a simulation.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/BidirectionalFlow.svg\" alt=\"BidirectionalFlow.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Flows.Bidirectional\">Bidirectional</a></strong></td>
<td>
<p><em>Bidirectional flows</em> are essentially unidirectional flows that may change the direction of flow during a simulation depending on the <em>sign</em> of the rate: &nbsp;A negative rate will transport entities from B to A, while a positive rate will transport entities from A to B.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Interaction.svg\" alt=\"Interaction.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Flows.Interaction\">Interaction</a></strong></td>
<td>
<p><em>Interactions</em>&nbsp;model the general case of two stocks having <em>netflows</em>  flow from/to clouds (positive rates will fill the connected stock), which may be influenced by the stock levels. A simple example is the →<a href=\"modelica://BusinessSimulation.Flows.Interaction.BrokenTransition\">BrokenTransition</a>, where the inflow to stock B is proportional to the rate of the outflow of stock A, as some kind of <em>transformation</em> is modeled rather than a mere transition.</p>
</td>
</tr>
</tbody>
</table>
<p>All flow components report their current rate—or rates in the case of interactions—via <em>information outputs</em> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>). They may have additional inputs (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealInput\">RealInput</a>) in the general case where variables determining the rate of flow can change during the simulation.</p>
<h4><a name = \"SourcesOrSinks\">Sources or Sinks</a></h4>
<p>Sources or Sinks are compact components that can be used to model processes of <em>growth or decline</em> at a system's boundary in a compact way:</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Cloud.svg\" alt=\"Cloud.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks.Cloud\">Cloud</a></strong></td>
<td><p>A <em>Cloud</em> simply is a stock that is outside a system's boundary—here we assume that the stock has an infinite capacity. In models of population dynamics, clouds will be used as <em>sources</em> for newborns or <em>sinks</em> for the deceased.</p></td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Source.svg\" alt=\"Source.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks\">Source</a></strong></td>
<td>
<p>A <em>Source</em> combines a cloud with a unidirectional <em>outflow</em> that will then <em>fill</em> the connected stock.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Sink.svg\" alt=\"Sink.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks\">Sink</a></strong></td>
<td>
<p>A <em>Sink</em> combines a cloud with a unidirectional <em>inflow</em> that will then <em>drain</em> the connected stock.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/SourceOrSink.svg\" alt=\"SourceOrSink.svg\" width=\"200\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks\">Source or Sink</a></strong></td>
<td>
<p>A <em>SourceOrSink</em> combines a cloud with a bidirectional <em>flow</em> that may <em>fill or drain</em> a stock depending on the sign of the flow's rate: A positive rate, by convention, fills the connected stock.</p>
</td>
</tr>
</table>
<p>Like flow components, sources or sink components report their current rate via <em>information outputs</em> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>). They may have additional inputs (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealInput\">RealInput</a>) in the general case where variables determining the rate of flow can change during the simulation.</p>
<h4><a name = \"Converters\">Converters</a></h4>
<p>Converters take one or more <e>information inputs</em> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealInput\">RealInput</a>), apply a real-valued function to the inputs, and then return the result as an <em>information output</em> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>). Regular converters typically model basic arithmetic functions like <em>exp, log, power, plus</em> etc. Next to regular converters there are more specialized converter classes:</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Package Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/DiscreteDelay.svg\" alt=\"DiscreteDelay.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay\">Discrete Delay</a></strong></td>
<td>
<p><em>DiscreteDelay</em> converters introduce discrete behavior or delays into information processing and typically contain an information level—which is the reason for their boxlike-appearance.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Logical.svg\" alt=\"Logical.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Converters.Logical\">Logical</a></strong></td>
<td>
<p><em>Logical</em> converters have Boolean outputs (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.BooleanOutput\">BooleanOutput</a>) and/or inputs (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.BooleanInput\">BooleanInput</a>).</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Lookup.svg\" alt=\"Lookup.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Converters.Lookup\">Lookup</a></strong></td>
<td>
<p><em>Lookup</em> converters use tabular or more elaborate parametric functions to model the transformation of information.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Vector.svg\" alt=\"Lookup.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Converters.Vector\">Vector</a></strong></td>
<td>
<p><em>Vector</em> converters have vector inputs and/or outputs.</p>
</td>
</tr>
</table>
<h4><a name = \"MoleculesOfStructure\">Molecules of Structure</a></h4>
<h5>Information Processing and Decision Making</h5>
<p>John Morecroft [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">7</a>] suggested that diagrams of dynamic systems would be greatly improved, if we used more aggregate diagramming. Instead of showing lots of converters, we may simply combine them within an aggregate class, which will succinctly indicate information processing and/or decision making (policy setting) in diagrams.</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Package Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/InformationProcessing.svg\" alt=\"InformationProcessing.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.InformationProcessing\">Information Processing</a></strong></td>
<td>
<p>Taking the raw information from the system and its environment and bringing it into the form needed for decision making.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Policy.svg\" alt=\"Policy.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Policy\">Policy</a></strong></td>
<td>
<p>Using (preprocessed) information, we will have some decision rule that will give a decision output&mdash;usually <em>goals</em> and other <em>regulations</em> to be observed or <em>rates</em> for processes that change the state(s) of the&nbsp;system.</p>
</td>
</tr>
</table>
<h5>Subsystems—Modeling a System of Systems</h5>
<p>When we look at complex systems in society or even at individual&nbsp;companies and markets, we are well advised to conquer their complexity by applying a&nbsp;<em>hierarchical</em> modeling approach. Accordingly, we will model the system in focus as a <em>system of systems</em> exchanging instantaneous information signals and conserved quantities, such as matter, energy, and stored information.</p>
<p>We can usually assume that all subsystems exchange some kind of information. Accordingly, we can best distinguish different types of subsystems by looking at the presence of <em>stock and flow ports</em> for the exchange of conserved quantities, such as raw materials or finished goods.</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Subsystem Type</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Blocks.svg\" alt=\"Blocks.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Blocks\">Blocks</a></strong></td>
<td>
<p><em>Blocks</em> do not exchange physical quantities with other systems. Instead there is only exchange of information for managerial control or information processing.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Incubators.svg\" alt=\"Incubators.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Incubators\">Incubators</a></strong></td>
<td>
<p><em>Incubators</em> receive, store, and provide physical entities via multiple stock ports. There will often be some kind of <em>transformation during storage</em>.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Transceivers.svg\" alt=\"Transceivers.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Transceivers\">Transceivers</a></strong></td>
<td>
<p><em>Transceivers</em> not only receive and store physical quantities, but also move them to/from connected systems. With multiple stock and flow ports, these are the most general kind of subsystems.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Actuators.svg\" alt=\"Actuators.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Actuators\">Actuators</a></strong></td>
<td>
<p><em>Actuators</em> move physical entities to and from connected systems via multiple flow ports (push or pull). Subsequently, there may also be some storage as internal processes of transformation take up time.</p>
</td>
</tr>
</table>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"));
end ElementaryBuildingBlocks;
