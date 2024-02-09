# IRA-Rebates-API

**Current API version:** beta v3

This repository contains materials useful to users of the IRA Rebates API ***beta version 3***. The IRA Rebates API supports the HOMES (section 50121) and HEEHRA (section 50122) DOE rebate programs authorized by the Inflation Reduction Act (IRA) of 2022. See https://www.energy.gov/scep/home-energy-rebates-programs for program descriptions and updates.

## JSON Schema 
The `/json-schema` folder includes JSON Schema files that are used by the IRA Rebate API to validate the JSON payload for each POST endpoint. API users may find these files useful as the most precise documentation regarding the allowed structure of the POST endpoint payloads. The schema files can also be used, together with a json schema validator (see  https://json-schema.org/implementations), to validate the POST payloads before submitting to the API. This may be especially helpful during the development of client software. 

### API endpoint to JSON Schema table
| API POST endpoint | JSON schema filename |
| ---- | ---- |
| /address-service | addressServicePayload.schema.json |
| /electric/eligible-rebates | electricEligibleRebatesPayload.schema.json |
| /electric/reservations | electricReservationsPayload.schema.json |
| /electric/reservations/{reservation_id}/redemptions | electricRedemptionsPayload.schema.json |
| /electric/vendor-coupons/{vendor_coupon_id}/redemptions | electricVendorCouponRedemptionsPayload.schema.json |
| /homes/eligible-rebates | homesEligibleRebatesPayload.schema.json |
| /homes/reservations | homesReservationsPayload.schema.json |
| /homes/reservations/{reservation_id}/redemptions | homesRedemptionsPayload.schema.json |
All other json schema files are referenced from the those listed in the table. 
## Useful Links
- Home Energy Rebate Programs: https://www.energy.gov/scep/home-energy-rebates-programs
- Home Energy Rebate Tools (the high-level web page for the IRA Rebate API and related tools): https://www.pnnl.gov/projects/rebate-tools
- JSON Schema documentation: https://json-schema.org/
- JSON Schema validators: https://json-schema.org/implementations

## Feedback and Support
We appreciate feedback from API users. Please email feedback to rebatetools@pnnl.gov.