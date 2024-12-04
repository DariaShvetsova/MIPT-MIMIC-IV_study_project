-----------------------------------------
-- Load data into the MIMIC-IV schemas --
-----------------------------------------

-- To run from a terminal:
--  psql "dbname=<DBNAME> user=<USER>" -v data_dir=<PATH TO DATA DIR> -f load.sql

-- making sure that all tables are emtpy and correct encoding is defined -utf8- 
SET CLIENT_ENCODING TO 'utf8';

-- clear all tables if exits
\echo '##################################'
\echo 'Cleaning data from all tables.....'
DELETE FROM hosp.admissions; 
DELETE FROM hosp.patients; 
DELETE FROM hosp.transfers;
DELETE FROM hosp.d_hcpcs;
DELETE FROM hosp.diagnoses_icd;
DELETE FROM hosp.d_icd_diagnoses;
DELETE FROM hosp.d_icd_procedures;
DELETE FROM hosp.d_labitems; 
DELETE FROM hosp.drgcodes;
DELETE FROM hosp.emar_detail;
DELETE FROM hosp.emar;
DELETE FROM hosp.hcpcsevents;
DELETE FROM hosp.labevents;
DELETE FROM hosp.microbiologyevents;
DELETE FROM hosp.pharmacy;
DELETE FROM hosp.poe_detail; 
DELETE FROM hosp.poe;
DELETE FROM hosp.prescriptions;
DELETE FROM hosp.procedures_icd;
DELETE FROM hosp.services;
DELETE FROM icu.chartevents;
DELETE FROM icu.datetimeevents;
DELETE FROM icu.d_items;
DELETE FROM icu.icustays;
DELETE FROM icu.inputevents;
DELETE FROM icu.outputevents;
DELETE FROM icu.procedureevents;
DELETE FROM ed.diagnosis;
DELETE FROM ed.edstays;
DELETE FROM ed.medrecon;
DELETE FROM ed.pyxis;
DELETE FROM ed.triage;
DELETE FROM ed.vitalsign;

-- hosp schema
\echo '########################################'
\echo 'Start loading data from hosp tables.....'
\cd :data_dir/hosp

\echo '########################################'
\echo 'Start loading data from admissions......'
\COPY hosp.admissions FROM PROGRAM 'gzip -dc admissions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from patients........'
\COPY hosp.patients FROM PROGRAM 'gzip -dc patients.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from transfers.......'
\COPY hosp.transfers FROM PROGRAM 'gzip -dc transfers.csv.gz' DELIMITER ',' CSV HEADER NULL '';

\echo '########################################'
\echo 'Start loading data from d_hcpcs.........'
\COPY hosp.d_hcpcs FROM PROGRAM 'gzip -dc d_hcpcs.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from diagnoses_icd...'
\COPY hosp.diagnoses_icd FROM PROGRAM 'gzip -dc diagnoses_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from d_icd_diagnoses'
\COPY hosp.d_icd_diagnoses FROM PROGRAM 'gzip -dc d_icd_diagnoses.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from d_icd_procedures'
\COPY hosp.d_icd_procedures FROM PROGRAM 'gzip -dc d_icd_procedures.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from d_labitems......'
\COPY hosp.d_labitems FROM PROGRAM 'gzip -dc d_labitems.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from drgcodes........'
\COPY hosp.drgcodes FROM PROGRAM 'gzip -dc drgcodes.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from emar_detail.....'
\COPY hosp.emar_detail FROM PROGRAM 'gzip -dc emar_detail.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from emar............'
\COPY hosp.emar FROM PROGRAM 'gzip -dc emar.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from hcpcsevents.....'
\COPY hosp.hcpcsevents FROM PROGRAM 'gzip -dc hcpcsevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from labevents......'
\COPY hosp.labevents FROM PROGRAM 'gzip -dc labevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from microbiologyevents......'
\COPY hosp.microbiologyevents FROM PROGRAM 'gzip -dc microbiologyevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from pharmacy.......'
\COPY hosp.pharmacy FROM PROGRAM 'gzip -dc pharmacy.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from poe_detail.......'
\COPY hosp.poe_detail FROM PROGRAM 'gzip -dc poe_detail.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from poe.......'
\COPY hosp.poe FROM PROGRAM 'gzip -dc poe.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from prescriptions.......'
\COPY hosp.prescriptions FROM PROGRAM 'gzip -dc prescriptions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from procedures_icd.......'
\COPY hosp.procedures_icd FROM PROGRAM 'gzip -dc procedures_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from services.......'
\COPY hosp.services FROM PROGRAM 'gzip -dc services.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- icu schema
\echo '########################################'
\echo 'Start loading data from icu tables.....'
\cd :data_dir/icu

\echo '########################################'
\echo 'Start loading data from chartevents.......'
\COPY icu.chartevents FROM PROGRAM 'gzip -dc chartevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from datetimeevents.......'
\COPY icu.datetimeevents FROM PROGRAM 'gzip -dc datetimeevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from d_items.......'
\COPY icu.d_items FROM PROGRAM 'gzip -dc d_items.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from icustays.......'
\COPY icu.icustays FROM PROGRAM 'gzip -dc icustays.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from inputevents.......'
\COPY icu.inputevents FROM PROGRAM 'gzip -dc inputevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from outputevents.......'
\COPY icu.outputevents FROM PROGRAM 'gzip -dc outputevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from procedureevents.......'
\COPY icu.procedureevents FROM PROGRAM 'gzip -dc procedureevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- ed schema
\echo '########################################'
\echo 'Start loading data from ed tables.....'
\cd :data_dir/ed

\echo '########################################'
\echo 'Start loading data from diagnosis.......'
\COPY ed.diagnosis FROM PROGRAM 'gzip -dc diagnosis.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from edstays.......'
\COPY ed.edstays FROM PROGRAM 'gzip -dc edstays.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from medrecon.......'
\COPY ed.medrecon FROM PROGRAM 'gzip -dc medrecon.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from pyxis.......'
\COPY ed.pyxis FROM PROGRAM 'gzip -dc pyxis.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from triage.......'
\COPY ed.triage FROM PROGRAM 'gzip -dc triage.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\echo '########################################'
\echo 'Start loading data from vitalsign.......'
\COPY ed.vitalsign FROM PROGRAM 'gzip -dc vitalsign.csv.gz' DELIMITER ',' CSV HEADER NULL '';

\echo '########################################'
