<p align = "left"><img src = "/BusinessSimulation/Resources/Images/BusinessSimulation.svg" width = 150></p>

# Business Simulation Library (BSL)
A Modelica library for modeling &amp; simulation of dynamical systems in the social sciences, e.g., business, economics, and ecology using the System Dynamics metaphor.

## Library Description
System Dynamics offers a very general, low-level modeling paradigm, that lends itself perfectly to model, simulate, and analyze strategic business and policy issues in any kind of organization. Unlike existing aproaches the __BSL__ makes use of Modelica's acausal connectors to better distinguish _material/mass_ flows from instantaneous _information_ signal flows (causal connections). The approach has the additional benefit of allowing the modeler to build more compact models in a fast and reliable fashion.

#### Overview of the Main Packages

| Icon     | Name              | Description |
| :-------:|:------------------|:------------|
| <img src = "/BusinessSimulation/Resources/Images/CausalLoop.svg" width = "70"> |  __CausalLoop__ | Agile system dynamics modeling with quantitative causal loop diagrams (CLD<sup>+</sup>) |
| <img src = "/BusinessSimulation/Resources/Images/Stocks.svg" width = "70"> | __Stocks__  | Containers ("reservoirs") used to represent entities that have been stored in a specific state |
| <img src = "/BusinessSimulation/Resources/Images/Flows.svg" width = "70"> | __Flows__ | Processes that move entities from one stock to another at a specific rate |
| <img src = "/BusinessSimulation/Resources/Images/SourcesOrSinks.svg" width = "70"> | __SourcesOrSinks__ | Flows into or out of a stock with infinite capacity at a system's boundary |
| <img src = "/BusinessSimulation/Resources/Images/Converters.svg" width = "70"> | __Converters__ | Information processing (blocks) |
| <img src = "/BusinessSimulation/Resources/Images/InformationSources.svg" width = "70"> | __InformationSources__ | External information input |
| <img src = "/BusinessSimulation/Resources/Images/MoleculesOfStructure.svg" width = "70"> | __MoleculesOfStructure__ | Pre-built components to model _information processing_, _decision making_ and _subsystems_ in general (blocks, incubators, transceivers, and actuators)  |

Using the pre-built components modelers can start to build their own components to eventually arrive at an appropriate representation of the system in focus in a hierarchical fashion.

## Documentation and Release Notes
You can read the documentation for the library online at:<br>
[https://bsl-support.de/BusinessSimulation/BusinessSimulation](https://bsl-support.de/BusinessSimulation/BusinessSimulation.html)

[Release Notes](https://bsl-support.de/BusinessSimulation/BusinessSimulation.UsersGuide.ReleaseNotes.html) are included with the documentation and can be found there as well.

The library was developed and tested using Wolfram System Modeler and Wolfram Mathematica.<br>User experience may differ when using other modeling and simulation environments.

## License
Copyright © 2020 Guido Wolf Reichert  
Licensed under the European Union Public Licence (EUPL), Version 1.2 or later (the "License")

You may not use this work except in compliance with the License. You may obtain a copy of the License at:<br>
[https://eur-lex.europa.eu/eli/dec_impl/2017/863/oj](https://eur-lex.europa.eu/eli/dec_impl/2017/863/oj)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either expressed or implied. See the License for the specific language governing permissions and limitations under the License.


__Modelica©__ is a registered trademark of the Modelica Association.</br>
__Wolfram System Modeler&trade;__ is a trademark of Wolfram Research, Inc.</br>
__Wolfram Mathematica and Mathematica&trade;__ are registered trademarks of Wolfram Research, Inc.

## Development and Contribution
You may report bugs and other issues or simply make suggestions for future enhancements by using the Issues button.

Please refrain from pull requests until an appropriate Contributor License Agreement (CLA) has been established.

## Corresponding Author
<p align = "left"><img src="/BusinessSimulation/Resources/Images/UsersGuide/Contact/ContactInformation.png" alt="ContactInformation.png" width="400" />
