# HPXML Rebates Data Requirements

In this folder you will find schematron (*.sch) files that validate the requirements for the following use cases in the IRA HOMES 50121 rebates for single family homes:

- Recommended for modeled
- Required for modeled
- Required for measured

These files are generated with a script since they are very similar with a few additions and subtractions. Please don't edit these files directly. If you would like to edit the schematron files, please edit the files in the `source_schematrons` directory and run the python script in there to generate the files in this directory. 

## Generating the schematrons

Create a python environment. Install the dependency.

```bash
cd source_schematrons
pip install -r requirements.txt
```

Run the script to generate the schematrons.

```bash
python combine_schematrons.py
```

## How the schematron files are assembled

The data requirements are based on the Home Energy Score data requirements, so much of it comes from that repository. The `hescore.sch` file should be kept in sync with the one in the [OpenStudio-HEScore](https://github.com/NREL/OpenStudio-HEScore/) repo.

### Recommended for Modeled

This is the most complete dataset. This is created by concatenating the validations from `hescore.sh` and `modeled_recommended_extras.sch`. The "extras" schematron file holds the rules that are part of the IRA validation, but aren't part of Home Energy Score.

### Required for Modeled

This starts with all the rules in the Recommended for Modeled use case and removes any patterns or assertions that are marked with the `ira:remove-req-modeled='true'` attribute. 

### Required for Measured

This starts with all the rules in the Recommended for Modeled use case and removes any patterns or assertions that are marked with the `ira:remove-measured='true'` attribute.

### Modifying the requirements

To add a rule to the recommended for modeled dataset, add it to the `modeled_recommended_extras.sch` file. 

To remove a rule from either of the required datasets, add the appropriate "remove" attribute to the rule you would like removed.
