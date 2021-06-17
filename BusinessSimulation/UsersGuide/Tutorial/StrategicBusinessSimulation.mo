within BusinessSimulation.UsersGuide.Tutorial;

final class StrategicBusinessSimulation "From Business Process Modeling the Strategic Business Simulation"
  extends Icons.Info;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<h4>From Business Process Modeling to&nbsp;Strategic Business Simulation</h4>
<h5>Business Process Modeling</h5>
<p>Business process modeling (BPM) has become an ubiquitous activity in support of management decision making and business analytics. While there are different tools and notation for BPM, <a href=\"https://en.wikipedia.org/wiki/Event-driven_process_chain\">event-driven process chains</a>&nbsp;(EPC) offer a very general and simple way of modeling business processes.&nbsp;Essentially, processes always start with an <em>event</em> that will lead to one or more <em>activites</em> (functions in EPC-terminology) which again will mount into one or more events, so that in general <em>any activity must always be braced by two events</em>.</p>
<p>Figure 1 shows an EPC for the idealized production process of ACME, a startup that produces intruder alarm systems specifically designed to meet private home owners&rsquo; needs. The diagram is valid for a single unit produced and shows events (red hexagons) and functions (green boxes) in typical notation.&nbsp;</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 1: Simple Production Process</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/StrategicBusinessSimulation/SimpleProductionProcess.png\" alt=\"SimpleProductionProcess.png\" width=\"600\"></td>
</tr>
</tbody>
</table>
<p>While this \"discrete-event\" view of production is great for operational process improvement, it is not so well suited for for winning over investors by telling a compelling story about business development or for discussing policy-setting issues with regard to social systems and organizations. In these cases an <em>aggregate strategic view</em>&nbsp;is the better choice.</p>
<h4>Aggregate View of Production</h4>
<p>To go from the the familiar perspective of BPM to a more strategic one, we will look at what happens in a <em>period</em>. In a month there will be lots of events and actions. We can aggregate the actions and events separately: &nbsp;Individual actions will thus add up to a <em>process</em> that produces tangible results at a certain rate(e.g. assembled units per month). In the general case the rate may be a <em> continuously varying</em> quantity due to external and internal disruptions or policies. <em>Events</em> on the other hand can be collected as the </em>countable results of processes</em>, e.g. finished products can be collected in an <em>inventory</em>.</p>
<p>Figure 2 shows, how we can move from the event-driven process chain model to a strategic model using the Business Simulation Library. As in the EPC we will start out with its dynamic equivalent, a container—called <em>stock</em>. The very first stock is called a <em>source</em> in the library, which means that we assume infinite capacity indicating our model's boundary (i.e. in our example we do not care for the source of all material, that we need to assemble products).</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 2: Actions Add Up to Flows and Events to Stocks</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/StrategicBusinessSimulation/ContinuousView.png\" alt=\"ContinuousView.png\" width=\"600\"></td>
</tr>
</tbody>
</table>
<p>The assembly of products in our example has been aggregated to a mere process of&nbsp;<em>transition</em>&nbsp;from the unlimited stock of raw materials to the <em>inventory</em> of finished goods. Shipping products in Figure 2 has also become a mere transition at some given rate, which moves our products to the stock <em>installedBase</em> representing continued use during the product's useful lifetime.</p>
<p><em>Stocks</em> (with red color code inherited from events) and <em>flows</em> (with green color code inherited from actions) are <em>atomic systems</em> in the library. As we can see in Figure 2, stocks and flows are connected via <em>acausal connectors</em> (&rarr; <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>, &rarr; <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>). Each component <em>reports</em>&nbsp;basic <em>information</em> about what is going on <em>inside</em> using output connectors (white triangles; &rarr; <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>): &nbsp;A flow will report its <em>current rate</em> at any time during a simulation, whereas a stock will report the <em>amount of entities</em> that are inside at any time during a simulation. The numbers shown inside the stocks indicates the initial amount inside the respective stock.</p>
<p>Looking at the <em>producing</em>&nbsp;and <em>shipping</em> flows in Figure 2, we find, that they show a<em> stylized pipeline</em> (following System Dyamics conventions) with a <em>stylized paddle wheel pump</em>&nbsp;that is influenced by a variable called <em>rate</em>.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 3: Setting the Rate</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/StrategicBusinessSimulation/SettingTheRate.png\" alt=\"SettingTheRate.png\" width=\"600\"></td>
</tr>
</tbody>
</table>
<p>Since there is no <em>information input</em> to the <em>producing</em> component, the rate of production in this simple case is a constant parameter. Figure 3 shows how—upon selecting the component—the <code>rate</code> can be set in the General tab in SystemModeler. Note, that there is also a <em>structural</em> parameter <code>hasConstantRate</code> that allows to instead of a parameter have an variable input for the <em>rate</em>.</p>
<h4>Examples</h4>
<p>This introductory example is continued in the package <a href=\"modelica://BusinessSimulation.Examples\"><strong>Examples</strong></a>:</p>
<ul>
<li><a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\"><strong>SimpleProductionChain</strong></a></li><br>
<li><a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainII\"><strong>SimpleProductionChainII</strong></a></li><br>
<li><a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainIII\"><strong>SimpleProductionChainIII</strong></a></li><br>
</ul>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"));
end StrategicBusinessSimulation;
