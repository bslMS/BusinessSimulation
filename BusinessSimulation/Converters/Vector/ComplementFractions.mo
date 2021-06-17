within BusinessSimulation.Converters.Vector;

block ComplementFractions "Taking a vector of k fractions of 1 and adding another fraction as to achieve a total of 1"
  extends Interfaces.PartialConverters.MO(redeclare replaceable type OutputType = Units.Fraction);
  Interfaces.Connectors.RealMultiInput[nout - 1] u "Inputs, the total of which should be less than one" annotation(Placement(visible = true, transformation(origin = {-145, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real y_comp "The complement of the total input with regard to 1 or zero";
equation
  y_comp = max(0, 1 - sum(u));
  y = cat(1, u, vector(y_comp));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>The vector output <strong>y</strong> is obtained by adding another element y_comp to the list of inputs so that the total is 1. If the sum of the inputs is larger than one, then the element added to the list of inputs will be zero.&nbsp;</p></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {16.393, 0}, textColor = {0, 0, 128}, extent = {{-40.484, -12}, {40.484, 12}}, textString = "=  1", fontName = "Lato Black", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {-22, 6}, textColor = {0, 0, 128}, extent = {{-22.881, -36.024}, {22.881, 36.024}}, textString = "∑", fontName = "Lato", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ComplementFractions;
