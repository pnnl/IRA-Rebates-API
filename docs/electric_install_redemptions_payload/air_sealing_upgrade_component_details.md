


  
[electric_install_redemptions_payload](electric_install_redemptions_payload.md) / [upgrade_component_details](upgrade_component_details.md) / [original_component_details_one_of_1](original_component_details_one_of_1.md) / [insulation_air_sealing_ventilation_upgrade_component_details](insulation_air_sealing_ventilation_upgrade_component_details.md)
# Air Sealing Upgrade Component Details
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[cfm50](#cfm50)|`integer`||||
|[is_homeowner_aware_combustion_safety_tests_are_highly_recommended](#is_homeowner_aware_combustion_safety_tests_are_highly_recommended)|`boolean`|:white_check_mark:|||
|[is_leakage_rate_known](#is_leakage_rate_known)|`boolean`|:white_check_mark:|||
|[locations](#locations)|[location_item](location_item.md)|:white_check_mark:||Location Item|
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
## is_homeowner_aware_combustion_safety_tests_are_highly_recommended
  
Is the homeowner aware that combustion safety tests are highly recommended for homes with any combustion appliances after air sealing projects are completed?  
  

- is required
- Type: `boolean`
- can not be null

## is_leakage_rate_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## locations
  
  
  

- is required
- Type: [location_item](location_item.md)
- can not be null
  
Items should be unique: `True`  
Minimum number of items: `1`
## upgrade_subtype
  
  
  

- is required
- Type: `AIR_SEALING`
- can not be null
  
Constant: `AIR_SEALING`