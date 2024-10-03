<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch='http://purl.oclc.org/dsdl/schematron' xmlns:ira='https://hpxml.nrel.gov/ira'>
  <sch:title>HPXML Import Schematron Validator</sch:title>
  <sch:ns uri='http://hpxmlonline.com/2023/09' prefix='h'/>

  <sch:pattern>
    <sch:title>[Root]</sch:title>
    <sch:rule context='/h:HPXML'>
      <sch:assert role='ERROR' test='count(h:Building) &gt;= 1'>Expected Building</sch:assert> <!-- See [Building] -->
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Building]</sch:title>
    <sch:rule context='/h:HPXML/h:Building'>
      <sch:assert role='ERROR' test='h:BuildingID/@id'>Expected BuildingID/@id</sch:assert>
      <sch:assert role='ERROR' test='h:Site'>Expected Site</sch:assert>
      <sch:assert role='ERROR' test='h:ProjectStatus'>Expected ProjectStatus</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[BuildingSite]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:Site'>
      <sch:assert role='ERROR' test='count(h:Address[h:AddressType="street"]) = 1'>Expected only 1 Address[AddressType="street"] for each Building</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Address]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:Site/h:Address[h:AddressType="street"]'>
      <sch:assert role='ERROR' test='h:Address1'>Expected Address1</sch:assert>
      <sch:assert role='ERROR' test='h:CityMunicipality'>Expected CityMunicipality</sch:assert>
      <sch:assert role='ERROR' test='h:StateCode'>Expected StateCode</sch:assert>
      <sch:assert role='ERROR' test='h:ZipCode'>Expected ZipCode</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[BuildingConstruction]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:BuildingSummary/h:BuildingConstruction'>
      <sch:assert role='ERROR' test='h:YearBuilt'>Expected YearBuilt</sch:assert>
      <sch:assert role='ERROR' test='h:ResidentialFacilityType'>Expected ResidentialFacilityType</sch:assert> <!-- See [BuildingType=SFAorMF] -->
      <sch:assert role='ERROR' test='h:ResidentialFacilityType[text()="single-family detached" or text()="single-family attached" or text()="apartment unit" or text()="manufactured home" or text()="multi-family - town homes"]'>Expected ResidentialFacilityType to be one of 'single-family detached', 'single-family attached', 'apartment unit', 'manufactured home', 'multi-family - town homes'</sch:assert>
      <sch:assert role='ERROR' test='h:ConditionedFloorArea'>Expected ConditionedFloorArea</sch:assert>
      <sch:assert role='ERROR' test='h:NumberofConditionedFloorsAboveGrade'>Expected NumberofConditionedFloorsAboveGrade</sch:assert>
      <sch:assert role='ERROR' test='h:NumberofBedrooms' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected NumberofBedrooms</sch:assert>
      <sch:assert role='ERROR' test='h:AverageCeilingHeight | h:ConditionedBuildingVolume' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected AverageCeilingHeight or ConditionedBuildingVolume</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-req-modeled='true' ira:remove-measured='true'>
    <sch:title>[BuildingType=ManufacturedHome]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:BuildingSummary/h:BuildingConstruction/h:ResidentialFacilityType[text()="manufactured home"]'>
      <sch:assert role='ERROR' test='h:ManufacturedHomeSections'>Expected ManufacturedHomeSections</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ProjectStatus]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:ProjectStatus'>
      <sch:assert role='ERROR' test='h:EventType'>Expected EventType</sch:assert>
      <sch:assert role='ERROR' test='h:Date'>Expected Date</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[BuildingDetails]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails'>
      <sch:assert role='ERROR' test='h:BuildingSummary/h:Site'>Expected BuildingSummary/Site</sch:assert> <!-- See [BuildingSite] -->
      <sch:assert role='ERROR' test='h:Enclosure/h:AirInfiltration/h:AirInfiltrationMeasurement[h:BuildingAirLeakage/h:AirLeakage | h:LeakinessDescription | h:AirSealing]'>Expected Enclosure/AirInfiltration/AirInfiltrationMeasurement[BuildingAirLeakage/AirLeakage | LeakinessDescription | AirSealing]</sch:assert> <!-- See [BuildingAirLeakage] or [AirInfiltrationMeasurement=ACHorCFM]-->
      <sch:assert role='ERROR' test='h:Enclosure/h:Attics/h:Attic'>Expected Enclosure/Attics/Attic</sch:assert> <!-- See [Attic] -->
      <sch:assert role='ERROR' test='h:Enclosure/h:Foundations/h:Foundation' ira:remove-measured='true'>Expected Enclosure/Foundations/Foundation</sch:assert> <!-- See [Foundation] -->
      <sch:assert role='ERROR' test='h:Enclosure/h:Walls/h:Wall'>Expected Enclosure/Walls/Wall</sch:assert> <!-- see [Wall] -->
      <sch:assert role='ERROR' test='h:Enclosure/h:Windows/h:Window'>Expected Enclosure/Windows/Window</sch:assert> <!-- see [Window] -->
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-req-modeled='true' ira:remove-measured='true'>
    <sch:title>[BuildingSummarySite]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:BuildingSummary/h:Site'>
      <sch:assert role='ERROR' test='h:AzimuthOfFrontOfHome | h:OrientationOfFrontOfHome'>Expected AzimuthOfFrontOfHome or OrientationOfFrontOfHome</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[BuildingAirLeakage]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:AirInfiltration/h:AirInfiltrationMeasurement[h:BuildingAirLeakage/h:AirLeakage]'>
      <sch:assert role='ERROR' test='h:BuildingAirLeakage/h:UnitofMeasure'>Expected BuildingAirLeakage/UnitofMeasure</sch:assert>
      <sch:assert role='ERROR' test='h:BuildingAirLeakage/h:UnitofMeasure[text()="ACH" or text()="CFM"]'>Expected BuildingAirLeakage/UnitofMeasure to be 'ACH' or 'CFM'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[AirInfiltrationMeasurement=ACHorCFM]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:AirInfiltration/h:AirInfiltrationMeasurement[h:BuildingAirLeakage/h:UnitofMeasure[text()="ACH" or text()="CFM"]]'>
      <sch:assert role='ERROR' test='h:HousePressure'>Expected HousePressure</sch:assert>
      <sch:assert role='ERROR' test='number(h:HousePressure) = 50'>Expected HousePressure to be 50</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Attic]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Attics/h:Attic'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:AtticType[h:Attic | h:CathedralCeiling | h:FlatRoof | h:BelowApartment]'>Expected WallType[Attic | CathedralCeiling | FlatRoof | BelowApartment]</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[AtticType=CathedralCeiling]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Attics/h:Attic[h:AtticType/h:CathedralCeiling]'>
      <sch:let name="attachedRoofId" value="h:AttachedToRoof/@idref"/>
      <sch:assert role='ERROR' test='ancestor::h:Enclosure/h:Roofs/h:Roof[h:SystemIdentifier/@id=$attachedRoofId]/h:Area'>Expected Roof[SystemIdentifier/id=<sch:value-of select="$attachedRoofId"/>]/Area</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[AtticType=UnventedAttic]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Attics/h:Attic[h:AtticType/h:Attic[h:Vented[text()="false"]]]'>
      <sch:let name="attachedRoofId" value="h:AttachedToRoof/@idref"/>
      <sch:assert role='ERROR' test='ancestor::h:Enclosure/h:Roofs/h:Roof[h:SystemIdentifier/@id=$attachedRoofId]/h:Area'>Expected Roof[SystemIdentifier/id=<sch:value-of select="$attachedRoofId"/>]/Area</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-measured='true'>
    <sch:title>[Foundation]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Foundations/h:Foundation'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:FoundationType[h:Basement | h:Crawlspace | h:SlabOnGrade | h:Garage | h:AboveApartment | h:Ambient | h:BellyAndWing]'>Expected WallType[Basement | Crawlspace | SlabOnGrade | Garage | AboveApartment | Ambient | BellyAndWing]</sch:assert> <!-- [FoundationType=Basement] [FoundationType=Crawlspace] [FoundationType[SlabOnGrade | AboveApartment]] -->
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-measured='true' ira:remove-req-modeled='true'>
    <sch:title>[FoundationType[SlabOnGrade | AboveApartment]]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Foundations/h:Foundation[h:FoundationType[h:SlabOnGrade | h:AboveApartment]]'>
      <sch:assert role='ERROR' test='not(h:AttachedToFoundationWall)'>FoundationType[SlabOnGrade | AboveApartment] should not have foundation walls associated with it</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Roof]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Roofs/h:Roof'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:RoofType[text()="asphalt or fiberglass shingles" or text()="wood shingles or shakes" or text()="shingles" or text()="slate or tile shingles" or text()="metal surfacing" or text()="plastic/rubber/synthetic sheeting" or text()="concrete"]' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected RoofType to be 'asphalt or fiberglass shingles' or 'wood shingles or shakes' or 'shingles' or 'slate or tile shingles' or 'metal surfacing' or 'plastic/rubber/synthetic sheeting' or 'concrete'</sch:assert>
      <sch:assert role='ERROR' test='h:RoofColor[text()="light" or text()="medium" or text()="medium dark" or text()="dark" or text()="reflective"]'>Expected RoofColor to be 'light' or 'medium' or 'medium dark' or 'dark' or 'reflective'</sch:assert>
      <sch:assert role='ERROR' test='(h:Insulation/h:Layer/h:NominalRValue and count(h:Insulation/h:Layer/h:NominalRValue) = count(h:Insulation/h:Layer)) or h:Insulation/h:AssemblyEffectiveRValue'>Expected all Insulation/Layer element(s) to have NominalRValue or for AssemblyEffectiveRValue to be set</sch:assert>
      <!-- Warnings -->
      <sch:report role='WARN' test='count(h:Insulation/h:Layer/h:NominalRValue) &gt; 0 and count(h:Insulation/h:AssemblyEffectiveRValue) &gt; 0'>Insulation/Layer/NominalRValue and Insulation/AssemblyEffectiveRValue are both entered. Insulation/AssemblyEffectiveRValue takes precedence.</sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Walls]</sch:title>
    <sch:rule context="/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls">
      <sch:assert role='ERROR' test='(count(h:Wall) = count(h:Wall/h:Azimuth)) or (count(h:Wall) = count(h:Wall/h:Orientation)) or (count(h:Wall/h:Azimuth) = 0 and count(h:Wall/h:Orientation) = 0)'>Every Wall needs an Orientation or Azimuth, or every wall needs to not have those elements.</sch:assert>
      <sch:assert role='ERROR' test='(count(h:Wall/h:Area) = count(h:Wall)) or (count(h:Wall/h:Area) = 0)'>Every Wall should have an Area, or no Walls should have an Area</sch:assert>
      <sch:assert role='ERROR' test='count(h:Wall[h:ExteriorAdjacentTo[text()="outside" or text()="unconditioned space" or text()="other housing unit" or text()="other heated space" or text()="other multifamily buffer space" or text()="other non-freezing space"] and h:InteriorAdjacentTo[text()="living space" or text()="conditioned space"]]) &gt; 0'>At least one exterior wall needs to be present</sch:assert>
      <sch:assert role='ERROR' test='not(count(h:Wall) &gt; 1 and count(h:Wall[not(h:Azimuth) and not(h:Orientation)]) = count(h:Wall) and count(h:Wall[not(h:Azimuth) and not(h:Orientation) and not(h:Area)]) &gt; 0)'>If all Walls are missing both Azimuth and Orientation, and there's more than one Wall, each Wall must have an Area subelement.</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Wall]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected Wall/SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:ExteriorAdjacentTo'>Expected Wall/ExteriorAdjacentTo</sch:assert>
      <sch:assert role='ERROR' test='h:InteriorAdjacentTo'>Expected Wall/InteriorAdjacentTo</sch:assert>
      <sch:assert role='ERROR' test='h:WallType[h:WoodStud or h:ConcreteMasonryUnit or h:SteelFrame or h:StructuralBrick or h:StrawBale or h:Stone]' ira:remove-req-modeled='true' ira:remove-measured='true'>A WallType of WoodStud, ConcreteMasonryUnit, SteelFrame, StructuralBrick, StrawBale, or Stone is expected. Received <sch:value-of select="name(h:WallType/h:*[1])" /></sch:assert> <!-- See [WallType[WoodStud | SteelFrame]] -->
      <sch:assert role='ERROR' test='(h:Insulation/h:Layer/h:NominalRValue and count(h:Insulation/h:Layer/h:NominalRValue) = count(h:Insulation/h:Layer)) or h:Insulation/h:AssemblyEffectiveRValue'>Expected all Insulation/Layer element(s) to have NominalRValue or for AssemblyEffectiveRValue to be set</sch:assert>
      <sch:assert role='ERROR' test="(count(h:Area) > 0) or (not(h:Area) and not(h:Orientation)) or (not(h:Area) and count(h:Orientation) > 0 and count(../h:Wall[not(h:Area) and h:Orientation[text()=current()/h:Orientation]]) = 1)" ira:remove-req-modeled='true' ira:remove-measured='true'>Walls with the same Orientation must have an Area specified</sch:assert>
      <sch:assert role='ERROR' test="(count(h:Area) > 0) or (not(h:Area) and not(h:Azimuth)) or (not(h:Area) and count(h:Azimuth) > 0 and count(../h:Wall[not(h:Area) and h:Azimuth[text()=current()/h:Azimuth]]) = 1)" ira:remove-req-modeled='true' ira:remove-measured='true'>Walls with the same Azimuth must have an Area specified</sch:assert>
      <!-- Warnings -->
      <sch:report role='WARN' test='count(h:Insulation/h:Layer/h:NominalRValue) &gt; 0 and count(h:Insulation/h:AssemblyEffectiveRValue) &gt; 0' ira:remove-req-modeled='true' ira:remove-measured='true'>Insulation/Layer/NominalRValue and Insulation/AssemblyEffectiveRValue are both entered. Insulation/AssemblyEffectiveRValue takes precedence.</sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-req-modeled='true' ira:remove-measured='true'>
    <sch:title>[WallType[WoodStud | SteelFrame]]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall[h:ExteriorAdjacentTo[text()="outside"] and not(h:InteriorAdjacentTo[text()="garage"]) and not(h:AtticWallType[text()="knee wall"]) and h:WallType[h:WoodStud | h:SteelFrame]]'>
      <sch:assert role='ERROR' test='h:Siding[text()="wood siding" or text()="vinyl siding" or text()="stucco" or text()="fiber cement siding" or text()="brick veneer" or text()="aluminum siding" or text()="masonite siding" or text()="composite shingle siding" or text()="asbestos siding" or text()="synthetic stucco"]'>Expected Siding to be present and one of 'wood siding', 'vinyl siding', 'stucco', 'fiber cement siding', 'brick veneer', 'aluminum siding', 'masonite siding', 'composite shingle siding', 'asbestos siding', or 'synthetic stucco'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-req-modeled='true' ira:remove-measured='true'>
    <sch:title>[WallType[ConcreteMasonryUnit | Stone]]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall[h:ExteriorAdjacentTo[text()="outside"] and not(h:InteriorAdjacentTo[text()="garage"]) and not(h:AtticWallType[text()="knee wall"]) and h:WallType[h:ConcreteMasonryUnit | h:Stone]]'>
      <sch:assert role='ERROR' test='h:Siding[text()="stucco" or text()="brick veneer" or text()="synthetic stucco" or text()="none"]'>Expected Siding to be present and one of 'stucco', 'brick veneer', 'synthetic stucco', or 'none'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-req-modeled="true" ira:remove-measured="true">
    <sch:title>[AtticWallType[text()="knee wall"]]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall[h:AtticWallType[text()="knee wall"]]'>
      <sch:assert role='ERROR' test='h:Area = 1'>Knee walls should have an area</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[FoundationWalls]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:FoundationWalls'>
      <sch:assert role='ERROR' test='count(h:FoundationWall) &lt;= 1 or count(h:FoundationWall) = count(h:FoundationWall/h:Area)'>If there is more than one FoundationWall, an Area is expected for each</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[FoundationWall]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:FoundationWalls/h:FoundationWall'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test="h:SystemIdentifier/@id=//h:Foundation[h:FoundationType[not(h:SlabOnGrade | h:AboveApartment)]]/h:AttachedToFoundationWall/@idref" ira:remove-measured='true'>Each FoundationWall must be referenced by a Foundation</sch:assert>
      <!-- Warnings -->
      <sch:report role='WARN' test='count(h:Insulation/h:Layer/h:NominalRValue) &gt; 0 and count(h:Insulation/h:AssemblyEffectiveRValue) &gt; 0'>Insulation/Layer/NominalRValue and Insulation/AssemblyEffectiveRValue are both entered. Insulation/AssemblyEffectiveRValue takes precedence.</sch:report>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Floor]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Floors/h:Floor'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:ExteriorAdjacentTo[text()="outside" or text()="attic - vented" or text()="attic - unvented" or text()="basement - conditioned" or text()="basement - unconditioned" or text()="crawlspace - vented" or text()="crawlspace - unvented" or text()="crawlspace - conditioned" or text()="garage" or text()="other housing unit" or text()="other heated space" or text()="other multifamily buffer space" or text()="other non-freezing space" or text()="manufactured home underbelly"]'>Expected ExteriorAdjacentTo to be present and one of 'outside', 'attic - vented', 'attic - unvented', 'basement - conditioned', 'basement - unconditioned', 'crawlspace - vented', 'crawlspace - unvented', 'crawlspace - conditioned', 'garage', 'other housing unit', 'other heated space', 'other multifamily buffer space', 'other non-freezing space', or 'manufactured home underbelly'</sch:assert>
      <sch:assert role='ERROR' test='h:InteriorAdjacentTo[text()="conditioned space" or text()="attic - vented" or text()="attic - unvented" or text()="basement - conditioned" or text()="basement - unconditioned" or text()="crawlspace - vented" or text()="crawlspace - unvented" or text()="crawlspace - conditioned" or text()="garage"]'>Expected InteriorAdjacentTo to be present and one of 'conditioned space', 'attic - vented', 'attic - unvented', 'basement - conditioned', 'basement - unconditioned', 'crawlspace - vented', 'crawlspace - unvented', 'crawlspace - conditioned', 'garage'</sch:assert>
      <sch:assert role='ERROR' test='h:Area' ira:remove-measured='true' ira:remove-req-modeled='true'>Expected Area</sch:assert>
      <sch:assert role='ERROR' test='(h:Insulation/h:Layer/h:NominalRValue and count(h:Insulation/h:Layer/h:NominalRValue) = count(h:Insulation/h:Layer)) or h:Insulation/h:AssemblyEffectiveRValue'>Expected all Insulation/Layer element(s) to have NominalRValue or for AssemblyEffectiveRValue to be set</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Slab]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Slabs/h:Slab'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:Area' ira:remove-measured='true' ira:remove-req-modeled='true'>Expected Area</sch:assert>
      <sch:assert role='ERROR' test='h:PerimeterInsulation/h:Layer/h:NominalRValue and count(h:PerimeterInsulation/h:Layer) = count(h:PerimeterInsulation/h:Layer/h:NominalRValue)'>PerimeterInsulation/Layer/NominalRValue is expected for all Layers</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Window and Skylight]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Windows/h:Window|/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Skylights/h:Skylight'>
      <sch:assert role='ERROR' test='h:Area' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected Area</sch:assert>
      <sch:assert role='ERROR' test='h:GlassLayers[text()="single-pane" or text()="double-pane" or text()="triple-pane"] or not(h:GlassLayers)' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected GlassLayers to be 'single-pane' or 'double-pane' or 'triple-pane'</sch:assert>
      <sch:assert role='ERROR' test='h:FrameType[h:Aluminum | h:Fiberglass | h:Metal | h:Vinyl | h:Wood | h:Composite] or not(h:FrameType)' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected FrameType of Aluminum, Fiberglass, Metal, Vinyl, Wood, or Composite</sch:assert>
      <sch:assert role='ERROR' test='(h:UFactor and h:SHGC) or (h:FrameType and h:GlassLayers)'>Expected UFactor and SHGC or FrameType and GlassLayers</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-req-modeled='true' ira:remove-measured='true'>
    <sch:title>[Window]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Windows/h:Window'>
      <sch:assert role='ERROR' test='h:Azimuth or h:Orientation or h:AttachedToWall'>Expected Azimuth or Orientation or AttachedToWall</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatingSystem]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem'>
      <sch:assert role='ERROR' test='h:HeatingSystemType[h:ElectricResistance | h:Furnace | h:WallFurnace | h:FloorFurnace | h:Boiler | h:Stove]'>Expected HeatingSystemType to be ElectricResistance, Furnace, WallFurnace, FloorFurnace, Boiler, or Stove</sch:assert> <!-- See [HeatingSystemType=Resistance] or [HeatingSystemType=Furnace] or [HeatingSystemType=WallFurnace] or [HeatingSystemType=FloorFurnace] or [HeatingSystemType=InUnitBoiler] or [HeatingSystemType=Stove] -->
      <sch:assert role='ERROR' test='h:FractionHeatLoadServed | h:FloorAreaServed'>Expected FractionHeatLoadServed or FloorAreaServed</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatingSystemType=Resistance]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType/h:ElectricResistance]'>
      <sch:assert role='ERROR' test='not(h:DistributionSystem)'>DistributionSystem not allowed for HeatingSystemType/Resistance, use Furnace or Boiler instead</sch:assert>
      <sch:assert role='ERROR' test='h:HeatingSystemFuel[text()="electricity"]'>Expected HeatingSystemFuel to be 'electricity'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatingSystemType=Furnace|WallFurnace|FloorFurnace|InUnitBoiler]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType[h:Furnace|h:WallFurnace|h:FloorFurnace|h:Boiler]]'>
      <sch:assert role='ERROR' test='h:HeatingSystemFuel[text()="electricity" or text()="natural gas" or text()="fuel oil" or text()="fuel oil 1" or text()="fuel oil 2" or text()="fuel oil 4" or text()="fuel oil 5/6" or text()="propane"]'>Expected HeatingSystemFuel to be 'electricity', 'natural gas', 'fuel oil', 'fuel oil 1', 'fuel oil 2', 'fuel oil 4', 'fuel oil 5/6', or 'propane'</sch:assert>
      <sch:assert role='ERROR' test='h:AnnualHeatingEfficiency[h:Units="AFUE"]/h:Value or h:YearInstalled or h:ModelYear'>Expected AnnualHeatingEfficiency[Units="AFUE"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatingSystemType=Furnace]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType/h:Furnace]'>
      <sch:assert role='ERROR' test='h:DistributionSystem/@idref'>Expected DistributionSystem/@idref</sch:assert>
      <sch:assert role='ERROR' test='../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution'>Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert> <!-- See [HVACDistribution] -->
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatingSystemType=WallFurnace|FloorFurnace]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType[h:WallFurnace|h:FloorFurnace]]'>
      <sch:assert role='ERROR' test='not(h:DistributionSystem)'>DistributionSystem not allowed</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatingSystemType=Stove]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatingSystem[h:HeatingSystemType/h:Stove]'>
      <sch:assert role='ERROR' test='not(h:DistributionSystem)'>DistributionSystem not allowed</sch:assert>
      <sch:assert role='ERROR' test='h:HeatingSystemFuel'>Expected HeatingSystemFuel</sch:assert>
      <sch:assert role='ERROR' test='h:HeatingSystemFuel[text()="wood" or text()="wood pellets"]'>Expected HeatingSystemFuel to be 'wood' or 'wood pellets'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[CoolingSystem]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem'>
      <sch:assert role='ERROR' test='h:CoolingSystemType[text()="central air conditioner" or text()="room air conditioner" or text()="evaporative cooler" or text()="mini-split"]'>Expected CoolingSystemType to be 'central air conditioner', 'room air conditioner', 'evaporative cooler', or 'mini-split'</sch:assert>
      <sch:assert role='ERROR' test='h:FractionCoolLoadServed | h:FloorAreaServed'>Expected FractionCoolLoadServed or FloorAreaServed</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[CoolingSystemType=CentralAC]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem[h:CoolingSystemType="central air conditioner"]'>
      <sch:assert role='ERROR' test='../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution'>Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert> <!-- See [HVACDistribution] -->
      <sch:assert role='ERROR' test='h:AnnualCoolingEfficiency[h:Units="SEER" or h:Units="SEER2"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualCoolingEfficiency[Units="SEER" or Units="SEER2"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[CoolingSystemType=PTACorRoomAC]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem[h:CoolingSystemType="room air conditioner" or h:CoolingSystemType="packaged terminal air conditioner"]'>
      <sch:assert role='ERROR' test='not(h:DistributionSystem)'>DistributionSystem not allowed</sch:assert>
      <sch:assert role='ERROR' test='h:AnnualCoolingEfficiency[h:Units="EER" or h:Units="CEER"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualCoolingEfficiency[Units="EER" or Units="CEER"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[CoolingSystemType=MiniSplitAC]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:CoolingSystem[h:CoolingSystemType="mini-split"]'>
      <sch:assert role='ERROR' test='h:AnnualCoolingEfficiency[h:Units="SEER" or h:Units="SEER2"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualCoolingEfficiency[Units="SEER" or Units="SEER2"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatPump]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump'>
      <sch:assert role='ERROR' test='h:HeatPumpType[text()="air-to-air" or text()="mini-split" or text()="ground-to-air"]'>Expected HeatPumpType to be 'air-to-air', 'mini-split', or 'ground-to-air'</sch:assert>
      <sch:assert role='ERROR' test='(h:FractionHeatLoadServed and h:FractionCoolLoadServed) or h:FloorAreaServed'>Expected FractionHeatLoadServed and FractionCoolLoadServed or FloorAreaServed</sch:assert>
      <sch:assert role='ERROR' test='h:HeatPumpFuel[text()="electricity"]'>Expected HeatPumpFuel to be 'electricity'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatPumpType=AirSource]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump[h:HeatPumpType="air-to-air"]'>
      <sch:assert role='ERROR' test='../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution'>Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert> <!-- See [HVACDistribution] -->
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatPumpType=AirSource|MiniSplit]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump[h:HeatPumpType="mini-split" or h:HeatPumpType="air-to-air"]'>
      <sch:assert role='ERROR' test='h:AnnualCoolingEfficiency[h:Units="SEER" or h:Units="SEER2"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualCoolingEfficiency[Units="SEER" or Units="SEER2"]/Value, YearInstalled, or ModelYear</sch:assert>
      <sch:assert role='ERROR' test='h:AnnualHeatingEfficiency[h:Units="HSPF" or h:Units="HSPF2"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualHeatingEfficiency[Units="HSPF" or Units="HSPF2"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HeatPumpType=GroundSource]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACPlant/h:HeatPump[h:HeatPumpType="ground-to-air"]'>
      <sch:assert role='ERROR' test='../../h:HVACDistribution/h:DistributionSystemType/h:AirDistribution'>Expected HVACDistribution/DistributionSystemType/AirDistribution</sch:assert> <!-- See [HVACDistribution] -->
      <sch:assert role='ERROR' test='h:AnnualCoolingEfficiency[h:Units="EER"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualCoolingEfficiency[Units="EER"]/Value, YearInstalled, or ModelYear</sch:assert>
      <sch:assert role='ERROR' test='h:AnnualHeatingEfficiency[h:Units="COP"]/h:Value | h:YearInstalled | h:ModelYear'>Expected AnnualHeatingEfficiency[Units="COP"]/Value, YearInstalled, or ModelYear</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[DuctLeakageMeasurement]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACDistribution[h:DistributionSystemType/h:AirDistribution]/h:DuctLeakageMeasurement'>
      <sch:assert role='ERROR' test='h:DuctLeakage[h:Units="CFM25"] | h:LeakinessObservedVisualInspection'>Expected DuctLeakage[Units="CFM25"] | LeakinessObservedVisualInspection</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[DuctLeakage=CFM]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACDistribution/h:DistributionSystemType/h:AirDistribution/h:DuctLeakageMeasurement/h:DuctLeakage[h:Units="CFM25"]'>
      <sch:assert role='ERROR' test='h:Value'>Expected Value</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HVACDuct]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:HVAC/h:HVACDistribution/h:DistributionSystemType/h:AirDistribution/h:Ducts'>
      <sch:assert role='ERROR' test='h:DuctLocation[text()="living space" or text()="conditioned space" or text()="unconditioned space" or text()="basement - conditioned" or text()="basement" or text()="basement - unconditioned" or text()="crawlspace - vented" or text()="crawlspace - unvented" or text()="crawlspace - conditioned" or text()="crawlspace - unconditioned" or text()="attic" or text()="attic - vented" or text()="attic - unvented" or text()="attic - conditioned" or text()="attic - unconditioned" or text()="garage" or text()="garage - conditioned" or text()="garage - unconditioned" or text()="exterior wall" or text()="under slab" or text()="roof deck" or text()="outside" or text()="manufactured home belly"]' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected DuctLocation to be one of 'conditioned space', 'unconditioned space', 'basement - conditioned', 'basement', 'basement - unconditioned', 'crawlspace - vented', 'crawlspace - unvented', 'crawlspace - conditioned', 'crawlspace - unconditioned', 'attic', 'attic - vented', 'attic - unvented', 'attic - conditioned', 'attic - unconditioned', 'garage', 'garage - conditioned', 'garage - unconditioned', 'exterior wall', 'under slab', 'roof deck', 'outside', or 'manufactured home belly'</sch:assert>
      <sch:assert role='ERROR' test='h:DuctInsulationRValue | h:DuctInsulationThickness | h:DuctInsulationMaterial'>Expected DuctInsulationRValue, DuctInsulationThickness, or DuctInsulationMaterial</sch:assert>
      <sch:assert role='ERROR' test='h:FractionDuctArea' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected FractionDuctArea</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WaterHeating]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems'>
      <sch:assert role='ERROR' test='h:WaterHeating/h:WaterHeatingSystem'>Expected WaterHeatingSystem</sch:assert>
      <sch:assert role='ERROR' test='(count(h:WaterHeating/h:WaterHeatingSystem/h:FractionDHWLoadServed) = count(h:WaterHeating/h:WaterHeatingSystem)) or (count(h:WaterHeating/h:WaterHeatingSystem) = 1)'>If there is more than 1 WaterHeatingSystem, FractionDHWLoadServed is expected for each</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WaterHeatingSystem]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem'>
      <sch:assert role='ERROR' test='h:WaterHeaterType[text()="storage water heater" or text()="dedicated boiler with storage tank" or text()="instantaneous water heater" or text()="heat pump water heater" or text()="space-heating boiler with storage tank" or text()="space-heating boiler with tankless coil"]'>Expected WaterHeaterType to be one of 'storage water heater', 'dedicated boiler with storage tank', 'instantaneous water heater', 'heat pump water heater', 'space-heating boiler with storage tank', or 'space-heating boiler with tankless coil'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WaterHeatingSystemType=Tank|Tankless|HeatPump]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[h:WaterHeaterType="storage water heater" or h:WaterHeaterType="dedicated boiler with storage tank" or h:WaterHeaterType="instantaneous water heater" or h:WaterHeaterType="heat pump water heater"]'>
      <sch:assert role='ERROR' test='h:UniformEnergyFactor | h:EnergyFactor | h:YearInstalled | h:ModelYear'>Expected UniformEnergyFactor, EnergyFactor, YearInstalled, or ModelYear</sch:assert>
      <sch:assert role='ERROR' test='h:FuelType[text()="natural gas" or text()="fuel oil" or text()="fuel oil 1" or text()="fuel oil 2" or text()="fuel oil 4" or text()="fuel oil 5/6" or text()="propane" or text()="electricity"]'>Expected FuelType to be one of 'natural gas', 'electricity', 'propane', 'fuel oil', 'fuel oil 1', 'fuel oil 2', 'fuel oil 4', or 'fuel oil 5/6'</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WaterHeatingSystemType=HeatPump]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[h:WaterHeaterType="heat pump water heater"]'>
      <sch:assert role='ERROR' test='h:FuelType[text()="electricity"]'>Expected FuelType = "electricity"</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WaterHeatingSystemType=CombiIndirect|CombiTanklessCoil]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[h:WaterHeaterType="space-heating boiler with storage tank" or h:WaterHeaterType="space-heating boiler with tankless coil"]'>
      <sch:assert role='ERROR' test='h:RelatedHVACSystem'>Expected RelatedHVACSystem</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[PVSystem]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:Photovoltaics/h:PVSystem'>
      <sch:assert role='ERROR' test='h:ArrayAzimuth | h:ArrayOrientation'>Expected ArrayAzimuth or ArrayOrientation</sch:assert>
      <sch:assert role='ERROR' test='h:ArrayTilt'>Expected ArrayTilt</sch:assert>
      <sch:assert role='ERROR' test='h:CollectorArea | h:NumberOfPanels | h:MaxPowerOutput'>Expected one of MaxPowerOutput, NumberOfPanels, or CollectorArea</sch:assert>
      <sch:assert role='ERROR' test='h:YearInverterManufactured | h:YearModulesManufactured'>Expected one of YearInverterManufactured or YearModulesManufactured</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>