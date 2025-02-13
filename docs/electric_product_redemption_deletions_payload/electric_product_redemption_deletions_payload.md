



# Electric Product Redemption Deletions Payload
  
Defined in: [electrificationProductRedemptionDeletion.schema.json](https://ira-rebates.labworks.org/schemas/electrificationProductRedemptionDeletion)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[deletion_reason](#deletion_reason)|`string`|:white_check_mark:||Deletion reason|
|[delete_redemptions](#delete_redemptions)|`boolean`|||Delete redemptions|

## deletion_reason
  
Provide a reason for deleting the reservation. CANCEL_RESERVATION indicates that the intention is to delete the reservation with no immediate intention of replacing it. CORRECT_RESERVATION indicates that the intention is to delete the reservation in order to replace it with another.  
  

- is required
- Type: `string`
- can not be null

#### Any Of
  
Minimum Length: `4`  
  

|Value|
| :--- |
|`CANCEL_RESERVATION`|
|`CORRECT_RESERVATION`|
  

## delete_redemptions
  
A boolean flag to determine if the redemption(s) for this reservation will be deleted. When this flag is set to true, any associated redemption for the reservation will also be deleted.  
  

- is not required
- Type: `boolean`
- can not be null
