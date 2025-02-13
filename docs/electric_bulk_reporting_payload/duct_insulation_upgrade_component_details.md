


  
[electric_bulk_reporting_payload](electric_bulk_reporting_payload.md) / [electric_bulk_reporting_payload_item](electric_bulk_reporting_payload_item.md) / [upgrade_component_details](upgrade_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_upgrade_component_details](insulation_air_sealing_ventilation_upgrade_component_details.md)
# Duct Insulation Upgrade Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[percent_ducts_receiving_additional_insulation](#percent_ducts_receiving_additional_insulation)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`DUCT_INSULATION`|:white_check_mark:|||

## percent_ducts_receiving_additional_insulation
  
The percentage of the ducts that received additional insulation in the upgrade. Choose the closest percentage.  
  

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

## upgrade_subtype
  
  
  

- is required
- Type: `DUCT_INSULATION`
- can not be null
  
Constant: `DUCT_INSULATION`