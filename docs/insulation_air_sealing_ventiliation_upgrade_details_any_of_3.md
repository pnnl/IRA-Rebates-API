
Insulation Air Sealing Ventiliation Upgrade Details Any of 3
============================================================
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Nullable|Format|Title|
| :---: | :---: | :---: | :---: | :---: | :---: |
|[cavity_insulation_added](#cavity_insulation_added)|`enum`||False|||
|[exterior_continuous_insulation_added](#exterior_continuous_insulation_added)|`enum`||False|||
|[percent_wall_area_treated](#percent_wall_area_treated)|`enum`|:white_check_mark:|False|||
|[upgrade_subtype](#upgrade_subtype)|`WALL_INSULATION`|:white_check_mark:|False|||

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
