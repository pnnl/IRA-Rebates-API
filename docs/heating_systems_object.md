
Heating Systems Object
======================
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Nullable|Format|Title|
| :---: | :---: | :---: | :---: | :---: | :---: |
|[efficiency_afue](#efficiency_afue)|`number`||False||Efficiency AFUE|
|[efficiency_hspf](#efficiency_hspf)|`number`||False||Efficiency HSPF|
|[fuel_and_system_type](#fuel_and_system_type)|`enum`|:white_check_mark:|False||Fuel and system type|
|[is_efficiency_known](#is_efficiency_known)|`boolean`|:white_check_mark:|False||Is efficiency known|
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known)|`boolean`|:white_check_mark:|False||Is percent conditioned floor area served known|
|[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)|`integer`||False||Percent conditioned floor area served|
  

allOf Requirement
=================
  

Conditional Validation
======================
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|`is_efficiency_known` is `True`||||
|`is_percent_conditioned_floor_area_served_known` is `True`|`percent_conditioned_floor_area_served`|||

efficiency_afue
===============
  
  
  

- is not required
- Type: ``number``
- can not be null
  

efficiency_hspf
===============
  
  
  

- is not required
- Type: ``number``
- can not be null
  

fuel_and_system_type
====================
  
  
  

- is required
- Type: ``enum``
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
  

is_efficiency_known
===================
  
  
  

- is required
- Type: ``boolean``
- can not be null
  

is_percent_conditioned_floor_area_served_known
==============================================
  
  
  

- is required
- Type: ``boolean``
- can not be null
  

percent_conditioned_floor_area_served
=====================================
  
For estimating this percentage, use the total conditioned floor area `mf_conditioned_floor_area` or `sf_conditioned_floor_area`, whichever is required for this reservation.  
  

- is not required
- Type: ``integer``
- can not be null
  
