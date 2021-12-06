within BusinessSimulation.Interfaces.PartialSourcesOrSinks;

partial model SourceOrSink "Source or sink with regard to a connected stock"
  extends Basics.GenericSourceOrSink;
  extends Icons.SourceOrSink;
protected
  // positive rate should fill the connected stock stock; negative rate should drain it
  OutputType rate;
equation
  // switch signs in accordance with Modelica's rule for rates
  // observe constraining signals from stock
  massPort.rate = Functions.constrainedRate(-rate, massPort.stopInflow, massPort.stopOutflow);
  // report current rate of flow via output connectors so that it can be used as exogenous input for another source or sink (e.g., switch signs!)
  y = -massPort.rate;
  y1 = -massPort.rate;
  y2 = -massPort.rate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.GenericSourceOrSink\">GenericSourceOrSink</a> base class. This partial class can be used to model <em>SourceOrSink</em> components using equations to assign a value to the Real variable <code>rate</code>.</p>
<h4>Notes</h4>
<p>A positive value for <code>rate</code> will fill the connected stock; the reported rate (<code>y, y1, y2</code>) will follow this convention.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SourceOrSink;
