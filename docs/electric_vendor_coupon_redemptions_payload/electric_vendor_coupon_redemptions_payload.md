



# Electric Vendor Coupon Redemptions Payload
  
Defined in: [electrificationVendorCouponRedemption.schema.json](https://ira-rebates.labworks.org/schemas/electrificationVendorCouponRedemption)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[equipment_and_material_cost](#equipment_and_material_cost)|`number`|:white_check_mark:||Equipment and material cost|
|[installation_cost](#installation_cost)|`number`|:white_check_mark:||Installation cost|
|[product_info](#product_info)|[product_info](product_info.md)|:white_check_mark:||Product Info|
|[purchase_date_time](#purchase_date_time)|`string`|:white_check_mark:|`date-time`|Purchase date-time|
|[rebate_deducted](#rebate_deducted)|`number`|:white_check_mark:||Rebate deducted|
|[upgrade_type](#upgrade_type)|`enum`|:white_check_mark:||Upgrade type|
|[vendor_id](#vendor_id)|`string`|:white_check_mark:||Vendor id|
|[vendor_coupon_id](#vendor_coupon_id)|`string`|:white_check_mark:||Vendor coupon id|
  

## allOf Requirement
  

### Conditional Validation
  

|`if`|`then` should be present|should `not` be present|comment|
| :---: | :---: | :---: | :---: |

## equipment_and_material_cost
  
The total cost of the equipment and materials purchased as part of a redemption.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Exclusive Minimum: `0`
## installation_cost
  
The installation costs associated with this redemption. To qualify, the installation must be performed by an approved contractor. Also see `is_contractor_eligible`.  
  

- is required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## product_info
  
Provide identifying information for the qualifying product or products that are covered by this rebate.  
  

- is required
- Type: [product_info](product_info.md)
- can not be null
  
Minimum number of items: `1`
## purchase_date_time
  
This is the date and time a product was purchased. Either this field or the 'purchase_date' field is required for product redemption. Note that the 'purchase_date_time' field will be deprecated in the future.  
  

- is required
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
## vendor_coupon_id
  
The unique identifier for the vendor coupon.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`