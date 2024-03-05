within BusinessSimulation.Interfaces.PartialFlows;

partial model UnidirectionalFlow "Flow from Stock A to Stock B"
  extends Basics.GenericFlow;
  extends Icons.UnidirectionalFlow;
  extends Basics.ThreeSO_rate;
protected
  // positive rates will drain the conected stock (e.g., flow from A to B)
  Real A_rate(min = 0) "Indicted rate for portA";
  Real B_rate(max = 0) "Indicted rate for portB";
  Boolean useA_rate "= true, if indicated rate for portA meets constraints";
  Boolean useB_rate "= true, if indicated rate for portB meets constraints";
initial equation
  // make sure that discrete vars are properly initialized
  pre(useA_rate) = Functions.constrainedRateBoolean(A_rate < 0, portA.stopInflow, portA.stopOutflow) and A_rate > 0;
  pre(useB_rate) = Functions.constrainedRateBoolean(B_rate < 0, portB.stopInflow, portB.stopOutflow);
equation
  // set indicated rates according to flow rules
  A_rate = -B_rate;
  // make sure that stock constraints are met
  useA_rate = A_rate > 0 and not portA.stopOutflow;
  // A_rate > 0 => isInflow = false
  useB_rate = not portB.stopInflow;
  // B must be less than 0 thus only one check needed
  portA.rate = if useA_rate and useB_rate then A_rate else 0;
  portB.rate = -portA.rate;
  // report the actual rate of flow at Port A
  y = portA.rate;
  y1 = portA.rate;
  y2 = portA.rate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>Partial model extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.GenericFlow\">GenericFlow</a> base class. This is a generic class for <em>unidirectional</em> flow components where the value for the rate at port A (<code>A_rate</code>) can be set by an equation. The rate has to be positive; negative values will cause a warning.</p>
<h4>Notes</h4>
<ul>
<li>The unidirectional flow will only allow flows from source (A) to destination (B). A positive rate is associated with the A-side port (<code>portA</code>) and will thus drain the stock connected to it.</li><br>
<li>The rate of flow at port B is given by the equation <code>B_rate = - A_rate</code>.</li>
</ul>
<ul>
<li>The flow-element will observe the Boolean flags of the connected stocks (e.g., <em>stopOutflow</em> or <em>stopInflow</em>) on both ports which may override the intended rate to give zero flow.</li>
</ul>
</html>", revisions = "<html>
<ul>
<li>Minor modifications for <code>useA_rate</code> and <code>useB_rate</code> expressions in v2.1.0.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end UnidirectionalFlow;
