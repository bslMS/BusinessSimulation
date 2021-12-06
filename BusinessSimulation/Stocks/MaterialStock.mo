within BusinessSimulation.Stocks;

model MaterialStock "Reservoir that cannot be drained below zero"
  import BusinessSimulation.Constants.{small,zero};
  import BusinessSimulation.Types.InitializationOptions;
  extends Interfaces.PartialStocks.BasicStock(initialValue(min = 0), minValue = zero);
  extends Icons.MaterialStockIndicator;
  parameter Boolean reinitializeStock = false "= true, if the stock is to be reinitalized to guarante nonnegativity" annotation(Evaluate = true, Dialog(tab = "Advanced"));
initial equation
  // properly initialize discrete vars with fixed = false
  // inflow to stock is unrestricted
  pre(inflow.stopInflow) = false;
  pre(outflow.stopInflow) = false;
  // provide Boolean signal in case of negative stock
  pre(inflow.stopOutflow) = not x > small;
  pre(outflow.stopOutflow) = pre(inflow.stopOutflow);
equation
  // inflow to stock is unrestricted
  inflow.stopInflow = false;
  outflow.stopInflow = false;
  // provide Boolean signal in case of negative stock
  inflow.stopOutflow = not x > small;
  outflow.stopOutflow = inflow.stopOutflow;
  // optional reinitialize stock to zero if negative //
  if reinitializeStock then
    when x < 0 then
      reinit(x, 0);
    end when;
  end if;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is a restricted&nbsp;<em>reservoir</em> of the System Dynamics methodology, which accumulates <em>material &nbsp;</em>(i.e., countable entities, some kind of mass) transported by flow components connected to the component's StockPorts. The&nbsp;<em>MaterialStock&nbsp;</em>can never become negative &ndash;&nbsp;we are not collecting \"antimatter\"&nbsp;&ndash; and will prevent connected flow components from draining its value below zero.</p>
<h4>Implementation</h4>
<p>The value of the stock will be set to zero if the calculated value <code>x</code> is less than a very small positive amount and if <code>reinitializeStock = true</code> is chosen in the Advanced tab:</p>
<pre>  if reinitializeStock then
    when x < 0 then
      reinit(x, 0);
    end when;
  end if;</pre>
<p><em>MaterialStock</em> components will prevent connected flows from draining the stock via their &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort </a>connectors' Boolean flags, should the calculated value <code>x</code> be less than a very small positive amount:</p>
<pre>  inflow.stopOutflow = not x > small;
  outflow.stopOutflow = inflow.stopOutflow;</pre><br>
<h4>Notes</h4>
<ul>
<li>The <code>inflow</code> and <code>outflow</code> &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPorts </a>are only indicative; in general the reservoir may be filled or drained by flows connected to either port.</li><br>
<li>The parameters <code>maxValue</code> and <code>minValue</code> allow to define an <em>admissable</em> range. It can be monitored by an <code>assert</code> using <code>useAssert = true</code> in the Advanced tab. The switch <code>causeError</code> controls whether an <em>error</em> or a <em>warning</em> is to be raised.</li><br>
</ul>
<ul>
<li>The parameter <code>init</code> in the Advanced tab allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br><br>
<ul>
<li><em>FixedValue</em> (default) will use the parameter <code>initialValue</code> to determine the initial value.</li><br>
<li><em>SteadyState</em> will introduce the equation <code>der(x) = 0</code> in order to find an initial value that establishes equilibrium. <br>(Note: Such a solution may not exist and to avoid trivial solution in many cases <code>initialValue</code> -- in this case used as a start value for numerical iteration -- should be set to a value different from zero.)</li><br>
<li><em>Free</em> there will be no initial equation and thus the solver is free in solving the initial value problem.</li>
</ul>
</li>
</ul>
<ul>
<li>There is an optional &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutput </a>connector.</li>
</ul>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\">InformationLevel</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.CapacityRestrictedStock\">CapacityRestrictedStock</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {-80.87, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}}), Polygon(visible = true, origin = {-70.87, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}}), Polygon(visible = true, origin = {70.439, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}}), Polygon(visible = true, origin = {80.439, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MaterialStock;
