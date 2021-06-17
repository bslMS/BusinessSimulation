within BusinessSimulation.MoleculesOfStructure.InformationProcessing;

block ResidenceTime "Calculate average time of residence or time needed for completion"
  import BusinessSimulation.Constants.inf;
  extends Icons.InformationProcessing;
  parameter Real durationAtZeroRate = inf "Value for duration if the rateOfDepletion becomes zero";
  Interfaces.Connectors.RealInput u_level "Current level of work to do or simply level of stock being depleted by flow" annotation(Placement(visible = true, transformation(origin = {-145, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-109.796, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_rate "The rate at which the stock is drained or the tasks being completed" annotation(Placement(visible = true, transformation(origin = {-145, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110.231, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Connectors.RealOutput y(quantity = "Time", unit = "s") "Time needed to complete work or drain stock" annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {112.58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Converters.Division_Guarded residenceTime(outputIfZero = durationAtZeroRate, redeclare replaceable type OutputType = Units.Time) "Average time of residence in a stock that is being depleted" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ZeroIfNegative currentLevel "Current amount that is being depleted" annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Converters.ZeroIfNegative rateOfDepletion(redeclare replaceable type OutputType = Units.Rate) "Rate of Depletion" annotation(Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(residenceTime.y, y) annotation(Line(visible = true, origin = {84, 0}, points = {{-76, 0}, {76, 0}}, color = {0, 0, 127}));
  connect(u_level, currentLevel.u) annotation(Line(visible = true, origin = {-101.5, 20}, points = {{-43.5, 0}, {43.5, 0}}, color = {0, 0, 127}));
  connect(currentLevel.y, residenceTime.u1) annotation(Line(visible = true, origin = {-21.909, 12.5}, points = {{-20.091, 7.5}, {1.909, 7.5}, {1.909, -7.5}, {13.909, -7.5}}, color = {0, 0, 127}));
  connect(u_rate, rateOfDepletion.u) annotation(Line(visible = true, origin = {-101.5, -20}, points = {{-43.5, 0}, {43.5, 0}}, color = {0, 0, 127}));
  connect(rateOfDepletion.y, residenceTime.u2) annotation(Line(visible = true, origin = {-21.909, -12.5}, points = {{-20.091, -7.5}, {1.909, -7.5}, {1.909, 7.5}, {13.909, 7.5}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The Real output <strong>y</strong> is obtained by dividing the current amount in a material stock<code>u_level</code> by the (positive) rate of its outflow <code>u_rate</code>. According to Little's Law—a famous result from queueing theory—the output <strong>y</strong> will be equal to the <em>mean time of residence</em> in the stock if the system is in equilibrium.</p>
<h4>Notes</h4>
<ul>
<li> Both, the amount in the stock (<code>u_level</code>) and the rate of outflow (<code>u_rate</code>) have to be positive; negative values will be assumed to be zero.<br><br></li>
<li>Should the rate of outflow be zero (or negative) the parameter <code>durationAtZeroRate</code> (default = <code>Constants.inf</code> will be used to obtain the output.</li>
</ul>
<h4>Acknowledgements</h4>
<p>Additional information can be found on Jim Hines' <em>Molecules of Structure</em> website: →<a href = \"https://sdmolecules.org/index.htm#MoleculeTopics/CloseGap/GoToZero/Decay/ResidenceTime/residenceTime.htm\">Residence Time</a>.</p>
<h4>See also</h4>
<p>
<a href=\"modelica://BusinessSimulation.Flows.Unidirectional.Decay\">Decay<br></a>
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Residence or", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {0, -25}, textColor = {0, 0, 128}, extent = {{-96.456, -12}, {96.456, 12}}, textString = "Completion Time", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ResidenceTime;
