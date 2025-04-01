<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch='http://purl.oclc.org/dsdl/schematron' xmlns:ira='https://hpxml.nrel.gov/ira'>
  <sch:title>IRA HOMES Rebates 50121 Recommended For Modeled</sch:title>
  <sch:ns uri='http://hpxmlonline.com/2023/09' prefix='h'/>

  <!-- Insert contents of hescore.sch here -->

  <sch:pattern>
    <sch:title>[ElectricPanels]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems'>
      <sch:assert role='ERROR' test='h:ElectricPanels/h:ElectricPanel'>Expected ElectricPanels/ElectricPanel</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ElectricPanel]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:ElectricPanels/h:ElectricPanel'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:MaxCurrentRating'>Expected MaxCurrentRating</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ModeledUsages]</sch:title>
    <sch:rule context='/h:HPXML/h:Building'>
      <sch:assert role='ERROR' test='h:ModeledUsages/h:ModeledUsage[h:EnergyType="electricity"]'>Expected ModeledUsages with all modeled fuel types (electricity at a minimum)</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ModeledUsage]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:ModeledUsages/h:ModeledUsage'>
      <sch:assert role='ERROR' test='h:AnnualConsumption'>Expected AnnualConsumption</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[HPXML/Consumption]</sch:title>
    <sch:rule context='/h:HPXML'>
      <sch:assert role='ERROR' test='h:Consumption[h:ConsumptionDetails/h:ConsumptionInfo/h:ConsumptionType/h:Energy/h:FuelType="electricity"]'>Expected Consumption (electricity at a minimum)</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Consumption]</sch:title>
    <sch:rule context='/h:HPXML/h:Consumption'>
      <sch:assert role='ERROR' test='h:BuildingID/@idref'>Expected BuildingID/@idref</sch:assert>
      <sch:assert role='ERROR' test='h:ConsumptionDetails'>Expected ConsumptionDetails</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ConsumptionInfo]</sch:title>
    <sch:rule context='/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo'>
      <sch:assert role='ERROR' test='h:BPI2400Inputs'></sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-measured='true'>
    <sch:title>[BPI2400Inputs]</sch:title>
    <sch:rule context='/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:BPI2400Inputs'>
      <sch:assert role='ERROR' test='h:WeatherRegressionBeginDate'>Expected WeatherRegressionBeginDate</sch:assert>
      <sch:assert role='ERROR' test='h:WeatherRegressionEndDate'>Expected WeatherRegressionEndDate</sch:assert>
      <sch:assert role='ERROR' test='h:CalibrationQualification'>Expected CalibrationQualification</sch:assert>
      <sch:assert role='ERROR' test='h:CalibrationWeatherRegressionCVRMSE'>Expected CalibrationWeatherRegressionCVRMSE</sch:assert>
      <sch:assert role='ERROR' test='h:WeatherNormalizedHeatingUsage'>Expected WeatherNormalizedHeatingUsage</sch:assert>
      <sch:assert role='ERROR' test='h:WeatherNormalizedCoolingUsage'>Expected WeatherNormalizedCoolingUsage</sch:assert>
      <sch:assert role='ERROR' test='h:WeatherNormalizedBaseloadUsage'>Expected WeatherNormalizedBaseloadUsage</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-measured='true'>
    <sch:title>[BPI2400Inputs=Detailed]</sch:title>
    <sch:rule context='/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:BPI2400Inputs[h:CalibrationQualification="detailed"]'>
      <sch:assert role='ERROR' test='h:DetailedModelCalibrationHeatingBiasError'>Expected DetailedModelCalibrationHeatingBiasError</sch:assert>
      <sch:assert role='ERROR' test='h:DetailedModelCalibrationHeatingAbsoluteError'>Expected DetailedModelCalibrationHeatingAbsoluteError</sch:assert>
      <sch:assert role='ERROR' test='h:DetailedModelCalibrationCoolingBiasError'>Expected DetailedModelCalibrationCoolingBiasError</sch:assert>
      <sch:assert role='ERROR' test='h:DetailedModelCalibrationCoolingAbsoluteError'>Expected DetailedModelCalibrationCoolingAbsoluteError</sch:assert>
      <sch:assert role='ERROR' test='h:DetailedModelCalibrationBaseloadBiasError'>Expected DetailedModelCalibrationBaseloadBiasError</sch:assert>
      <sch:assert role='ERROR' test='h:DetailedModelCalibrationBaseloadAbsoluteError'>Expected DetailedModelCalibrationBaseloadAbsoluteError</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern ira:remove-measured='true'>
    <sch:title>[BPI2400Inputs=Simple]</sch:title>
    <sch:rule context='/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:BPI2400Inputs[h:CalibrationQualification="simple"]'>
      <sch:assert role='ERROR' test='h:SimplifiedModelCalibrationHeatingBiasError'>Expected SimplifiedModelCalibrationHeatingBiasError</sch:assert>
      <sch:assert role='ERROR' test='h:SimplifiedModelCalibrationCoolingBiasError'>Expected SimplifiedModelCalibrationCoolingBiasError</sch:assert>
      <sch:assert role='ERROR' test='h:SimplifiedModelCalibrationBaseloadBiasError'>Expected SimplifiedModelCalibrationBaseloadBiasError</sch:assert>
      <sch:assert role='ERROR' test='h:SimplifiedModelCalibrationTotalBiasError'>Expected SimplifiedModelCalibrationTotalBiasError</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ConsumptionDetail]</sch:title>
    <sch:rule context='/h:HPXML/h:Consumption/h:ConsumptionDetails/h:ConsumptionInfo/h:ConsumptionDetail'>
      <!-- Consumption is required by the xsd -->
      <sch:assert role='ERROR' test='h:StartDateTime'>Expected StartDateTime</sch:assert>
      <sch:assert role='ERROR' test='h:EndDateTime'>Expected EndDateTime</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WallInsulation]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall/h:Insulation'>
      <sch:assert role='ERROR' test='h:Layer'>Expected Layer</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WallInsulationLayer]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Enclosure/h:Walls/h:Wall/h:Insulation/h:Layer'>
      <sch:assert role='ERROR' test='h:InstallationType' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected InstallationType</sch:assert>
      <sch:assert role='ERROR' test='h:InsulationMaterial[not(h:Unknown)]' ira:remove-req-modeled='true' ira:remove-measured='true'>Expected InsulationMaterial</sch:assert>
      <sch:assert role='ERROR' test='h:NominalRValue'>Expected NominalRValue</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[VentilationFan]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:MechanicalVentilation/h:VentilationFans/h:VentilationFan'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
      <sch:assert role='ERROR' test='h:FanType'>Expected FanType</sch:assert>
      <sch:assert role='ERROR' test='h:RatedFlowRate'>Expected RatedFlowRate</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[WaterHeatingSystem]</sch:title>
      <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Systems/h:WaterHeating/h:WaterHeatingSystem[not(h:WaterHeaterType="instantaneous water heater" or h:WaterHeaterType="space-heating boiler with tankless coil")]'>
        <sch:assert role='ERROR' test='h:TankVolume'>Expected TankVolume</sch:assert>
      </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[BuildingDetails]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails'>
      <sch:assert role='ERROR' test='h:Appliances'>Expected Appliances</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Appliances]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Appliances'>
      <sch:assert role='ERROR' test='h:ClothesWasher'>Expected ClothesWasher</sch:assert>
      <sch:assert role='ERROR' test='h:ClothesDryer'>Expected ClothesDryer</sch:assert>
      <sch:assert role='ERROR' test='h:CookingRange'>Expected CookingRange</sch:assert>
      <sch:assert role='ERROR' test='h:Oven'>Expected Oven</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Appliances/All]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:*[not(name() = "extension")]'>
      <sch:assert role='ERROR' test='h:SystemIdentifier/@id'>Expected SystemIdentifier/@id</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ClothesWasher]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:ClothesWasher'>
      <sch:assert role='ERROR' test='h:Type'>Expected Type</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[ClothesDryer]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:ClothesDryer'>
      <sch:assert role='ERROR' test='h:Type'>Expected Type</sch:assert>
      <sch:assert role='ERROR' test='h:FuelType'>Expected FuelType</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[CookingRange]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:CookingRange'>
      <sch:assert role='ERROR' test='h:FuelType'>Expected FuelType</sch:assert>
      <sch:assert role='ERROR' test='h:IsInduction'>Expected IsInduction</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:title>[Oven]</sch:title>
    <sch:rule context='/h:HPXML/h:Building/h:BuildingDetails/h:Appliances/h:Oven'>
      <sch:assert role='ERROR' test='h:FuelType'>Expected FuelType</sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>