within BusinessSimulation.Converters;

block DmnlInput "Input u will be stated as dimensionless fraction with regard to a reference value"
  import BusinessSimulation.Types.Reals;
  extends Interfaces.PartialConverters.SO(redeclare final type OutputType = Units.Dimensionless);
  Interfaces.Connectors.RealInput u "Input to be normalized" annotation(Placement(visible = true, transformation(origin = {-145, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Interfaces.Connectors.RealInput u_reference if not hasConstantReference "Input of reference value" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  parameter BaseType referenceValue "Reference value, so that input is represented as a dimensionless fraction thereof" annotation(Dialog(enable = hasConstantReference));
  parameter Boolean hasConstantReference = false "If true, the constant reference value will be used" annotation(Evaluate = true, Dialog(group = "Structural Parameters"));
  replaceable type BaseType = Reals "Type for reference value and input";
protected
  Division_Guarded division_yidz(outputIfZero = 0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConstantConverter parReference(value = referenceValue) if hasConstantReference "Constant reference value (optional)" annotation(Placement(visible = true, transformation(origin = {-120, -5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, division_yidz.u1) annotation(Line(visible = true, origin = {-83.75, 22.5}, points = {{-61.25, -17.5}, {3.75, -17.5}, {3.75, -17.5}, {75.75, -17.5}}, color = {0, 0, 127}));
  connect(u_reference, division_yidz.u2) annotation(Line(visible = true, origin = {-83.75, -22.5}, points = {{-61.25, -17.5}, {3.75, -17.5}, {3.75, 17.5}, {75.75, 17.5}}, color = {0, 0, 127}));
  connect(division_yidz.y, y) annotation(Line(visible = true, origin = {84.134, 0}, points = {{-76.134, 0}, {76.134, 0}}, color = {0, 0, 127}));
  connect(parReference.y, division_yidz.u2) annotation(Line(visible = true, origin = {-61, -5}, points = {{-53, 0}, {53, 0}}, color = {1, 37, 163}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The output <strong>y</strong> is obtained by <em>guarded division</em> of the input <strong>u</strong> by some <em>reference value</em>. The reference value can either be a constant (<code>referenceValue</code>) or a variable input (<code>u_reference</code>). If the reference value is zero the output will be zero also.</p>
<h4>Notes</h4>
<p>Since there is just regular division, care has to be taken in case of negative values for either input or reference value.</p>
<h5>Units</h5>
<p>As the reference value&nbsp;should have the same dimension as the input, the output will effectively be dimensionless.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Division_Guarded\">Division_Guarded</a></p>
<h4>Revision History</h4>
<ul>
<li>Replaceable type for constant introduced in v2.0.0</li><br>
</ul>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {0, 0, 128}, extent = {{-43.326, -12}, {43.326, 12}}, textString = "Dmnl [1]", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end DmnlInput;
