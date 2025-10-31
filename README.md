# IRA-Rebates-API

This repository contains materials useful to users of the IRA Rebates API. The IRA Rebates API supports 50121 and 50122 of the DOE rebate programs authorized by the Inflation Reduction Act (IRA) of 2022. See https://www.pnnl.gov/projects/rebate-tools for additional information and updates.

## API Environments and Branches
This repository maintains different branches that correspond to different API environments:
- `prod+sandbox` - Contains the latest production-ready API schemas and documentation
- `sandbox-test` - Contains schemas and documentation for the sandbox-test environment. This environment allows users to test new features and functionalities before they are released in production.

Each branch reflects the current state of its respective environment. When making API integrations, ensure you're using the branch that corresponds to your target environment. 

Both branches currently correspond to the Data and Tools Guide version 1.2. (See Useful Links below.)

## JSON Schema

### /json_schemas Folder 
The `/json_schemas` folder includes JSON Schema files that are used by the IRA Rebate API to validate the JSON payload for each POST and PUT endpoint. API users may find these files useful as the most precise documentation regarding the allowed structure of the POST and PUT endpoint payloads. The schema files can also be used, together with a JSON Schema validator (see  https://json-schema.org/implementations), to validate the payloads before submitting to the API. This may be especially helpful during the development of client  software.

#### API Endpoint to JSON Schema Table
| API POST &amp; PUT endpoint | JSON schema filename |
| ---- | ---- |
| /applicants | applicantIdsPayload.schema.json |
| /address-service/addresses | addressServicePayload.schema.json |
| /electric/reporting | electricBulkReportingPayload.schema.json |
| /electric/reservations | electricReservationsPayload.schema.json |
| /electric/reservations/{reservation_id}/extend | electricReservationsExpirationDateUpdatesPayload.schema.json |
| /electric/reservations/{reservation_id}/files | electricFilesPayload.schema.json |
| /electric/reservations/{reservation_id}/install-redemptions | electricInstallRedemptionsPayload.schema.json |
| /electric/reservations/{reservation_id}/limited-assessments | electricLimitedAssessmentsPayload.schema.json |
| /electric/reservations/{reservation_id}/product-redemptions | electricProductRedemptionsPayload.schema.json |
| /electric/reservations/{reservation_id}/state-addenda | electricStateAddendaPayload.schema.json |
| /electric/vendor-coupons/product-redemptions | electricVendorCouponRedemptionsPayload.schema.json |
| /homes/reporting | homesBulkReportingPayload.schema.json |
| /homes/reservations | homesReservationsPayload.schema.json | 
| /homes/reservations/{reservation_id}/files | homesFilesPayload.schema.json |
| /homes/reservations/{reservation_id}/redemptions | homesRedemptionsPayload.schema.json |
| /homes/reservations/{reservation_id}/state-addenda | homesStateAddendaPayload.schema.json |

All other json schema files are referenced from those listed in the table. 

### /resolved_json_schemas Folder 
The `/resolved_json_schemas` folder includes JSON Schema payload files where all referenced definitions are resolved. This provides a way to use an online JSON schema validator (such as https://www.liquid-technologies.com/online-json-schema-validator) to validate a POST payload.

### Human Readable Schema Documentation
More human-readable documentation of the JSON Schema files is available at https://pnnl.github.io/IRA-Rebates-API. Be sure to choose the appropriate branch (environment) at the top of the page.

### /resolved_response_schemas
The `/resolved_response_schemas` folder includes JSON Schema files that are used by the IRA Rebate API to validate the JSON reponse payloads for most API endpoints. Note that these schemas only specify the top-level fields in each response; nested structures are not specified. The number (e.g. 201) in the file name refers to the response code associated with the response.

#### API Endpoint to Response JSON Schema Table
| API endpoint | JSON schema filename |
| ---- | ---- |
| POST /electric/reporting | bulk-reporting.post.200.json |
| POST /electric/reservations/{reservation_id}/files | electric-reservations-by-reservation-id-files.post.201.json |
| GET /electric/reservations/{reservation_id}/install-redemptions/{redemption_id} | electric-reservations-by-reservation-id-install-redemptions.get.200.json |
| POST /electric/reservations/{reservation_id}/install-redemptions | electric-reservations-by-reservation-id-install-redemptions.post.201.json |
| GET /electric/reservations/{reservation_id}/product-redemptions/{redemption_id} | electric-reservations-by-reservation-id-product-redemptions.get.200.json |
| POST /electric/reservations/{reservation_id}/product-redemptions | electric-reservations-by-reservation-id-product-redemptions.post.201.json |
| GET /electric/reservations/{reservation_id} | electric-reservations-by-reservation-id.get.200.json |
| GET /electric/reservations | electric-reservations.get.200.json |
| POST /electric/reservations | electric-reservations.post.201.json |
| DELETE /electric/reservations/{reservation_id} | electric-reservations-by-reservation-id.delete.200.json |
| POST /homes/reservations/{reservation_id}/files | homes-reservations-by-reservation-id-files.post.201.json |
| GET /homes/reservations/{reservation_id}/redemptions/{redemption_id} | homes-reservations-by-reservation-id-redemptions.get.200.json |
| POST /homes/reservations/{reservation_id}/redemptions | homes-reservations-by-reservation-id-redemptions.post.201.json |
| GET /homes/reservations | homes-reservations.get.200.json |
| POST /homes/reservations | homes-reservations.post.201.json |
| DELETE /homes/reservations/{reservation_id} | homes-reservations-by-reservation-id.delete.200.json |

## /hpxml_schematrons Folder
HPXML files may be uploaded to the API in support of 50121 modeled rebates for single-family and small (< 5 units) multifamily buildings.

The API validates HPXML v4.x files into steps:
1. Validate against the HPXML v4.x XML Schema file, which can be obtained from https://github.com/hpxmlwg/hpxml.
2. Validate against the appropriate IRA 50121 Rebate HPXML Schematron file from the `/hpxml_schematrons` folder.

### file_type to Schematron Table
| file_type from payload | Schematron filename |
| ---- | ---- |
| HPXML_MEASURED | measured_required.sch |
| HPXML_MODELED_RECOMMENDED | modeled_recommended.sch |
| HPXML_MODELED_REQUIRED | modeled_required.sch |

## /buildingsync_schematrons Folder
BuildingSync v2.6.0 files may be uploaded to the API in support of 50121 modeled rebates for a multifamily buildings.

The API validates BuildingSync v2.6.0 files into steps:
1. Validate against the BuildingSync v2.6.0 XML Schema file, which can be obtained from https://github.com/hpxmlwg/hpxml.
2. Validate against the IRA BuildingSync Schematron file from the `/buildingsync_schematrons` folder.

## Useful Links
- Home Energy Rebate Programs: https://www.energy.gov/scep/home-energy-rebates-programs
- Home Energy Rebate Tools (the high-level web page for the IRA Rebate API and related tools): https://www.pnnl.gov/projects/rebate-tools
- Data & Tools Requirement Guide: https://www.energy.gov/sites/default/files/2024-05/ira-home-energy-rebates-data-and-tools-requirements-guide-version-1.2.pdf
- JSON Schema documentation: https://json-schema.org/
- JSON Schema validators: https://json-schema.org/implementations
- JSON Schema online validator: https://www.liquid-technologies.com/online-json-schema-validator

## Feedback and Support
We appreciate feedback from API users. Please email feedback to rebatetools@pnnl.gov.

