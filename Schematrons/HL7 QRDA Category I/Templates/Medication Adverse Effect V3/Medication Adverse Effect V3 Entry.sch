<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	 
	<sch:phase id="errors">
		<sch:active pattern="Medication_Adverse_Effect_V3-pattern-errors" />
	</sch:phase>

	<sch:phase id="warnings">
		<sch:active pattern="Medication_Adverse_Effect_V3-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Adverse_Effect_V3-pattern-errors">
		<sch:rule id="Medication_Adverse_Effect_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-14110-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14110).</sch:assert>
			<sch:assert id="a-2228-14111-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14111).</sch:assert>
			<sch:assert id="a-2228-28081-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28081).</sch:assert>
			<sch:assert id="a-2228-14112-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2228-14112) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.43" (CONF:2228-14113). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27030).</sch:assert>
			<sch:assert id="a-2228-14134-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14134).</sch:assert>
			<sch:assert id="a-2228-27964-error" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)= 1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-27964) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-27968).SHALL contain exactly one [1..1] participantRole (CONF:2228-27965).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Adverse_Effect_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']]/cda:value[@xsi:type='CD']">
			<sch:assert id="a-2228-14135-error" test="@code='419511003'">This value SHALL contain exactly one [1..1] @code="419511003" Propensity to adverse reactions to drug (disorder) (CONF:2228-14135).</sch:assert>
			<sch:assert id="a-2228-28554-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28554).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Adverse_Effect_V3-participantRole-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']]/cda:participant[@typeCode='CSM']/cda:participantRole">
			<sch:assert id="a-2228-27969-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-27969).</sch:assert>
			<sch:assert id="a-2228-27966-error" test="count(cda:playingEntity)=1">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:2228-27966).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Adverse_Effect_V3-playingEntity-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']]/cda:participant[@typeCode='CSM']/cda:participantRole[@classCode='MANU']/cda:playingEntity">
			<sch:assert id="a-2228-27970-error" test="@classCode='MMAT'">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:2228-27970).</sch:assert>
			<sch:assert id="a-2228-27967-error" test="count(cda:code)=1">This playingEntity SHALL contain exactly one [1..1] code (CONF:2228-27967).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Adverse_Effect_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']]/cda:participant[@typeCode='CSM']/cda:participantRole[@classCode='MANU']/cda:playingEntity[@classCode='MMAT']/cda:code">
			<sch:assert id="a-2228-27971-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27971).</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Adverse_Effect_V3-pattern-warnings">
		<sch:rule id="Medication_Adverse_Effect_V3-warning" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-14130-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']])=1]) = 1"> SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-14130) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CONF:2228-14131). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14132). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27124).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>