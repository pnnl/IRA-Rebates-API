


  
[electric_bulk_reporting_payload](electric_bulk_reporting_payload.md) / [electric_bulk_reporting_payload_item](electric_bulk_reporting_payload_item.md)
# Electric Limited Assessments Payload
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[assessment_date](#assessment_date)|`string`|:white_check_mark:||Assessment date|
|[ceiling_insulation_r_value](#ceiling_insulation_r_value)|`integer`|||Ceiling insulation r-value|
|[ceiling_insulation_type](#ceiling_insulation_type)|`enum`|||Ceiling insulation type|
|[conditioned_floor_area_sq_ft](#conditioned_floor_area_sq_ft)|`integer \| enum`|:white_check_mark:||Conditioned floor area sq. ft|
|[cooling_systems](#cooling_systems)|[cooling_systems](cooling_systems.md)|:white_check_mark:||Cooling systems|
|[ducts_are_insulated](#ducts_are_insulated)|`enum`|:white_check_mark:||Ducts are insulated|
|[ducts_are_sealed](#ducts_are_sealed)|`enum`|:white_check_mark:||Ducts are sealed|
|[electrical_panel_max_amps](#electrical_panel_max_amps)|`integer`|:white_check_mark:||Electrical panel max amps|
|[envelope_professionally_air_sealed](#envelope_professionally_air_sealed)|`enum`|:white_check_mark:||Envelope professionally air sealed|
|[heating_systems](#heating_systems)|[heating_systems](heating_systems.md)|:white_check_mark:||Heating systems|
|[is_ceiling_insulation_r_value_known](#is_ceiling_insulation_r_value_known)|`boolean`|:white_check_mark:||Is ceiling insulation r-value known|
|[is_whole_home_ventilation_system_rated_flow_cfm_known](#is_whole_home_ventilation_system_rated_flow_cfm_known)|`boolean`|:white_check_mark:||Is whole home ventilation system rated flow CFM known|
|[whole_home_ventilation_system_rated_flow_cfm](#whole_home_ventilation_system_rated_flow_cfm)|`integer`|||Whole home ventilation system rated flow CFM|
|[whole_home_ventilation_system_type](#whole_home_ventilation_system_type)|`enum`|:white_check_mark:||Whole home ventilation system type|
|[year_built](#year_built)|`string \| DO_NOT_KNOW`|:white_check_mark:||Year built|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |
|[is_ceiling_insulation_r_value_known](#is_ceiling_insulation_r_value_known) is `True`|[ceiling_insulation_r_value](#ceiling_insulation_r_value)|||
|[is_ceiling_insulation_r_value_known](#is_ceiling_insulation_r_value_known) is not `True`||[ceiling_insulation_r_value](#ceiling_insulation_r_value)||
|[is_whole_home_ventilation_system_rated_flow_cfm_known](#is_whole_home_ventilation_system_rated_flow_cfm_known) is `True`|[whole_home_ventilation_system_rated_flow_cfm](#whole_home_ventilation_system_rated_flow_cfm)|||
|[is_whole_home_ventilation_system_rated_flow_cfm_known](#is_whole_home_ventilation_system_rated_flow_cfm_known) is not `True`||[whole_home_ventilation_system_rated_flow_cfm](#whole_home_ventilation_system_rated_flow_cfm)||

## assessment_date
  
The calendar date when the assessment was performed. Note: time zone is immaterial.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `10`  
Maximum Length: `10`  
Regex Pattern: `^\d{4}-\d{2}-\d{2}$`
## ceiling_insulation_r_value
  
Estimate of the R-value of the as-found ceiling insulation.  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## ceiling_insulation_type
  
The preexisting insulation type for the area to receive (additional) insulation. See https://www.energy.gov/energysaver/types-insulation for information about insulation types.  
  

- is not required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`BATT`|
|`BLOWN_IN`|
|`CLOSED_CELL_SPRAY_FOAM`|
|`DO_NOT_KNOW`|
|`NONE`|
|`RIGID_BOARD`|

## conditioned_floor_area_sq_ft
  
The conditioned floor area, in square feet, of the building or multifamily dwelling unit corresponding to the reservation. If the reservation is for an upgrade in an individual unit of a multifamily building, then this is the conditioned floor area of that unit. Otherwise, this is the conditioned floor area of the building.  
  

- is required
- Type: `integer | enum`
- can not be null

#### One Of
  
Minimum Number: `1000`  
Maximum Number: `1000000`  
  

|Value|
| :--- |
|`1500SF_2500SF`|
|`500SF_1500SF`|
|`GREATER_THAN_2500SF`|
|`LESS_THAN_500SF`|
  

## cooling_systems
  
Provide information for each existing cooling system.  
  

- is required
- Type: [cooling_systems](cooling_systems.md)
- can not be null

## ducts_are_insulated
  
Choose `NA` if there are no ducts associated with this system. Choose `YES` only if visually verified.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`DO_NOT_KNOW`|
|`NA`|
|`NO`|
|`YES`|

## ducts_are_sealed
  
Choose `NA` if there are no ducts associated with this system. Choose `YES` only if visually verified or they are located in a concrete slab.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`DO_NOT_KNOW`|
|`NA`|
|`NO`|
|`YES`|

## electrical_panel_max_amps
  
The maximum amperage rating for the electrical panel as-found. This is only required if adding electrical load.  
  

- is required
- Type: `integer`
- can not be null
  
Minimum Number: `30`
## envelope_professionally_air_sealed
  
Has the building (or dwelling unit) been professionally air sealed?  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`DO_NOT_KNOW`|
|`NO`|
|`YES`|

## heating_systems
  
Provide information for each existing heating system.  
  

- is required
- Type: [heating_systems](heating_systems.md)
- can not be null

## is_ceiling_insulation_r_value_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## is_whole_home_ventilation_system_rated_flow_cfm_known
  
  
  

- is required
- Type: `boolean`
- can not be null

## whole_home_ventilation_system_rated_flow_cfm
  
  
  

- is not required
- Type: `integer`
- can not be null
  
Minimum Number: `0`
## whole_home_ventilation_system_type
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`BALANCED`|
|`CFIS`|
|`ERV`|
|`EXHAUST`|
|`HRV`|
|`NONE`|
|`SUPPLY`|

## year_built
  
The year the building was built.  
  

- is required
- Type: `string | DO_NOT_KNOW`
- can not be null

#### One Of
  
Minimum Length: `4`  
Maximum Length: `4`  
Regex Pattern: `^\d+$`  
  
Constant: `DO_NOT_KNOW`  
