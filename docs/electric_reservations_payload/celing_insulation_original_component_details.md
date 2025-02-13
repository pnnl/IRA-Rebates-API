


  
[electric_reservations_payload](electric_reservations_payload.md) / [original_component_details](original_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_original_component_details](insulation_air_sealing_ventilation_original_component_details.md)
# Celing Insulation Original Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[insulation_type](#insulation_type)|`enum`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`CEILING_INSULATION`|:white_check_mark:|||

## insulation_type
  
The preexisting insulation type for the area to receive (additional) insulation. See https://www.energy.gov/energysaver/types-insulation for information about insulation types.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`BATT`|
|`BLOWN_IN`|
|`CLOSED_CELL_SPRAY_FOAM`|
|`DO_NOT_KNOW`|
|`NONE`|
|`RIGID_BOARD`|

## upgrade_subtype
  
  
  

- is required
- Type: `CEILING_INSULATION`
- can not be null
  
Constant: `CEILING_INSULATION`