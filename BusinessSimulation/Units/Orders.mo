within BusinessSimulation.Units;

type Orders = IntangibleAssets(quantity = "Orders") "Orders [each]" annotation(Documentation(info = "<html>
<p>Orders are an operational stock used to model the delay between a stated need and its fulfillment.</p>
</html>"));
