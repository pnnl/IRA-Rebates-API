<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:ira="https://hpxml.nrel.gov/ira">
  <sch:title>IRA HOMES Rebates 50121 Recommended For Modeled</sch:title>
  <sch:ns uri="http://hpxmlonline.com/2023/09" prefix="h"/>
  <!-- Insert contents of hescore.sch here -->
  <sch:pattern>
    <sch:title>[Root]</sch:title>
    <sch:rule context="/h:HPXML">
      <sch:assert role="ERROR" test="count(h:Building) &gt;= 1">Expected Building</sch:assert>
      <!-- See [Building] -->
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Building]</sch:title>
    <sch:rule context="/h:HPXML/h:Building">
      <sch:assert role="ERROR" test="h:BuildingID/@id">Expected BuildingID/@id</sch:assert>
      <sch:assert role="ERROR" test="h:Site">Expected Site</sch:assert>
      <sch:assert role="ERROR" test="h:ProjectStatus">Expected ProjectStatus</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[BuildingSite]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:Site">
      <sch:assert role="ERROR" test="count(h:Address[h:AddressType=&quot;street&quot;]) = 1">Expected only 1 Address[AddressType="street"] for each Building</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Address]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:Site/h:Address[h:AddressType=&quot;street&quot;]">
      <sch:assert role="ERROR" test="h:Address1">Expected Address1</sch:assert>
      <sch:assert role="ERROR" test="h:CityMunicipality">Expected CityMunicipality</sch:assert>
      <sch:assert role="ERROR" test="h:StateCode">Expected StateCode</sch:assert>
      <sch:assert role="ERROR" test="h:ZipCode">Expected ZipCode</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[BuildingConstruction]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:BuildingSummary/h:BuildingConstruction">
      <sch:assert role="ERROR" test="h:YearBuilt">Expected YearBuilt</sch:assert>
      <sch:assert role="ERROR" test="h:ResidentialFacilityType">Expected ResidentialFacilityType</sch:assert>
      <!-- See [BuildingType=SFAorMF] -->
      <sch:assert role="ERROR" test="h:ResidentialFacilityType[text()=&quot;single-family detached&quot; or text()=&quot;single-family attached&quot; or text()=&quot;apartment unit&quot; or text()=&quot;manufactured home&quot; or text()=&quot;multi-family - town homes&quot;]">Expected ResidentialFacilityType to be one of 'single-family detached', 'single-family attached', 'apartment unit', 'manufactured home', 'multi-family - town homes'</sch:assert>
      <sch:assert role="ERROR" test="h:ConditionedFloorArea">Expected ConditionedFloorArea</sch:assert>
      <sch:assert role="ERROR" test="h:NumberofConditionedFloorsAboveGrade">Expected NumberofConditionedFloorsAboveGrade</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ProjectStatus]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:ProjectStatus">
      <sch:assert role="ERROR" test="h:EventType">Expected EventType</sch:assert>
      <sch:assert role="ERROR" test="h:Date">Expected Date</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[BuildingDetails]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails">
      <sch:assert role="ERROR" test="h:BuildingSummary/h:Site">Expected BuildingSummary/Site</sch:assert>
      <!-- See [BuildingSite] -->
      <sch:assert role="ERROR" test="h:Enclosure/h:AirInfiltration/h:AirInfiltrationMeasurement[h:BuildingAirLeakage/h:AirLeakage | h:LeakinessDescription | h:AirSealing]">Expected Enclosure/AirInfiltration/AirInfiltrationMeasurement[BuildingAirLeakage/AirLeakage | LeakinessDescription | AirSealing]</sch:assert>
      <!-- See [BuildingAirLeakage] or [AirInfiltrationMeasurement=ACHorCFM]-->
      <sch:assert role="ERROR" test="h:Enclosure/h:Attics/h:Attic">Expected Enclosure/Attics/Attic</sch:assert>
      <!-- See [Attic] -->
      <sch:assert role="ERROR" test="h:Enclosure/h:Foundations/h:Foundation" ira:remove-measured="true">Expected Enclosure/Foundations/Foundation</sch:assert>
      <!-- See [Foundation] -->
      <sch:assert role="ERROR" test="h:Enclosure/h:Walls/h:Wall">Expected Enclosure/Walls/Wall</sch:assert>
      <!-- see [Wall] -->
      <sch:assert role="ERROR" test="h:Enclosure/h:Windows/h:Window">Expected Enclosure/Windows/Window</sch:assert>
      <!-- see [Window] -->
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[BuildingAirLeakage]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:AirInfiltration/h:AirInfiltrationMeasurement[h:BuildingAirLeakage/h:AirLeakage]">
      <sch:assert role="ERROR" test="h:BuildingAirLeakage/h:UnitofMeasure">Expected BuildingAirLeakage/UnitofMeasure</sch:assert>
      <sch:assert role="ERROR" test="h:BuildingAirLeakage/h:UnitofMeasure[text()=&quot;ACH&quot; or text()=&quot;CFM&quot;]">Expected BuildingAirLeakage/UnitofMeasure to be 'ACH' or 'CFM'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[AirInfiltrationMeasurement=ACHorCFM]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:AirInfiltration/h:AirInfiltrationMeasurement[h:BuildingAirLeakage/h:UnitofMeasure[text()=&quot;ACH&quot; or text()=&quot;CFM&quot;]]">
      <sch:assert role="ERROR" test="h:HousePressure">Expected HousePressure</sch:assert>
      <sch:assert role="ERROR" test="number(h:HousePressure) = 50">Expected HousePressure to be 50</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Attic]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Attics/h:Attic">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:AtticType[h:Attic | h:CathedralCeiling | h:FlatRoof | h:BelowApartment]">Expected WallType[Attic | CathedralCeiling | FlatRoof | BelowApartment]</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[AtticType=CathedralCeiling]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Attics/h:Attic[h:AtticType/h:CathedralCeiling]">
      <sch:let name="attachedRoofId" value="h:AttachedToRoof/@idref"/>
      <sch:assert role="ERROR" test="ancestor::h:Enclosure/h:Roofs/h:Roof[h:SystemIdentifier/@id=$attachedRoofId]/h:Area">Expected Roof[SystemIdentifier/id=<sch:value-of select="$attachedRoofId"/>]/Area</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[AtticType=UnventedAttic]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Attics/h:Attic[h:AtticType/h:Attic[h:Vented[text()=&quot;false&quot;]]]">
      <sch:let name="attachedRoofId" value="h:AttachedToRoof/@idref"/>
      <sch:assert role="ERROR" test="ancestor::h:Enclosure/h:Roofs/h:Roof[h:SystemIdentifier/@id=$attachedRoofId]/h:Area">Expected Roof[SystemIdentifier/id=<sch:value-of select="$attachedRoofId"/>]/Area</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern ira:remove-measured="true">
    <sch:title>[Foundation]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Foundations/h:Foundation">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:FoundationType[h:Basement | h:Crawlspace | h:SlabOnGrade | h:Garage | h:AboveApartment | h:Ambient | h:BellyAndWing]">Expected WallType[Basement | Crawlspace | SlabOnGrade | Garage | AboveApartment | Ambient | BellyAndWing]</sch:assert>
      <!-- [FoundationType=Basement] [FoundationType=Crawlspace] [FoundationType[SlabOnGrade | AboveApartment]] -->
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Roof]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Roofs/h:Roof">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:RoofColor[text()=&quot;light&quot; or text()=&quot;medium&quot; or text()=&quot;medium dark&quot; or text()=&quot;dark&quot; or text()=&quot;reflective&quot;]">Expected RoofColor to be 'light' or 'medium' or 'medium dark' or 'dark' or 'reflective'</sch:assert>
      <sch:assert role="ERROR" test="(h:Insulation/h:Layer/h:NominalRValue and count(h:Insulation/h:Layer/h:NominalRValue) = count(h:Insulation/h:Layer)) or h:Insulation/h:AssemblyEffectiveRValue">Expected all Insulation/Layer element(s) to have NominalRValue or for AssemblyEffectiveRValue to be set</sch:assert>
      <!-- Warnings -->
      <sch:report role="WARN" test="count(h:Insulation/h:Layer/h:NominalRValue) &gt; 0 and count(h:Insulation/h:AssemblyEffectiveRValue) &gt; 0">Insulation/Layer/NominalRValue and Insulation/AssemblyEffectiveRValue are both entered. Insulation/AssemblyEffectiveRValue takes precedence.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Walls]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls">
      <sch:assert role="ERROR" test="(count(h:Wall) = count(h:Wall/h:Azimuth)) or (count(h:Wall) = count(h:Wall/h:Orientation)) or (count(h:Wall/h:Azimuth) = 0 and count(h:Wall/h:Orientation) = 0)">Every Wall needs an Orientation or Azimuth, or every wall needs to not have those elements.</sch:assert>
      <sch:assert role="ERROR" test="(count(h:Wall/h:Area) = count(h:Wall)) or (count(h:Wall/h:Area) = 0)">Every Wall should have an Area, or no Walls should have an Area</sch:assert>
      <sch:assert role="ERROR" test="count(h:Wall[h:ExteriorAdjacentTo[text()=&quot;outside&quot; or text()=&quot;unconditioned space&quot; or text()=&quot;other housing unit&quot; or text()=&quot;other heated space&quot; or text()=&quot;other multifamily buffer space&quot; or text()=&quot;other non-freezing space&quot;] and h:InteriorAdjacentTo[text()=&quot;living space&quot; or text()=&quot;conditioned space&quot;]]) &gt; 0">At least one exterior wall needs to be present</sch:assert>
      <sch:assert role="ERROR" test="not(count(h:Wall) &gt; 1 and count(h:Wall[not(h:Azimuth) and not(h:Orientation)]) = count(h:Wall) and count(h:Wall[not(h:Azimuth) and not(h:Orientation) and not(h:Area)]) &gt; 0)">If all Walls are missing both Azimuth and Orientation, and there's more than one Wall, each Wall must have an Area subelement.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Wall]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected Wall/SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:ExteriorAdjacentTo">Expected Wall/ExteriorAdjacentTo</sch:assert>
      <sch:assert role="ERROR" test="h:InteriorAdjacentTo">Expected Wall/InteriorAdjacentTo</sch:assert>
      <!-- See [WallType[WoodStud | SteelFrame]] -->
      <sch:assert role="ERROR" test="(h:Insulation/h:Layer/h:NominalRValue and count(h:Insulation/h:Layer/h:NominalRValue) = count(h:Insulation/h:Layer)) or h:Insulation/h:AssemblyEffectiveRValue">Expected all Insulation/Layer element(s) to have NominalRValue or for AssemblyEffectiveRValue to be set</sch:assert>
      <!-- Warnings -->
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[FoundationWalls]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:FoundationWalls">
      <sch:assert role="ERROR" test="count(h:FoundationWall) &lt;= 1 or count(h:FoundationWall) = count(h:FoundationWall/h:Area)">If there is more than one FoundationWall, an Area is expected for each</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[FoundationWall]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:FoundationWalls/h:FoundationWall">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id=//h:Foundation[h:FoundationType[not(h:SlabOnGrade | h:AboveApartment)]]/h:AttachedToFoundationWall/@idref" ira:remove-measured="true">Each FoundationWall must be referenced by a Foundation</sch:assert>
      <!-- Warnings -->
      <sch:report role="WARN" test="count(h:Insulation/h:Layer/h:NominalRValue) &gt; 0 and count(h:Insulation/h:AssemblyEffectiveRValue) &gt; 0">Insulation/Layer/NominalRValue and Insulation/AssemblyEffectiveRValue are both entered. Insulation/AssemblyEffectiveRValue takes precedence.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Floor]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Floors/h:Floor">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:ExteriorAdjacentTo[text()=&quot;outside&quot; or text()=&quot;attic - vented&quot; or text()=&quot;attic - unvented&quot; or text()=&quot;basement - conditioned&quot; or text()=&quot;basement - unconditioned&quot; or text()=&quot;crawlspace - vented&quot; or text()=&quot;crawlspace - unvented&quot; or text()=&quot;crawlspace - conditioned&quot; or text()=&quot;garage&quot; or text()=&quot;other housing unit&quot; or text()=&quot;other heated space&quot; or text()=&quot;other multifamily buffer space&quot; or text()=&quot;other non-freezing space&quot; or text()=&quot;manufactured home underbelly&quot;]">Expected ExteriorAdjacentTo to be present and one of 'outside', 'attic - vented', 'attic - unvented', 'basement - conditioned', 'basement - unconditioned', 'crawlspace - vented', 'crawlspace - unvented', 'crawlspace - conditioned', 'garage', 'other housing unit', 'other heated space', 'other multifamily buffer space', 'other non-freezing space', or 'manufactured home underbelly'</sch:assert>
      <sch:assert role="ERROR" test="h:InteriorAdjacentTo[text()=&quot;conditioned space&quot; or text()=&quot;attic - vented&quot; or text()=&quot;attic - unvented&quot; or text()=&quot;basement - conditioned&quot; or text()=&quot;basement - unconditioned&quot; or text()=&quot;crawlspace - vented&quot; or text()=&quot;crawlspace - unvented&quot; or text()=&quot;crawlspace - conditioned&quot; or text()=&quot;garage&quot;]">Expected InteriorAdjacentTo to be present and one of 'conditioned space', 'attic - vented', 'attic - unvented', 'basement - conditioned', 'basement - unconditioned', 'crawlspace - vented', 'crawlspace - unvented', 'crawlspace - conditioned', 'garage'</sch:assert>
      <sch:assert role="ERROR" test="(h:Insulation/h:Layer/h:NominalRValue and count(h:Insulation/h:Layer/h:NominalRValue) = count(h:Insulation/h:Layer)) or h:Insulation/h:AssemblyEffectiveRValue">Expected all Insulation/Layer element(s) to have NominalRValue or for AssemblyEffectiveRValue to be set</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Slab]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Slabs/h:Slab">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:PerimeterInsulation/h:Layer/h:NominalRValue and count(h:PerimeterInsulation/h:Layer) = count(h:PerimeterInsulation/h:Layer/h:NominalRValue)">PerimeterInsulation/Layer/NominalRValue is expected for all Layers</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Window and Skylight]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Windows/h:Window|/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Skylights/h:Skylight">
      <sch:assert role="ERROR" test="(h:UFactor and h:SHGC) or (h:FrameType and h:GlassLayers)">Expected UFactor and SHGC or FrameType and GlassLayers</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatingSystem]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem">
      <sch:assert role="ERROR" test="h:HeatingSystemType[h:ElectricResistance | h:Furnace | h:WallFurnace | h:FloorFurnace | h:Boiler | h:Stove]">Expected HeatingSystemType to be ElectricResistance, Furnace, WallFurnace, FloorFurnace, Boiler, or Stove</sch:assert>
      <!-- See [HeatingSystemType=Resistance] or [HeatingSystemType=Furnace] or [HeatingSystemType=WallFurnace] or [HeatingSystemType=FloorFurnace] or [HeatingSystemType=InUnitBoiler] or [HeatingSystemType=Stove] -->
      <sch:assert role="ERROR" test="h:FractionHeatLoadServed | h:FloorAreaServed">Expected FractionHeatLoadServed or FloorAreaServed</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatingSystemType=Resistance]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType/h:ElectricResistance]">
      <sch:assert role="ERROR" test="not(h:DistributionSystem)">DistributionSystem not allowed for HeatingSystemType/Resistance, use Furnace or Boiler instead</sch:assert>
      <sch:assert role="ERROR" test="h:HeatingSystemFuel[text()=&quot;electricity&quot;]">Expected HeatingSystemFuel to be 'electricity'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatingSystemType=Furnace|WallFurnace|FloorFurnace|InUnitBoiler]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType[h:Furnace|h:WallFurnace|h:FloorFurnace|h:Boiler]]">
      <sch:assert role="ERROR" test="h:HeatingSystemFuel[text()=&quot;electricity&quot; or text()=&quot;natural gas&quot; or text()=&quot;fuel oil&quot; or text()=&quot;fuel oil 1&quot; or text()=&quot;fuel oil 2&quot; or text()=&quot;fuel oil 4&quot; or text()=&quot;fuel oil 5/6&quot; or text()=&quot;propane&quot;]">Expected HeatingSystemFuel to be 'electricity', 'natural gas', 'fuel oil', 'fuel oil 1', 'fuel oil 2', 'fuel oil 4', 'fuel oil 5/6', or 'propane'</sch:assert>
      <sch:assert role="ERROR" test="h:AnnualHeatingEfficiency[h:Units=&quot;AFUE&quot;]/h:Value or h:YearInstalled or h:ModelYear">Expected AnnualHeatingEfficiency[Units="AFUE"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatingSystemType=Furnace]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType/h:Furnace]">
      <sch:assert role="ERROR" test="h:DistributionSystem/@idref">Expected DistributionSystem/@idref</sch:assert>
      <sch:assert role="ERROR" test="../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution">Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert>
      <!-- See [HVACDistribution] -->
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatingSystemType=WallFurnace|FloorFurnace]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType[h:WallFurnace|h:FloorFurnace]]">
      <sch:assert role="ERROR" test="not(h:DistributionSystem)">DistributionSystem not allowed</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatingSystemType=Stove]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType/h:Stove]">
      <sch:assert role="ERROR" test="not(h:DistributionSystem)">DistributionSystem not allowed</sch:assert>
      <sch:assert role="ERROR" test="h:HeatingSystemFuel">Expected HeatingSystemFuel</sch:assert>
      <sch:assert role="ERROR" test="h:HeatingSystemFuel[text()=&quot;wood&quot; or text()=&quot;wood pellets&quot;]">Expected HeatingSystemFuel to be 'wood' or 'wood pellets'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[CoolingSystem]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem">
      <sch:assert role="ERROR" test="h:CoolingSystemType[text()=&quot;central air conditioner&quot; or text()=&quot;room air conditioner&quot; or text()=&quot;evaporative cooler&quot; or text()=&quot;mini-split&quot;]">Expected CoolingSystemType to be 'central air conditioner', 'room air conditioner', 'evaporative cooler', or 'mini-split'</sch:assert>
      <sch:assert role="ERROR" test="h:FractionCoolLoadServed | h:FloorAreaServed">Expected FractionCoolLoadServed or FloorAreaServed</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[CoolingSystemType=CentralAC]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem[h:CoolingSystemType=&quot;central air conditioner&quot;]">
      <sch:assert role="ERROR" test="../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution">Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert>
      <!-- See [HVACDistribution] -->
      <sch:assert role="ERROR" test="h:AnnualCoolingEfficiency[h:Units=&quot;SEER&quot; or h:Units=&quot;SEER2&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualCoolingEfficiency[Units="SEER" or Units="SEER2"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[CoolingSystemType=PTACorRoomAC]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem[h:CoolingSystemType=&quot;room air conditioner&quot; or h:CoolingSystemType=&quot;packaged terminal air conditioner&quot;]">
      <sch:assert role="ERROR" test="not(h:DistributionSystem)">DistributionSystem not allowed</sch:assert>
      <sch:assert role="ERROR" test="h:AnnualCoolingEfficiency[h:Units=&quot;EER&quot; or h:Units=&quot;CEER&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualCoolingEfficiency[Units="EER" or Units="CEER"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[CoolingSystemType=MiniSplitAC]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem[h:CoolingSystemType=&quot;mini-split&quot;]">
      <sch:assert role="ERROR" test="h:AnnualCoolingEfficiency[h:Units=&quot;SEER&quot; or h:Units=&quot;SEER2&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualCoolingEfficiency[Units="SEER" or Units="SEER2"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatPump]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump">
      <sch:assert role="ERROR" test="h:HeatPumpType[text()=&quot;air-to-air&quot; or text()=&quot;mini-split&quot; or text()=&quot;ground-to-air&quot;]">Expected HeatPumpType to be 'air-to-air', 'mini-split', or 'ground-to-air'</sch:assert>
      <sch:assert role="ERROR" test="(h:FractionHeatLoadServed and h:FractionCoolLoadServed) or h:FloorAreaServed">Expected FractionHeatLoadServed and FractionCoolLoadServed or FloorAreaServed</sch:assert>
      <sch:assert role="ERROR" test="h:HeatPumpFuel[text()=&quot;electricity&quot;]">Expected HeatPumpFuel to be 'electricity'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatPumpType=AirSource]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump[h:HeatPumpType=&quot;air-to-air&quot;]">
      <sch:assert role="ERROR" test="../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution">Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert>
      <!-- See [HVACDistribution] -->
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatPumpType=AirSource|MiniSplit]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump[h:HeatPumpType=&quot;mini-split&quot; or h:HeatPumpType=&quot;air-to-air&quot;]">
      <sch:assert role="ERROR" test="h:AnnualCoolingEfficiency[h:Units=&quot;SEER&quot; or h:Units=&quot;SEER2&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualCoolingEfficiency[Units="SEER" or Units="SEER2"]/Value, YearInstalled, or ModelYear</sch:assert>
      <sch:assert role="ERROR" test="h:AnnualHeatingEfficiency[h:Units=&quot;HSPF&quot; or h:Units=&quot;HSPF2&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualHeatingEfficiency[Units="HSPF" or Units="HSPF2"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HeatPumpType=GroundSource]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump[h:HeatPumpType=&quot;ground-to-air&quot;]">
      <sch:assert role="ERROR" test="../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution">Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert>
      <!-- See [HVACDistribution] -->
      <sch:assert role="ERROR" test="h:AnnualCoolingEfficiency[h:Units=&quot;EER&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualCoolingEfficiency[Units="EER"]/Value, YearInstalled, or ModelYear</sch:assert>
      <sch:assert role="ERROR" test="h:AnnualHeatingEfficiency[h:Units=&quot;COP&quot;]/h:Value | h:YearInstalled | h:ModelYear">Expected AnnualHeatingEfficiency[Units="COP"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[DuctLeakageMeasurement]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACDistribution[h:DistributionSystemType/h:AirDistribution]/h:DuctLeakageMeasurement">
      <sch:assert role="ERROR" test="h:DuctLeakage[h:Units=&quot;CFM25&quot;] | h:LeakinessObservedVisualInspection">Expected DuctLeakage[Units="CFM25"] | LeakinessObservedVisualInspection</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[DuctLeakage=CFM]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACDistribution/h:DistributionSystemType/h:AirDistribution/h:DuctLeakageMeasurement/h:DuctLeakage[h:Units=&quot;CFM25&quot;]">
      <sch:assert role="ERROR" test="h:Value">Expected Value</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HVACDuct]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACDistribution/h:DistributionSystemType/h:AirDistribution/h:Ducts">
      <sch:assert role="ERROR" test="h:DuctInsulationRValue | h:DuctInsulationThickness | h:DuctInsulationMaterial">Expected DuctInsulationRValue, DuctInsulationThickness, or DuctInsulationMaterial</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WaterHeating]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems">
      <sch:assert role="ERROR" test="h:WaterHeating/h:WaterHeatingSystem">Expected WaterHeatingSystem</sch:assert>
      <sch:assert role="ERROR" test="(count(h:WaterHeating/h:WaterHeatingSystem/h:FractionDHWLoadServed) = count(h:WaterHeating/h:WaterHeatingSystem)) or (count(h:WaterHeating/h:WaterHeatingSystem) = 1)">If there is more than 1 WaterHeatingSystem, FractionDHWLoadServed is expected for each</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WaterHeatingSystem]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem">
      <sch:assert role="ERROR" test="h:WaterHeaterType[text()=&quot;storage water heater&quot; or text()=&quot;dedicated boiler with storage tank&quot; or text()=&quot;instantaneous water heater&quot; or text()=&quot;heat pump water heater&quot; or text()=&quot;space-heating boiler with storage tank&quot; or text()=&quot;space-heating boiler with tankless coil&quot;]">Expected WaterHeaterType to be one of 'storage water heater', 'dedicated boiler with storage tank', 'instantaneous water heater', 'heat pump water heater', 'space-heating boiler with storage tank', or 'space-heating boiler with tankless coil'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WaterHeatingSystemType=Tank|Tankless|HeatPump]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[h:WaterHeaterType=&quot;storage water heater&quot; or h:WaterHeaterType=&quot;dedicated boiler with storage tank&quot; or h:WaterHeaterType=&quot;instantaneous water heater&quot; or h:WaterHeaterType=&quot;heat pump water heater&quot;]">
      <sch:assert role="ERROR" test="h:UniformEnergyFactor | h:EnergyFactor | h:YearInstalled | h:ModelYear">Expected UniformEnergyFactor, EnergyFactor, YearInstalled, or ModelYear</sch:assert>
      <sch:assert role="ERROR" test="h:FuelType[text()=&quot;natural gas&quot; or text()=&quot;fuel oil&quot; or text()=&quot;fuel oil 1&quot; or text()=&quot;fuel oil 2&quot; or text()=&quot;fuel oil 4&quot; or text()=&quot;fuel oil 5/6&quot; or text()=&quot;propane&quot; or text()=&quot;electricity&quot;]">Expected FuelType to be one of 'natural gas', 'electricity', 'propane', 'fuel oil', 'fuel oil 1', 'fuel oil 2', 'fuel oil 4', or 'fuel oil 5/6'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WaterHeatingSystemType=HeatPump]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[h:WaterHeaterType=&quot;heat pump water heater&quot;]">
      <sch:assert role="ERROR" test="h:FuelType[text()=&quot;electricity&quot;]">Expected FuelType = "electricity"</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WaterHeatingSystemType=CombiIndirect|CombiTanklessCoil]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[h:WaterHeaterType=&quot;space-heating boiler with storage tank&quot; or h:WaterHeaterType=&quot;space-heating boiler with tankless coil&quot;]">
      <sch:assert role="ERROR" test="h:RelatedHVACSystem">Expected RelatedHVACSystem</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[PVSystem]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:Photovoltaics/h:PVSystem">
      <sch:assert role="ERROR" test="h:ArrayAzimuth | h:ArrayOrientation">Expected ArrayAzimuth or ArrayOrientation</sch:assert>
      <sch:assert role="ERROR" test="h:ArrayTilt">Expected ArrayTilt</sch:assert>
      <sch:assert role="ERROR" test="h:CollectorArea | h:NumberOfPanels | h:MaxPowerOutput">Expected one of MaxPowerOutput, NumberOfPanels, or CollectorArea</sch:assert>
      <sch:assert role="ERROR" test="h:YearInverterManufactured | h:YearModulesManufactured">Expected one of YearInverterManufactured or YearModulesManufactured</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ElectricPanels]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems">
      <sch:assert role="ERROR" test="h:ElectricPanels/h:ElectricPanel">Expected ElectricPanels/ElectricPanel</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ElectricPanel]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:ElectricPanels/h:ElectricPanel">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:MaxCurrentRating">Expected MaxCurrentRating</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ModeledUsages]</sch:title>
    <sch:rule context="/h:HPXML/h:Building">
      <sch:assert role="ERROR" test="h:ModeledUsages/h:ModeledUsage[h:EnergyType=&quot;electricity&quot;]">Expected ModeledUsages with all modeled fuel types (electricity at a minimum)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ModeledUsage]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:ModeledUsages/h:ModeledUsage">
      <sch:assert role="ERROR" test="h:AnnualConsumption">Expected AnnualConsumption</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[HPXML/Consumption]</sch:title>
    <sch:rule context="/h:HPXML">
      <sch:assert role="ERROR" test="h:Consumption[h:ConsumptionDetails/h:ConsumptionInfo/h:ConsumptionType/h:Energy/h:FuelType=&quot;electricity&quot;]">Expected Consumption (electricity at a minimum)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Consumption]</sch:title>
    <sch:rule context="/h:HPXML/h:Consumption">
      <sch:assert role="ERROR" test="h:BuildingID/@idref">Expected BuildingID/@idref</sch:assert>
      <sch:assert role="ERROR" test="h:ConsumptionDetails">Expected ConsumptionDetails</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern ira:remove-measured="true">
    <sch:title>[ConsumptionInfo]</sch:title>
    <sch:rule context="/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo">
      <sch:assert role="ERROR" test="h:BPI2400Inputs">Expected BPI2400Inputs</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern ira:remove-measured="true">
    <sch:title>[BPI2400Inputs]</sch:title>
    <sch:rule context="/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:BPI2400Inputs">
      <sch:assert role="ERROR" test="h:WeatherRegressionBeginDate">Expected WeatherRegressionBeginDate</sch:assert>
      <sch:assert role="ERROR" test="h:WeatherRegressionEndDate">Expected WeatherRegressionEndDate</sch:assert>
      <sch:assert role="ERROR" test="h:CalibrationQualification">Expected CalibrationQualification</sch:assert>
      <sch:assert role="ERROR" test="h:CalibrationWeatherRegressionCVRMSE">Expected CalibrationWeatherRegressionCVRMSE</sch:assert>
      <sch:assert role="ERROR" test="h:WeatherNormalizedHeatingUsage">Expected WeatherNormalizedHeatingUsage</sch:assert>
      <sch:assert role="ERROR" test="h:WeatherNormalizedCoolingUsage">Expected WeatherNormalizedCoolingUsage</sch:assert>
      <sch:assert role="ERROR" test="h:WeatherNormalizedBaseloadUsage">Expected WeatherNormalizedBaseloadUsage</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern ira:remove-measured="true">
    <sch:title>[BPI2400Inputs=Detailed]</sch:title>
    <sch:rule context="/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:BPI2400Inputs[h:CalibrationQualification=&quot;detailed&quot;]">
      <sch:assert role="ERROR" test="h:DetailedModelCalibrationHeatingBiasError">Expected DetailedModelCalibrationHeatingBiasError</sch:assert>
      <sch:assert role="ERROR" test="h:DetailedModelCalibrationHeatingAbsoluteError">Expected DetailedModelCalibrationHeatingAbsoluteError</sch:assert>
      <sch:assert role="ERROR" test="h:DetailedModelCalibrationCoolingBiasError">Expected DetailedModelCalibrationCoolingBiasError</sch:assert>
      <sch:assert role="ERROR" test="h:DetailedModelCalibrationCoolingAbsoluteError">Expected DetailedModelCalibrationCoolingAbsoluteError</sch:assert>
      <sch:assert role="ERROR" test="h:DetailedModelCalibrationBaseloadBiasError">Expected DetailedModelCalibrationBaseloadBiasError</sch:assert>
      <sch:assert role="ERROR" test="h:DetailedModelCalibrationBaseloadAbsoluteError">Expected DetailedModelCalibrationBaseloadAbsoluteError</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern ira:remove-measured="true">
    <sch:title>[BPI2400Inputs=Simple]</sch:title>
    <sch:rule context="/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:BPI2400Inputs[h:CalibrationQualification=&quot;simple&quot;]">
      <sch:assert role="ERROR" test="h:SimplifiedModelCalibrationHeatingBiasError">Expected SimplifiedModelCalibrationHeatingBiasError</sch:assert>
      <sch:assert role="ERROR" test="h:SimplifiedModelCalibrationCoolingBiasError">Expected SimplifiedModelCalibrationCoolingBiasError</sch:assert>
      <sch:assert role="ERROR" test="h:SimplifiedModelCalibrationBaseloadBiasError">Expected SimplifiedModelCalibrationBaseloadBiasError</sch:assert>
      <sch:assert role="ERROR" test="h:SimplifiedModelCalibrationTotalBiasError">Expected SimplifiedModelCalibrationTotalBiasError</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ConsumptionDetail]</sch:title>
    <sch:rule context="/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:ConsumptionDetail">
      <!-- Consumption is required by the xsd -->
      <sch:assert role="ERROR" test="h:StartDateTime">Expected StartDateTime</sch:assert>
      <sch:assert role="ERROR" test="h:EndDateTime">Expected EndDateTime</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WallInsulationLayer]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall/h:Insulation/h:Layer">
      <sch:assert role="ERROR" test="h:NominalRValue">Expected NominalRValue</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[VentilationFan]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:MechanicalVentilation/h:VentilationFans/h:VentilationFan">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role="ERROR" test="h:FanType">Expected FanType</sch:assert>
      <sch:assert role="ERROR" test="h:RatedFlowRate">Expected RatedFlowRate</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[WaterHeatingSystem]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[not(h:WaterHeaterType=&quot;instantaneous water heater&quot; or h:WaterHeaterType=&quot;space-heating boiler with tankless coil&quot;)]">
      <sch:assert role="ERROR" test="h:TankVolume">Expected TankVolume</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[BuildingDetails]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails">
      <sch:assert role="ERROR" test="h:Appliances">Expected Appliances</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Appliances]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Appliances">
      <sch:assert role="ERROR" test="h:ClothesWasher">Expected ClothesWasher</sch:assert>
      <sch:assert role="ERROR" test="h:ClothesDryer">Expected ClothesDryer</sch:assert>
      <sch:assert role="ERROR" test="h:CookingRange">Expected CookingRange</sch:assert>
      <sch:assert role="ERROR" test="h:Oven">Expected Oven</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Appliances/All]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:*[not(name() = &quot;extension&quot;)]">
      <sch:assert role="ERROR" test="h:SystemIdentifier/@id">Expected SystemIdentifier/@id</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ClothesWasher]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:ClothesWasher">
      <sch:assert role="ERROR" test="h:Type">Expected Type</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[ClothesDryer]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:ClothesDryer">
      <sch:assert role="ERROR" test="h:Type">Expected Type</sch:assert>
      <sch:assert role="ERROR" test="h:FuelType">Expected FuelType</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[CookingRange]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:CookingRange">
      <sch:assert role="ERROR" test="h:FuelType">Expected FuelType</sch:assert>
      <sch:assert role="ERROR" test="h:IsInduction">Expected IsInduction</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>[Oven]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:Oven">
      <sch:assert role="ERROR" test="h:FuelType">Expected FuelType</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
