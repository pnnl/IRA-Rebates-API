
Building Product Info Item
==========================
  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Nullable|Format|Title|
| :---: | :---: | :---: | :---: | :---: | :---: |
|[ahri_reference_number](#ahri_reference_number)|`string`||False||AHRI reference number|
|[count](#count)|`integer`||False||Count|
|[model_number](#model_number)|`string`||False||Model number|
|[product_description](#product_description)|`string`||False||Product description|
|[upc](#upc)|`string`||False||UPC|

ahri_reference_number
=====================
  
The AHRA Reference Number associated with a heat pump or heat pump water heater. See the AHRI Directory of Certified Product Performance at  https://www.ahridirectory.org/Search/SearchHome?ReturnUrl=%2f for more information regarding AHRI Reference Numbers.  
  

- is not required
- Type: `string`
- can not be null
  

count
=====
  
This should be set to 1 in most cases. An example of a situation where a value greater than 1 is appropriate is when several rolls of insulation are being purchased. Another situation is for `building_project_type` MULTIFAMILY_CENTRAL and `upgrade_type` HEAT_PUMP_WATER_HEATER for which the shared water heating system upgrade consists of multiple identical heat pump water heaters.  
  

- is not required
- Type: `integer`
- can not be null
  

model_number
============
  
The model number for the product being purchased.  
  

- is not required
- Type: `string`
- can not be null
  

product_description
===================
  
The description of the product being purchased, as it would appear on an invoice.  
  

- is not required
- Type: `string`
- can not be null
  

upc
===
  
The universal product code (UPC) for the product being purchased.  
  

- is not required
- Type: `string`
- can not be null
  
