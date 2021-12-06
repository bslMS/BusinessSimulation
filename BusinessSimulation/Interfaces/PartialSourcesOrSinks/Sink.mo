within BusinessSimulation.Interfaces.PartialSourcesOrSinks;

partial model Sink "Outflow to a stock with infinity capacity"
  extends Basics.GenericSourceOrSink;
  extends Icons.Sink;
protected
  // a positive rate should drain the stock (which here matches Modelica's rule for flows)
  OutputType rate(min = 0);
equation
  // observe stock signals and constraints
  assert(rate >= 0, "Rate must be positive and will be set to zero", level = AssertionLevel.warning);
  massPort.rate = Functions.constrainedRate(max(rate, 0), massPort.stopInflow, massPort.stopOutflow);
  // report current rate of flow via output connectors
  // so that it may be used directly as exogenous rate by another sink element (e.g., positive rate!)
  y = massPort.rate;
  y1 = massPort.rate;
  y2 = massPort.rate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.GenericSourceOrSink\">GenericSourceOrSink</a> base class. This partial class can be used to model <em>Sink</em> components using equations to assign a value to the Real variable <code>rate.</code></p>
<h4>Notes</h4>
<p>Only positive values should be assigned to <code>rate</code>&nbsp;and accordingly negative values will cause a warning.</p>
</html>"), __Wolfram(itemFlippingEnabled = true), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Sink;
