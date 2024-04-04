within BusinessSimulation.Interfaces.PartialSubsystems;

partial model BasicIncubator "Partial incubator subsystem model (no flow ports)"
  extends Icons.SubsystemIncubator;
  extends BaseSubsystem(final n_flowPorts = 0);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), defaultComponentName = "sys", Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>This class extends the →<a href=\"modelica://BusinessSimulation.Interfaces.PartialSubsystems.BaseSubsystem\"><code>BaseSubsystem</code></a> and the →<a href=\"modelica://BusinessSimulation.Icons.SubsystemIncubator\"><code>Icons.SubsystemIncubator</code></a> classes. By modifying the constant <code>iconLabel</code> a label in a color matching the subsystem type can be given. An <em>incubator</em> subsystem cannot have flow ports.</p>
<h4>Notes</h4>
<p>In Wolfram SystemModeler the value given for <code>Font size</code> in the menu <em>Tools > Options... > Model Center > Graphical Class Views > General > Component Text</em> will override any local settings for the display of <code>iconLabel</code>.</p>
</html>", revisions = "<html>
<ul>
<li>Introduced in v2.0.0.</li>
</ul>
</html>"));
end BasicIncubator;
