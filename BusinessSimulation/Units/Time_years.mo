within BusinessSimulation.Units;

type Time_years = Time(displayUnit = "yrCal") "Time [yrCal (y)]" annotation(Documentation(info = "<html>
<p>Time entered and displayed in average <em>Gregorian calendar</em> years (<code>displayUnit = \"yrCal\"</code>). An average Gregorian year spans 365.2425 days will average over regular and leap years in order to minimize deviation from the \"true\" duration of a solar year. It is the basis of most civil calendars in the world.</p>
<h4>Notes</h4>
<ul>
<li>Whenever we speak of \"years\" in the BSL, we will mean average Gregorian calendar years. If we take a model's time horizon to be between 10 to 20 years—a common span for simulations of social systems—the deviation from the \"true\" time span will be mere minutes, while using common or vague years will introduce an error of several days.</li><br>
<li>In fact, using this definition will ensure that deviations from the \"true\" amount of time between any two calendar dates will always be less than 0.5 days irrespective of the length of the time span.</li><br>
<li><code>yrCal</code> will display as <code>y</code> in Wolfram System Modeler.</li><br>
<li>The use of non-SI units of time requires definitions of additional derived units of time, which may not be permitted in all Modelica tools.</li><br>
<ul>
<h4>See also</h4>
<p>
<a href = \"https://en.wikipedia.org/wiki/Gregorian_calendar\">Wikipedia: Gregorian calendar</a>,
<a href = \"modelica://BusinessSimulation.Units.Time_quarters\">Time_quarters</a>,
<a href = \"modelica://BusinessSimulation.Units.Time_months\">Time_months</a>
</p>
</html>", revisions = "<html>
<ul>
<li>Changed to Gregorian mean calendar years in v2.2.</li><br>
</ul>
</html>"));
