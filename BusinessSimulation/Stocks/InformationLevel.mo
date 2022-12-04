within BusinessSimulation.Stocks;

model InformationLevel "Unrestricted reservoir to store information"
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Constants.{small,zero,inf,INF};
  extends Interfaces.PartialStocks.BasicStock;
initial equation
  // properly initialize discrete vars with fixed = false
  pre(inflow.stopInflow) = false;
  pre(outflow.stopInflow) = false;
  pre(inflow.stopOutflow) = false;
  pre(outflow.stopOutflow) = false;
equation
  // inflow to and outflow from stock are unrestricted
  inflow.stopInflow = false;
  outflow.stopInflow = false;
  inflow.stopOutflow = false;
  outflow.stopOutflow = false;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is the general, <em>unrestricted reservoir</em> of the System Dynamics methodology, it accumulates information transported by flow components connected to the StockPorts. The&nbsp;<em>InformationLevel</em>&nbsp;can become negative.</p>
<h4>Notes</h4>
<ul>
<li>The <code>inflow</code> and <code>outflow</code> &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPorts </a>are only indicative; in general the reservoir may be filled or drained by flows connected to either port.</li><br>
<li>The parameters <code>maxValue</code> and <code>minValue</code> allow to define an <em>admissable</em> range. It can be monitored by an <code>assert</code> using <code>useAssert = true</code> in the Advanced tab. The switch <code>causeError</code> controls whether an <em>error</em> or a <em>warning</em> is to be raised.</li><br>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br><br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial value.</li><br>
<li><em>SteadyState</em> will introduce the equation <code>der(x) = 0</code> in order to find an initial value that establishes equilibrium. <br>(Note: Such a solution may not exist and to avoid trivial solution in many cases <code>initialValue</code> -- in this case used as a start value for numerical iteration -- should be set to a value different from zero.)</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free in solving the initial value problem.</li>
</ul>
</li>
</ul>
<ul>
<li>There is an optional &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutput </a>connector.</li>
</ul>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\">MaterialStock</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.CapacityRestrictedStock\">CapacityRestrictedStock</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InformationLevel;
