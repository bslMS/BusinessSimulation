within BusinessSimulation.Functions.UtilityFunctions;

encapsulated function findClearAttrac "y = available - sum( allocatedAmounts(u, vecA, vecC, vecW, pp) )"
  import partialScalarFunc = Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
  import BusinessSimulation.Functions.allocatedAmounts;
  import PP = BusinessSimulation.Types.PriorityProfiles;
  extends partialScalarFunc;
  // input Real u "Clearing attractiveness";
  input Real amount "Available amount";
  input Real[:] vecA "Vector of attractiveness (i.e., priority) scores for recipients";
  input Real[size(vecA, 1)] vecC "Vector of supply capacities or demand saturation levels";
  input Real[size(vecA, 1)] vecW "Vector of width parameters for priority distributions";
  input PP pp = PP.uniform "Priority distribution to be used for allocation";
protected
  Real totalAllocated;
algorithm
  totalAllocated := sum(allocatedAmounts(x = u, vecA = vecA, vecC = vecC, vecW = vecW, pp = pp));
  y := amount - totalAllocated;
end findClearAttrac;
