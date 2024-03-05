within BusinessSimulation.Functions;

function shiftList "Shift a list n steps, report carry, and fill gaps"
  extends BusinessSimulation.Icons.Function;
  input Real[:] list "List of values to be shifted";
  input Integer n "Number of steps to shift the list( n < 0 => shift to the left)";
  input Real fill = 0 "Value to fill the gaps with (default = 0)";
  output Real[size(list, 1)] shiftedList "Shifted list";
  output Real carry "Sum of elements that were pushed out of range by the shift";
protected
  Integer length = size(list, 1) "Length of the list of values";
  Integer nAbs = min(abs(n), length) "Absolute value of n, clipped to never be larger than length";
algorithm
  if n == 0 then
    // do nothing really
    carry := 0.;
    shiftedList := list;
  elseif n < 0 then
    // shift left
    carry := sum(list[1:nAbs]);
    shiftedList := if nAbs < length then cat(1, list[nAbs + 1:end], zeros(nAbs)) else zeros(nAbs);
  else
    // n > 0
    // shift right
    carry := sum(list[end - nAbs + 1:end]);
    shiftedList := if nAbs < length then cat(1, zeros(nAbs), list[1:end - nAbs]) else zeros(nAbs);
  end if;
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The function will return a list shifted by <code>n</code> places (<code>n &lt; 0</code> &rArr; shift to the left), where the elements \"pushed\" out of range are added up and reported as <code>carry</code>. The gaps will be shifted with the real value <code>fill</code>, which by default is set to 0.</p>
<h4>Syntax</h4>
<br>
<pre>
Functions.<strong>shiftList</strong>( list, n );        // fill by default is set to zero
Functions.<strong>shiftList</strong>( list, n, fill );  // explicitly give a real value for fill</pre><br>
<h4>Examples</h4>
<pre>shiftList( {1, 2, 3, 4, 5},  0); &nbsp; // ( {1, 2, 3, 4, 5}, 0. )<br>shiftList(&nbsp;{1, 2, 3, 4, 5}, -2);   // ( {3, 4, 5, 0, 0}, 3. )<br>shiftList( {1, 2, 3, 4, 5},  2);   // ( {0, 0, 1, 2, 3}, 9. )</pre></html>", revisions = "<html>
<ul>
<li>Added <code>Inline = true</code> in v2.1.0.</li>
</ul>
<html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end shiftList;
