


  
[electrification_bulk_reporting](electrification_bulk_reporting.md) / [reporting_item](reporting_item.md) / [building_upgrade_component_details](building_upgrade_component_details.md) / [insulation_air_sealing_ventilation_upgrade_details_requirement](insulation_air_sealing_ventilation_upgrade_details_requirement.md) / [insulation_air_sealing_ventilation_upgrade_details](insulation_air_sealing_ventilation_upgrade_details.md)
# Insulation Air Sealing Ventiliation Upgrade Details Any of 6
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[percent_floor_receiving_additional_insulation](#percent_floor_receiving_additional_insulation)|`enum`|:white_check_mark:|||
|[r_value_added](#r_value_added)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`FLOOR_ABOVE_CONDITIONED_SPACE_INSULATION`|:white_check_mark:|||

## percent_floor_receiving_additional_insulation
  
For estimating this percentage, use the total conditioned floor area `mf_conditioned_floor_area` or `sf_conditioned_floor_area`, whichever is required for this reservation.  
  

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
|`LESS_THAN_R10`|
|`MORE_THAN_R30`|
|`R10`|
|`R13`|
|`R19`|
|`R30`|

## upgrade_subtype
  
  
  

- is required
- Type: `FLOOR_ABOVE_CONDITIONED_SPACE_INSULATION`
- can not be null
