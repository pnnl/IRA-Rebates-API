
Insulation Air Sealing Any of Requirement 4
===========================================
  
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
