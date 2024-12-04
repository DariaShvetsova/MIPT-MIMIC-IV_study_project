---------------------------
---------------------------
-- Creating Primary Keys --
---------------------------
---------------------------

----------
-- hosp --
----------

-- patients

ALTER TABLE hosp.patients DROP CONSTRAINT IF EXISTS patients_pk CASCADE;
ALTER TABLE hosp.patients
ADD CONSTRAINT patients_pk
  PRIMARY KEY (subject_id);

-- admissions

ALTER TABLE hosp.admissions DROP CONSTRAINT IF EXISTS admissions_pk CASCADE;
ALTER TABLE hosp.admissions
ADD CONSTRAINT admissions_pk
  PRIMARY KEY (hadm_id);

-- transfers

ALTER TABLE hosp.transfers DROP CONSTRAINT IF EXISTS transfers_pk CASCADE;
ALTER TABLE hosp.transfers
ADD CONSTRAINT transfers_pk
  PRIMARY KEY (transfer_id);

-- d_hcpcs

ALTER TABLE hosp.d_hcpcs DROP CONSTRAINT IF EXISTS d_hcpcs_pk CASCADE;
ALTER TABLE hosp.d_hcpcs
ADD CONSTRAINT d_hcpcs_pk
  PRIMARY KEY (code);

-- diagnoses_icd

ALTER TABLE hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_pk CASCADE;
ALTER TABLE hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

-- d_icd_diagnoses

ALTER TABLE hosp.d_icd_diagnoses DROP CONSTRAINT IF EXISTS d_icd_diagnoses_pk CASCADE;
ALTER TABLE hosp.d_icd_diagnoses
ADD CONSTRAINT d_icd_diagnoses_pk
  PRIMARY KEY (icd_code, icd_version);

-- d_icd_procedures

ALTER TABLE hosp.d_icd_procedures DROP CONSTRAINT IF EXISTS d_icd_procedures_pk CASCADE;
ALTER TABLE hosp.d_icd_procedures
ADD CONSTRAINT d_icd_procedures_pk
  PRIMARY KEY (icd_code, icd_version);

-- d_labitems

ALTER TABLE hosp.d_labitems DROP CONSTRAINT IF EXISTS d_labitems_pk CASCADE;
ALTER TABLE hosp.d_labitems
ADD CONSTRAINT d_labitems_pk
  PRIMARY KEY (itemid);

-- emar_detail

ALTER TABLE hosp.emar_detail DROP CONSTRAINT IF EXISTS emar_detail_pk;
ALTER TABLE hosp.emar_detail
ADD CONSTRAINT emar_detail_pk
  PRIMARY KEY (emar_id, parent_field_ordinal);

-- emar

ALTER TABLE hosp.emar DROP CONSTRAINT IF EXISTS emar_pk CASCADE;
ALTER TABLE hosp.emar
ADD CONSTRAINT emar_pk
  PRIMARY KEY (emar_id);

-- hcpcsevents

ALTER TABLE hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_pk CASCADE;
ALTER TABLE hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_pk
  PRIMARY KEY (hadm_id, hcpcs_cd, seq_num);

-- labevents

ALTER TABLE hosp.labevents DROP CONSTRAINT IF EXISTS labevents_pk CASCADE;
ALTER TABLE hosp.labevents
ADD CONSTRAINT labevents_pk
  PRIMARY KEY (labevent_id);

-- microbiologyevents

ALTER TABLE hosp.microbiologyevents DROP CONSTRAINT IF EXISTS microbiologyevents_pk CASCADE;
ALTER TABLE hosp.microbiologyevents
ADD CONSTRAINT microbiologyevents_pk
  PRIMARY KEY (microevent_id);

-- pharmacy

ALTER TABLE hosp.pharmacy DROP CONSTRAINT IF EXISTS pharmacy_pk CASCADE;
ALTER TABLE hosp.pharmacy
ADD CONSTRAINT pharmacy_pk
  PRIMARY KEY (pharmacy_id);

