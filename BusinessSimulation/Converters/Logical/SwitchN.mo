within BusinessSimulation.Converters.Logical;

block SwitchN "Switching between inputs up to n times depending upon condition"
  import BusinessSimulation.Units.*;
  extends Interfaces.PartialConverters.SI2SO;
  Interfaces.Connectors.BooleanInput u_cond "Condition" annotation(Placement(visible = true, transformation(origin = {-145, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0.12, 79.88}, extent = {{-10.12, -10.12}, {10.12, 10.12}}, rotation = -450)));
  parameter Integer n(min = 1) = 1 "Maximum number of switchings";
protected
  discrete Boolean previousCondition "Previous value for u_cond";
  discrete Integer counter "Counter for the switching operations";
initial equation
  pre(counter) = 0;
  pre(previousCondition) = u_cond;
algorithm
  when previousCondition <> u_cond then
    counter := counter + 1;
    // update previousCondition iff maximum switchings have not been reached yet
    previousCondition := if counter <= n then u_cond else previousCondition;
  end when;
  // invariant: the previousCondition is always the relevant condition for switching
  y := if previousCondition then u1 else u2;
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The <em>SwitchN</em> switches up to <code>n</code> times between the inputs <strong>u1</strong> (<code>u_cond = true</code>) and <strong>u2</strong> (<code>u_cond = false</code>). After each switching an internal counter will be increased and checked so that there are at most&nbsp;<code>n</code>&nbsp;switches.</p>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Converters.Logical.Switch\">Switch</a></p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-59.824, 50}, rotation = -990, points = {{-0, 0.176}, {0, -27.661}}, color = {0, 0, 128}, thickness = 3), Line(visible = true, origin = {-58.086, -50}, rotation = 990, points = {{-0, -1.914}, {0, 24.5}}, color = {0, 0, 128}, thickness = 3), Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {5, 5, 125}, fillPattern = FillPattern.Solid, extent = {{-11.872, -11.872}, {11.872, 11.872}}), Line(visible = true, origin = {35, 0}, rotation = -270, points = {{0, 25}, {0, -25}}, color = {5, 5, 125}, thickness = 3, arrowSize = 10), Line(visible = true, origin = {-25.841, 0}, points = {{0, 30}, {-14.159, 0}, {0, -30}}, color = {190, 52, 178}, thickness = 3, arrow = {Arrow.Filled, Arrow.Filled}, arrowSize = 10, smooth = Smooth.Bezier), Line(visible = true, origin = {-31.39, -44.212}, rotation = -275.101, points = {{-6.228, 4.669}, {6.228, -4.669}}, color = {5, 5, 125}, thickness = 3, arrowSize = 10), Line(visible = true, origin = {-19.388, 28.7}, points = {{-14.549, 21.3}, {14.549, -21.3}}, color = {5, 5, 125}, thickness = 3, arrowSize = 10), Text(visible = true, origin = {-47.721, 0}, textColor = {190, 52, 178}, extent = {{-37.721, -6}, {37.721, 6}}, textString = "≤ n", fontName = "Lato", textStyle = {TextStyle.Bold}), Text(visible = true, origin = {20, 35}, textColor = {190, 52, 178}, extent = {{-30.242, -12}, {30.242, 12}}, textString = "true", fontName = "Lato", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left), Text(visible = true, origin = {20, -30}, textColor = {190, 52, 178}, extent = {{-30.242, -12}, {30.242, 12}}, textString = "false", fontName = "Lato", textStyle = {TextStyle.Bold}, horizontalAlignment = TextAlignment.Left)}));
end SwitchN;
