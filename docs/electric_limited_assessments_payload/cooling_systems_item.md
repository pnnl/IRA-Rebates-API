


  
[electric_limited_assessments_payload](electric_limited_assessments_payload.md) / [cooling_systems](cooling_systems.md)
# Cooling Systems Item
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[efficiency_seer](#efficiency_seer)|`number`||||
|[is_efficiency_known](#is_efficiency_known)|`boolean`|:white_check_mark:||Is efficiency known|
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known)|`boolean`|:white_check_mark:||Is percent conditioned floor area served known|
|[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)|`integer`||||
|[system_type](#system_type)|`enum`|:white_check_mark:|||
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[is_efficiency_known](#is_efficiency_known) is `True`|[efficiency_seer](#efficiency_seer)|||
|[is_efficiency_known](#is_efficiency_known) is not `True`||[efficiency_seer](#efficiency_seer)||
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known) is `True`|[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)|||
|[is_percent_conditioned_floor_area_served_known](#is_percent_conditioned_floor_area_served_known) is not `True`||[percent_conditioned_floor_area_served](#percent_conditioned_floor_area_served)||

## efficiency_seer
  
  
  

- is not required
- Type: `number`
- can not be null
  
Minimum Number: `1`
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
## system_type
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CENTRAL`|
|`HEAT_PUMP`|
|`WINDOW`|
