



# Address Service Payload
  
Defined in: [addressService.schema.json](https://ira-rebates.labworks.org/schemas/addressService)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[city](#city)|`string`|||City|
|[county](#county)|`string`|||County|
|[state](#state)|`enum`|:white_check_mark:||State|
|[street](#street)|`string`|:white_check_mark:||Street|
|[street_number](#street_number)|`string`|:white_check_mark:||Street number|
|[zip_code](#zip_code)|`string`|||Zip code|

## Any Of
  
  
[city](#city)  
[county](#county)  
[zip_code](#zip_code)
## city
  
The name of the city, town, etc.. This would be &ldquo;Richland&rdquo; for the address: 650 Horn Rapids Road, Richland, WA 99354.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`
## county
  
The name of the county containing the address.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `1`
## state
  
The two letter code for the state. This would be &ldquo;WA&rdquo; for the address: 650 Horn Rapids Road, Richland, WA 99354.  
  

- is required
- Type: `enum`
- can not be null
  

|Value|
| :--- |
|`AA`|
|`AE`|
|`AK`|
|`AL`|
|`AP`|
|`AR`|
|`AS`|
|`AZ`|
|`CA`|
|`CO`|
|`CT`|
|`DC`|
|`DE`|
|`FL`|
|`FM`|
|`GA`|
|`GU`|
|`HI`|
|`IA`|
|`ID`|
|`IL`|
|`IN`|
|`KS`|
|`KY`|
|`LA`|
|`MA`|
|`MD`|
|`ME`|
|`MH`|
|`MI`|
|`MN`|
|`MO`|
|`MP`|
|`MS`|
|`MT`|
|`NC`|
|`ND`|
|`NE`|
|`NH`|
|`NJ`|
|`NM`|
|`NV`|
|`NY`|
|`OH`|
|`OK`|
|`OR`|
|`PA`|
|`PR`|
|`PW`|
|`RI`|
|`SC`|
|`SD`|
|`TN`|
|`TX`|
|`UT`|
|`VA`|
|`VI`|
|`VT`|
|`WA`|
|`WI`|
|`WV`|
|`WY`|
  
Comment:  https://bedes.lbl.gov/bedes-online/state
## street
  
The name of the street, avenue, etc.. This would be &ldquo;Horn Rapids Road&rdquo; for the address: 650 Horn Rapids Road, Richland, WA 99354.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `1`
## street_number
  
The building number. This would be &ldquo;650&rdquo; for the address: 650 Horn Rapids Road, Richland, WA 99354.  
  

- is required
- Type: `string`
- can not be null
  
Minimum Length: `1`  
Maximum Length: `12`  
Regex Pattern: `^[0-9a-zA-Z/\- ]+$`
## zip_code
  
The *zip_code* is the 5-digit zip code. This would be &ldquo;99354&rdquo; for the address: 650 Horn Rapids Road, Richland, WA 99354.  
  

- is not required
- Type: `string`
- can not be null
  
Minimum Length: `5`  
Maximum Length: `5`  
Regex Pattern: `^\d{5}$`