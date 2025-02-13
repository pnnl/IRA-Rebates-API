



# Homes State Addenda Payload
  
Defined in: [homesStateAddenda.schema.json](https://ira-rebates.labworks.org/schemas/homesStateAddenda)  
Type: `object`  
Additional Properties Allowed: `False`  
  

|Property|Type|Required|Format|Title|
| :---: | :---: | :---: | :---: | :---: |
|[claimant_payment](#claimant_payment)|`number`|||Claimant payment|
|[state_attests_any_failed_inspection_remediated](#state_attests_any_failed_inspection_remediated)|`boolean`|||State attests any failed inspection remediated|

## Any Of
  
  
[claimant_payment](#claimant_payment)  
[state_attests_any_failed_inspection_remediated](#state_attests_any_failed_inspection_remediated)
## claimant_payment
  
This is the amount that the state paid to an aggregator, or other claimant, for a HOMES rebate.  
  

- is not required
- Type: `number`
- can not be null
  
Must be multiple of: `0.01`  
Minimum Number: `0`
## state_attests_any_failed_inspection_remediated
  
  
  

- is not required
- Type: `boolean`
- can not be null
