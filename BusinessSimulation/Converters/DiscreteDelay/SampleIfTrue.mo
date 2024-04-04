within BusinessSimulation.Converters.DiscreteDelay;

block SampleIfTrue "Samples input, if Boolean trigger is true"
  import BusinessSimulation.Units.*;
  import BusinessSimulation.Types.InitializationOptions;
  import BusinessSimulation.Constants.{inf, small, eps, e};
  extends Interfaces.PartialConverters.SmoothSISO(redeclare discrete RealOutput y);
  extends Icons.DiscreteSmoothLabel;
  Interfaces.Connectors.BooleanInput trigger "Triggers sampling upon `true`" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0.12, 49.88}, extent = {{-10.12, -10.12}, {10.12, 10.12}}, rotation = -450)));
  parameter OutputType initialValue = 0 "Initial Value to be reported before sampling starts" annotation(Dialog(enable = not init == InitializationOptions.SteadyState));
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
  when trigger then
    y := u;
  end when;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The (discrete) output <strong>y</strong> is sampled from the input <strong>u</strong> whenever the Boolean input <code>trigger</code> becomes <code>true</code>.</p>
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
<a href=\"modelica://BusinessSimulation.Converters.DiscreteDelay.Sampler\">Sampler</a>
</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {0, 12.5}, textColor = {0, 0, 128}, extent = {{-51.371, -12}, {51.371, 12}}, textString = "SAMPLE", fontName = "Lato", textStyle = {TextStyle.Bold}), Bitmap(visible = true, origin = {178.304, 50}, fileName = "", imageSource = "iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGeYUxB9wAAACBjSFJNAAB6JQAAgIMAAPn/AACA6AAAUggAARVYAAA6lwAAF2/XWh+QAAAB7klEQVR42mJsufTiPwMZACCAWP5//4Fd4tcnBsndRQzyn/aA+Q/5XBieu/Yx/GHjA/MBAojl3zfsGmWOlDHo/N7DoKEA4Qu83MPAfKCM4Z7NBDAfIIBY/uKwUebtDrAmDlYIX0OcgeHDgx0Mt6HqAQKI5Q8OjbgATD1AALH8xuHUJ8IeDDde7gDbBAI3XkLEYOoBAojlF5Dx69dvhrev34MFePm4GXh4uRkuCqcw/P39B+g8ROBcAYrBNAIEEMuXT18Y3rx6z2Ctp8hgoCbNMHfTcYY/QIM4uTgYTgjlgDEc/AIREI0AAcTy+uU7BjtDZYZkP0uGn7/+MOSFOzBMXHGA4dfP3wzs7KwM////Z/j06SvDnz9/wRp4eLjA4gABxGRvpMKQEWjN8PfvPzCWEOJjSAPyQbZ+/vyN4cOHLwwC3BwMsV5mDN7W2gw/f/wEiwMEEOOPn7///wDa9PP3bwYwDcQg+tGLdwwLt55kYGVlYQhxNADb9gNo2Kt3nxkOXbjLABBATH/+AW0C4j9QG2G0iAAPQ5iLETDg/jDce/oGIg5Ux83FzmCqJccAEEBMCMX/Ic5FMkiIj4vBz06X4fiVBwwPnr+Fe4eLnY0BIIBYYDaAFf/7B5f8CzVMgJeTwcdGG+yFPyDDoeoAAgwAAiQQgeLRB5kAAAAASUVORK5CYII=", extent = {{-1.696, -0}, {1.696, 0}}), Text(visible = true, origin = {0, -12.5}, textColor = {0, 0, 128}, extent = {{-51.371, -12}, {51.371, 12}}, textString = "IF TRUE", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end SampleIfTrue;
