# IRA-Rebates-API

**Current API version:** beta v4.2

This repository contains materials useful to users of the IRA Rebates API ***beta version 4.2***. The IRA Rebates API supports the HOMES (section 50121) and HEEHRA (section 50122) DOE rebate programs authorized by the Inflation Reduction Act (IRA) of 2022. See https://www.energy.gov/scep/home-energy-rebates-programs for program descriptions and updates.

## JSON Schema 
The `/json_schemas` folder includes JSON Schema files that are used by the IRA Rebate API to validate the JSON payload for each POST endpoint. API users may find these files useful as the most precise documentation regarding the allowed structure of the POST endpoint payloads. The schema files can also be used, together with a JSON Schema validator (see  https://json-schema.org/implementations), to validate the POST payloads before submitting to the API. This may be especially helpful during the development of client software.

Additionally, the `/resolved_json_schemas` folder includes JSON Schema payload files where all referenced definitions are resolved. This provides a way to use an online JSON schema validator (see https://www.liquid-technologies.com/online-json-schema-validator) to validate a POST payload.

This version of the json schema files correspond to Data and Tools Guide version 1.2. (See Useful Links below.)

### API endpoint to JSON Schema table
| API POST endpoint | JSON schema filename |
| ---- | ---- |
| /applicants | applicantIdsPayload.schema.json |
| /address-service/addresses | addressServicePayload.schema.json |
| /electric/bulk-reporting | electricBulkReportingPayload.schema.json |
| /electric/reservations | electricReservationsPayload.schema.json |
| /electric/reservations/{reservation_id}/files | electricFilesPayload.schema.json |
| /electric/reservations/{reservation_id}/limited-assessments | electricLimitedAssessmentsPayload.schema.json |
| /electric/reservations/{reservation_id}/install-redemptions | electricInstallRedemptionsPayload.schema.json |
| /electric/reservations/{reservation_id}/product-redemptions | electricProductRedemptionsPayload.schema.json |
| /electric/reservations/{reservation_id}/state-addenda | electricStateAddendaPayload.schema.json |
| /homes/reservations | homesReservationsPayload.schema.json | 
| /homes/reservations/{reservation_id}/files | homesFilesPayload.schema.json |
| /homes/reservations/{reservation_id}/redemptions | homesRedemptionsPayload.schema.json |
| /homes/reservations/{reservation_id}/state-addenda | homesStateAddendaPayload.schema.json |

All other json schema files are referenced from those listed in the table. 

## Useful Links
- Home Energy Rebate Programs: https://www.energy.gov/scep/home-energy-rebates-programs
- Home Energy Rebate Tools (the high-level web page for the IRA Rebate API and related tools): https://www.pnnl.gov/projects/rebate-tools
- Data & Tools Requirement Guide: https://www.energy.gov/sites/default/files/2024-05/ira-home-energy-rebates-data-and-tools-requirements-guide-version-1.2.pdf
- JSON Schema documentation: https://json-schema.org/
- JSON Schema validators: https://json-schema.org/implementations
- JSON Schema online validator: https://www.liquid-technologies.com/online-json-schema-validator

## Feedback and Support
We appreciate feedback from API users. Please email feedback to rebatetools@pnnl.gov.
