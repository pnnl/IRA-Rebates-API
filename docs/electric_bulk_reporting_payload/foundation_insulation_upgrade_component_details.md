


  
[electric_bulk_reporting_payload](electric_bulk_reporting_payload.md) / [electric_bulk_reporting_payload_item](electric_bulk_reporting_payload_item.md) / [upgrade_component_details](upgrade_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_upgrade_component_details](insulation_air_sealing_ventilation_upgrade_component_details.md)
# Foundation Insulation Upgrade Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[percent_foundation_perimeter_receiving_additional_insulation](#percent_foundation_perimeter_receiving_additional_insulation)|`enum`|:white_check_mark:|||
|[r_value_added](#r_value_added)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`FOUNDATION_INSULATION`|:white_check_mark:|||

## percent_foundation_perimeter_receiving_additional_insulation
  
For estimating this percentage, use the distance around the footprint that is determined by either `mf_conditioned_floor_area` or `sf_conditioned_floor_area`, whichever is required for this reservation.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`10`|
|`25`|
|`50`|
|`75`|
|`100`|

## r_value_added
  
Choose the R-value that best describes the amount of insulation added.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`LESS_THAN_R5`|
|`R10`|
|`R13`|
|`R19`|
|`R30`|
|`R5`|

## upgrade_subtype
  
  
  

- is required
- Type: `FOUNDATION_INSULATION`
- can not be null
  
Constant: `FOUNDATION_INSULATION`