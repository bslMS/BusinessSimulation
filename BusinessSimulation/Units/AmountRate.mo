within BusinessSimulation.Units;

type AmountRate = Rate(quantity = "Throughput", unit = "each/s") "Amount rate/Throughput [each/s]" annotation(Documentation(info = "<html>
<p>The throughput of some amount, e.g., basically a flow of discretely counted entities, measured in <code>each/s</code>.</p>
<h4>Notes</h4>
<ul>
<li>While <code>Rate</code> can be used for fractional rates of flow or for the throughput of a continuously measured, dimensionless quantity, <code>AmountRate</code> is to be used for the throughput of discretely countable entities like people, tangible assets, and material.</li><br>
<li>Using <code>Rate</code> for a fractional rate allows unit checking to catch unit mismatch in cases when a fractional rate has not been multiplied by some amount.</li><br>
<li><code>AmountRate</code> is similar to the <code>MolarFlowRate</code> used in Chemistry: We can succinctly describe flows of similar substances, i.e., entities, while avoiding the need to name each and every entity—an advantage with regard to component reuse.</li><br>
<li>In Wolfram System Modeler, the unit <code>each/s</code> will be shown as <code>#/s</code> in Model Center and Simulation Center.</li><Br>
</ul>
</html>", revisions = "<html>
<ul>
<li>Added in v2.0.0.</li><br>
<li>Changed <code>quantity</code> from \"AmountRate\" to \"Throughput\" in v2.2.</li><br>
</ul>
<html>"));
