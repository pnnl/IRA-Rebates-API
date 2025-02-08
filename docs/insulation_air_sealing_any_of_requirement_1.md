
Insulation Air Sealing Any of Requirement 1
===========================================
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[cfm50](#cfm50)|`integer`||||
|[is_leakage_rate_known](#is_leakage_rate_known)|`boolean`|:white_check_mark:|||
|[upgrade_subtype](#upgrade_subtype)|`AIR_SEALING`|:white_check_mark:|||
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[is_leakage_rate_known](#is_leakage_rate_known) is `True`|[cfm50](#cfm50)|||
|[is_leakage_rate_known](#is_leakage_rate_known) is not `True`||[cfm50](#cfm50)||

## cfm50
  
  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `100`
## is_leakage_rate_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## upgrade_subtype
  
  
  

- is required
- Type: `AIR_SEALING`
- can not be null
