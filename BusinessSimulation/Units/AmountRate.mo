within BusinessSimulation.Units;

type AmountRate = Rate(quantity = "AmountRate", unit = "each/s") "AmountRate [each/s]" annotation(Documentation(info = "<html>
<p>Rate of flow for some amount measured in each per second.</p>
</html>", revisions = "<html>
<ul>
<li>Added in v2.0.0.</li><br>
</ul>
<html>"));
