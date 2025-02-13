


  
[electric_reservations_payload](electric_reservations_payload.md) / [original_component_details](original_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_original_component_details](insulation_air_sealing_ventilation_original_component_details.md)
# Duct Insulation Original Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[primary_duct_location](#primary_duct_location)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`DUCT_INSULATION`|:white_check_mark:|||

## primary_duct_location
  
The type of space in which the majority of the ducts being treated are located.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CONDITIONED_SPACE`|
|`DO_NOT_KNOW`|
|`UNCONDITIONED_SPACE`|

## upgrade_subtype
  
  
  

- is required
- Type: `DUCT_INSULATION`
- can not be null
  
Constant: `DUCT_INSULATION`