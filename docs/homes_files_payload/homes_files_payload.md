



# Homes Files Payload
  
Defined in: [homesFile.schema.json](https://ira-rebates.labworks.org/schemas/homesFile)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[binary_file_content_base_64](#binary_file_content_base_64)|`string`|:white_check_mark:||Binary file content Base64|
|[description](#description)|`string`|||Description|
|[file_name](#file_name)|`string`|:white_check_mark:||File name|
|[file_type](#file_type)|`enum`|:white_check_mark:||File type|
|[file_purpose](#file_purpose)|`enum`|:white_check_mark:||File purpose|

## binary_file_content_base_64
  
The API user must convert the binary file content to base64 encoding.  
  

- is required
- Type: `string`
- can not be null

## description
  
  
  

- is not required
- Type: `string`
- can not be null

## file_name
  
This file name will be associated with the uploaded file and will be shown wherever a list of the uploaded files for a reservation is returned.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `2`  
Maximum Length: `64`  
Regex Pattern: `^[0-9a-zA-Z\-.\(\)_ ]+$`
## file_type
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`CSV`|
|`HEIC`|
|`HPXML_MEASURED`|
|`HPXML_MODELED_RECOMMENDED`|
|`HPXML_MODELED_REQUIRED`|
|`JPEG`|
|`PDF`|
|`PNG`|
|`BUILDINGSYNC`|
|`JSON`|
|`EXCEL`|

## file_purpose
  
  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`POST_RETROFIT_MODEL`|
|`PRE_AND_POST_RETROFIT_MODELS`|
|`PRE_RETROFIT_MODEL`|
|`QUALITY_ASSURANCE`|
|`MEASURED_SAVINGS_CALCULATION_OUTPUT_FILE`|