-- poe_detail

ALTER TABLE hosp.poe_detail DROP CONSTRAINT IF EXISTS poe_detail_pk CASCADE;
ALTER TABLE hosp.poe_detail
ADD CONSTRAINT poe_detail_pk
  PRIMARY KEY (poe_id, field_name);

-- poe

ALTER TABLE hosp.poe DROP CONSTRAINT IF EXISTS poe_pk CASCADE;
ALTER TABLE hosp.poe
ADD CONSTRAINT poe_pk
  PRIMARY KEY (poe_id);

-- prescriptions

ALTER TABLE hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_pk CASCADE;
ALTER TABLE hosp.prescriptions
ADD CONSTRAINT prescriptions_pk
  PRIMARY KEY (pharmacy_id, drug_type, drug);

-- procedures_icd

ALTER TABLE hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_pk CASCADE;
ALTER TABLE hosp.procedures_icd
ADD CONSTRAINT procedures_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

-- services

ALTER TABLE hosp.services DROP CONSTRAINT IF EXISTS services_pk CASCADE;
ALTER TABLE hosp.services
ADD CONSTRAINT services_pk
  PRIMARY KEY (hadm_id, transfertime, curr_service);

---------
-- icu --
---------

-- datetimeevents

ALTER TABLE icu.datetimeevents DROP CONSTRAINT IF EXISTS datetimeevents_pk CASCADE;
ALTER TABLE icu.datetimeevents
ADD CONSTRAINT datetimeevents_pk
  PRIMARY KEY (stay_id, itemid, charttime);

-- d_items

ALTER TABLE icu.d_items DROP CONSTRAINT IF EXISTS d_items_pk CASCADE;
ALTER TABLE icu.d_items
ADD CONSTRAINT d_items_pk
  PRIMARY KEY (itemid);

-- icustays

ALTER TABLE icu.icustays DROP CONSTRAINT IF EXISTS icustays_pk CASCADE;
ALTER TABLE icu.icustays
ADD CONSTRAINT icustays_pk
  PRIMARY KEY (stay_id);

-- inputevents

ALTER TABLE icu.inputevents DROP CONSTRAINT IF EXISTS inputevents_pk CASCADE;
ALTER TABLE icu.inputevents
ADD CONSTRAINT inputevents_pk
  PRIMARY KEY (orderid, itemid);

-- outputevents

ALTER TABLE icu.outputevents DROP CONSTRAINT IF EXISTS outputevents_pk CASCADE;
ALTER TABLE icu.outputevents
ADD CONSTRAINT outputevents_pk
  PRIMARY KEY (stay_id, charttime, itemid);

-- procedureevents

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_pk CASCADE;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_pk
  PRIMARY KEY (orderid);

---------------------------
---------------------------
-- Creating Foreign Keys --
---------------------------
---------------------------

----------
-- hosp --
----------

-- admissions

ALTER TABLE hosp.admissions DROP CONSTRAINT IF EXISTS admissions_patients_fk;
ALTER TABLE hosp.admissions
ADD CONSTRAINT admissions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

-- transfers

ALTER TABLE hosp.transfers DROP CONSTRAINT IF EXISTS transfers_patients_fk;
ALTER TABLE hosp.transfers
ADD CONSTRAINT transfers_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

-- diagnoses_icd

ALTER TABLE hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_patients_fk;
ALTER TABLE hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_admissions_fk;
ALTER TABLE hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- drgcodes

ALTER TABLE hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_patients_fk;
ALTER TABLE hosp.drgcodes
ADD CONSTRAINT drgcodes_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.drgcodes DROP CONSTRAINT IF EXISTS drgcodes_admissions_fk;
ALTER TABLE hosp.drgcodes
ADD CONSTRAINT drgcodes_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- emar_detail

