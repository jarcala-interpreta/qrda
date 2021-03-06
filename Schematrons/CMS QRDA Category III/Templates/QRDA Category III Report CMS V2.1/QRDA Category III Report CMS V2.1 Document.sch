<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="QRDA_Category_III_CMS-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III_CMS-pattern-errors">
        <sch:let name="intendedRecipient-Doc" value="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension" />
        <sch:rule id="QRDA_Category_III_CMS-errors" context="cda:ClinicalDocument">
            <sch:assert id="a-4378-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:4378-17226).</sch:assert>
            <sch:assert id="a-4378-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:4378-18186).</sch:assert>
            <sch:assert id="a-4378-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:4378-17209). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:2226-21168).</sch:assert>
            <sch:assert id="a-4378-711280-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-711280) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.2" (CONF:4378-711281). SHALL contain exactly one [1..1] @extension="2018-06-01" (CONF:4378-711305).</sch:assert>
            <sch:assert id="a-4378-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:4378-17236).</sch:assert>
            <sch:assert id="a-4378-17210-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4378-17210).</sch:assert>
            <sch:assert id="a-4378-17211-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:4378-17211).</sch:assert>
            <sch:assert id="a-4378-17237-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:4378-17237).</sch:assert>
            <sch:assert id="a-4378-711174-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode (CONF:4378-711174).</sch:assert>
            <sch:assert id="a-4378-711173-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:4378-711173).</sch:assert>
            <sch:assert id="a-4378-17212-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:4378-17212).</sch:assert>
            <sch:assert id="a-4378-18156-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) &gt; 0">SHALL contain at least one [1..*] author (CONF:4378-18156) such that it SHALL contain exactly one [1..1] time (CONF:4378-18158). SHALL contain exactly one [1..1] assignedAuthor (CONF:4378-18157).</sch:assert>
            <sch:assert id="a-4378-17213-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:4378-17213).</sch:assert>
            <sch:assert id="a-4378-711158-error" test="count(cda:informationRecipient)=1">SHALL contain exactly one [1..1] informationRecipient (CONF:4378-711158).</sch:assert>
            <sch:assert id="a-4378-17225-error" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:4378-17225).</sch:assert>
            <sch:assert id="a-4378-711214-error" test="count(cda:documentationOf)=1">SHALL contain exactly one [1..1] documentationOf (CONF:4378-711214).</sch:assert>
            <sch:assert id="a-4378-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:4378-17217).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:typeId">
            <sch:assert id="a-4378-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:4378-18187).</sch:assert>
            <sch:assert id="a-4378-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:4378-18188).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:realmCode">
            <sch:assert id="a-4378-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:4378-17227).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:code">
            <sch:assert id="a-4378-19549-error" test="@code='55184-6'">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:4378-19549).</sch:assert>
            <sch:assert id="a-4378-21166-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4378-21166).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-confidentialityCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:confidentialityCode">
            <sch:assert id="a-4378-711246-error" test="@code='N'">This confidentialityCode SHALL contain exactly one [1..1] @code="N" Normal (CodeSystem: ConfidentialityCode urn:oid:2.16.840.1.113883.5.25 STATIC) (CONF:4378-711246).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:languageCode">
            <sch:assert id="a-4378-711247-error" test="@code='en'">This languageCode SHALL contain exactly one [1..1] @code="en" English (CodeSystem: Language urn:oid:2.16.840.1.113883.6.121) (CONF:4378-711247).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:recordTarget">
            <sch:assert id="a-4378-17232-error" test="count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:4378-17232) such that it SHALL contain exactly one [1..1] id (CONF:4378-17233). This id SHALL contain exactly one [1..1] @nullFlavor="NA" (CONF:4378-17234).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-4378-711240-error" test="count(cda:id)=1">This assignedAuthor SHALL contain exactly one [1..1] id (CONF:4378-711240).</sch:assert>
            <sch:assert id="a-4378-18163-error" test="count(cda:representedOrganization)=1">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:4378-18163).</sch:assert>
            <sch:assert id="a-4378-19667-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:4378-19667).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-author-assignedAuthor-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:author/cda:assignedAuthor/cda:representedOrganization">
            <sch:assert id="a-4378-18265-error" test="count(cda:name) &gt; 0">This representedOrganization SHALL contain at least one [1..*] name (CONF:4378-18265).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
            <sch:assert id="a-4378-18262-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:4378-18262).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:custodian">
            <sch:assert id="a-4378-17214-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:4378-17214).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:custodian/cda:assignedCustodian">
            <sch:assert id="a-4378-17215-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:4378-17215).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-4378-18165-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:4378-18165).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:informationRecipient">
            <sch:assert id="a-4378-711159-error" test="count(cda:intendedRecipient)=1">This informationRecipient SHALL contain exactly one [1..1] intendedRecipient (CONF:4378-711159).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:informationRecipient/cda:intendedRecipient">
            <sch:assert id="a-4378-711160-error" test="count(cda:id)=1">This intendedRecipient SHALL contain exactly one [1..1] id (CONF:4378-711160).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:informationRecipient/cda:intendedRecipient/cda:id">
            <sch:assert id="a-4378-711161-error" test="@root='2.16.840.1.113883.3.249.7'">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.7" CMS Program (CONF:4378-711161).</sch:assert>
            <sch:assert id="a-4378-711162-error" test="@extension=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.249.14.101']/voc:code/@value">This id SHALL contain exactly one [1..1] @extension, which SHALL be selected from ValueSet CMS Program Name urn:oid:2.16.840.1.113883.3.249.14.101 STATIC (CONF:4378-711162).</sch:assert>
            <sch:assert id="a-4378-711248-error" test="(@extension='CPCPLUS' and ../../../cda:participant[@typeCode='LOC']) or @extension!='CPCPLUS'">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then ClinicalDocument/participant/@typeCode="LOC" SHALL be present (CONF:4378-711248).</sch:assert>
            <sch:assert id="a-4378-711340-error" test="(@extension='CPCPLUS' and count(../../../cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-06-01']])=1) or @extension!='CPCPLUS'">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then QRDA Category III Measure Section – CMS (V2.1) SHALL be present (CONF:4378-711340).</sch:assert>
            <sch:assert id="a-4378-711342-error" test="(@extension='CPCPLUS' and count(../../../cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25'][@extension='2016-11-01']])=1) or @extension!='CPCPLUS'">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then Performance Rate for Proportion Measure – CMS (V2) SHALL be present (CONF:4378-711342). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:legalAuthenticator">
            <sch:assert id="a-4378-18167-error" test="count(cda:time)=1">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:4378-18167).</sch:assert>
            <sch:assert id="a-4378-18168-error" test="count(cda:signatureCode)=1">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:4378-18168).</sch:assert>
            <sch:assert id="a-4378-19670-error" test="count(cda:assignedEntity)=1">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:4378-19670).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:legalAuthenticator/cda:signatureCode">
            <sch:assert id="a-4378-18169-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:4378-18169).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-4378-19672-error" test="count(cda:id) &gt; 0">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:4378-19672).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:documentationOf">
            <sch:assert id="a-4378-18171-error" test="count(cda:serviceEvent)=1">This documentationOf SHALL contain exactly one [1..1] serviceEvent (CONF:4378-18171). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:documentationOf/cda:serviceEvent">
            <sch:assert id="a-4378-18172-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4378-18172).</sch:assert>
            <sch:assert id="a-4378-711325-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:4378-711325). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
            <sch:assert id="a-4378-18174-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4378-18174).</sch:assert>
            <sch:assert id="a-4378-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:4378-18176).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-4378-711167-error" test="count(cda:id[@root='2.16.840.1.113883.4.6'])=1">This assignedEntity SHALL contain exactly one [1..1] id (CONF:4378-711167) such that it MAY contain zero or one [0..1] @nullFlavor="NA" (CONF:4378-711249). SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:4378-711169). MAY contain zero or one [0..1] @extension (CONF:4378-711170).</sch:assert>
            <sch:assert id="a-4378-18180-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:4378-18180).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-4378-711346-error" test="$intendedRecipient-Doc != 'MIPS_GROUP' or ($intendedRecipient-Doc='MIPS_GROUP' and count(cda:id)=1)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_GROUP", then this representedOrganization SHALL contain exactly one 1..1] id, which is the group's TIN (CONF:4378-711346). </sch:assert>
            <sch:assert id="a-4378-711347-error" test="$intendedRecipient-Doc != 'MIPS_VIRTUALGROUP' or ($intendedRecipient-Doc='MIPS_VIRTUALGROUP' and count(cda:id)=1)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_VIRTUALGROUP", then this representedOrganization SHALL contain exactly one 1..1] id, which is the virtual group's Virtual Group Identifier (CONF:4378-711347).  </sch:assert>
         </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-authorization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:authorization">
            <sch:assert id="a-4378-18360-error" test="count(cda:consent)=1">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:4378-18360).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-authorization-consent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:authorization/cda:consent">
            <sch:assert id="a-4378-18361-error" test="count(cda:id)=1">This consent SHALL contain exactly one [1..1] id (CONF:4378-18361).</sch:assert>
            <sch:assert id="a-4378-18363-error" test="count(cda:code)=1">This consent SHALL contain exactly one [1..1] code (CONF:4378-18363).</sch:assert>
            <sch:assert id="a-4378-18364-error" test="count(cda:statusCode)=1">This consent SHALL contain exactly one [1..1] statusCode (CONF:4378-18364).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-authorization-consent-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:authorization/cda:consent/cda:code">
            <sch:assert id="a-4378-19550-error" test="@code='425691002'">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:4378-19550).</sch:assert>
            <sch:assert id="a-4378-21172-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4378-21172).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-authorization-consent-statusCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:authorization/cda:consent/cda:statusCode">
            <sch:assert id="a-4378-19551-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4378-19551).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:component">
            <sch:assert id="a-4378-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:4378-17235).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:component/cda:structuredBody">
            <sch:assert id="a-4378-711341-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']])=1])=0">This structuredBody SHALL NOT contain [0..0] component (CONF:4378-711341) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.2) (CONF:4378-17282).</sch:assert>
            <sch:assert id="a-4378-711311-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-06-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2017-06-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2017-06-01']])=1])=1">This structuredBody SHALL contain at least a QRDA Category III Measure Section - CMS (V2.1), or an Improvement Activity Section - CMS, or a Promoting Interoperability Section (V2) (formerly Advancing Care Information) (CONF:4378-711311). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="QRDA_Category_III_CMS-pattern-warnings">
        <sch:rule id="QRDA_Category_III_CMS-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]">
            <sch:assert id="a-4378-18260-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:4378-18260).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-4378-18166-warning" test="count(cda:name)=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:4378-18166).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-4378-19673-warning" test="count(cda:name)=1">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:4378-19673).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-4378-711168-warning" test="count(cda:id[@root='2.16.840.1.113883.4.2'][@extension]) =1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:4378-711168) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:4378-711171).  SHALL contain exactly one [1..1] @extension (CONF:4378-711172).  </sch:assert>
            <sch:assert id="a-4378-711343-warning" test="count(cda:id[@root='2.16.840.1.113883.3.249.5.2'][@extension]) =1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:4378-711343) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.5.2" MIPS Virtual Group (CONF:4378-711344).  SHALL contain exactly one [1..1] @extension (CONF:4378-711345). </sch:assert>
            <sch:assert id="a-4378-19659-warning" test="count(cda:name) &gt; 0">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:4378-19659).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>