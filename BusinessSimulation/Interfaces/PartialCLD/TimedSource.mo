within BusinessSimulation.Interfaces.PartialCLD;

partial model TimedSource "Partial class for flow port with timing"
  extends FlowPort;
  // timing
  parameter TimingChoices tc = TimingChoices.permanent "Select whether contoll is permanent or timed" annotation(Evaluate = true, Dialog(group = "Timing"));
  parameter Time onTime(min = 0) = modelSettings.modelStartTime "Time for component to become effective" annotation(Dialog(group = "Timing", enable = tc == TimingChoices.period));
  parameter Time offTime(min = 0) = modelSettings.modelTimeHorizon "Time for component to become ineffective" annotation(Dialog(group = "Timing", enable = tc == TimingChoices.period));
  outer ModelSettings modelSettings;
  encapsulated type TimingChoices = enumeration(permanent "Permanent control", period "On-off control");
protected
  InformationSources.PulseInput onOff(width = 100, nperiod = 1, startTime = onTime, offset = 0, amplitude = 1, period = offTime - onTime) if tc == TimingChoices.period annotation(Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ConstantConverter permanent(value = 1) if tc == TimingChoices.permanent annotation(Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>A single flow port with two output connectors (optional) and parameters and converters to enable on-off-control (timing) for the flow.</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TimedSource;
