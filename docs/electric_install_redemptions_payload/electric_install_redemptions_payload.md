



# Electric Install Redemptions Payload
  
Defined in: [electrificationInstallRedemption.schema.json](https://ira-rebates.labworks.org/schemas/electrificationInstallRedemption)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[contractor_company_name](#contractor_company_name)|`string`|:white_check_mark:||Contractor company name|
|[contractor_name](#contractor_name)|`string`|:white_check_mark:||Contractor name|
|[equipment_and_material_cost](#equipment_and_material_cost)|`number`|:white_check_mark:||Equipment and material cost|
|[installation_cost](#installation_cost)|`number`|:white_check_mark:||Installation cost|
|[is_contractor_eligible](#is_contractor_eligible)|`boolean`|:white_check_mark:||Is contractor eligible|
|[is_final_project_redemption](#is_final_project_redemption)|`boolean`|:white_check_mark:||Is final project redemption|
|[post_retrofit_inspection_passed](#post_retrofit_inspection_passed)|`enum`|||Post retrofit inspection passed|
|[project_completion_date](#project_completion_date)|`string`|||Project completion date|
|[rebate_deducted](#rebate_deducted)|`number`|:white_check_mark:||Rebate deducted|
|[rebate_passed_through_to_applicant](#rebate_passed_through_to_applicant)|`number`|:white_check_mark:||Rebate passed through to applicant|
|[safety_checks](#safety_checks)|[safety_checks](safety_checks.md)|||Safety Checks|
|[upgrade_component_details](#upgrade_component_details)|[upgrade_component_details](upgrade_component_details.md)|||Upgrade Component Details|
|[upgrade_type](#upgrade_type)|`enum`|:white_check_mark:||Upgrade type|
|[vendor_id](#vendor_id)|`string`|:white_check_mark:||Vendor id|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_CLOTHES_DRYER`|[upgrade_component_details](#upgrade_component_details)||The appropriate schema must be used for upgrade_component_details depending on upgrade_type.|
|[upgrade_type](#upgrade_type) is `ELECTRIC_COOKING_APPLIANCE`|[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `HEAT_PUMP_WATER_HEATER`|[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `ELECTRICAL_PANEL`|[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is `INSULATION_AIR_SEALING_VENTILATION`|[upgrade_component_details](#upgrade_component_details)|||
|[upgrade_type](#upgrade_type) is one of [`ELECTRIC_WIRING`, `HEAT_PUMP_FOR_SPACE_HEATING_OR_COOLING`]||[upgrade_component_details](#upgrade_component_details)||
|[is_final_project_redemption](#is_final_project_redemption) is `True`|[project_completion_date](#project_completion_date)|||
|[is_final_project_redemption](#is_final_project_redemption) is not `True`||[project_completion_date](#project_completion_date)||

## contractor_company_name
  
The name of the primary contracting company for the project.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`
## contractor_name
  
The name of the primary contractor for the project.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`
## equipment_and_material_cost
  
The total cost of the equipment and materials purchased as part of a redemption.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## installation_cost
  
The installation costs associated with this redemption. To qualify, the installation must be performed by an approved contractor. Also see `is_contractor_eligible`.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Exclusive Minimum: `0`
## is_contractor_eligible
  
The contractor is eligible if they are on the state's approved list.  
  

- is required
- Type: `boolean`
- can not be null
  
Constant: `True`
## is_final_project_redemption
  
Set this to true if the project work has been completed and there will be no more redemptions made on this reservation. This will, among other things, free up any remaining reservation amount for the household's future use.  
  

- is required
- Type: `boolean`
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
  

- is not required
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
## rebate_passed_through_to_applicant
  
Use this field when the contractor submitted a product redemption for this reservation and received a rebate on behalf of the applicant. Otherwise set this to 0. This amount must be passed on to the applicant and shown on the invoice. Do not include this in the amount for `equipment_and_material_cost`.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## safety_checks
  
  
  

- is not required
- Type: [safety_checks](safety_checks.md)
- can not be null

## upgrade_component_details
  
  
  

- is not required
- Type: [upgrade_component_details](upgrade_component_details.md)
- can not be null

#### One Of
  
  
  
  
  

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

## vendor_id
  
This is a unique identifier for a vendor that the state will reimburse in connection with a redemption.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `6`  
Maximum Length: `64`