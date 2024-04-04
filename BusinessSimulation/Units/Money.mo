within BusinessSimulation.Units;

type Money = ExtensiveQuantity(quantity = "Money", unit = "XXX") "Money [¤]" annotation(Documentation(info = "<html>
<p>Anything used as a medium of exchange, a unit of accounting, and a store of value (base unit = 'XXX').</p>
<h4>Notes</h4>
<ul>
<li>In using the base unit <code>XXX</code> we interpret ISO 4217 to mean \"<em>unspecified</em> currency\" and thus we can use this unit whenever we refer to some general currency unit.</li><br>
<li>In Wolfram System Modeler, the symbol ¤ is used in Model Center and Simulation Center.</li><br>
</ul>
</html>", revisions = "<html>
<ul>
<li>Modified <code>unit = \"XXX\"</code> in v2.2.</li>
</ul>
</html>"));
