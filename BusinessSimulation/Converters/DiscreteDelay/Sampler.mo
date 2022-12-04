within BusinessSimulation.Converters.DiscreteDelay;

block Sampler "Ideal periodic sampler of input"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Constants.{inf,small,eps,e};
  extends Interfaces.PartialConverters.SmoothSISO(redeclare discrete RealOutput y);
  extends Icons.DiscreteSmoothLabel;
  parameter Time samplingPeriod(min = small) "Interval at which to sample the input" annotation(Evaluate = true);
  parameter Time offsetStartTime = samplingPeriod "Sampling will begin at startTime = modelStartTime + offsetStartTime";
  parameter OutputType initialValue = 0 "Initial Value to be reported before startTime" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
  parameter InitializationOptions init = modelSettings.init "Provide InitializationOptions (Free, FixedValue, SteadyState)" annotation(Evaluate = true, Dialog(tab = "Advanced"));
  outer ModelSettings modelSettings;
protected
  parameter Real initialOutput(start = initialValue, fixed = false) "Initial output for the sampler" annotation(Dialog(tab = "Initialization", enable = false));
initial equation
  if init == InitializationOptions.FixedValue then
    initialOutput = initialValue;
  elseif init == InitializationOptions.SteadyState then
    initialOutput = u;
  end if;
  pre(y) = initialOutput;
algorithm
  when sample(modelSettings.modelStartTime + offsetStartTime, samplingPeriod) then
    y := u;
  end when;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation Library (BSL).</p>
<p>The (discrete) output <strong>y</strong> is obtained by sampling every <code>samplingPeriod</code> starting at <code>modelSettings.modelStartTime + offsetStartTime</code> from the input <strong>u</strong>.</p>
<h4>Notes</h4>
<ul>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial output <strong>y</strong> to be given before the sampling starts.</li><br>
<li><em>SteadyState</em> will set the initial output <strong>y</strong> equal to the initial input <strong>u</strong>.</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free to find an initial output using <code>initialValue</code> as an initial guess.</li>
</ul>
</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.SampleIfTrue\">SampleIfTrue</a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-51.371, -12}, {51.371, 12}}, textString = "SAMPLER", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Sampler;
