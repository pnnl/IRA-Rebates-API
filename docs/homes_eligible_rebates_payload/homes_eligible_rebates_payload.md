



# Homes Eligible Rebates Payload
  
Defined in: [homesEligibleRebate.schema.json](https://ira-rebates.labworks.org/schemas/homesEligibleRebate)  
Type: `object`  
Additional Properties Allowed: `True`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[address_id](#address_id)|`string`|:white_check_mark:|`uuid`|Address id|
|[building_project_type](#building_project_type)|`enum`|:white_check_mark:||Building project type|
|[claimant_type](#claimant_type)|`enum`|:white_check_mark:||Claimant type|
|[construction_type](#construction_type)|`enum`|:white_check_mark:||Construction type|
|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|`enum`|||Dwelling unit income bucket|
|[estimated_percent_energy_savings](#estimated_percent_energy_savings)|`number`||||
|[estimated_post_retrofit_energy_usage_kwh_equivalent](#estimated_post_retrofit_energy_usage_kwh_equivalent)|`integer`|||Estimated post retrofit energy usage kwh equivalent|
|[estimated_post_retrofit_site_energy_usages_by_fuel_type](#estimated_post_retrofit_site_energy_usages_by_fuel_type)|[estimated_post_retrofit_item](estimated_post_retrofit_item.md)|||Estimated Post Retrofit Item|
|[is_disadvantaged_community](#is_disadvantaged_community)|`boolean`|:white_check_mark:||Is disadvantaged community|
|[measured_pre_retrofit_energy_usage_kwh_equivalent](#measured_pre_retrofit_energy_usage_kwh_equivalent)|`integer`|||Measured pre-retrofit energy usage kwh equivalent|
|[measured_pre_retrofit_site_energy_usages_by_fuel_type](#measured_pre_retrofit_site_energy_usages_by_fuel_type)|[measured_pre_retrofit_site_energy_usages_by_fuel_type](measured_pre_retrofit_site_energy_usages_by_fuel_type.md)|||Measured Pre Retrofit Site Energy Usages By Fuel Type|
|[mf_building_income_bucket](#mf_building_income_bucket)|`enum`|||Multifamily building income bucket|
|[modeled_percent_energy_savings](#modeled_percent_energy_savings)|`number`||||
|[modeled_post_retrofit_energy_usage_kwh_equivalent](#modeled_post_retrofit_energy_usage_kwh_equivalent)|`integer`|||Modeled post retrofit energy usage kwh equivalent|
|[modeled_post_retrofit_site_energy_usages_by_fuel_type](#modeled_post_retrofit_site_energy_usages_by_fuel_type)|[modeled_post_retrofit_site_energy_usages_by_fuel_type](modeled_post_retrofit_site_energy_usages_by_fuel_type.md)|||Modeled Post Retrofit Site Energy Usages By Fuel Type|
|[modeled_pre_retrofit_energy_usage_kwh_equivalent](#modeled_pre_retrofit_energy_usage_kwh_equivalent)|`integer`|||Modeled pre-retrofit energy usage kwh equivalent|
|[modeled_pre_retrofit_site_energy_usages_by_fuel_type](#modeled_pre_retrofit_site_energy_usages_by_fuel_type)|[modeled_pre_retrofit_site_energy_usages_by_fuel_type](modeled_pre_retrofit_site_energy_usages_by_fuel_type.md)|||Modeled Pre Retrofit Site Energy Usages By Fuel Type|
|[num_occupied_units](#num_occupied_units)|`integer`|||Num occupied units|
|[num_units](#num_units)|`integer`|||Num units|
|[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)|`integer`|||Num units meeting income bucket|
|[rebate_type](#rebate_type)|`enum`|:white_check_mark:||Rebate type|
|[unit_name_or_number](#unit_name_or_number)|`string`|||Unit name or number|
|[upgrades](#upgrades)|[homes_upgrades](homes_upgrades.md)|:white_check_mark:||Homes upgrades|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[rebate_type](#rebate_type) is not `MODELED`|[software_used_to_estimate_post_retrofit_energy_usage](#software_used_to_estimate_post_retrofit_energy_usage)||Determine which fields are required when rebate_type is MODELED or MEASURED|
|[building_project_type](#building_project_type) is `MULTIFAMILY_IN_UNIT`|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)<br>[unit_name_or_number](#unit_name_or_number)|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)<br>[num_occupied_units](#num_occupied_units)|Determine which fields are required when building_project_type is MULTIFAMILY_IN_UNIT|
|[building_project_type](#building_project_type) is `MULTIFAMILY_CENTRAL`|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)||Determine which fields are required when building_project_type is MULTIFAMILY_CENTRAL|
|[building_project_type](#building_project_type) is one of [`MANUFACTURED`, `SINGLE_FAMILY_ATTACHED`, `SINGLE_FAMILY_DETACHED`]|[dwelling_unit_income_bucket](#dwelling_unit_income_bucket)|[mf_building_income_bucket](#mf_building_income_bucket)<br>[num_occupied_units](#num_occupied_units)<br>[num_units](#num_units)<br>[num_units_meeting_income_bucket](#num_units_meeting_income_bucket)<br>[unit_name_or_number](#unit_name_or_number)|Determine which fields are required for single family building_project_type|

## address_id
  
A unique identifier associated with the address of the building at which the upgrade(s) will be installed. This id must be obtained using the address-service endpoint.  
  

- is required
- Type: `string`
- can not be null

## building_project_type
  
This describes both the type of the building and, in the multifamily case, whether this reservation applies to the whole building or to a single unit. For the MULTIFAMILY_CENTRAL case, the income bucket for the building, mf_income_bucket, is used. Otherwise, the income bucket for the dwelling unit, dwelling_unit_income_bucket, is used.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`MANUFACTURED`|
|`MULTIFAMILY_CENTRAL`|
|`MULTIFAMILY_IN_UNIT`|
|`SINGLE_FAMILY_ATTACHED`|
|`SINGLE_FAMILY_DETACHED`|

## claimant_type
  
The type of person or entity that is initiating the rebate process on behalf of the applicant.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`AGGREGATOR`|
|`CONTRACTOR`|
|`HOMEOWNER`|
|`MULTIFAMILY_BUILDING_OWNER`|
|`OTHER`|

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
|`80%_AMI_AND_GREATER`|
|`LESS_THAN_80%_AMI`|

## estimated_percent_energy_savings
  
An estimate for the percent measured energy savings where total energy use is first converted to source energy in a manner determined by the state. To avoid an immediate breaking change, this field is currently optional when rebate_type is MEASURED and otherwise not allowed – either this field or the two fields measured_pre_retrofit_energy_usage_kwh_equivalent and  estimated_post_retrofit_energy_usage_kwh_equivalent must be specified when rebate_type is MEASURED. The behavior starting mid to late January 2025 will be: this field is required for rebate_type MEASURED and otherwise not allowed.  
  

- is not required
- Type: `number`
- can not be null
  
Maximum Number: `100`
## estimated_post_retrofit_energy_usage_kwh_equivalent
  
The total estimated (expected) annual  energy usage converted to kWh-equivalent for the home or multifamily building post-retrofit. This field is used for MEASURED reservations only.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## estimated_post_retrofit_site_energy_usages_by_fuel_type
  
An array of estimated post-retrofit site energy usage objects. Each entry represents a different fuel type. To avoid an immediate breaking change, this field is currently optional when rebate_type is MEASURED and otherwise not allowed. The behavior starting mid to late January 2025 will be: this field is required when rebate_type is MEASURED and otherwise not allowed. Please begin using this field asap.  
  

- is not required
- Type: [estimated_post_retrofit_item](estimated_post_retrofit_item.md)
- can not be null

## is_disadvantaged_community
  
This field should only be used by states that have been approved by the DOE to do so. If provided, this will override the is_disadvantaged_community value from the address-service.  
  

- is required
- Type: `boolean`
- can not be null

## measured_pre_retrofit_energy_usage_kwh_equivalent
  
The total actual annual energy usage converted to kWh-equivalent for the home or multifamily building prior to the retrofit - based on normalized utility bill data. This field is used for MEASURED reservations only.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## measured_pre_retrofit_site_energy_usages_by_fuel_type
  
An array of measured pre-retrofit site energy usage objects. Each entry represents a different site fuel type. To avoid an immediate breaking change, this field is currently optional when rebate_type is MEASURED and otherwise not allowed. The behavior starting mid to late January 2025 will be: this field is required when rebate_type is MEASURED and otherwise not allowed. Please begin using this field asap.  
  

- is not required
- Type: [measured_pre_retrofit_site_energy_usages_by_fuel_type](measured_pre_retrofit_site_energy_usages_by_fuel_type.md)
- can not be null

## mf_building_income_bucket
  
Choose the lowest area median income (AMI) range for which at least 50% of the household units fall into the range or lower. For example, consider a five-unit apartment building for which two units fall in the `LESS_THAN_80%_AMI` range and three fall in the `80%_AMI_AND_GREATER`. Then the `80%_AMI_AND_GREATER` range should be chosen because more than half of the units fall into this range or lower.  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`80%_AMI_AND_GREATER`|
|`LESS_THAN_80%_AMI`|

## modeled_percent_energy_savings
  
The calculated percent modeled energy savings where total energy use is first converted to source energy in a manner determined by the state. To avoid an immediate breaking change, this field is currently optional when rebate_type is MODELED and otherwise not allowed – either this field or the two modeled_...kwh_equalent fields must be specified when _rebate_type is MODELED. The behavior starting mid to late January 2025 will be: this field is required when rebate_type is MODELED and otherwise not allowed. Please begin using this field asap.  
  

- is not required
- Type: `number`
- can not be null
  
Maximum Number: `100`
## modeled_post_retrofit_energy_usage_kwh_equivalent
  
The total annual modeled energy usage converted to kWh-equivalent for the home or multifamily building post-retrofit. This field is used for MODELED reservations only.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## modeled_post_retrofit_site_energy_usages_by_fuel_type
  
An array of modeled post-retrofit site energy usage objects. Each entry represents a different fuel type. To avoid an immediate breaking change, this field is currently optional when rebate_type is MODELED and otherwise not allowed. The behavior starting mid to late January 2025 will be: this field is required when rebate_type is MODELED and otherwise not allowed. Please begin using this field asap.  
  

- is not required
- Type: [modeled_post_retrofit_site_energy_usages_by_fuel_type](modeled_post_retrofit_site_energy_usages_by_fuel_type.md)
- can not be null

## modeled_pre_retrofit_energy_usage_kwh_equivalent
  
The total annual modeled energy usage converted to kWh-equivalent for the home or multifamily building as-found (prior to the retrofit). This field is used for MODELED reservations only.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## modeled_pre_retrofit_site_energy_usages_by_fuel_type
  
An array of modeled pre-retrofit site energy usage objects. Each entry represents a different site fuel type. To avoid an immediate breaking change, this field is currently optional when rebate_type is MODELED and otherwise not allowed. The behavior starting mid to late January 2025 will be: this field is required when rebate_type is MODELED and otherwise not allowed. Please begin using this field asap.  
  

- is not required
- Type: [modeled_pre_retrofit_site_energy_usages_by_fuel_type](modeled_pre_retrofit_site_energy_usages_by_fuel_type.md)
- can not be null

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
## rebate_type
  
The HOMES rebates have two distinct options for determining savings and rebate amounts, MODELED vs MEASURED.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`MEASURED`|
|`MODELED`|

## unit_name_or_number
  
This is the unit designator for a unit in a multifamily building. Do NOT include words or abbreviations such as 'APT' or 'UNIT'. For example, if the unit is referred to as 'APT 7B', then *unit_name_or_number* should be '7B'.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `32`
## upgrades
  
List all the upgrades from the enumeration that apply to the HOMES project.  
  

- is required
- Type: [homes_upgrades](homes_upgrades.md)
- can not be null
  
Items should be unique: `True`