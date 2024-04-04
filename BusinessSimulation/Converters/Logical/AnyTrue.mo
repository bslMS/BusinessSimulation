within BusinessSimulation.Converters.Logical;

block AnyTrue "Logical 'any true'"
  extends Interfaces.PartialConverters.BooleanMISO;
  NoneTrue noneTrue(nin = nin) annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Not negation annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, noneTrue.u) annotation(Line(visible = true, origin = {-104, 0}, points = {{-66, -0}, {66, 0}}, color = {255, 0, 255}));
  connect(noneTrue.y, negation.u) annotation(Line(visible = true, origin = {-10, 0}, points = {{-12, 0}, {12, -0}}, color = {255, 0, 255}));
  connect(negation.y, y) annotation(Line(visible = true, origin = {89, 0}, points = {{-71, 0}, {71, 0}}, color = {255, 0, 255}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The Boolean output <strong>y</strong> is <code>true</code>, if any of the Boolean elements of the input vector <strong>u</strong> are <code>true</code>, and <code>false</code> otherwise.</p>
</html>"), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {190, 52, 178}, extent = {{-48.609, -12}, {48.609, 12}}, textString = "AnyTrue", fontName = "Lato", textStyle = {TextStyle.Bold})}));
end AnyTrue;
