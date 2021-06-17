within BusinessSimulation.Stocks;

model CapacityRestrictedStock "Material stock, that cannot be drained or filled beyond its capacity limits"
  import BusinessSimulation.Constants.{small,zero};
  import BusinessSimulation.Types.InitializationOptions;
  extends Interfaces.PartialStocks.BasicStock(initialValue(min = 0), minValue(min = zero) = zero, useAssert = false);
  extends Icons.MaterialStockIndicator;
  extends Icons.CapacityLabel;
  Interfaces.Connectors.RealInput u_min if hasVariableAdmissableRange "Variable minimum value to be monitored" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.Connectors.RealInput u_max if hasVariableAdmissableRange "Maximum value input" annotation(Placement(visible = true, transformation(origin = {-145, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter Boolean hasVariableAdmissableRange = false "=true, if capacity restrictions are to be given by the variable inputs u_min and u_max" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  parameter Boolean reinitializeStock = false "= true, if the stock is to be reinitalized to guarante nonnegativity" annotation(Evaluate = true, Dialog(tab = "Advanced"));
protected
  Converters.Special.VariableRangeAssert variableRangeControl(causeError = causeError) if useAssert and hasVariableAdmissableRange "Use assert() to check admissable values" annotation(Placement(visible = true, transformation(origin = {-50, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OutputType minCapacity = if hasVariableAdmissableRange then u_min else minValue "Minimum capacity";
  OutputType maxCapacity = if hasVariableAdmissableRange then u_max else maxValue "Maximum capacity";
initial equation
  // properly initialize discrete vars with fixed = false
  // provide Boolean signal when above capacity
  pre(inflow.stopInflow) = not x < maxCapacity - BusinessSimulation.Constants.small;
  pre(outflow.stopInflow) = inflow.stopInflow;
  // provide Boolean signal when below capacity
  pre(inflow.stopOutflow) = not x > minCapacity + BusinessSimulation.Constants.small;
  pre(outflow.stopOutflow) = pre(inflow.stopOutflow);
equation
  // provide Boolean signal when above capacity
  inflow.stopInflow = not x < maxCapacity - BusinessSimulation.Constants.small;
  outflow.stopInflow = inflow.stopInflow;
  // provide Boolean signal when below capacity
  inflow.stopOutflow = not x > minCapacity + BusinessSimulation.Constants.small;
  outflow.stopOutflow = inflow.stopOutflow;
  // optional reinitialize stock to zero if negative //
  if reinitializeStock then
    when x < 0 then
      reinit(x, 0);
    end when;
  end if;
  assert(minCapacity < maxCapacity, "Minimum capacity must be smaller than maximum capacity");
  connect(y1, variableRangeControl.u) annotation(Line(visible = true, origin = {20.4, 74}, points = {{139.6, -4}, {139.6, 11}, {-100.4, 11}, {-100.4, -9}, {-78.4, -9}}, color = {1, 37, 163}));
  connect(u_max, variableRangeControl.u_max) annotation(Line(visible = true, origin = {-101.5, 70}, points = {{-43.5, 0}, {43.5, 0}}, color = {0, 0, 128}));
  connect(u_min, variableRangeControl.u_min) annotation(Line(visible = true, origin = {-110.313, 50}, points = {{-34.687, -10}, {10.313, -10}, {10.313, 10}, {52.313, 10}}, color = {0, 0, 128}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This is a restricted&nbsp;<em>reservoir</em> of the System Dynamics methodology, which accumulates <em>material &nbsp;</em>(i.e. countable entities, some kind of mass) transported by flow components connected to the component's StockPorts. Like a&nbsp;<em>MaterialStock </em>the<em> CapacityRestrictedStock&nbsp;</em>can never become negative—we are not collecting \"antimatter\"—and will prevent connected flow components from draining its value below zero. Unlike other stocks, <code>minCapacity</code> and <code>maxCapacity</code> are seen as capacity restrictions that for \"physical\" reasons cannot be violated—the restrictions can be given as either constant parameters (<code>minValue, maxValue</code>) or as variable inputs (<code>u_min, u_max</code>). Accordingly, the component will signal flow restrictions via its port that must be observed by connected flow components.</p>
<h4>Implementation</h4>
<p>The value of the stock will be set to zero if the calculated value <code>x</code> is less than a very small positive amount and if <code>reinitializeStock = true</code> is chosen in the Advanced tab:</p>
<pre>  if reinitializeStock then
    when x < 0 then
      reinit(x, 0);
    end when;
  end if;</pre>
<p><em>CapacityRestrictedStock</em> components will prevent connected flows from draining the stock via their &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPort </a>connectors' Boolean flags, should the calculated state variable&nbsp;<code>x</code> be less than a very small positive amount:</p>
<br>
<pre>  inflow.stopInflow = not x < maxCapacity - BusinessSimulation.Constants.small;
  outflow.stopInflow = inflow.stopInflow;</pre><br>   
<pre>  inflow.stopOutflow = not x > minCapacity + BusinessSimulation.Constants.small;
  outflow.stopOutflow = inflow.stopOutflow;</pre><br>
<h4>Notes</h4>
<ul>
<li>The <code>inflow</code> and <code>outflow</code> &rarr;<a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockPort\">StockPorts </a>are only indicative; in general the reservoir may be filled or drained by flows connected to either port.</li><br>
<li>The capacity restrictions are also used to define an <em>admissable</em> range than can be monitored by an <code>assert</code> using <code>useAssert = true</code> in the Advanced tab. The switch <code>causeError</code> controls whether an <em>error</em> or a <em>warning</em> is to be raised.</li><br>
</ul>
<ul>
<li>The parameter <code>init</code> allows to select &rarr;<a href=\"modelica://BusinessSimulation.Types.InitializationOptions\">InitializationOptions</a>:<br><br>
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
<p><a href=\"modelica://BusinessSimulation.Stocks.MaterialStock\">MaterialStock</a>,&nbsp;<a href=\"modelica://BusinessSimulation.Stocks.InformationLevel\">InformationLevel</a></p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {-80.87, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}}), Polygon(visible = true, origin = {-70.87, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}}), Polygon(visible = true, origin = {70.439, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}}), Polygon(visible = true, origin = {80.439, 0}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-2.435, 13.229}, {-2.435, -13.344}, {4.87, 0.115}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end CapacityRestrictedStock;
