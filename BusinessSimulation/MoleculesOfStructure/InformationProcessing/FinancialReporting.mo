within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

model FinancialReporting "Periodic reporting of a financial flow for the past accounting period"
  import BusinessSimulation.Units.Time;
  extends Interfaces.PartialConverters.InformationProcessing_SO;
  Interfaces.Connectors.RealInput u "Actual rate of financial flow" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-113.106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // parameter
  parameter Time reportingPeriod = 1 "Accounting period";
  parameter Time offsetFirstReporting = reportingPeriod "The first report will be issued at startTime + offsetFirstRporting";
  parameter Real initialValue = 0 "Initial reported value (value to be reported until the first reporting date)";
protected
  Converters.Gap gap annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.Sampler previousValue(samplingPeriod = reportingPeriod, offsetStartTime = offsetFirstReporting, initialValue = 0) "Reported flow for the previous reporting period" annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.Sampler currentValue(samplingPeriod = reportingPeriod, offsetStartTime = offsetFirstReporting, initialValue = initialValue) "Reported actual flow at the end of each reporting period" annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.DiscreteDelay.DelayFixed delayedAccountingFlow(delayTime = reportingPeriod, initialValue = 0, hasConstantDelayTime = true, hasExogenousHistory = false, init = BusinessSimulation.Types.InitializationOptions.FixedValue) "Accounting flow delayed for one accounting period" annotation(Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange cumulating_previous "Previous flow" annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel accruedPreviousFlow(initialValue = 0, init = BusinessSimulation.Types.InitializationOptions.FixedValue, redeclare replaceable type OutputType = OutputType) "Cumulative value for the delayed flow" annotation(Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SourcesOrSinks.ExogenousChange cumulating_actual "Current flow" annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Stocks.InformationLevel accruedFlow(init = BusinessSimulation.Types.InitializationOptions.FixedValue, redeclare replaceable type OutputType = OutputType) "Cumulative flow for the reporting period" annotation(Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, delayedAccountingFlow.u) annotation(Line(visible = true, origin = {-113.588, -10}, points = {{-31.412, 10}, {5.841, 10}, {5.841, -10}, {14.226, -10}}, color = {0, 0, 127}));
  connect(delayedAccountingFlow.y, cumulating_previous.u) annotation(Line(visible = true, origin = {-70.155, -23.333}, points = {{-10.311, 3.333}, {5.155, 3.333}, {5.155, -6.667}}, color = {0, 0, 127}));
  connect(u, cumulating_actual.u) annotation(Line(visible = true, origin = {-96.158, 7.3}, points = {{-48.842, -7.3}, {-18.364, -7.3}, {-18.364, 12.7}, {31.158, 12.7}, {31.158, 2.7}}, color = {0, 0, 127}));
  connect(cumulating_actual.massPort, accruedFlow.inflow) annotation(Line(visible = true, origin = {-35, 0}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(accruedFlow.y, currentValue.u) annotation(Line(visible = true, origin = {0.213, 16.8}, points = {{-5.213, -6.4}, {-5.213, 3.2}, {10.425, 3.2}}, color = {0, 0, 127}));
  connect(accruedPreviousFlow.y, previousValue.u) annotation(Line(visible = true, origin = {0.213, -23.2}, points = {{-5.213, -6.4}, {-5.213, 3.2}, {10.425, 3.2}}, color = {0, 0, 127}));
  connect(cumulating_previous.massPort, accruedPreviousFlow.inflow) annotation(Line(visible = true, origin = {-35, -40}, points = {{-15, 0}, {15, 0}}, color = {128, 0, 128}));
  connect(currentValue.y, gap.u1) annotation(Line(visible = true, origin = {43.091, 12.5}, points = {{-13.557, 7.5}, {-3.091, 7.5}, {-3.091, -7.5}, {18.909, -7.5}}, color = {0, 0, 127}));
  connect(previousValue.y, gap.u2) annotation(Line(visible = true, origin = {43.091, -12.5}, points = {{-13.557, -7.5}, {-3.091, -7.5}, {-3.091, 7.5}, {18.909, 7.5}}, color = {0, 0, 127}));
  connect(gap.y, y) annotation(Line(visible = true, origin = {88.681, 0}, points = {{-11.319, 0}, {71.319, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>In a continuous time simulation financial flows will show their current value at any time. While this is a clear advantage of a simulation&mdash;we will never know the true current rates in reality&mdash;we would often like to show the average flow with regard to a defined accounting period as it is typical for financial reporting (e.g., at the end of an acounting period the Finance Department will report a single value for the average revenue in the past period in monetary units per period).</p>
<p>The <em>FinancialReporting</em> component will report such an averaged flow by showing the difference between the actual flow and the flow delayed by exactly the length of the accounting period. This difference will be sampled at the end of any accounting period during the simulation time horizon. During the accounting period the last reported value will be kept constant.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Reporting", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Financial", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -60}, {148.5, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end FinancialReporting;
