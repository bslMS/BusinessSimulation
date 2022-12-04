within BusinessSimulation.Interfaces.PartialFlows;

partial model Interaction "Describes two separate flows to or from sinks or sources"
  extends Basics.GenericFlow;
  extends Basics.Interaction4SO;
  extends Icons.Interaction;
protected
  // positive rates will fill the conected stock (think of the rates as A's and B's inflow!)
  // indicated rates (may be overriden by stock restrictions)
  Rate A_rate "Indicated rate for portA";
  Rate B_rate "Indicated rate for portB";
  // acutal rates
  Rate setA_rate "Rate to be used for portA meeting the constraints imposed by the stock";
  Rate setB_rate "Rate to be used for portB meeting the constraints imposed by the stock";
equation
  // Children of this class need to procvide eplicit equations for A_rate and B_rate
  // make sure that stock constraints are met
  // positive values for A_rate and/or B_rate mean, that the connected stock will be filled
  setA_rate = Functions.constrainedRate(-A_rate, portA.stopInflow, portA.stopOutflow);
  setB_rate = Functions.constrainedRate(-B_rate, portB.stopInflow, portB.stopOutflow);
  // set flow to zero if constraints are not met
  portA.rate = setA_rate;
  portB.rate = setB_rate;
  // report the rate of flow at Port A
  y_A = -portA.rate;
  y1_A = -portA.rate;
  y_B = -portB.rate;
  y1_B = -portB.rate;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>Partial model extending from the &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Basics.GenericFlow\">GenericFlow</a> base class. This is a generic class for <em>interactional</em> flow components where the values for the rates at port A (<code>A_rate</code>) and B (<code>B_rate</code>) can be set by equations. Positive rates will fill the connected stocks, while negative rates will drain them.</p>
<h4>Notes</h4>
<ul>
<li>The flow-element will observe the Boolean flags of the connected stocks (e.g., <em>stopOutflow</em> or <em>stopInflow</em>) on both ports which may override the intended rate to give zero flow.</li>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Interaction;
