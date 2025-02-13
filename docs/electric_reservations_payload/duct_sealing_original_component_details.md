


  
[electric_reservations_payload](electric_reservations_payload.md) / [original_component_details](original_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_original_component_details](insulation_air_sealing_ventilation_original_component_details.md)
# Duct Sealing Original Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[cfm25](#cfm25)|`number`||||
|[is_leakage_rate_known](#is_leakage_rate_known)|`boolean`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`DUCT_SEALING`|:white_check_mark:|||
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[is_leakage_rate_known](#is_leakage_rate_known) is `True`|[cfm25](#cfm25)|||
|[is_leakage_rate_known](#is_leakage_rate_known) is not `True`||[cfm25](#cfm25)||

## cfm25
  
Total duct leakage cfm at 25 Pa pressure difference  
  

- is not required
- Type: `number`
- can not be null

## is_leakage_rate_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## upgrade_subtype
  
  
  

- is required
- Type: `DUCT_SEALING`
- can not be null
  
Constant: `DUCT_SEALING`