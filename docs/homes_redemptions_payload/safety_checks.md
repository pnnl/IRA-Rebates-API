


  
[homes_redemptions_payload](homes_redemptions_payload.md)
# Safety Checks
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[ambient_co_test_result](#ambient_co_test_result)|`enum`|:white_check_mark:||Ambient CO test result|
|[ashrae_62_2_ventilation_calculated](#ashrae_62_2_ventilation_calculated)|`enum`|:white_check_mark:||ASHRAE 62.2 ventilation calculated|
|[confirm_all_safety_check_results_disclosed_to_homeowner](#confirm_all_safety_check_results_disclosed_to_homeowner)|`enum`|:white_check_mark:||ASHRAE 62.2 ventilation calculated|
|[drainage_system_condition](#drainage_system_condition)|`enum`|:white_check_mark:||Drainage system condition|
|[gas_leak_detection_test_result](#gas_leak_detection_test_result)|`enum`|:white_check_mark:||Ambient CO test result|
|[roof_condition](#roof_condition)|`enum`|:white_check_mark:||Drainage system condition|
|[signs_of_mold_or_moisture](#signs_of_mold_or_moisture)|`enum`|:white_check_mark:||ASHRAE 62.2 ventilation calculated|
|[spillage_test_result](#spillage_test_result)|`enum`|:white_check_mark:||Ambient CO test result|
|[undiluted_co_test_result](#undiluted_co_test_result)|`enum`|:white_check_mark:||Ambient CO test result|
|[venting_test_result](#venting_test_result)|`enum`|:white_check_mark:||Ambient CO test result|

## ambient_co_test_result
  
Testing is only required if the home has one or more combustion appliances post-retrofit.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`FAILED`|
|`NA`|
|`PASSED`|
|`WARNING`|

## ashrae_62_2_ventilation_calculated
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`NA`|
|`NO`|
|`YES`|

## confirm_all_safety_check_results_disclosed_to_homeowner
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`NA`|
|`NO`|
|`YES`|

## drainage_system_condition
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`GOOD`|
|`NA`|
|`POTENTIAL_ISSUES`|

## gas_leak_detection_test_result
  
Testing is only required if the home has one or more combustion appliances post-retrofit.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`FAILED`|
|`NA`|
|`PASSED`|
|`WARNING`|

## roof_condition
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`GOOD`|
|`NA`|
|`POTENTIAL_ISSUES`|

## signs_of_mold_or_moisture
  
Contractor should not proceed with energy efficiency measures until mold and moisture issues are mitigated.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`NA`|
|`NO`|
|`YES`|

## spillage_test_result
  
Testing is only required if the home has one or more combustion appliances post-retrofit.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`FAILED`|
|`NA`|
|`PASSED`|
|`WARNING`|

## undiluted_co_test_result
  
Testing is only required if the home has one or more combustion appliances post-retrofit.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`FAILED`|
|`NA`|
|`PASSED`|
|`WARNING`|

## venting_test_result
  
Testing is only required if the home has one or more combustion appliances post-retrofit.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`FAILED`|
|`NA`|
|`PASSED`|
|`WARNING`|
