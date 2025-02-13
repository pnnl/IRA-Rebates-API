


  
[homes_reservations_payload](homes_reservations_payload.md) / [modeled_pre_retrofit_site_energy_usages_by_fuel_type](modeled_pre_retrofit_site_energy_usages_by_fuel_type.md)
# Site Energy Usage
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[annual_consumption](#annual_consumption)|`number`|:white_check_mark:|||
|[energy_type](#energy_type)|`enum`|:white_check_mark:|||
|[unit_of_measure](#unit_of_measure)|`enum`|:white_check_mark:|||

## annual_consumption
  
The annual site usage for the specified fuel type.  
  

- is required
- Type: `number`
- can not be null
  
Exclusive Minimum: `0`
## energy_type
  
A site fuel type. This enumeration is a subset of https://hpxml.nrel.gov/datadictionary/4.0.0/Building/ModeledUsages/ModeledUsage/EnergyType . In the case of a district-type fuel, the source fuel must be used.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`COAL`|
|`ELECTRICITY`|
|`FUEL_OIL`|
|`KEROSENE`|
|`NATURAL_GAS`|
|`PROPANE`|
|`SOLAR_HOT_WATER`|
|`WOOD`|

## unit_of_measure
  
The energy unit for the energy_type. This enumeration is a subset of https://hpxml.nrel.gov/datadictionary/4.0.0/Building/ModeledUsages/ModeledUsage/UnitofMeasure.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`BTU`|
|`KBTU`|
|`KWH`|
|`MWH`|
|`THERMS`|
