within BusinessSimulation.Units;

type UnitScaleIntangibles = Probability(quantity = "IntangibleAssets", displayUnit = "percent") "Intangibles measured on the unit scale [1]" annotation(Documentation(info = "<html>
<p>Intangibles like reputation or informational/psychological resources measured on a dimensionless unit scale.</p>
</html>", revisions = "<html>
<ul>
<li>Added <code>final unit = \"1\"</code> in v2.2.</li><br>
</html>"));
