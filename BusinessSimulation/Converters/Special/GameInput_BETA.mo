within BusinessSimulation.Converters.Special;

block GameInput_BETA "Enable user input, if gaming mode is activated"
  extends Interfaces.PartialConverters.SO;
  Interfaces.Connectors.RealInput u "Input to be used if gaming = false" annotation(Placement(visible = true, transformation(origin = {-145, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
  Interfaces.Connectors.RealInput u_User if modelSettings.gaming "User input to be used if gaming = true" annotation(Placement(visible = true, transformation(origin = {-145, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  outer ModelSettings modelSettings;
  ConstantConverter zero(final value = 0) if not modelSettings.gaming "Dummy input for gaming = false" annotation(Placement(visible = true, transformation(origin = {-60, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Logical.Switch chooseInput "Choose the right input" annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Logical.ConstantConverterBoolean gamingQ(value = modelSettings.gaming) "= true, if gaming mode is activated" annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
equation
  connect(chooseInput.y, y) annotation(Line(visible = true, origin = {83.681, 0}, points = {{-76.319, 0}, {76.319, 0}}, color = {1, 37, 163}));
  connect(u, chooseInput.u2) annotation(Line(visible = true, origin = {-47, -22.5}, points = {{-98, -17.5}, {7, -17.5}, {7, 17.5}, {39, 17.5}}, color = {1, 37, 163}));
  connect(u_User, chooseInput.u1) annotation(Line(visible = true, origin = {-47, 12.5}, points = {{-98, 27.5}, {7, 27.5}, {7, -7.5}, {39, -7.5}}, color = {1, 37, 163}));
  connect(zero.y, chooseInput.u1) annotation(Line(visible = true, origin = {-31, 5}, points = {{-23, 0}, {23, 0}}, color = {1, 37, 163}));
  connect(gamingQ.y, chooseInput.u_cond) annotation(Line(visible = true, origin = {-4.992, 42.663}, points = {{-10.008, 17.337}, {5.004, 17.337}, {5.004, -34.675}}, color = {190, 52, 178}));
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL).</p>
<p>This component allows to easily set up a model for either <code>gaming = true</code> (e.g., the user has to provide an input <code>u_User</code> that is then used in the model) or as a regular model (e.g., the model provides the input <strong>u</strong> that can be used if <code>gaming = false</code>).</p>
<h4>Notes</h4>
<p>The input <code>u_User</code> is conditional upon the global boolean parameter <code>gaming</code>. If there are to be corresponding user inputs at the top level of a model, then these should be connected to the appropriate <code>u_User</code> inputs of <code>GameInput</code> components at deeper levels. These top level inputs should then also be made conditional, so that the model will be balanced for the case <code>gaming = false</code> as well.</p></html>", revisions = ""), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-58, -58}, {58, 58}}), Text(visible = true, textColor = {128, 0, 128}, extent = {{-31.731, -40}, {31.731, 40}}, textString = "?", fontName = "Lato Black", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GameInput_BETA;
