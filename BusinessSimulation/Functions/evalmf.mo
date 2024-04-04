within BusinessSimulation.Functions;

function evalmf "Evaluate a fuzzy membership function"
  import BusinessSimulation.Types.MembershipFunctionTypes;
  import BusinessSimulation.Functions.{rampmf, trimf, smf, sigmf, pimf, psigmf, gaussmf, gbellmf, trapmf};
  extends BusinessSimulation.Icons.Function;
  input Real x "Input value for which the degree of membership is to be computed";
  input MembershipFunctionTypes mft = MembershipFunctionTypes.trapezoidal "Type of membership function to be used";
  input Real a "Parameter of membership function";
  input Real b "Parameter of membership function";
  input Real c "Parameter of membership function";
  input Real d "Parameter of membership function";
  output Real y "Degree of membership";
algorithm
  y := if mft == MembershipFunctionTypes.ramp then rampmf(x, a, b) elseif mft == MembershipFunctionTypes.triangular then trimf(x, a, b, c)
   elseif mft == MembershipFunctionTypes.sshaped then smf(x, a, b)
   elseif mft == MembershipFunctionTypes.sigmoidal then sigmf(x, a, c)
   elseif mft == MembershipFunctionTypes.pishaped then pimf(x, a, b, c, d)
   elseif mft == MembershipFunctionTypes.psigmoidal then psigmf(x, a, b, c, d)
   elseif mft == MembershipFunctionTypes.gaussian then gaussmf(x, a, c)
   elseif mft == MembershipFunctionTypes.bell then gbellmf(x, a, b, c) else trapmf(x, a, b, c, d);
  annotation(Documentation(info = "<html>
<p class=\"aside\">This information is part of the Business Simulation&nbsp;Library (BSL). Please support this work and <a href=\"https://www.paypal.com/donate/?hosted_button_id=GXVZT8LD7CFXN\" style=\"font-weight:bold; color:orange; text-decoration:none;\">&#9658;&nbsp;donate</a>.</p>
<p>The function returns the degree of membership using the <em>membership function</em> specified.</p>
<h4>Syntax</h4>
<p><code>Functions.<strong>evalmf</strong>(x, mft, a, b, c, d);</code></p>
<h4>Examples</h4>
<pre><br>
Functions.evalmf( 5, mft = MembershipFunctionTypes.trapezoid, a=2, b=4, c=6, d=8); // 1.0
<br>
</pre>
<h4>See also</h4>
<p><a href=\"modelica://BusinessSimulation.Functions.rampmf\">rampmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trapmf\">trapmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.trimf\">trimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.smf\">smf</a>,
<a href=\"modelica://BusinessSimulation.Functions.sigmf\">sigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.pimf\">pimf</a>,
<a href=\"modelica://BusinessSimulation.Functions.psigmf\">psigmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gaussmf\">gaussmf</a>,
<a href=\"modelica://BusinessSimulation.Functions.gbellmf\">gbellmf</a>
</p></html>"));
end evalmf;