ALTER TABLE hosp.emar_detail DROP CONSTRAINT IF EXISTS emar_detail_patients_fk;
ALTER TABLE hosp.emar_detail
ADD CONSTRAINT emar_detail_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.emar_detail DROP CONSTRAINT IF EXISTS emar_detail_emar_fk;
ALTER TABLE hosp.emar_detail
ADD CONSTRAINT emar_detail_emar_fk
  FOREIGN KEY (emar_id)
  REFERENCES hosp.emar (emar_id);

-- emar

ALTER TABLE hosp.emar DROP CONSTRAINT IF EXISTS emar_patients_fk;
ALTER TABLE hosp.emar
ADD CONSTRAINT emar_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.emar DROP CONSTRAINT IF EXISTS emar_admissions_fk;
ALTER TABLE hosp.emar
ADD CONSTRAINT emar_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- hcpcsevents

ALTER TABLE hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_patients_fk;
ALTER TABLE hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_admissions_fk;
ALTER TABLE hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

ALTER TABLE hosp.hcpcsevents DROP CONSTRAINT IF EXISTS hcpcsevents_d_hcpcs_fk;
ALTER TABLE hosp.hcpcsevents
ADD CONSTRAINT hcpcsevents_d_hcpcs_fk
  FOREIGN KEY (hcpcs_cd)
  REFERENCES hosp.d_hcpcs (code);

-- labevents

ALTER TABLE hosp.labevents DROP CONSTRAINT IF EXISTS labevents_patients_fk;
ALTER TABLE hosp.labevents
ADD CONSTRAINT labevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.labevents DROP CONSTRAINT IF EXISTS labevents_d_labitems_fk;
ALTER TABLE hosp.labevents
ADD CONSTRAINT labevents_d_labitems_fk
  FOREIGN KEY (itemid)
  REFERENCES hosp.d_labitems (itemid);

-- microbiologyevents

ALTER TABLE hosp.microbiologyevents DROP CONSTRAINT IF EXISTS microbiologyevents_patients_fk;
ALTER TABLE hosp.microbiologyevents
ADD CONSTRAINT microbiologyevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.microbiologyevents DROP CONSTRAINT IF EXISTS microbiologyevents_admissions_fk;
ALTER TABLE hosp.microbiologyevents
ADD CONSTRAINT microbiologyevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- pharmacy

ALTER TABLE hosp.pharmacy DROP CONSTRAINT IF EXISTS pharmacy_patients_fk;
ALTER TABLE hosp.pharmacy
ADD CONSTRAINT pharmacy_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.pharmacy DROP CONSTRAINT IF EXISTS pharmacy_admissions_fk;
ALTER TABLE hosp.pharmacy
ADD CONSTRAINT pharmacy_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- poe_detail

ALTER TABLE hosp.poe_detail DROP CONSTRAINT IF EXISTS poe_detail_patients_fk;
ALTER TABLE hosp.poe_detail
ADD CONSTRAINT poe_detail_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.poe_detail DROP CONSTRAINT IF EXISTS poe_detail_poe_fk;
ALTER TABLE hosp.poe_detail
ADD CONSTRAINT poe_detail_poe_fk
  FOREIGN KEY (poe_id)
  REFERENCES hosp.poe (poe_id);

-- poe

ALTER TABLE hosp.poe DROP CONSTRAINT IF EXISTS poe_patients_fk;
ALTER TABLE hosp.poe
ADD CONSTRAINT poe_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.poe DROP CONSTRAINT IF EXISTS poe_admissions_fk;
ALTER TABLE hosp.poe
ADD CONSTRAINT poe_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- prescriptions

ALTER TABLE hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_patients_fk;
ALTER TABLE hosp.prescriptions
ADD CONSTRAINT prescriptions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_admissions_fk;
ALTER TABLE hosp.prescriptions
ADD CONSTRAINT prescriptions_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- procedures_icd

