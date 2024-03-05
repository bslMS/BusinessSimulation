within BusinessSimulation.Functions;

function stringToTimeBase "Find the corresponding element of the TimeBases enumeration for a given time base string"
  extends BusinessSimulation.Icons.Function;
  import BusinessSimulation.Types.TimeBases;
  import Modelica.Utilities.Strings.isEqual;
  input String timeBaseString "String for a time base given in lower case";
  output TimeBases timeBase "Element in the enumeration corresponding to the string given";
protected
  Boolean ignoreCase = false "= true, to set caseSensitive flag to true";
algorithm
  timeBase := if isEqual(timeBaseString, "minute", ignoreCase) or isEqual(timeBaseString, "min", ignoreCase) then TimeBases.minutes else if isEqual(timeBaseString, "hour", ignoreCase) or isEqual(timeBaseString, "hours", ignoreCase) or isEqual(timeBaseString, "h", ignoreCase) then TimeBases.hours else if isEqual(timeBaseString, "day", ignoreCase) or isEqual(timeBaseString, "days", ignoreCase) or isEqual(timeBaseString, "d", ignoreCase) then TimeBases.days else if isEqual(timeBaseString, "week", ignoreCase) or isEqual(timeBaseString, "weeks", ignoreCase) or isEqual(timeBaseString, "wk", ignoreCase) then TimeBases.weeks else if isEqual(timeBaseString, "month", ignoreCase) or isEqual(timeBaseString, "months", ignoreCase) or isEqual(timeBaseString, "mo", ignoreCase) then TimeBases.months else if isEqual(timeBaseString, "quarter", ignoreCase) or isEqual(timeBaseString, "quarters", ignoreCase) or isEqual(timeBaseString, "qtr", ignoreCase) then TimeBases.quarters else if isEqual(timeBaseString, "year", ignoreCase) or isEqual(timeBaseString, "years", ignoreCase) or isEqual(timeBaseString, "yrCal", ignoreCase) or isEqual(timeBaseString, "y", ignoreCase) then TimeBases.years else TimeBases.seconds;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The function will return the element of the enumeration <code>Types.TimeBases</code> that corresponds to a given unit of time given as a string. The string should be given in lower case letters and should be given either as a word or the unit symbol. If there is no match, the function will default to <code>TimeBases.second</code>.</p>
<h4>Syntax</h4>
<br>
<pre>Functions.stringToTimeBase( timeBaseString ); &nbsp; // the string is to be given as lower case<br><br></pre>
<h4>Examples</h4>
<br>
<pre>stringToTimeBase( \"month\" ); &nbsp; // TimesBases.months<br>stringToTimeBase(&nbsp;\"yrCal\" );   // TimeBases.years</pre>
</html>", revisions = "<html>
<ul>
<li>As of v2.2 the strings <em>\"year\", \"years\", \"yrCal\", \"y\"</em> may be used to indicate <code>TimeBases.years</code>.</li><br>
</ul>
<html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end stringToTimeBase;
