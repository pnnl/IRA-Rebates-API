



# Homes Reservations Expiration Date Updates Payload
  
Defined in: [homesReservationExpirationDateUpdate.schema.json](https://ira-rebates.labworks.org/schemas/homesReservationExpirationDateUpdate)  
Type: `object`  
Additional Properties Allowed: `True`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[new_expiration_date](#new_expiration_date)|`string`||`date`|New expiration date|

## new_expiration_date
  
The new date at which the reservation should be set to expire.  
  

- is not required
- Type: `string`
- can not be null
  
Regex Pattern: `^\d{4}-\d{2}-\d{2}`  
Comment: The date format follows RFC 3339, section 5.6:  https://datatracker.ietf.org/doc/html/rfc3339#section-5.6:~:text=Timestamps%20%20%20%20%20%20%20July%202002-,5.6,-.%20Internet%20Date/Time.