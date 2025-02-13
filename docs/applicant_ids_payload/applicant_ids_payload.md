



# Applicant IDs Payload
  
Defined in: [applicantId.schema.json](https://ira-rebates.labworks.org/schemas/applicantId)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[email](#email)|`string`|:white_check_mark:|||
|[last_name](#last_name)|`string`|:white_check_mark:|||
|[phone](#phone)|`string`|:white_check_mark:|||

## Any Of
  

## email
  
The email address of the homeowner, building owner, or renter that will ultimately be receiving the benefit of the rebate.  
  

- is required
- Type: `string`
- can not be null

#### Any Of
  
Regex Pattern: `(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])`  
  
Constant: `NOT AVAILABLE`  
  
Comment: https://datatracker.ietf.org/doc/html/rfc5322
## last_name
  
The applicant's last name.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `64`  
Regex Pattern: `^[a-zA-Z\-\s']+$`
## phone
  
The ten-digit phone number of the home owner, building owner, or renter that will ultimately be receiving the benefit of the rebate.  
  

- is required
- Type: `string`
- can not be null

#### Any Of
  
Minimum Length: `10`  
Maximum Length: `10`  
Regex Pattern: `^\d+$`  
  
Constant: `NOT AVAILABLE`  
