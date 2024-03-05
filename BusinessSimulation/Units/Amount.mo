within BusinessSimulation.Units;

type Amount = ExtensiveQuantity(quantity = "Amount", unit = "each") "Amount [each]" annotation(Documentation(info = "<html>
<p>Counting numbers of entities or substance (base unit = 'each').</p>
<h4>Notes</h4>
<ul>
<li>We can think of <code>each</code> as the <code>mole</code> for social sciences, where we will essentially be counting <em>discrete</em> entities as opposed to measuring a quantity on the real plane.</li><br>
<li>In System Modeler, the base unit <code>each</code> will be represented by the number sign (<code>#</code>) in Model Center and Simulation Center.</li><br>
</ul>
</html>"));
