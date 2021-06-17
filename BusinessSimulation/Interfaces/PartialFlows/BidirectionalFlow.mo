within BusinessSimulation.Interfaces.PartialFlows;

partial model BidirectionalFlow "Generic bi-directional flow between two stocks"
  import BusinessSimulation.Units.Rate;
  extends Basics.GenericFlow;
  extends Icons.BidirectionalFlow;
  extends Basics.ThreeSO_rate;
protected
  // indicated rates; positive rates will drain the conected stock
  Rate A_rate "Indicated rate for portA";
  Rate B_rate "Indicated rate for portB";
  Boolean useA_rate "= true, if indicated rate for portA meets restrictions";
  Boolean useB_rate "= true, if indicated rate for portB meets restrictions";
initial equation
  // make sure that discrete vars are properly initialized
  pre(useA_rate) = Functions.constrainedRateBoolean(A_rate, portA.stopInflow, portA.stopOutflow);
  pre(useB_rate) = Functions.constrainedRateBoolean(B_rate, portB.stopInflow, portB.stopOutflow);
equation
  // set indicated rates according to flow rules
  A_rate = -B_rate;
  // make sure that stock constraints are met
  useA_rate = Functions.constrainedRateBoolean(A_rate, portA.stopInflow, portA.stopOutflow);
  useB_rate = Functions.constrainedRateBoolean(B_rate, portB.stopInflow, portB.stopOutflow);
  // set flow to zero if constraints are not met
  portA.rate = if useA_rate and useB_rate then A_rate else 0;
  portB.rate = -portA.rate;
  // report the actual rate of flow at Port A
  y = portA.rate;
  y1 = portA.rate;
  y2 = portA.rate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.GenericFlow\">GenericFlow</a> base class. This is a generic class for <em>bi-directional</em> flow components where the value for the rate at port A (<code>A_rate</code>) can be set by an equation.</p>
<h4>Notes</h4>
<ul>
<li>A positive rate is associated with a flow from the stock connected to port A (portA) to the one connected to port B, while a negative rate will indicate a flow from B to A.</li><br>
<li>The rate of flow at port B is given by the equation <code>B_rate = - A_rate</code>.</li><br>
<li>The flow-element will observe the stock-signals (e.g. <em>stopOutflow</em> or <em>stopInflow</em>) on both ports which may override the intended rate to give zero flow.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BidirectionalFlow;
