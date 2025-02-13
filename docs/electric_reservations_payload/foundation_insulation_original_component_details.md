


  
[electric_reservations_payload](electric_reservations_payload.md) / [original_component_details](original_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_original_component_details](insulation_air_sealing_ventilation_original_component_details.md)
# Foundation Insulation Original Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[foundation_type](#foundation_type)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`FOUNDATION_INSULATION`|:white_check_mark:|||

## foundation_type
  
Pick the one with the most area  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CONDITIONED_BASEMENT`|
|`CONDITIONED_CRAWLSPACE`|
|`SLAB_ON_GRADE`|
|`UNCONDITIONED_BASEMENT`|
|`UNCONDITIONED_CRAWLSPACE`|

## upgrade_subtype
  
  
  

- is required
- Type: `FOUNDATION_INSULATION`
- can not be null
  
Constant: `FOUNDATION_INSULATION`