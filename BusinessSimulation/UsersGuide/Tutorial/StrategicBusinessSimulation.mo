within BusinessSimulation.UsersGuide.Tutorial;

final class StrategicBusinessSimulation "Moving from Business Process Modeling to Strategic Business Simulation"
  extends Icons.Info;
  extends Icons.DocumentationInfo;
  annotation(Documentation(info = "<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<h4>From Business Process Modeling to Strategic Business Simulation</h4>
<h5>Business Process Modeling</h5>
<p>Business process modeling (BPM) has become a ubiquitous activity in supporting management decision-making and business analytics. Although various tools and notations exist for BPM, <a href=\"https://en.wikipedia.org/wiki/Event-driven_process_chain\">event-driven process chains</a> (EPC) provide a straightforward and general method for modeling business processes. Essentially, processes always start with an <em>event</em> leading to one or more <em>activities</em> (referred to as functions in EPC terminology), which in turn lead to one or more events, establishing that <em>every activity must always be preceded and followed by events</em>.</p>
<p>Figure 1 presents an EPC for the idealized production process of ACME, a startup producing intruder alarm systems tailored for private homeowners. The diagram, valid for a single unit produced, illustrates events (red hexagons) and functions (green boxes) using typical notation.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 1: Simple Production Process</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/StrategicBusinessSimulation/SimpleProductionProcess.png\" alt=\"SimpleProductionProcess.png\" width=\"600\"></td>
</tr>
</tbody>
</table>
<p>While this discrete-event view is beneficial for operational process improvement, it falls short for attracting investors with a compelling business development narrative or for discussing policy issues within social systems and organizations. Here, an <em>aggregate strategic view</em> is more appropriate.</p>
<h4>Aggregate View of Production</h4>
<p>Moving from BPM to a strategic perspective involves focusing on what happens over a <em>period</em>, such as a month, during which numerous events and actions occur. These can be aggregated: actions accumulate into a <em>process</em> yielding tangible results at a certain rate (e.g., assembled units per month), which may vary continuously due to internal and external factors. <em>Events</em>, on the other hand, can be considered as <em>countable outcomes of processes</em>, such as finished products accruing in an <em>inventory</em>.</p>
<p>Figure 2 illustrates the transition from an event-driven process chain model to a strategic model using the Business Simulation Library. Starting with its dynamic counterpart, a container called <em>stock</em>, the initial stock is termed a <em>source</em> in the library, indicating infinite capacity and marking the model's boundary (i.e., in our example, the origin of materials needed for product assembly is not considered).</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 2: Actions Transform into Flows and Events into Stocks</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/StrategicBusinessSimulation/ContinuousView.png\" alt=\"ContinuousView.png\" width=\"600\"></td>
</tr>
</tbody>
</table>
<p>In our example, product assembly has been aggregated into a simple <em>transition</em> from the unlimited stock of raw materials to the <em>inventory</em> of finished goods. Shipping products, as depicted in Figure 2, also becomes a transition at a specified rate, moving products to the <em>installedBase</em> stock, which represents products in use during their lifetime.</p>
<p><em>Stocks</em> (color-coded red, akin to events) and <em>flows</em> (color-coded green, akin to actions) are <em>atomic systems</em> within the library. As shown in Figure 2, stocks and flows connect through <em>acausal connectors</em> (&rarr; <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>, &rarr; <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort</a>). Each component <em>reports</em> essential <em>information</em> about its internal state via output connectors (white triangles; &rarr; <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.RealOutput\">RealOutput</a>): A flow reports its <em>current rate</em> during simulation, while a stock reports the <em>quantity of entities</em> it contains at any time. The numbers inside the stocks indicate the initial quantity in each stock.</p>
<p>The <em>producing</em> and <em>shipping</em> flows in Figure 2 are represented as <em>stylized pipelines</em> (following system dynamics conventions) with a <em>stylized paddle wheel pump</em> affected by a variable named <em>rate</em>.</p>
<table cellspacing=\"0\" cellpadding=\"2\"><caption align=\"top\">Figure 3: Setting the Rate</caption>
<tbody>
<tr>
<td><img src=\"modelica://BusinessSimulation/Resources/Images/UsersGuide/Tutorial/StrategicBusinessSimulation/SettingTheRate.png\" alt=\"SettingTheRate.png\" width=\"600\"></td>
</tr>
</tbody>
</table>
<p>With no <em>information input</em> to the <em>producing</em> component, the production rate in this simplified model is a constant parameter. Figure 3 demonstrates how—upon selecting the component—the <code>rate</code> is adjusted in the General tab in SystemModeler. Notably, a <em>structural</em> parameter <code>hasConstantRate</code> allows for replacing the constant parameter with a variable input for the <em>rate</em>.</p>
<h4>Examples</h4>
<p>This introductory example continues in the package <a href=\"modelica://BusinessSimulation.Examples\"><strong>Examples</strong></a>:</p>
<ul>
<li><a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChain\"><strong>SimpleProductionChain</strong></a></li>
<li><a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainII\"><strong>SimpleProductionChainII</strong></a></li>
<li><a href=\"modelica://BusinessSimulation.Examples.SimpleProductionChainIII\"><strong>SimpleProductionChainIII</strong></a></li>
</ul>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the EUPL-1.2 or later</p>", revisions = "<html>
<ul>
<li>Reformulated version in v2.2.</li><br>
</html>"));
end StrategicBusinessSimulation;
