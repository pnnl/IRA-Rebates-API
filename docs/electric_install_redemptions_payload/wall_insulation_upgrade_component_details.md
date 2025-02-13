


  
[electric_install_redemptions_payload](electric_install_redemptions_payload.md) / [upgrade_component_details](upgrade_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_upgrade_component_details](insulation_air_sealing_ventilation_upgrade_component_details.md)
# Wall Insulation Upgrade Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[cavity_insulation_added](#cavity_insulation_added)|`enum`||||
|[exterior_continuous_insulation_added](#exterior_continuous_insulation_added)|`enum`||||
|[percent_wall_area_treated](#percent_wall_area_treated)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`WALL_INSULATION`|:white_check_mark:|||

## Any Of
  
  
[cavity_insulation_added](#cavity_insulation_added)  
[exterior_continuous_insulation_added](#exterior_continuous_insulation_added)
## cavity_insulation_added
  
  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`MORE_THAN_R21`|
|`R13`|
|`R19`|
|`R21`|

## exterior_continuous_insulation_added
  
  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`1_INCH`|
|`2_INCH`|
|`MORE_THAN_2_INCH`|

## percent_wall_area_treated
  
  
  

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
- Type: `WALL_INSULATION`
- can not be null
  
Constant: `WALL_INSULATION`