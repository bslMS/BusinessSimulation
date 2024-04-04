within BusinessSimulation.Functions;

function constrainedRate "Set rate for a port according to signals from stock"
  extends BusinessSimulation.Icons.Function;
  input Real indicatedRate "Proposed rate for port of flow element";
  input Boolean stopInflow "Signal from connected stock";
  input Boolean stopOutflow "Signal from connected stock";
  output Real actualRate "The rate to use";
protected
  // neagtive rate is inflow to stock
  Boolean indRateIsInflow = indicatedRate < 0;
algorithm
  // set rate to zero if stopSignal matches character of flow
  actualRate := if stopInflow and indRateIsInflow then 0 elseif stopOutflow and not indRateIsInflow then 0 else indicatedRate;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The real output <strong><code>actualRate</code> </strong>is determined by checking whether the real input <strong><code>indicatedRate</code> </strong>is complying with the restrictions signaled by a connected stock in form of the boolean flags <strong><code>stopInflow</code> </strong>and <strong><code>stopOutflow</code></strong>. If the rate is found to violate either flag 0 is returned, in all other cases the <code>indicated rate</code> is returned unchanged.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>constrainedRate</strong>(indicatedRate, stopInflow, stopOutflow)</code></p>
<h4>Examples</h4>
<br>
<pre>Functions.constrainedRate(-5.0, stopInflow = true, stopOutflow = false); //  0.0<br>Functions.constrainedRate( 5.0, stopInflow = true, stopOutflow = false); //  5.0<br>Functions.constrainedRate(-5.0, stopInflow = false, stopOutflow = true); // -5.0<br>Functions.constrainedRate( 5.0, stopInflow = false, stopOutflow = true); //  0.0</pre>
<br>
<h4>Notes</h4>
<p>Rates are usually set by flow components and have to observe the flow-restrictions with regard to a connected stock component. By Modelica conventions a negative rate for the flow indicates an inflow with regard to the connected stock, while a positive rate indicates an outflow for the stock.</p>
<p>Thus, in the first example above the indicated negative rate for a &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.FlowPort\">FlowPort </a>would mean an outflow from the flow component and an inflow with regard to the connected &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort</a>. Observing the flow restriction signaled by the stock the acutal rate is set to zero.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.constrainedRateBoolean\">constrainedRateBoolean</a></p>
</html>", revisions = "<html>
<ul>
<li>Added <code>Inline = true</code> in v2.1.0.</li>
</ul>
<html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end constrainedRate;
