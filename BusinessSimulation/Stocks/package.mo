within BusinessSimulation;

package Stocks "Containers (\"reservoirs\") used to represent entities that have been stored in a specific state"
  extends Icons.Package annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {0, 5}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, lineThickness = 10, extent = {{-50, -50}, {50, 50}})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This package contains stock (\"reservoirs\") elements of the System Dynamics method.</p>
<h4>Technical Notes</h4>
<p>While stocks&nbsp;do have an <em>inflow</em> and an <em>outflow</em> port (indicated by two small arrows pointing into and out of the component respectively), this designation will in general not be relevant for their behavior with regard to flows:</p>
<p><strong>A stock may be filled or drained on either side - the flow element connected to a stock will determine the direction of flow!</strong></p>
<p>Nevertheless, it is good modeling practice to follow the convention of connecting flows that are strictly inflows or outflows to the corresponding stock port.</p>
<p><strong>There are two important cases, where closely sticking to the inflow and outflow designations is very important:</strong></p>
<ul>
<li>For <em>dynamic stocks</em> (e.g. conveyors and ovens that have a StockPort_Special) the <em>inflow</em> and <em>outflow</em>&nbsp;designations have to be strictly observed. These stocks cannot be filled&nbsp;on the outflow side or be drained on the input side.</li><br>
<li>Should a <a href=\"modelica://BusinessSimulation.Stocks.HinesCoflow\">HinesCoflow </a>component be connected to a stock&mdash;conveniently using the <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutput</a>&mdash;the reported average attribute will give false results, if inflows and outflows are mixed at any port (it will suffice to connect inflows and outflows to <em>separate</em> ports). Should a biflow be connected to a port, there should not be another flow connected to that port.</li>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.UsersGuide.Tutorial.ElementaryBuildingBlocks\">Tutorial.ElementaryBuildingBlocks</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"));
end Stocks;
