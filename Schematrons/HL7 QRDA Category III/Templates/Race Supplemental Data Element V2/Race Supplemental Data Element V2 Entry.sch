<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Race_Supplemental_Data_Element-pattern-errors" />
    </sch:phase>
 
    <sch:pattern id="Race_Supplemental_Data_Element-pattern-errors">
        <sch:rule id="Race_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-18223-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-18223).</sch:assert>
            <sch:assert id="a-3259-18224-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-18224).</sch:assert>
            <sch:assert id="a-3259-18225-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:3259-18226). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21178).</sch:assert>
            <sch:assert id="a-3259-18227-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-18227).</sch:assert>
            <sch:assert id="a-3259-18112-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-18112).</sch:assert>
            <sch:assert id="a-3259-18114-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-18116). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-18117).</sch:assert>
            <sch:assert id="a-3259-18229-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:3259-18229).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Race_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']]/cda:code">
            <sch:assert id="a-3259-18228-error" test="@code='72826-1'">This code SHALL contain exactly one [1..1] @code="72826-1" Race (CONF:3259-18228).</sch:assert>
            <sch:assert id="a-3259-21177-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21177).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Race_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']]/cda:statusCode">
            <sch:assert id="a-3259-18113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18113).</sch:assert>
        </sch:rule>
    </sch:pattern>        
</sch:schema>