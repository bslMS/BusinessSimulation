within BusinessSimulation.UsersGuide.Tutorial;

final class ElementaryBuildingBlocks "A quick tour introducing the library's main classes"
  extends Icons.Info;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<h4>Elementary Building Blocks for Dynamic Models</h4>
<p>The Business Simulation Library provides the following elementary classes to build dynamic models:</p>
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
<p>Stocks describe the <em>states</em> of a system, e.g., some measurable quantity, which might—at least on principle—be measured even when we (hypothetically) \"freeze the system\".</p>
</td>
</tr>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Flows.svg\" alt=\"Flows.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.Flows\"><strong>Flows</strong></a></td>
<td>
<p>Flows are <em>aggregate processes</em> that change the states of a system, i.e., they <em>fill</em> and <em>drain</em> stocks at a certain rate.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/SourcesOrSinks.svg\" alt=\"SourcesOrSinks.svg\" width= \"200\"></td>
<td><a href=\"modelica://BusinessSimulation.SourcesOrSinks\"><strong>Sources or Sinks</strong></a></td>
<td>
<p>Sources or Sinks are <em>stocks with an infinite capacity</em> (aka \"clouds\") out of or into which elements flow at a system's boundary. The BSL extends the narrow definition of sources or sinks and also considers the <em>combination of a stock with infinite capacity and a connected flow</em> to describe processes of <em>growth or decline</em> from external sources or sinks.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Converters.svg\" alt=\"Converters.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.Converters\"><strong>Converters</strong></a></td>
<td>
<p>Converters can be used to model<em> information processing</em> on a very low level. In a converter some <em>information input</em> is immediately processed to provide some <em>information output</em>.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/InformationSources.svg\" width = \"200\" alt=\"InformationSources.svg\"></td>
<td><a href=\"modelica://BusinessSimulation.InformationSources\"><strong>Information Sources</strong></a></td>
<td>
<p>Information sources describe information inputs from \"information processors\" or \"controllers\" that are <em>outside a system's boundary</em>.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/MoleculesOfStructure.svg\" alt=\"MoleculesOfStructure.svg\" width=\"200\"></td>
<td><a href=\"modelica://BusinessSimulation.MoleculesOfStructure\"><strong>Molecules of&nbsp;Structure</strong></a></td>
<td>
<p>Pre-built components to model <em>information processing, decision making</em> or <em>subsystems</em> in general.</p>
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
<p>In the System Dynamics community the terms <em>stock</em> and <em>level</em> (sometimes also: <em>reservoir</em>) are synonymously used to describe compartments, that store some measurable quantity during a simulation [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">20</a>]. In general, these compartments can only be <em>filled</em> and <em>drained</em> <em>over time by </em>flows operating at a certain rate. In the Business Simulation Library we will distinguish <em>three basic types of reservoirs</em>:&nbsp;</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/InformationLevel.png\" alt=\"InformationLevel.png\" width=\"250\"></td>
<td><a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\"><strong>Information Level</strong></a></td>
<td>
<p>An <em>InformationLevel</em> stores information and can become negative. It is the most general kind of reservoir. For example, we may use an information level to model a company's assets, liabilities, and shareholders' equity.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/MaterialStock.png\" alt=\"MaterialStock.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\">Material Stock</a></strong></td>
<td>
<p>A <em>MaterialStock</em> will usually contain some form of <em>matter or mass</em>, e.g., living beings and people, raw material, finished goods, capital equipment&nbsp;etc. The plus sign in the upper left corner of the icon indicates, that a material stock can never become negative. If a flow tries to drain a material stock, that does not contain any element, it will be set to zero, as a flow cannot transport \"antimatter\".</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/CapacityRestrictedStock.png\" alt=\"CapacityRestrictedStock.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.CapacityRestrictedStock\">Capacity Restricted Stock</a></strong></td>
<td>
<p>The <em>CapacityRestrictedStock</em> is a material stock with additional restrictions regarding its capacity. It may have a <em>maximum</em> and a <em>minimum</em> level (&ge; 0) which have to be observed and cannot be violated by flows draining or filling the reservoir.</p>
</td>
</tr>
</tbody>
</table>
<p>Stocks—we will continue to use this as a short term for stocks/levels in general—do have an <em>inflow</em> and an <em>outflow</em> port (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>) via which they can receive \"mass\" in- and outflows from connected flow components. This is indicated by the pairs of grey arrows shown within the stock icon. It should be noted though, that this indication and naming is generally only suggestive, as stocks may be filled or drained <em>via both ports</em>. Whenever possible, though, inflows and outflows should primarily be connected to the \"correct\" port of a stock component, as mixing in- and outflows at any port will lead to false stock information reporting by →<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutputs</a>.</p>
<p>All stock components report the quantity that currently resides in the component via <em>information outputs</em> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>).</p>
<h5>Keeping Track of Mean Qualities</h5>
<p>We would often like to keep track of some <em>mean quality</em> for entities contained in a stock: The experience of new employees or their wage level may vary during a simulation. A <em>coflow</em> is typically applied in these cases and can be very compactly modeled using the <a href=\"modelica://BusinessSimulation.Stocks.HinesCoflow\">HinesCoflow</a>.</p>
<h5>Dynamic Stocks—Stocks With Delayed or Discrete Outflow</h5>
<p>Next to the elementary types of stock, there are special kinds of stock which can best be thought of as <em>dynamic stocks</em>. Dynamic stocks have a special stock port (red) on their outflow side (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort_Special\">StockPort_Special</a>). The special stock port indicates, that there is some process working inside the stock, which we will not model in more detail. A dynamic stock will determine the rate of outflow internally (as opposed to regular stocks, where connected flows determine the rate out outflow):</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td>&nbsp;<img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/DelayN.png\" alt=\"DelayN.png\" width=\"250\"></td>
<td>&nbsp;<strong><a href=\"modelica://BusinessSimulation.Stocks.DelayN\">DelayN</a></strong></td>
<td>
<p>An n-th order <em>exponential delay</em> will delay its inflow so that the actual times of residence will be distributed around the indicated (mean) <em>delay time</em>. The variation for the distribution of residence times will decrease with higher delay orders (a delay of infinite order will behave exactly like a <em>PureDelay</em>).</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/PureDelay.png\" alt=\"PureDelay.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.PureDelay\">Pure Delay</a></strong></td>
<td>
<p>A material delay with <em>fixed delay time</em> that may change over time. Any changes in the delay time will only affect incoming material, so that new material may flow out earlier than material already in the stock.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/SimpleConveyor.png\" alt=\"SimpleConveyor.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.SimpleConveyor\">Simple Conveyor</a></strong></td>
<td>
<p>This stock can be seen as an <em>ideal conveyor belt</em>, i.e., everything that enters is delayed by a fixed amount of time (which cannot change during the simulation).</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Conveyor.png\" alt=\"Conveyor.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.Conveyor\">Conveyor</a></strong></td>
<td>
<p>This stock also models an <em>ideal conveyor</em>, but the discretely modeled component allows the <em>delay time to change</em> during the simulation. Unlike a PureDelay, the order of inflow is preserved so that material may leave the belt at the same time, but never ahead of material that has entered earlier.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Oven.png\" alt=\"Oven.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Stocks.Oven\">Oven</a></strong></td>
<td>
<p>The Oven (aka batch delay) is an ideal model of a <em>batch production process</em>: &nbsp;Material will flow into the oven until its capacity is reached (or the load time is exceeded). The material will then be processed for some process time and will then be unloaded. During the processing material can neither flow in nor out of the stock.</p>
</td>
</tr>
</tbody>
</table>
<p>All dynamic stocks are material stocks (e.g., there can never be negative amounts inside a process). Dynamic stocks may have additional input ports (or a <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.DataInPort\">DataInPort </a>in the case of the Oven) in case process or delay times (and optionally other parameters) are to be variable during the simulation.</p>
<p><strong>For dynamic stocks the designation of the ports is binding: &nbsp;They can only be filled via the inflow port and can only be drained via the outflow port.</strong></p>
<p>Unlike regular stocks, dynamic stocks will determine the rate of outflow, so that the rate of outflow is not set independently by the flow component connected to the outflow port of a dynamic stock. Only the →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.OutflowDynamicStock\">OutflowDynamicStock</a>&nbsp;and the →<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.SplitOutflowDynamicStock\">SplitOutFlowDynamicStock</a>&nbsp;components have a corresponding <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort_Special\">FlowPort_Specia</a>l and can be connected to the outflow port of a dynamic stock.</p>
<h4><a name =\"Flows\">Flows</a></h4>
<p>Flow components are mainly responsible for dynamic behavior as they <em>fill or drain</em> stocks over time. There are three basic types of flows:</p>
<table width = 600>
<tbody>
<tr>
<th>Icon</th>
<th>Class Name</th>
<th>Description</th>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/UnidirectionalFlow.png\" alt=\"UnidirectionalFlow.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Flows.Unidirectional\">Unidirectional</a></strong></td>
<td>
<p><em>Unidirectional flows</em> drain the stock connected to their <code>portA</code> (→<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>) and fill the stock connected to their <code>portB</code> at an identical rate. The rate will always be positive (it will be set to zero if it is negative) and the direction of flow will not change during a simulation.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/BidirectionalFlow.png\" alt=\"BidirectionalFlow.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Flows.Bidirectional\">Bidirectional</a></strong></td>
<td>
<p><em>Bidirectional flows</em> are essentially unidirectional flows that may change the direction of flow during a simulation depending on the <em>sign</em> of the rate: &nbsp;A negative rate will transport entities from B to A, while a positive rate will transport entities from A to B.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Interaction.png\" alt=\"Interaction.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.Flows.Interaction\">Interaction</a></strong></td>
<td>
<p><em>Interactions</em>&nbsp;model the general case of two stocks which&nbsp;have a <em>bidrectional flow from/to a cloud</em> (\"netflow\")&nbsp;where the rate of the netflow (a positive rate will fill the respective stock) may depend on the current amount in one or both of the connected stocks. A simple example is the →<a href=\"modelica://BusinessSimulation.Flows.Interaction.BrokenTransition\">BrokenTransition</a>, where the inflow to stock B is proportional to the rate of the outflow of stock A, i.e., here some kind of <em>transformation</em> is modeled rather than a mere transition.</p>
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
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Cloud.png\" alt=\"Cloud.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks.Cloud\">Cloud</a></strong></td>
<td><p>A <em>Cloud</em> simply is a stock that is outside a system's boundary—here we assume that the stock has an infinite capacity. A typical example would be any model of population dynamics, where we will not model where newborns come from or what will happen to the deceased population. A cloud can be either <em>source</em> or <em>sink</em>.</p></td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Source.png\" alt=\"Source.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks\">Source</a></strong></td>
<td>
<p>A <em>Source</em> combines a Cloud with a unidirectional <em>outflow</em> that will then <em>fill</em> the stock connected to the component's <code>massPort</code>.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Sink.png\" alt=\"Sink.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks\">Sink</a></strong></td>
<td>
<p>A <em>Sink</em> combines a Cloud with a unidirectional <em>inflow</em> that will then <em>drain</em> the stock connected to the component's <code>massPort</code>.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/SourceOrSink.png\" alt=\"SourceOrSink.png\" width=\"250\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.SourcesOrSinks\">Source or Sink</a></strong></td>
<td>
<p>A <em>SourceOrSink</em> combines a Cloud with a bidirectional <em>flow</em> that may <em>fill or drain</em> the stock connected to the component's <code>massPort</code> depending on the sign of the flow's rate (a positive rate by convention fills the stock).</p>
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
<h5>Information Processingand Decision Making</h5>
<p>John Morecroft [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">7</a>] suggested that diagrams of dynamic systems would be greatly improved, if we used more aggregate diagramming. In this library we are well advised to follow that advice: We can reduce the diagram for a <em>system under management</em> to show the system itself and its observable information output. We then just need two additional, rather aggregated converters:</p>
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
<p>When we look at complex systems in society or even at individual&nbsp;companies and markets, we are well advised to conquer their complexity by applying a&nbsp;<em>hierarchical</em> modeling approach: &nbsp;<strong>We will model the system in focus as a <em>system of systems</em> exchanging information and/or physical entities</strong>. Jay Forrester, for example, in his seminal book \"<em>Industrial Dynamics</em>\" [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">2</a>, Section 6.2] distinguished the \"physical\" flow of <em>material</em>, <em>orders</em>, <em>money</em>, <em>personnel</em>, and<em> capital equipment </em>from that of <em>information</em>.</p>
<p>Since a closed system, i.e., one that does not exchange anything with other systems, is rather irrelevant, we can usually assume that all subsystems will receive and/or transmit information for managerial control or just for information processing. Accordingly, <strong>all subsystems will have connectors for information input and output</strong> (typically →<a href = \"modelica://BusinessSimulation.Interfaces.Connectors.DataInPort\">DataInPort</a> and →<a href = \"modelica://BusinessSimulation.Interfaces.Connectors.DataOutPort\">DataOutPort</a>).</p>
<p>We can thus best distinguish different types of subsystems by looking at the presence of <em>stock and flow ports</em>:</p>
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
<p>Systems or processes that do not exchange physical entities with other systems vie stock or flow ports&mdash;there is only exchange of information via DataIn- and DataOutPorts, e.g., managerial control, government, and/or information processing.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Incubators.svg\" alt=\"Incubators.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Incubators\">Incubators</a></strong></td>
<td>
<p>Systems or processes that receive, store, and provide physical entities via multiple stock ports. There will usually be some kind of <em>transformation during storage</em>.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Transceivers.svg\" alt=\"Transceivers.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Transceivers\">Transceivers</a></strong></td>
<td>
<p>Systems or processes that receive and store physical entities, but also move entities to/from connected systems. This is most general kind of subsystem and will have multiple stock and flow ports.</p>
</td>
</tr>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/ElementaryBuildingBlocks/Actuators.svg\" alt=\"Actuators.svg\" width=\"150\"></td>
<td><strong><a href=\"modelica://BusinessSimulation.MoleculesOfStructure.Actuators\">Actuators</a></strong></td>
<td>
<p>Systems or processes that move physical entities to and from connected systems via multiple flow ports.</p>
</td>
</tr>
</table>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"));
end ElementaryBuildingBlocks;