ALTER TABLE hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_patients_fk;
ALTER TABLE hosp.procedures_icd
ADD CONSTRAINT procedures_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.procedures_icd DROP CONSTRAINT IF EXISTS procedures_icd_admissions_fk;
ALTER TABLE hosp.procedures_icd
ADD CONSTRAINT procedures_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- services

ALTER TABLE hosp.services DROP CONSTRAINT IF EXISTS services_patients_fk;
ALTER TABLE hosp.services
ADD CONSTRAINT services_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.services DROP CONSTRAINT IF EXISTS services_admissions_fk;
ALTER TABLE hosp.services
ADD CONSTRAINT services_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

---------
-- icu --
---------

-- chartevents

ALTER TABLE icu.chartevents DROP CONSTRAINT IF EXISTS chartevents_patients_fk;
ALTER TABLE icu.chartevents
ADD CONSTRAINT chartevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE icu.chartevents DROP CONSTRAINT IF EXISTS chartevents_admissions_fk;
ALTER TABLE icu.chartevents
ADD CONSTRAINT chartevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

ALTER TABLE icu.chartevents DROP CONSTRAINT IF EXISTS chartevents_icustays_fk;
ALTER TABLE icu.chartevents
ADD CONSTRAINT chartevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icu.icustays (stay_id);

ALTER TABLE icu.chartevents DROP CONSTRAINT IF EXISTS chartevents_d_items_fk;
ALTER TABLE icu.chartevents
ADD CONSTRAINT chartevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES icu.d_items (itemid);

-- datetimeevents

ALTER TABLE icu.datetimeevents DROP CONSTRAINT IF EXISTS datetimeevents_patients_fk;
ALTER TABLE icu.datetimeevents
ADD CONSTRAINT datetimeevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE icu.datetimeevents DROP CONSTRAINT IF EXISTS datetimeevents_admissions_fk;
ALTER TABLE icu.datetimeevents
ADD CONSTRAINT datetimeevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

ALTER TABLE icu.datetimeevents DROP CONSTRAINT IF EXISTS datetimeevents_icustays_fk;
ALTER TABLE icu.datetimeevents
ADD CONSTRAINT datetimeevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icu.icustays (stay_id);

ALTER TABLE icu.datetimeevents DROP CONSTRAINT IF EXISTS datetimeevents_d_items_fk;
ALTER TABLE icu.datetimeevents
ADD CONSTRAINT datetimeevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES icu.d_items (itemid);

-- icustays

ALTER TABLE icu.icustays DROP CONSTRAINT IF EXISTS icustays_patients_fk;
ALTER TABLE icu.icustays
ADD CONSTRAINT icustays_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE icu.icustays DROP CONSTRAINT IF EXISTS icustays_admissions_fk;
ALTER TABLE icu.icustays
ADD CONSTRAINT icustays_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

-- inputevents

ALTER TABLE icu.inputevents DROP CONSTRAINT IF EXISTS inputevents_patients_fk;
ALTER TABLE icu.inputevents
ADD CONSTRAINT inputevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE icu.inputevents DROP CONSTRAINT IF EXISTS inputevents_admissions_fk;
ALTER TABLE icu.inputevents
ADD CONSTRAINT inputevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

ALTER TABLE icu.inputevents DROP CONSTRAINT IF EXISTS inputevents_icustays_fk;
ALTER TABLE icu.inputevents
ADD CONSTRAINT inputevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icu.icustays (stay_id);

ALTER TABLE icu.inputevents DROP CONSTRAINT IF EXISTS inputevents_d_items_fk;
ALTER TABLE icu.inputevents
ADD CONSTRAINT inputevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES icu.d_items (itemid);

-- outputevents

ALTER TABLE icu.outputevents DROP CONSTRAINT IF EXISTS outputevents_patients_fk;
ALTER TABLE icu.outputevents
ADD CONSTRAINT outputevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE icu.outputevents DROP CONSTRAINT IF EXISTS outputevents_admissions_fk;
ALTER TABLE icu.outputevents
ADD CONSTRAINT outputevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

