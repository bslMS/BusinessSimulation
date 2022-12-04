within BusinessSimulation;

package Constants "Mathematical and other constants"
  import BusinessSimulation.Types.TimeBases;
  import BusinessSimulation.Units.Amount;
  extends Icons.Package;
  final constant Real e = Modelica.Constants.e "Euler's number also known as Napier's constant";
  final constant Real eps = ModelicaServices.Machine.eps "Biggest number such that 1.0 + eps = 1.0";
  final constant Real inf = Modelica.Constants.inf "Infinity";
  final constant Real INF = inf "Infinity";
  final constant Real pi = Modelica.Constants.pi "Ratio of a circle's circumference to its diameter (π)";
  final constant Real small = ModelicaServices.Machine.small "Smallest number such that small and -small are representable on the machine";
  final constant String timeBaseUnits[TimeBases] = {"s", "min", "h", "d", "wk", "mo", "qtr", "yr"} "Unit strings for model time bases";
  final constant String timeBaseRateUnits[TimeBases] = {"1/s", "1/min", "1/h", "1/d", "1/wk", "1/mo", "1/qtr", "1/yr"} "Unit strings for rates matching time bases";
  final constant String rateStrings[TimeBases] = {"per second", "per minute", "per hour", "per day", "per week", "per month", "per quarter", "per year"} "Rate strings for different time bases";
  final constant Real timeBaseConversionFactors[TimeBases, TimeBases] = [1, 1 / 60, 1 / 3600, 1 / 86400, 1 / 604800, 1 / 2628000, 1 / 7884000, 1 / 31536000; 60, 1, 1 / 60, 1 / 1440, 1 / 10080, 1 / 43800, 1 / 131400, 1 / 525600; 3600, 60, 1, 1 / 24, 1 / 168, 1 / 730, 1 / 2190, 1 / 8760; 86400, 1440, 24, 1, 1 / 7, 12 / 365, 4 / 365, 1 / 365; 604800, 10080, 168, 7, 1, 84 / 365, 28 / 365, 7 / 365; 2628000, 43800, 730, 365 / 12, 365 / 84, 1, 1 / 3, 1 / 12; 7884000, 131400, 2190, 365 / 4, 365 / 28, 3, 1, 1 / 4; 31536000, 525600, 8760, 365, 365 / 7, 12, 4, 1] "Conversion factors for time base conversions";
  final constant Real unspecified = inf "Unspecified as an alias for 'inf' to indicate potential inputs in some cases";
  final constant Real unspec = zero "Unspecified as an alias for 'zero' to indicate potential inputs in some cases";
  final constant Real zero = -1e-10 "Constant that is negative but close enough to zero to be considered effectively zero";
  final constant Amount '1each' = 1 "Define the amount of one `each` for counting";
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This package contains some common constants that are considered useful for System Dynamics modeling and simulation.</p>
<h4>Notes</h4>
<p>It is generally advisable to set up models in SIunits of time so that they will be compatibale with models from other domains. To enter and display times and rates in a convenient fashion the <code>displayUnit</code> attribute should be used. This should be conveniently handled by Modelica tools which most often will allow to make such a choice by drop-down menu.</p>
<p>In that sense, the constants <code>timeBaseUnits</code> and <code>timeBaseConversionFactors</code> are usually not needed.</p>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.UsersGuide.Tutorial.UnitsInBusinessSimulations\">Tutorial.UnitsInBusinessSimulations</a>,
<a href=\"modelica://BusinessSimulation.Converters.TimeConversion\">TimeConversion</a></p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>", revisions = "<html>
<ul>
<li><code>timeBaseRateUnits[TimeBases]</code> added in v2.0.0</li><br>
<li><code>unspecified</code> and <code>unspec</code> added in v2.1.0</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {14.3, 18.868}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-80, -6.372}, {-80, -6.372}, {-76.12, -6.372}, {-76.12, -6.372}, {-60.75, 16.378}, {-9.64, 16.378}, {43.88, 16.378}, {43.88, 16.378}, {43.88, 32.798}, {43.88, 32.798}, {-11.12, 32.798}, {-66.12, 32.798}}, smooth = Smooth.Bezier), Polygon(visible = true, origin = {14.3, 18.868}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{16.84, 26.921}, {16.84, -51.493}, {33.13, -53.079}, {41.24, -38.779}, {41.24, -38.779}, {45.7, -38.779}, {45.7, -38.779}, {33.13, -75.549}, {6.87, -75.549}, {0, -43.079}, {5.157, 26.921}, {5.157, 26.921}, {16.84, 26.921}}, smooth = Smooth.Bezier), Polygon(visible = true, origin = {14.3, 18.868}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-38.493, 26.921}, {-44.229, -29.502}, {-70, -66.269}, {-52.476, -76.921}, {-33.577, -66.269}, {-28.493, 26.921}, {-28.493, 26.921}, {-38.493, 26.921}}, smooth = Smooth.Bezier)}));
end Constants;
