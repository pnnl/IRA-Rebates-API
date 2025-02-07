
Insulation Air Sealing Ventiliation Upgrade Details Any of 2
============================================================
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Nullable|Format|Title|
| :---: | :---: | :---: | :---: | :---: | :---: |
|[percent_ceiling_receiving_additional_insulation](#percent_ceiling_receiving_additional_insulation)|`enum`|:white_check_mark:|False|||
|[r_value_added](#r_value_added)|`enum`|:white_check_mark:|False|||
|[upgrade_subtype](#upgrade_subtype)|`CEILING_INSULATION`|:white_check_mark:|False|||

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