ALTER TABLE icu.outputevents DROP CONSTRAINT IF EXISTS outputevents_icustays_fk;
ALTER TABLE icu.outputevents
ADD CONSTRAINT outputevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icu.icustays (stay_id);

ALTER TABLE icu.outputevents DROP CONSTRAINT IF EXISTS outputevents_d_items_fk;
ALTER TABLE icu.outputevents
ADD CONSTRAINT outputevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES icu.d_items (itemid);

-- procedureevents

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_patients_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES hosp.patients (subject_id);

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_admissions_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES hosp.admissions (hadm_id);

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_icustays_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icu.icustays (stay_id);

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_d_items_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES icu.d_items (itemid);

-- ed

ALTER TABLE ed.edstays DROP CONSTRAINT IF EXISTS edstays_pk CASCADE;
ALTER TABLE ed.edstays
ADD CONSTRAINT edstays_pk
  PRIMARY KEY (stay_id);

ALTER TABLE ed.diagnosis DROP CONSTRAINT IF EXISTS diagnosis_pk CASCADE;
ALTER TABLE ed.diagnosis
ADD CONSTRAINT diagnosis_pk
  PRIMARY KEY (stay_id, seq_num);

ALTER TABLE ed.medrecon DROP CONSTRAINT IF EXISTS medrecon_pk CASCADE;
ALTER TABLE ed.medrecon
ADD CONSTRAINT medrecon_pk
  PRIMARY KEY (stay_id, charttime, name);

ALTER TABLE ed.pyxis DROP CONSTRAINT IF EXISTS pyxis_pk CASCADE;
ALTER TABLE ed.pyxis
ADD CONSTRAINT pyxis_pk
  PRIMARY KEY (stay_id, charttime, name);

ALTER TABLE ed.triage DROP CONSTRAINT IF EXISTS triage_pk CASCADE;
ALTER TABLE ed.triage
ADD CONSTRAINT triage_pk
  PRIMARY KEY (stay_id);

ALTER TABLE ed.vitalsign DROP CONSTRAINT IF EXISTS vitalsign_pk CASCADE;
ALTER TABLE ed.vitalsign
ADD CONSTRAINT vitalsign_pk
  PRIMARY KEY (stay_id, charttime);

---------------------------
---------------------------
-- Creating Foreign Keys --
---------------------------
---------------------------

ALTER TABLE ed.diagnosis DROP CONSTRAINT IF EXISTS diagnosis_edstays_fk CASCADE;
ALTER TABLE ed.diagnosis
ADD CONSTRAINT diagnosis_edstays_fk
  FOREIGN KEY (stay_id)
  REFERENCES ed.edstays (stay_id);

ALTER TABLE ed.medrecon DROP CONSTRAINT IF EXISTS medrecon_edstays_fk CASCADE;
ALTER TABLE ed.medrecon
ADD CONSTRAINT medrecon_edstays_fk
  FOREIGN KEY (stay_id)
  REFERENCES ed.edstays (stay_id);

ALTER TABLE ed.pyxis DROP CONSTRAINT IF EXISTS pyxis_edstays_fk CASCADE;
ALTER TABLE ed.pyxis
ADD CONSTRAINT pyxis_edstays_fk
  FOREIGN KEY (stay_id)
  REFERENCES ed.edstays (stay_id);

ALTER TABLE ed.triage DROP CONSTRAINT IF EXISTS triage_edstays_fk CASCADE;
ALTER TABLE ed.triage
ADD CONSTRAINT triage_edstays_fk
  FOREIGN KEY (stay_id)
  REFERENCES ed.edstays (stay_id);

ALTER TABLE ed.vitalsign DROP CONSTRAINT IF EXISTS vitalsign_edstays_fk CASCADE;
ALTER TABLE ed.vitalsign
ADD CONSTRAINT vitalsign_edstays_fk
  FOREIGN KEY (stay_id)
  REFERENCES ed.edstays (stay_id);

