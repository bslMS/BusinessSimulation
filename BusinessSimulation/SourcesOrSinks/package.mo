within BusinessSimulation;

package SourcesOrSinks "Flows into or out of a stock with infinite capacity at a system's boundary"
  extends Icons.Package;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Polygon(visible = true, origin = {72.114, -0.25}, rotation = -450, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-22.295, -7.943}, {22.191, -7.943}, {0.104, 15.886}}), Line(visible = true, origin = {27.342, -10}, points = {{-39.852, 0}, {39.852, 0}}, color = {255, 255, 255}, thickness = 5), Line(visible = true, origin = {28.79, 11.777}, points = {{-41.21, 0}, {41.21, 0}}, color = {255, 255, 255}, thickness = 5), Rectangle(visible = true, origin = {-51.38, -0.345}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-38.62, -38.62}, {38.62, 38.62}}), Ellipse(visible = true, origin = {28.899, 0}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-15.107, -15.107}, {15.107, 15.107}}), Line(visible = true, origin = {-54.639, -1.132}, points = {{-19.013, -1.251}, {-19.013, 5.61}, {-13.146, 10.097}, {-4.518, 6.3}, {3.107, -1.637}, {9.976, -6.855}, {16.533, -6.855}, {19.639, -3.018}, {19.639, 4.92}, {13.107, 11.132}, {6.525, 8.716}, {3.107, 3.145}, {-4.173, -6.855}, {-14.872, -8.539}, {-19.013, -1.251}, {-19.013, -1.251}}, color = {76, 112, 136}, thickness = 4, smooth = Smooth.Bezier), Bitmap(visible = true, origin = {149.207, -5.816}, fileName = "", imageSource = "iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGeYUxB9wAAACBjSFJNAAB6JQAAgIMAAPn/AACA6AAAUggAARVYAAA6lwAAF2/XWh+QAAAB7klEQVR42mJsufTiPwMZACCAWP5//4Fd4tcnBsndRQzyn/aA+Q/5XBieu/Yx/GHjA/MBAojl3zfsGmWOlDHo/N7DoKEA4Qu83MPAfKCM4Z7NBDAfIIBY/uKwUebtDrAmDlYIX0OcgeHDgx0Mt6HqAQKI5Q8OjbgATD1AALH8xuHUJ8IeDDde7gDbBAI3XkLEYOoBAojlF5Dx69dvhrev34MFePm4GXh4uRkuCqcw/P39B+g8ROBcAYrBNAIEEMuXT18Y3rx6z2Ctp8hgoCbNMHfTcYY/QIM4uTgYTgjlgDEc/AIREI0AAcTy+uU7BjtDZYZkP0uGn7/+MOSFOzBMXHGA4dfP3wzs7KwM////Z/j06SvDnz9/wRp4eLjA4gABxGRvpMKQEWjN8PfvPzCWEOJjSAPyQbZ+/vyN4cOHLwwC3BwMsV5mDN7W2gw/f/wEiwMEEOOPn7///wDa9PP3bwYwDcQg+tGLdwwLt55kYGVlYQhxNADb9gNo2Kt3nxkOXbjLABBATH/+AW0C4j9QG2G0iAAPQ5iLETDg/jDce/oGIg5Ux83FzmCqJccAEEBMCMX/Ic5FMkiIj4vBz06X4fiVBwwPnr+Fe4eLnY0BIIBYYDaAFf/7B5f8CzVMgJeTwcdGG+yFPyDDoeoAAgwAAiQQgeLRB5kAAAAASUVORK5CYII=", extent = {{-0.793, -0.07}, {0.793, 0.07}})}), Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This pacakge contains sources or sinks with regard to the flow of conserved matter or information (\"mass flows\"). While in the narrow sense only a <em>cloud</em>&nbsp;(i.e. a stock with infinite capacity) is a source or sink, in this library we will extend the definition of a source or sink to also pertain to <em>inflows from</em> or <em>outflows into a stock with infinite capacity</em>, e.g. the cloud will be integrated into a flow element with a single flow port.</p>
<h4>Notes</h4>
<p>The direction of flow will not always be clear for <em>SourcesOrSinks</em>&nbsp;elements. For a constant or an exogenous input given the rate of flow these sign conventions are to be observed:</p>
<table>
<tbody>
<tr>
<th>Element</th>
<th>Behavior for positive rate</th>
</tr>
<tr>
<td>Sink</td>
<td>DRAIN connected stock</td>
</tr>
<tr>
<td>Source</td>
<td>FILL connected stock</td>
</tr>
<tr>
<td>SourceOrSink</td>
<td>FILL connected stock</td>
</tr>
</tbody>
</table>
<h4>See also</h4>
<p>
<a href = \"modelica://BusinessSimulation.UsersGuide.Tutorial.ElementaryBuildingBlocks\">Tutorial.ElementaryBuildingBlocks</a>
</p>
<br>
<hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end SourcesOrSinks;
