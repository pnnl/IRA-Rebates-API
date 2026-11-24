<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:title>DC BEPS Energy Audit Report - Minimal Validation</sch:title>
  <sch:ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <sch:pattern>
    <sch:title>Document</sch:title>
    <sch:rule context="/">
      <sch:assert test="count(auc:BuildingSync) &gt;= 1">element "auc:BuildingSync" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync">
      <sch:assert test="count(@version) &gt;= 1">element "@version" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Facilities/auc:Facility) &gt;= 1">element "auc:Facilities/auc:Facility" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility">
      <sch:assert test="count(auc:Reports/auc:Report) &gt;= 1">element "auc:Reports/auc:Report" is REQUIRED</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Report Type</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 1">element "auc:UserDefinedFields" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']/auc:FieldName">
      <sch:assert test="contains('_Audit Template Report Type_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Audit Template Report Type"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']/auc:FieldValue">
      <sch:assert test="contains('_DC BEPS Energy Audit Report_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "DC BEPS Energy Audit Report"</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
