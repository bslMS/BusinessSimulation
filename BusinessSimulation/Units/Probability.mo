within BusinessSimulation.Units;

type Probability = Fraction(final min = 0, final max = 1) "Probability [1]" annotation(Documentation(info = "<html>
<p>A dimensionless measure between zero and one, e.g., probability, membership of fuzzy set, or unit scale utility.</p>
</html>"));
