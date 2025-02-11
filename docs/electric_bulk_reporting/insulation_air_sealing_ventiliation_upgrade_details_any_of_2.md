


  
[electrification_bulk_reporting](electrification_bulk_reporting.md) / [reporting_item](reporting_item.md) / [building_upgrade_component_details](building_upgrade_component_details.md) / [insulation_air_sealing_ventilation_upgrade_details_requirement](insulation_air_sealing_ventilation_upgrade_details_requirement.md) / [insulation_air_sealing_ventilation_upgrade_details](insulation_air_sealing_ventilation_upgrade_details.md)
# Insulation Air Sealing Ventiliation Upgrade Details Any of 2
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[percent_ceiling_receiving_additional_insulation](#percent_ceiling_receiving_additional_insulation)|`enum`|:white_check_mark:|||
|[r_value_added](#r_value_added)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`CEILING_INSULATION`|:white_check_mark:|||

## percent_ceiling_receiving_additional_insulation
  
Choose the closest percent of total ceiling area that will receive (additional) insulation. The ceiling is the one that is associated with the appropriate conditioned_floor_area field.  
  

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
|`LESS_THAN_R30`|
|`MORE_THAN_R60`|
|`R30`|
|`R49`|
|`R60`|

## upgrade_subtype
  
  
  

- is required
- Type: `CEILING_INSULATION`
- can not be null
