


  
[electric_bulk_reporting_payload](electric_bulk_reporting_payload.md) / [electric_bulk_reporting_payload_item](electric_bulk_reporting_payload_item.md) / [electric_limited_assessments_payload](electric_limited_assessments_payload.md) / [heating_systems](heating_systems.md)
# Heating Systems Item
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[efficiency_afue](#efficiency_afue)|`number`|||Efficiency AFUE|
|[efficiency_hspf](#efficiency_hspf)|`number`|||Efficiency HSPF|
|[fuel_and_system_type](#fuel_and_system_type)|`enum`|:white_check_mark:||Fuel and system type|
|[is_efficiency_known](#is_efficiency_known)|`boolean`|:white_check_mark:||Is efficiency known|
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known)|`boolean`|:white_check_mark:||Is percent conditioned floor area served known|
|[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)|`integer`|||Percent conditioned floor area served|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[is_efficiency_known](#is_efficiency_known) is `True` AND [fuel_and_system_type](#fuel_and_system_type) is `ELECTRIC_HEAT_PUMP`|[efficiency_hspf](#efficiency_hspf)|||
|[is_efficiency_known](#is_efficiency_known) is `True` AND [fuel_and_system_type](#fuel_and_system_type) is not `ELECTRIC_HEAT_PUMP`|[efficiency_afue](#efficiency_afue)|||
|[is_efficiency_known](#is_efficiency_known) is not `True`||[efficiency_hspf](#efficiency_hspf)<br>[efficiency_afue](#efficiency_afue)||
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known) is `True`|[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)|||
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known) is not `True`||[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)||

## efficiency_afue
  
  
  

- is not required
- Type: `number`
- can not be null
  
Maximum Number: `1`  
Exclusive Minimum: `0`
## efficiency_hspf
  
  
  

- is not required
- Type: `number`
- can not be null
  
Minimum Number: `1`
## fuel_and_system_type
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`ELECTRIC_HEAT_PUMP`|
|`ELECTRIC_RESISTANCE_BASEBOARD`|
|`ELECTRIC_RESISTANCE_BOILER`|
|`ELECTRIC_RESISTANCE_FURNACE`|
|`GAS_PROPANE_BOILER`|
|`GAS_PROPANE_FURNACE`|
|`OIL_BOILER`|
|`OIL_FURNACE`|
|`OTHER`|

## is_efficiency_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## is_percent_conditioned_floor_area_served_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## percent_conditioned_floor_area_served
  
For estimating this percentage, use the total conditioned floor area `mf_conditioned_floor_area` or `sf_conditioned_floor_area`, whichever is required for this reservation.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`  
Maximum Number: `100`