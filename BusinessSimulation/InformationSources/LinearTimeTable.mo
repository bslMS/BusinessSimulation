within BusinessSimulation.InformationSources;

block LinearTimeTable "Generate a (possibly discontinuous) signal by linear interpolation in a table of (time,value) pairs"
  import BusinessSimulation.Units.Time;
  extends Interfaces.PartialConverters.InformationSource_SO;
  extends Icons.InterpolationTable;
  parameter Real offset = 0 "Offset of output signal y";
  parameter Time startTime = 0 "Output y = offset for time < startTime";
  parameter Real[:, 2] data = [0, 0] "n x 2 matrix of time series data (t,u(t))";
  parameter Time timeScale = 1 "Time scale of first table column (e.g., if first column is given in hours, then timeScale should be 3600)";
  parameter Time shiftTime = startTime "Shift time of first table column (timeTable.shiftTime)";
protected
  Modelica.Blocks.Sources.TimeTable timeTable(offset = offset, startTime = startTime, table = data, timeScale = timeScale, shiftTime = shiftTime) annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(timeTable.y, y) annotation(Line(visible = true, origin = {130.5, 0}, points = {{-29.5, 0}, {29.5, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real output <strong>y</strong> is found by <em>linear interpolation</em> in a time table&nbsp;&rarr; <a href=\"modelica://Modelica.Blocks.Sources.TimeTable\">Modelica.Blocks.Sources.TimeTable</a>.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LinearTimeTable;
