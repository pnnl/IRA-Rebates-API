



# Electric Eligible Rebates Payload
  
Defined in: [electrificationEligibleRebate.schema.json](https://ira-rebates.labworks.org/schemas/electrificationEligibleRebate)  
Type: `object`  
Additional Properties Allowed: `True`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[address_id](#address_id)|`string`|:white_check_mark:|`uuid`|Address id|
|[building_project_type](#building_project_type)|`enum`|:white_check_mark:||Building project type|
|[claimant_type](#claimant_type)|`enum`|:white_check_mark:||Claimant type|
|[construction_type](#construction_type)|`enum`|:white_check_mark:||Construction type|
|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|`enum`|||Dwelling unit income bucket|
|[installation_type](#installation_type)|`enum`|:white_check_mark:||Installation type|
|[is_disadvantaged_community](#is_disadvantaged_community)|`boolean`|:white_check_mark:||Is disadvantaged community|
|[mf_building_income_bucket](#mf_building_income_bucket)|`enum`|||Multifamily building income bucket|
|[num_occupied_units](#num_occupied_units)|`integer`|||Num occupied units|
|[num_units](#num_units)|`integer`|||Num units|
|[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)|`integer`|||Num units meeting income bucket|
|[reservation_amount](#reservation_amount)|`number`|||Requested reservation amount|
|[unit_name_or_number](#unit_name_or_number)|`string`|||Unit name or number|
|[upgrade_type](#upgrade_type)|`enum`|:white_check_mark:||Upgrade type|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[building_project_type](#building_project_type) is `MULTIFAMILY_CENTRAL`|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)||Determine which fields are required when building_project_type is MULTIFAMILY_CENTRAL|
|[building_project_type](#building_project_type) is `MULTIFAMILY_IN_UNIT_PART_OF_BUILDING_PROJECT`|[mf_building_income_bucket](#mf_building_income_bucket)<br>[project_id](#project_id)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)<br>[unit_name_or_number](#unit_name_or_number)||Determine which fields are required when building_project_type is MULTIFAMILY_IN_UNIT_PART_OF_BUILDING_PROJECT|
|[building_project_type](#building_project_type) is `MULTIFAMILY_IN_UNIT`|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)<br>[num_units](#num_units)<br>[unit_name_or_number](#unit_name_or_number)|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_occupied_units](#num_occupied_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)|Determine which fields are required when building_project_type is MULTIFAMILY_IN_UNIT|
|[building_project_type](#building_project_type) is one of [`MANUFACTURED`, `SINGLE_FAMILY_ATTACHED`, `SINGLE_FAMILY_DETACHED`]|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_occupied_units](#num_occupied_units)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)<br>[unit_name_or_number](#unit_name_or_number)|Determine which fields are required for single family building_project_type|

## address_id
  
A unique identifier associated with the address of the building at which the upgrade(s) will be installed. This id must be obtained using the address-service endpoint.  
  

- is required
- Type: `string`
- can not be null

## building_project_type
  
This describes both the type of the building and, in the multifamily case, whether the upgrade in this reservation applies to the whole building or to a single unit. If it applies to a single unit, there is a further distinction between an upgrade that is part of a whole building project and a stand-alone upgrade. For the MULTIFAMILY_IN_UNIT_PART_OF_BUILDING_PROJECT and MULTIFAMILY_CENTRAL cases, the income bucket for the building, mf_income_bucket, is used. Otherwise, the income bucket for the dwelling unit, dwelling_unit_income_bucket, is used.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`MANUFACTURED`|
|`MULTIFAMILY_CENTRAL`|
|`MULTIFAMILY_IN_UNIT`|
|`MULTIFAMILY_IN_UNIT_PART_OF_BUILDING_PROJECT`|
|`SINGLE_FAMILY_ATTACHED`|
|`SINGLE_FAMILY_DETACHED`|

## claimant_type
  
The type of person or entity that is initiating the rebate process on behalf of the applicant.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CONTRACTOR`|
|`HOMEOWNER`|
|`MULTIFAMILY_BUILDING_OWNER`|
|`OTHER`|
|`TENANT`|

## construction_type
  
Set to NEW if the building is less than one year old. Otherwise, set to EXISTING.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`EXISTING`|
|`NEW`|

## dwelling_unit_income_bucket
  
The household income level of the applicant compared to the area median income (AMI).  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`80%_AND_GREATER_BUT_LESS_THAN_150%_AMI`|
|`LESS_THAN_80%_AMI`|

## installation_type
  
Indicates who performed the installation.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CONTRACTOR_INSTALLED`|
|`DO_IT_YOURSELF`|

## is_disadvantaged_community
  
This field should only be used by states that have been approved by the DOE to do so. If provided, this will override the is_disadvantaged_community value from the address-service.  
  

- is required
- Type: `boolean`
- can not be null

## mf_building_income_bucket
  
Choose the lowest area median income (AMI) range for which at least 50% of the household units fall into the range or lower. For example, consider a five-unit apartment building for which one units falls in the `LESS_THAN_80%_AMI` range, two fall in the `80%_AND_GREATER_BUT_LESS_THAN_150%_AMI`, and the other two have household incomes above these ranges. Then the `80%_AND_GREATER_BUT_LESS_THAN_150%_AMI` range should be chosen because more than half of the units fall into this range or lower.  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`80%_AND_GREATER_BUT_LESS_THAN_150%_AMI`|
|`LESS_THAN_80%_AMI`|

## num_occupied_units
  
This is the number of occupied units in a multifamily building.   
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`  
Maximum Number: `1000`
## num_units
  
This is the total number of units in a multifamily building. This field is required when *building_project_type* is any of the enumerated values that has a "MULTIFAMILY" prefix. Otherwise, the field should be omitted.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `2`  
Maximum Number: `1000`
## num_units_meeting_income_bucket
  
This is the number of occupied units in a multifamily building for which the household income falls within the income range represented by *mf_income_bucket* or is lower.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `1`  
Maximum Number: `1000`
## reservation_amount
  
Optional API user-specified reservation amount. Use this to request a reservation amount that is less than the otherwise allowed amount. For example, this can be helpful if you need several concurrent reservations to support different parts of a project and need to make sure the total of the reservations will not exceed the $14,000 household cap.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Exclusive Minimum: `0`
## unit_name_or_number
  
This is the unit designator for a unit in a multifamily building. Do NOT include words or abbreviations such as 'APT' or 'UNIT'. For example, if the unit is referred to as 'APT 7B', then *unit_name_or_number* should be '7B'.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `32`
## upgrade_type
  
The upgrade covered by this reservation. These upgrade types are the ones specifically listed in the IRA legislation.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`ELECTRICAL_PANEL`|
|`ELECTRIC_COOKING_APPLIANCE`|
|`ELECTRIC_WIRING`|
|`HEAT_PUMP_CLOTHES_DRYER`|
|`HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`|
|`HEAT_PUMP_WATER_HEATER`|
|`INSULATION_AIR_SEALING_VENTILATION`|
