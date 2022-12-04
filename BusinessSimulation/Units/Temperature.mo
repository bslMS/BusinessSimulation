within BusinessSimulation.Units;

type Temperature = IntensiveQuantity(final quantity = "ThermodynamicTemperature", final unit = "K", min = 0.0, start = 288.15, nominal = 300, displayUnit = "degC") "AbsoluteTemperature [K]" annotation(absoluteValue = true, Documentation(info = "<html>
<p>Absolute temperature (use type TemperatureDifference for relative temperatures).</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"));
