within BusinessSimulation.Functions;

function constrainedRateBoolean "Return true, if the indicated rate meets restrictions"
  extends BusinessSimulation.Icons.Function;
  input Real indicatedRate "Proposed rate for port of flow element";
  input Boolean stopInflow "Signal from connected stock";
  input Boolean stopOutflow "Signal from connected stock";
  output Boolean useRate "= true, if the indicated rate does not violate restrictions";
protected
  // neagtive rate is inflow to stock
  Boolean indRateIsInflow = indicatedRate < 0;
algorithm
  // set rate to zero if stopSignal matches character of flow
  useRate := if stopInflow and indRateIsInflow then false elseif stopOutflow and not indRateIsInflow then false else true;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The real output <strong><code>actualRate</code> </strong>is determined by checking whether the real input <strong><code>indicatedRate</code> </strong>is complying with the restrictions signaled by a connected stock in form of the boolean flags <strong><code>stopInflow</code> </strong>and <strong><code>stopOutflow</code></strong>. If the rate is found to violate either flag <code>false</code> is returned, in all other cases <code>true</code> is&nbsp;returned.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>constrainedRateBoolean</strong>(indicatedRate, stopInflow, stopOutflow)</code></p>
<h4>Examples</h4>
<br>
<pre>Functions.constrainedRateBoolean(-5.0, stopInflow = true, stopOutflow = false); //  false<br>Functions.constrainedRateBoolean( 5.0, stopInflow = true, stopOutflow = false); //  true<br>Functions.constrainedRateBoolean(-5.0, stopInflow = false, stopOutflow = true); //  true<br>Functions.constrainedRateBoolean( 5.0, stopInflow = false, stopOutflow = true); //  false</pre>
<br>
<h4>Notes</h4><p>Rates are usually set by flow components and have to observe the flow-restrictions with regard to a connected stock component. By Modelica conventions a negative rate for the flow indicates an inflow with regard to the connected stock, while a positive rate indicates an outflow for the stock.</p>
<p>Thus, in the first example above the indicated negative rate for a &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort </a>would mean an outflow from the flow component and an inflow with regard to the connected &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>. Observing the flow restriction signaled by the stock <code>false</code> is returned.</p>
<h4>See also</h4><p><a href=\"modelica://BusinessSimulation.Functions.constrainedRate\">constrainedRate</a></p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end constrainedRateBoolean;
