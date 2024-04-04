within BusinessSimulation;

package Stocks "Containers (\"reservoirs\") used to represent entities that have been stored in a specific state"
  extends Icons.Package annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, lineThickness = 4, extent = {{-62.764, -53.47}, {62.764, 53.47}}), Rectangle(visible = true, origin = {-0, -29.138}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-57.685, -19.138}, {57.685, 19.138}}), Line(visible = true, origin = {-0, -1.684}, rotation = -270, points = {{5.045, 0}, {38.48, 0}}, color = {255, 255, 255}, thickness = 3, arrowSize = 10), Polygon(visible = true, origin = {0, 42.5}, rotation = -1350, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-5, 5}, {5, 0}, {-5, -5}, {-5, 5}}), Polygon(visible = true, origin = {-0, -2.5}, rotation = -1530, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-5, 5}, {5, 0}, {-5, -5}, {-5, 5}})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This package contains stock (\"reservoirs\") elements of the system dynamics method.</p>
<h4>Technical Notes</h4>
<p>While stocks&nbsp;do have an <em>inflow</em> and an <em>outflow</em> port (indicated by two small arrows pointing into and out of the component respectively), this designation will in general not be relevant for their behavior with regard to flows:</p>
<p><strong>A stock may be filled or drained on either side - the flow element connected to a stock will determine the direction of flow!</strong></p>
<p>Nevertheless, it is good modeling practice to follow the convention of connecting flows that are strictly inflows or outflows to the corresponding stock port.</p>
<p><strong>There are two important cases, where closely sticking to the inflow and outflow designations is very important:</strong></p>
<ul>
<li>For <em>dynamic stocks</em> (e.g., conveyors and ovens that have a StockPort_Special) the <em>inflow</em> and <em>outflow</em>&nbsp;designations have to be strictly observed. These stocks cannot be filled&nbsp;on the outflow side or be drained on the input side.</li><br>
<li>Should a <a href=\"modelica://BusinessSimulation.Stocks.HinesCoflow\">HinesCoflow </a>component be connected to a stock&mdash;conveniently using the <a href=\"modelica://BusinessSimulation.Interfaces.Connectors.StockInfoOutput\">StockInfoOutput</a>&mdash;the reported average attribute will give false results, if inflows and outflows are mixed at any port (it will suffice to connect inflows and outflows to <em>separate</em> ports). Should a biflow be connected to a port, there should not be another flow connected to that port.</li>
</ul>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.UsersGuide.Tutorial.ElementaryBuildingBlocks\">Tutorial.ElementaryBuildingBlocks</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>", revisions = "<html>
<ul>
<li>Icon modified in v2.2.</li><br>
</ul>
</html>"));
end Stocks;
