within BusinessSimulation;

package CausalLoop "Agile system dynamics modeling with quantitative causal loop diagrams (CLD+)"
  extends Icons.CausalLoopPackage;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This package contains high-level classes (i.e., wrappers) that allow to quickly set up dynamic models in a Causal Loop Diagram (CLD) fashion. Unlike conventional CLD such models can immediately be simulated and analyzed.</p>
<p>A typical workflow in an \"Agile Dynamic Modeling\" setup would be to quickly establish a first working model using the most relevant variables as starting points and consider them to be stocks/levels. Exogenous processes of <em>change</em> and/or <em>control</em> next to simplified relations between the variables&mdash;defined by <em>elasticities or proportionalities</em>&mdash;will then give rise to dynamic behavior.</p>
<p>Such a preliminary model can be made more expressive by introducing lookups to modify constant coefficients (e.g., factors of proportionality) thus making the models more nonlinear. As van Zijderveld [<a href=\"modelica://BusinessSimulation.UsersGuide.References\">24</a>] has shown, such models may even suffice in situations of tight budgets or lower stakes.</p>
<p>True to the Agile paradigm, we may start out with a preliminary, working model and replace any of its parts by more elaborate models as needed. Such a gradual approach to modeling is the sweet spot of object-oriented modeling in Modelica.</p>
<h4>Notes</h4>
<p>Since not all component names are visible in the diagram display for <code>CausalLoop</code> classes the following table shows the <code>defaultComponentName</code> for the main classes of the package:</p>
<table width = 600 style=\"margin-left: auto; margin-right: auto;\">
<tbody>
<tr style=\"height: 14px;\">
<td style=\"width: 10%; height: 14px;\"><strong>defaultComponentName</strong></td>
<td style=\"width: 50%; height: 14px;\"><strong>Explicit Name</strong></td>
<td style=\"width: 60%; height: 14px;\"><strong>Classes</strong></td>
</tr>
<tr style=\"height: 14px;\">
<td style=\"width: 10%; height: 14px;\">s</td>
<td style=\"width: 50%; height: 14px;\">Stocks (aka <em>states</em>)</td>
<td style=\"width: 60%; height: 14px;\"><code>SimpleInformationLevel,<br>SimpleMaterialStock</code></td>
</tr>
<tr style=\"height: 28px;\">
<td style=\"width: 10%; height: 28px;\">p</td>
<td style=\"width: 50%; height: 14px;\">Processes (<em>exogenous change</em> ~)</td>
<td style=\"width: 60%; height: 14px;\"><code>ExponentialChange,<br>LinearChange,<br> LogisticGrowth</code></td>
</tr>
<tr style=\"height: 14px;\">
<td style=\"width: 10%; height: 14px;\">r</td>
<td style=\"width: 50%; height: 14px;\">Relations (aka <em>links</em>)</td>
<td style=\"width: 60%; height: 14px;\"><code>Elasticity,<br>Proportionality</code></td>
</tr>
<tr style=\"height: 14px;\">
<td style=\"width: 10%; height: 14px;\">d</td>
<td style=\"width: 50%; height: 14px;\">Delays</td>
<td style=\"width: 60%; height: 14px;\"><code>ExponentialDelay,<br>PipelineDelay</code></td>
</tr>
<tr style=\"height: 42px;\">
<td style=\"width: 10%; height: 14px;\">c</td>
<td style=\"width: 50%; height: 14px;\">Controls</td>
<td style=\"width: 60%; height: 14px;\"><code>InputControl,<br>SimpleControl,<br>PID_Control,<br>ForceToStockValue,<br>ForceToInputValue</code></td>
</tr>
<tr style=\"height: 14px;\">
<td style=\"width: 10%; height: 14px;\">b</td>
<td style=\"width: 50%; height: 14px;\">Blocks (i.e., <em>information processing</em>)</td>
<td style=\"width: 60%; height: 14px;\"><code>Lookup_</code><em>type</em>,<br><code>Aggregation,<br>StockInformation,<br>RateInformation,<br>AggregationInfo,<br>Total,<br>Product</code></td>
</tr>
<tr style=\"height: 28px;\">
<td style=\"width: 10%; height: 14px;\">f</td>
<td style=\"width: 50%; height: 14px;\">Flows</td>
<td style=\"width: 60%; height: 14px;\"><code>UnidirectionalFlow,<br>ComplexInteraction,<br>SplitFlow</code></td>
</tr>
<tr>
<td style=\"width: 10%; height: 14px;\">L</td>
<td style=\"width: 50%; height: 14px;\">Loop indicators</td>
<td style=\"width: 60%; height: 14px;\"><code>LoopIndicator_CW,<br>LoopIndicator_CCW</code></td>
</tr>
<tr>
<td style=\"width: 10%; height: 14px;\">lab</td>
<td style=\"width: 50%; height: 14px;\">Labels (i.e., flow indicators)</td>
<td style=\"width: 60%; height: 14px;\"><code>MatFlowIndicator,<br>InfoFlowIndicator</code></td>
</tr>
</tbody>
</table>
<h4>See also</h4>
<p>To see the components of this package at work, have a look at these <strong>example models</strong>:</p>
<ul>
<li><a href = \"modelica://BusinessSimulation.Examples.HealTheWorld\">HealTheWorld</a></li><br>
<li><a href=\"modelica://BusinessSimulation.Examples.SoftwareReleaseProject\">SoftwareReleaseProject</a></li>
</ul>
<p>A short <strong>video presentation</strong> (12 min) introducing <em>quantitative causal loop diagramming</em> can be found <a href=\"https://vimeo.com/571763724\">here</a>.</p>
<br>
<hr>
<p>Copyright &copy; 2021 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end CausalLoop;
