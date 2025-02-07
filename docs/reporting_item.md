
Reporting Item
==============
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Nullable|Format|Title|
| :---: | :---: | :---: | :---: | :---: | :---: |
|[address_id](#address_id)|`string`|:white_check_mark:|False|`uuid`|Address id|
|[applicant_id](#applicant_id)|`string`|:white_check_mark:|False||Applicant id|
|[building_project_type](#building_project_type)|`enum`|:white_check_mark:|False||Building project type|
|[claimant_type](#claimant_type)|`enum`|:white_check_mark:|False||Claimant type|
|[construction_type](#construction_type)|`enum`|:white_check_mark:|False||Construction type|
|[contractor_company_name](#contractor_company_name)|`string`||False||Contractor company name|
|[contractor_dac_incentive](#contractor_dac_incentive)|`number`||False||Contractor DAC incentive|
|[contractor_incentive](#contractor_incentive)|`number`||False||Contractor incentive|
|[contractor_name](#contractor_name)|`string`||False||Contractor name|
|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|`enum`||False||Dwelling unit income bucket|
|[energy_data_evaluation_permission](#energy_data_evaluation_permission)|`boolean`|:white_check_mark:|False||Energy data evaluation permission|
|[equipment_and_material_cost](#equipment_and_material_cost)|`number`|:white_check_mark:|False||Equipment and material cost|
|[external_rebate_id](#external_rebate_id)|`string`||False||External rebate id|
|[install_vendor_id](#install_vendor_id)|`string`||False||Vendor id|
|[installation_cost](#installation_cost)|`number`||False||Installation cost|
|[installation_type](#installation_type)|`enum`|:white_check_mark:|False||Installation type|
|[is_contractor_eligible](#is_contractor_eligible)|`boolean`||False||Is contractor eligible|
|[is_disadvantaged_community](#is_disadvantaged_community)|`boolean`|:white_check_mark:|False||Is disadvantaged community|
|[limited_assessment](#limited_assessment)|[limited_assessment](limited_assessment.md)||False||Limited Assessment|
|[mf_building_income_bucket](#mf_building_income_bucket)|`enum`||False||Multifamily building income bucket|
|[mf_conditioned_floor_area](#mf_conditioned_floor_area)|`integer`||False||Multifamily conditioned floor area|
|[mf_num_bedrooms](#mf_num_bedrooms)|`integer`||False||Multifamily num bedrooms|
|[num_occupied_units](#num_occupied_units)|`integer`||False||Num occupied units|
|[num_units](#num_units)|`integer`||False||Num units|
|[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)|`integer`||False||Num units meeting income bucket|
|[original_component_details](#original_component_details)|[original_component_details](original_component_details.md)||False||Original Component Details|
|[product_info](#product_info)|[buildinging_product_info](buildinging_product_info.md)|:white_check_mark:|False||Buildinging Product Info|
|[product_vendor_id](#product_vendor_id)|`string`|:white_check_mark:|False||Vendor id|
|[project_completion_date](#project_completion_date)|`string`|:white_check_mark:|False||Project completion date|
|[project_id](#project_id)|`string`||False||Project id|
|[purchase_date](#purchase_date)|`string`||False||Purchase date|
|[purchase_date_time](#purchase_date_time)|`string`||False|`date-time`|Purchase date-time|
|[rebate_deducted](#rebate_deducted)|`number`|:white_check_mark:|False||Rebate deducted|
|[safety_checks](#safety_checks)|[building_safety_checks](building_safety_checks.md)||False||Building Safety Checks|
|[sf_conditioned_floor_area](#sf_conditioned_floor_area)|`enum`||False||Single-family conditioned floor area|
|[sf_num_bedrooms](#sf_num_bedrooms)|`integer`||False||Single-family num bedrooms|
|[state_attests_proof_of_identity_ownership_income](#state_attests_proof_of_identity_ownership_income)|`boolean`|:white_check_mark:|False||State attests proof of identity ownership income|
|[state_attests_any_failed_inspection_remediated](#state_attests_any_failed_inspection_remediated)|`boolean`|:white_check_mark:|False||State attests any failed inspection remediated|
|[unit_name_or_number](#unit_name_or_number)|`string`||False||Unit name or number|
|[upgrade_component_details](#upgrade_component_details)|[building_upgrade_component_details](building_upgrade_component_details.md)||False||Building Upgrade Component Details|
|[upgrade_type](#upgrade_type)|`enum`|:white_check_mark:|False||Upgrade type|

## One Of
  
  

### Mutual Exclusivity Requirement
  

|`if` present|should `not` be present|
| :--- | :--- |
|[purchase_date_time](#purchase_date_time)|[purchase_date](#purchase_date)|
|[purchase_date](#purchase_date)|[purchase_date_time](#purchase_date_time)|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[building_project_type](#building_project_type) is `MULTIFAMILY_CENTRAL`|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)<br>[unit_name_or_number](#unit_name_or_number)|Determine which fields are required or not allowed when building_project_type is MULTIFAMILY_CENTRAL|
|[building_project_type](#building_project_type) is `MULTIFAMILY_IN_UNIT_PART_OF_BUILDING_PROJECT`|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)<br>[project_id](#project_id)<br>[unit_name_or_number](#unit_name_or_number)|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|Determine which fields are required or not allowed when building_project_type is MULTIFAMILY_IN_UNIT_PART_OF_BUILDING_PROJECT|
|[building_project_type](#building_project_type) is `MULTIFAMILY_IN_UNIT`|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)<br>[num_units](#num_units)<br>[unit_name_or_number](#unit_name_or_number)|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_occupied_units](#num_occupied_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)|Determine which fields are required or not allowed when building_project_type is MULTIFAMILY_IN_UNIT|
|[building_project_type](#building_project_type) is one of [`MANUFACTURED`, `SINGLE_FAMILY_ATTACHED`, `SINGLE_FAMILY_DETACHED`]|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_units](#num_units)<br>[num_occupied_units](#num_occupied_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)<br>[unit_name_or_number](#unit_name_or_number)|Determine which fields are required or not allowed for single family building_project_type|
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_CLOTHES_DRYER`|[original_component_details](#original_component_details)<br>[upgrade_component_details](#upgrade_component_details)||The appropriate schema must be used for original_component_details and upgrade_component_details depending on upgrade_type.|
|[upgrade_type](#upgrade_type) is `ELECTRIC_COOKING_APPLIANCE`|[original_component_details](#original_component_details)<br>[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_WATER_HEATER`|[original_component_details](#original_component_details)<br>[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `ELECTRICAL_PANEL`|[original_component_details](#original_component_details)<br>[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `INSULATION_AIR_SEALING_VENTILATION`|[original_component_details](#original_component_details)<br>[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`|[original_component_details](#original_component_details)|[upgrade_component_details](#upgrade_component_details)||
|[upgrade_type](#upgrade_type) is `ELECTRIC_WIRING`||[original_component_details](#original_component_details)<br>[upgrade_component_details](#upgrade_component_details)||
|[upgrade_type](#upgrade_type) is one of [`ELECTRICAL_PANEL`, `ELECTRIC_WIRING`, `HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`]<br><br> OR <br><br>[upgrade_type](#upgrade_type) is `INSULATION_AIR_SEALING_VENTILATION` AND [upgrade_component_details](#upgrade_component_details).[insulation_air_sealing_ventilation_upgrade_details](#insulation_air_sealing_ventilation_upgrade_details)  contains [insulation_air_sealing_ventilation_upgrade_details_conditional_requirement](insulation_air_sealing_ventilation_upgrade_details_conditional_requirement.md) AND [installation_type](#installation_type) is `DO_IT_YOURSELF`||[contractor_company_name](#contractor_company_name)<br>[contractor_dac_incentive](#contractor_dac_incentive)<br>[contractor_incentive](#contractor_incentive)<br>[contractor_name](#contractor_name)<br>[is_contractor_eligible](#is_contractor_eligible)||
|[upgrade_type](#upgrade_type) is one of [`HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`, `INSULATION_AIR_SEALING_VENTILATION`] AND [building_project_type](#building_project_type) is `MULTIFAMILY_CENTRAL`|[mf_conditioned_floor_area](#mf_conditioned_floor_area)|||
|[upgrade_type](#upgrade_type) is one of [`HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`, `INSULATION_AIR_SEALING_VENTILATION`] AND [building_project_type](#building_project_type) is not `MULTIFAMILY_CENTRAL`|[sf_conditioned_floor_area](#sf_conditioned_floor_area)|||
|[upgrade_type](#upgrade_type) is one of [`HEAT_PUMP_CLOTHES_DRYER`, `HEAT_PUMP_WATER_HEATER`] AND [building_project_type](#building_project_type) is `MULTIFAMILY_CENTRAL`|[mf_num_bedrooms](#mf_num_bedrooms)|||
|[upgrade_type](#upgrade_type) is one of [`HEAT_PUMP_CLOTHES_DRYER`, `HEAT_PUMP_WATER_HEATER`] AND [building_project_type](#building_project_type) is not `MULTIFAMILY_CENTRAL`|[sf_num_bedrooms](#sf_num_bedrooms)|||
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`|[limited_assessment](#limited_assessment)||Determine when limited_assessment is required or not allowed|
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`||||
|[upgrade_type](#upgrade_type) is not one of [`HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`, `HEAT_PUMP_WATER_HEATER`]||||

## address_id
  
A unique identifier associated with the address of the building at which the upgrade(s) will be installed. This id must be obtained using the address-service endpoint.  
  

- is required
- Type: `string`
- can not be null

## applicant_id
  
This identifier is unique to the applicant (the building owner or renter that is to benefit from the rebate). It must be obtained from the API /applicant endpoint.  
  

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

## contractor_company_name
  
The name of the primary contracting company for the project.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`
## contractor_dac_incentive
  
This is the amount the state will pay to a contractor as a disadvantaged-community incentive. This field is required if the address of the building is within a DAC.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## contractor_incentive
  
This is the amount the state will pay to a contractor as an incentive. This is separate from any contractor DAC incentive.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## contractor_name
  
The name of the primary contractor for the project.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`
## dwelling_unit_income_bucket
  
The household income level of the applicant compared to the area median income (AMI).  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`80%_AND_GREATER_BUT_LESS_THAN_150%_AMI`|
|`LESS_THAN_80%_AMI`|

## energy_data_evaluation_permission
  
Set to true if the home/building owner has given their permission to share energy data with the State and the DOE for evaluation purposes.  
  

- is required
- Type: `boolean`
- can not be null

## equipment_and_material_cost
  
The total cost of the equipment and materials purchased as part of a redemption.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Exclusive Minimum: `0`
## external_rebate_id
  
This is an optional field that a state can use for their own purposes to identify a rebate or rebate reservation.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`
## install_vendor_id
  
This is a unique identifier for a vendor that the state will reimburse in connection with a redemption.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `6`  
Maximum Length: `64`
## installation_cost
  
The installation costs associated with this redemption. To qualify, the installation must be performed by an approved contractor. Also see `is_contractor_eligible`.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## installation_type
  
Indicates who performed the installation.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CONTRACTOR_INSTALLED`|
|`DO_IT_YOURSELF`|

## is_contractor_eligible
  
The contractor is eligible if they are on the state's approved list.  
  

- is not required
- Type: `boolean`
- can not be null

## is_disadvantaged_community
  
This field should only be used by states that have been approved by the DOE to do so. If provided, this will override the is_disadvantaged_community value from the address-service.  
  

- is required
- Type: `boolean`
- can not be null

## limited_assessment
  
  
  

- is not required
- Type: [limited_assessment](limited_assessment.md)
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

## mf_conditioned_floor_area
  
The conditioned floor area for the entire multifamily building including common areas.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `1000`  
Maximum Number: `1000000`
## mf_num_bedrooms
  
The number of bedrooms for the entire multifamily building.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`  
Maximum Number: `10000`
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
## original_component_details
  
  
  

- is not required
- Type: [original_component_details](original_component_details.md)
- can not be null

## product_info
  
Provide identifying information for the qualifying product or products that are covered by this rebate.  
  

- is required
- Type: [buildinging_product_info](buildinging_product_info.md)
- can not be null
  
Minimum number of items: `1`
## product_vendor_id
  
This is a unique identifier for a vendor that the state will reimburse in connection with a redemption.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `6`  
Maximum Length: `64`
## project_completion_date
  
This is a calendar date in the form YYYY-MM-DD. Time zone is immaterial.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `10`  
Maximum Length: `10`  
Regex Pattern: `^\d{4}-\d{2}-\d{2}$`
## project_id
  
This is a unique string supplied by the API user that is used to associate one or more reservations to a single project. Note: it is recommended that a uuid be used to avoid duplication, but the API user can use any other system that they find convenient, provided that it is unique for the state.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `6`  
Maximum Length: `36`
## purchase_date
  
This is a calendar date in the form YYYY-MM-DD. Time zone is immaterial. This represents the date the product was purchased. Either this field or 'purchase_date_time' is required for product redemption.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `10`  
Maximum Length: `10`  
Regex Pattern: `^\d{4}-\d{2}-\d{2}$`
## purchase_date_time
  
This is the date and time a product was purchased. Either this field or the 'purchase_date' field is required for product redemption. Note that the 'purchase_date_time' field will be deprecated in the future.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `10`  
Regex Pattern: `^\d{4}-\d{2}-\d{2}(T\d{2}:\d{2}:\d{2}(Z|([+-]\d{2}:\d{2})))?$|^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}[+-]\d{2}:\d{2}$`  
Comment: The date-time format follows RFC 3339, section 5.6:  https://datatracker.ietf.org/doc/html/rfc3339#section-5.6:~:text=Timestamps%20%20%20%20%20%20%20July%202002-,5.6,-.%20Internet%20Date/Time.
## rebate_deducted
  
This is the amount that was deducted from the customer's/homeowner's purchase price or invoiced amount for products and/or installation.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## safety_checks
  
  
  

- is not required
- Type: [building_safety_checks](building_safety_checks.md)
- can not be null

## sf_conditioned_floor_area
  
This is the conditioned floor area for an individual dwelling unit, either a single-family home or a unit in a multifamily building.  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`1500SF_2500SF`|
|`500SF_1500SF`|
|`GREATER_THAN_2500SF`|
|`LESS_THAN_500SF`|

## sf_num_bedrooms
  
The number of bedrooms in the dwelling unit.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`  
Maximum Number: `20`
## state_attests_proof_of_identity_ownership_income
  
The state attests that they have obtained the required proof of identify, proof of ownership, and proof of income for this rebate.  
  

- is required
- Type: `boolean`
- can not be null

## state_attests_any_failed_inspection_remediated
  
  
  

- is required
- Type: `boolean`
- can not be null

## unit_name_or_number
  
This is the unit designator for a unit in a multifamily building. Do NOT include words or abbreviations such as 'APT' or 'UNIT'. For example, if the unit is referred to as 'APT 7B', then *unit_name_or_number* should be '7B'.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `32`
## upgrade_component_details
  
  
  

- is not required
- Type: [building_upgrade_component_details](building_upgrade_component_details.md)
- can not be null

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
