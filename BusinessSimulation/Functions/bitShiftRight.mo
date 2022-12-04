within BusinessSimulation.Functions;

encapsulated function bitShiftRight "n >> k"
  import BusinessSimulation.Icons.Function;
  extends Function;
  input Integer n "Integer value whose binary bits are to be shifted";
  input Integer k = 1 "Integer places to be shifted (default = 1)";
  output Integer res "Integer value of the shifted bits";
algorithm
  res := integer(n / 2 ^ k);
  annotation(Inline = true, Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>res</strong> corresponds to the binary bits of the input <strong>n</strong> shifted <strong>k</strong> places to the right.</p>
<h4>Syntax</h4>
<br>
<pre>
Functions.<strong>intBitShiftRight</strong>(n);  // k = 1
Functions.<strong>intBitShiftRight</strong>(n,k);
</pre>
<br>
<h4>Implementation</h4><br>
<pre>res := integer(n/2^k);</pre><br>
<h4>Examples</h4>
<br>
<pre>
intBitShiftRight(10)  ; // 5.0
intBitShiftRight(32,3); // 4.0
</pre>
<br>
<h4>Notes</h4>
<p>Negative values for <strong>k</strong> will shift to the <em>left</em>.</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.1.0.</li>
</ul>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end bitShiftRight;
