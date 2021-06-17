within BusinessSimulation;

package InformationSources "External information input"
  extends Icons.InformationSources;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This package contains sources that provide continuous information (signals). Next to a <code>ConstantInput</code> there are typical <em>test inputs</em> (<code>StepInput, RampInput, PulseInput, SineInput</code>), inputs of <em>time</em> (<code>TimeInput, ConvertedTimeInput</code>), and <em>interpolation tables</em> (<code>LinearTimeTable, ExogenousData</code>).</p>
<br><hr>
<p>Copyright &copy; 2020 Guido Wolf Reichert<br>Licensed under the <a href=\"modelica://BusinessSimulation.UsersGuide.Licence\">EUPL-1.2</a>&nbsp;or later</p>
</html>"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end InformationSources;
