within BusinessSimulation.Units;

type UnitScaleIntangibles = Amount(quantity = "IntangibleAssets", min = 0.0, max = 1.0, displayUnit = "percent") "Intangibles measured on the unit scale [percent]" annotation(Documentation(info = "<html>
<p>Intangibles like reputation or informational/psychological resources measured on a dimensionless unit scale.</p>
</html>"));
