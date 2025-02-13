



# Homes Redemptions Payload
  
Defined in: [homesRedemption.schema.json](https://ira-rebates.labworks.org/schemas/homesRedemption)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[equipment_and_material_cost](#equipment_and_material_cost)|`number`|||Equipment and material cost|
|[installation_cost](#installation_cost)|`number`|||Installation cost|
|[is_contractor_eligible](#is_contractor_eligible)|`boolean`|:white_check_mark:||Is contractor eligible|
|[measured_percent_energy_savings](#measured_percent_energy_savings)|`number`||||
|[measured_post_retrofit_energy_usage_kwh_equivalent](#measured_post_retrofit_energy_usage_kwh_equivalent)|`integer`|||Measured post retrofit energy usage kwh equivalent|
|[measured_post_retrofit_site_energy_usages_by_fuel_type](#measured_post_retrofit_site_energy_usages_by_fuel_type)|[measured_post_retrofit_site_energy_usage_by_fuel_type](measured_post_retrofit_site_energy_usage_by_fuel_type.md)|||Measured Post Retrofit Site Energy Usage By Fuel Type|
|[post_retrofit_inspection_passed](#post_retrofit_inspection_passed)|`enum`|||Post retrofit inspection passed|
|[project_completion_date](#project_completion_date)|`string`|:white_check_mark:||Project completion date|
|[rebate_deducted](#rebate_deducted)|`number`|:white_check_mark:||Rebate deducted|
|[rebate_type](#rebate_type)|`enum`|:white_check_mark:||Rebate type|
|[safety_checks](#safety_checks)|[safety_checks](safety_checks.md)|:white_check_mark:||Safety Checks|
|[vendor_id](#vendor_id)|`string`|:white_check_mark:||Vendor id|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[rebate_type](#rebate_type) is not `MEASURED`||[measured_post_retrofit_energy_usage_kwh_equivalent](#measured_post_retrofit_energy_usage_kwh_equivalent)<br>[measured_post_retrofit_site_energy_usages_by_fuel_type](#measured_post_retrofit_site_energy_usages_by_fuel_type)<br>[measured_percent_energy_savings](#measured_percent_energy_savings)||

## Any Of
  
  
[equipment_and_material_cost](#equipment_and_material_cost)  
[installation_cost](#installation_cost)
## equipment_and_material_cost
  
The total cost of the equipment and materials purchased as part of a redemption.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## installation_cost
  
The installation costs associated with this redemption. To qualify, the installation must be performed by an approved contractor. Also see `is_contractor_eligible`.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## is_contractor_eligible
  
The contractor is eligible if they are on the state's approved list.  
  

- is required
- Type: `boolean`
- can not be null
  
Constant: `True`
## measured_percent_energy_savings
  
The calculated percent measured energy savings where total energy use is first converted to source energy in a manner determined by the state. To avoid an immediate breaking change, this field is currently optional when rebate_type is MEASURED and otherwise not allowed – either this field or measured_post_retrofit_energy_usage_kwh_equivalent must be specified when rebate_type is MEASURED. The behavior starting mid to late January 2025 will be: this field is required for rebate_type MEASURED and otherwise not allowed.  
  

- is not required
- Type: `number`
- can not be null
  
Maximum Number: `100`
## measured_post_retrofit_energy_usage_kwh_equivalent
  
The total actual annual energy usage converted to kWh-equivalent for the home or multifamily building post-retrofit - based on normalized utility bill data. This field is used for MEASURED redemptions only.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## measured_post_retrofit_site_energy_usages_by_fuel_type
  
An array of measured site energy usage objects. Each entry represents a different site fuel type. To avoid an immediate breaking change, this field is currently optional when rebate_type is MEASURED and otherwise not allowed. The behavior starting mid to late January 2025 will be: this field is required when rebate_type is MEASURED and otherwise not allowed.  
  

- is not required
- Type: [measured_post_retrofit_site_energy_usage_by_fuel_type](measured_post_retrofit_site_energy_usage_by_fuel_type.md)
- can not be null

## post_retrofit_inspection_passed
  
State attests that if a post-retrofit inspection was conducted and failed that the issues were remedied before the rebate was provided to the claimant.  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`NA`|
|`NO`|
|`YES`|

## project_completion_date
  
This is a calendar date in the form YYYY-MM-DD. Time zone is immaterial.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `10`  
Maximum Length: `10`  
Regex Pattern: `^\d{4}-\d{2}-\d{2}$`
## rebate_deducted
  
This is the amount that was deducted from the customer's/homeowner's purchase price or invoiced amount for products and/or installation.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## rebate_type
  
The HOMES rebates have two distinct options for determining savings and rebate amounts, MODELED vs MEASURED.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`MEASURED`|
|`MODELED`|

## safety_checks
  
  
  

- is required
- Type: [safety_checks](safety_checks.md)
- can not be null

## vendor_id
  
This is a unique identifier for a vendor that the state will reimburse in connection with a redemption.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `6`  
Maximum Length: `64`