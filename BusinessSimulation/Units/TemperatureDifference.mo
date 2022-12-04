within BusinessSimulation.Units;

type TemperatureDifference = IntensiveQuantity(final quantity = "ThermodynamicTemperature", final unit = "K", displayUnit = "degC") "TemperatureDifference [K]" annotation(absoluteValue = false, Documentation(info = "<html>
<p>Difference of temperatures using <code>annotation(absoluteValue = false)</code> to disregard <em>off</em> value for conversions.</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"));
