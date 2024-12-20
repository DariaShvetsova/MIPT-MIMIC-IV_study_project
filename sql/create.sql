-------------------------------------------
-- Create the tables and MIMIC-IV schema --
-------------------------------------------

----------------------
-- Creating schemas --
----------------------

DROP SCHEMA IF EXISTS hosp CASCADE;
CREATE SCHEMA hosp;
DROP SCHEMA IF EXISTS icu CASCADE;
CREATE SCHEMA icu;
DROP SCHEMA IF EXISTS ed CASCADE;
CREATE SCHEMA ed;


---------------------
-- Creating tables --
---------------------

-- hosp schema

DROP TABLE IF EXISTS hosp.admissions;
CREATE TABLE hosp.admissions
(
  subject_id    INTEGER NOT NULL,
  hadm_id       INTEGER NOT NULL,
  admittime     TIMESTAMP NOT NULL,
  dischtime     TIMESTAMP,
  deathtime     TIMESTAMP,
  admission_type        VARCHAR(40) NOT NULL,
  admit_provider_id     VARCHAR(10),
  admission_location    VARCHAR(60),
  discharge_location    VARCHAR(60),
  insurance     VARCHAR(255),
  language      VARCHAR(10),
  marital_status        VARCHAR(30),
  race  VARCHAR(80),
  edregtime     TIMESTAMP,
  edouttime     TIMESTAMP,
  hospital_expire_flag  SMALLINT
 );

DROP TABLE IF EXISTS hosp.patients;
CREATE TABLE hosp.patients
(
  subject_id INTEGER NOT NULL,
  gender CHAR(1) NOT NULL,
  anchor_age SMALLINT,
  anchor_year SMALLINT NOT NULL,
  anchor_year_group VARCHAR(20) NOT NULL,
  dod DATE
);

DROP TABLE IF EXISTS hosp.transfers;
CREATE TABLE hosp.transfers
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  transfer_id INTEGER NOT NULL,
  eventtype VARCHAR(10),
  careunit VARCHAR(255),
  intime TIMESTAMP,
  outtime TIMESTAMP
);

DROP TABLE IF EXISTS hosp.d_hcpcs;
CREATE TABLE hosp.d_hcpcs
(
  code CHAR(5) NOT NULL,
  category SMALLINT,
  long_description TEXT,
  short_description VARCHAR(180)
);

DROP TABLE IF EXISTS hosp.diagnoses_icd;
CREATE TABLE hosp.diagnoses_icd
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  seq_num INTEGER NOT NULL,
  icd_code CHAR(7),
  icd_version SMALLINT
);

DROP TABLE IF EXISTS hosp.d_icd_diagnoses;
CREATE TABLE hosp.d_icd_diagnoses
(
  icd_code CHAR(7) NOT NULL,
  icd_version SMALLINT NOT NULL,
  long_title VARCHAR(255)
);

DROP TABLE IF EXISTS hosp.d_icd_procedures;
CREATE TABLE hosp.d_icd_procedures
(
  icd_code CHAR(7) NOT NULL,
  icd_version SMALLINT NOT NULL,
  long_title VARCHAR(222)
);

DROP TABLE IF EXISTS hosp.d_labitems;
CREATE TABLE hosp.d_labitems
(
  itemid INTEGER NOT NULL,
  label VARCHAR(50),
  fluid VARCHAR(50),
  category VARCHAR(50)
);

DROP TABLE IF EXISTS hosp.drgcodes;
CREATE TABLE hosp.drgcodes
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  drg_type VARCHAR(4),
  drg_code INTEGER NOT NULL,
  description VARCHAR(195),
  drg_severity SMALLINT,
  drg_mortality SMALLINT
);

DROP TABLE IF EXISTS hosp.emar_detail;
CREATE TABLE hosp.emar_detail
(
  subject_id INTEGER NOT NULL,
  emar_id VARCHAR(25) NOT NULL,
  emar_seq INTEGER NOT NULL,
  parent_field_ordinal NUMERIC(3, 2),
  administration_type VARCHAR(50),
  pharmacy_id INTEGER,
  barcode_type VARCHAR(4),
  reason_for_no_barcode TEXT,
  complete_dose_not_given VARCHAR(5),
  dose_due VARCHAR(100),
  dose_due_unit VARCHAR(50),
  dose_given VARCHAR(255),
  dose_given_unit VARCHAR(50),
  will_remainder_of_dose_be_given VARCHAR(5),
  product_amount_given VARCHAR(30),
  product_unit VARCHAR(30),
  product_code VARCHAR(30),
  product_description VARCHAR(255),
  product_description_other VARCHAR(255),
  prior_infusion_rate VARCHAR(20),
  infusion_rate VARCHAR(20),
  infusion_rate_adjustment VARCHAR(50),
  infusion_rate_adjustment_amount VARCHAR(30),
  infusion_rate_unit VARCHAR(30),
  route VARCHAR(10),
  infusion_complete VARCHAR(1),
  completion_interval VARCHAR(30),
  new_iv_bag_hung VARCHAR(1),
  continued_infusion_in_other_location VARCHAR(1),
  restart_interval VARCHAR(2305),
  side VARCHAR(10),
  site VARCHAR(255),
  non_formulary_visual_verification VARCHAR(1)
);

DROP TABLE IF EXISTS hosp.emar;
CREATE TABLE hosp.emar
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  emar_id VARCHAR(25) NOT NULL,
  emar_seq INTEGER NOT NULL,
  poe_id VARCHAR(25) NOT NULL,
  pharmacy_id INTEGER,
  enter_provider_id       VARCHAR(10),
  charttime TIMESTAMP NOT NULL,
  medication TEXT,
  event_txt VARCHAR(100),
  scheduletime TIMESTAMP,
  storetime TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS hosp.hcpcsevents;
CREATE TABLE hosp.hcpcsevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  chartdate TIMESTAMP(0) NOT NULL,
  hcpcs_cd CHAR(5) NOT NULL,
  seq_num INTEGER NOT NULL,
  short_description VARCHAR(180)
);

DROP TABLE IF EXISTS hosp.labevents;
CREATE TABLE hosp.labevents
(
  labevent_id INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  specimen_id INTEGER NOT NULL,
  itemid INTEGER NOT NULL,
  order_provider_id     VARCHAR(10),
  charttime TIMESTAMP(0),
  storetime TIMESTAMP(0),
  value VARCHAR(200),
  valuenum DOUBLE PRECISION,
  valueuom VARCHAR(20),
  ref_range_lower DOUBLE PRECISION,
  ref_range_upper DOUBLE PRECISION,
  flag VARCHAR(10),
  priority VARCHAR(7),
  comments TEXT
);

DROP TABLE IF EXISTS hosp.microbiologyevents;
CREATE TABLE hosp.microbiologyevents
(
  microevent_id INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  micro_specimen_id INTEGER NOT NULL,
  order_provider_id     VARCHAR(10),
  chartdate TIMESTAMP(0) NOT NULL,
  charttime TIMESTAMP(0),
  spec_itemid INTEGER NOT NULL,
  spec_type_desc VARCHAR(100) NOT NULL,
  test_seq INTEGER NOT NULL,
  storedate TIMESTAMP(0),
  storetime TIMESTAMP(0),
  test_itemid INTEGER,
  test_name VARCHAR(100),
  org_itemid INTEGER,
  org_name VARCHAR(100),
  isolate_num SMALLINT,
  quantity VARCHAR(50),
  ab_itemid INTEGER,
  ab_name VARCHAR(30),
  dilution_text VARCHAR(10),
  dilution_comparison VARCHAR(20),
  dilution_value DOUBLE PRECISION,
  interpretation VARCHAR(5),
  comments TEXT
);

DROP TABLE IF EXISTS hosp.pharmacy;
CREATE TABLE hosp.pharmacy
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  pharmacy_id INTEGER NOT NULL,
  poe_id VARCHAR(25),
  starttime TIMESTAMP(3),
  stoptime TIMESTAMP(3),
  medication TEXT,
  proc_type VARCHAR(50) NOT NULL,
  status VARCHAR(50),
  entertime TIMESTAMP(3) NOT NULL,
  verifiedtime TIMESTAMP(3),
  route VARCHAR(50),
  frequency VARCHAR(50),
  disp_sched VARCHAR(255),
  infusion_type VARCHAR(15),
  sliding_scale VARCHAR(1),
  lockout_interval VARCHAR(50),
  basal_rate REAL,
  one_hr_max VARCHAR(10),
  doses_per_24_hrs REAL,
  duration REAL,
  duration_interval VARCHAR(50),
  expiration_value INTEGER,
  expiration_unit VARCHAR(50),
  expirationdate TIMESTAMP(3),
  dispensation VARCHAR(50),
  fill_quantity VARCHAR(50)
);

DROP TABLE IF EXISTS hosp.poe_detail;
CREATE TABLE hosp.poe_detail
(
  poe_id VARCHAR(25) NOT NULL,
  poe_seq INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  field_name VARCHAR(255) NOT NULL,
  field_value TEXT
);

DROP TABLE IF EXISTS hosp.poe;
CREATE TABLE hosp.poe
(
  poe_id VARCHAR(25) NOT NULL,
  poe_seq INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  ordertime TIMESTAMP(0) NOT NULL,
  order_type VARCHAR(25) NOT NULL,
  order_subtype VARCHAR(50),
  transaction_type VARCHAR(15),
  discontinue_of_poe_id VARCHAR(25),
  discontinued_by_poe_id VARCHAR(25),
  order_provider_id     VARCHAR(10),
  order_status VARCHAR(15)
);

DROP TABLE IF EXISTS hosp.prescriptions;
CREATE TABLE hosp.prescriptions
(
subject_id      INTEGER NOT NULL,
hadm_id INTEGER NOT NULL,
pharmacy_id     INTEGER NOT NULL,
poe_id  VARCHAR(25),
poe_seq INTEGER,
order_provider_id       VARCHAR(10),
starttime       TIMESTAMP(3),
stoptime        TIMESTAMP(3),
drug_type       VARCHAR(20) NOT NULL,
drug    VARCHAR(255) NOT NULL,
formulary_drug_cd       VARCHAR(50),
gsn     VARCHAR(255),
ndc     VARCHAR(25),
prod_strength   VARCHAR(255),
form_rx VARCHAR(25),
dose_val_rx     VARCHAR(100),
dose_unit_rx    VARCHAR(50),
form_val_disp   VARCHAR(50),
form_unit_disp  VARCHAR(50),
doses_per_24_hrs        REAL,
route   VARCHAR(50)
);

DROP TABLE IF EXISTS hosp.procedures_icd;
CREATE TABLE hosp.procedures_icd
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  seq_num INTEGER NOT NULL,
  chartdate TIMESTAMP(0) NOT NULL,
  icd_code VARCHAR(7),
  icd_version SMALLINT
);

DROP TABLE IF EXISTS hosp.services;
CREATE TABLE hosp.services
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  transfertime TIMESTAMP NOT NULL,
  prev_service VARCHAR(10),
  curr_service VARCHAR(10)
);

-- icu schema

DROP TABLE IF EXISTS icu.chartevents;
CREATE TABLE icu.chartevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  caregiver_id  INTEGER,
  charttime TIMESTAMP NOT NULL,
  storetime TIMESTAMP,
  itemid INTEGER NOT NULL,
  value VARCHAR(200),
  valuenum FLOAT,
  valueuom VARCHAR(20),
  warning SMALLINT
);

DROP TABLE IF EXISTS icu.datetimeevents;
CREATE TABLE icu.datetimeevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  caregiver_id  INTEGER NOT NULL,
  charttime TIMESTAMP NOT NULL,
  storetime TIMESTAMP,
  itemid INTEGER NOT NULL,
  value TIMESTAMP NOT NULL,
  valueuom VARCHAR(20),
  warning SMALLINT
);

DROP TABLE IF EXISTS icu.d_items;
CREATE TABLE icu.d_items
(
  itemid INTEGER NOT NULL,
  label VARCHAR(100) NOT NULL,
  abbreviation VARCHAR(50) NOT NULL,
  linksto VARCHAR(30) NOT NULL,
  category VARCHAR(50) NOT NULL,
  unitname VARCHAR(50),
  param_type VARCHAR(20) NOT NULL,
  lownormalvalue FLOAT,
  highnormalvalue FLOAT
);

DROP TABLE IF EXISTS icu.icustays;
CREATE TABLE icu.icustays
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  first_careunit VARCHAR(255),
  last_careunit VARCHAR(255),
  intime TIMESTAMP,
  outtime TIMESTAMP,
  los FLOAT
);

DROP TABLE IF EXISTS icu.inputevents;
CREATE TABLE icu.inputevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER,
  caregiver_id  INTEGER,
  starttime TIMESTAMP NOT NULL,
  endtime TIMESTAMP NOT NULL,
  storetime TIMESTAMP,
  itemid INTEGER NOT NULL,
  amount FLOAT,
  amountuom VARCHAR(20),
  rate FLOAT,
  rateuom VARCHAR(20),
  orderid INTEGER NOT NULL,
  linkorderid INTEGER,
  ordercategoryname VARCHAR(50),
  secondaryordercategoryname VARCHAR(50),
  ordercomponenttypedescription VARCHAR(100),
  ordercategorydescription VARCHAR(30),
  patientweight FLOAT,
  totalamount FLOAT,
  totalamountuom VARCHAR(50),
  isopenbag SMALLINT,
  continueinnextdept SMALLINT,
  statusdescription VARCHAR(20),
  originalamount FLOAT,
  originalrate FLOAT
);

DROP TABLE IF EXISTS icu.outputevents;
CREATE TABLE icu.outputevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  caregiver_id  INTEGER,
  charttime TIMESTAMP(3) NOT NULL,
  storetime TIMESTAMP(3) NOT NULL,
  itemid INTEGER NOT NULL,
  value FLOAT NOT NULL,
  valueuom VARCHAR(20)
);

DROP TABLE IF EXISTS icu.procedureevents;
CREATE TABLE icu.procedureevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  caregiver_id  INTEGER,
  starttime TIMESTAMP NOT NULL,
  endtime TIMESTAMP NOT NULL,
  storetime TIMESTAMP NOT NULL,
  itemid INTEGER NOT NULL,
  value FLOAT,
  valueuom VARCHAR(20),
  location VARCHAR(100),
  locationcategory VARCHAR(50),
  orderid INTEGER,
  linkorderid INTEGER,
  ordercategoryname VARCHAR(50),
  ordercategorydescription VARCHAR(30),
  patientweight FLOAT,
  isopenbag SMALLINT,
  continueinnextdept SMALLINT,
  statusdescription VARCHAR(20),
  originalamount DOUBLE PRECISION,
  originalrate DOUBLE PRECISION
);

-- ed

DROP TABLE IF EXISTS ed.diagnosis CASCADE;
CREATE TABLE ed.diagnosis
(
  subject_id INT NOT NULL,
  stay_id INT NOT NULL,
  seq_num INT NOT NULL,
  icd_code VARCHAR(10) NOT NULL,
  icd_version INT NOT NULL,
  icd_title VARCHAR(255) NOT NULL
) ;

DROP TABLE IF EXISTS ed.edstays CASCADE;
CREATE TABLE ed.edstays
(
subject_id      INTEGER NOT NULL,
hadm_id INTEGER,
stay_id INTEGER NOT NULL,
intime  TIMESTAMP(0) NOT NULL,
outtime TIMESTAMP(0) NOT NULL,
gender  VARCHAR(1) NOT NULL,
race    VARCHAR(60),
arrival_transport       VARCHAR(50) NOT NULL,
disposition     VARCHAR(255)
) ;

DROP TABLE IF EXISTS ed.medrecon CASCADE;
CREATE TABLE ed.medrecon
(
  subject_id INT NOT NULL,
  stay_id INT NOT NULL,
  charttime TIMESTAMP(0) NOT NULL,
  name VARCHAR(255) NOT NULL,
  gsn VARCHAR(11) NOT NULL,
  ndc VARCHAR(12) NOT NULL,
  etc_rn INT NOT NULL,
  etccode VARCHAR(8),
  etcdescription VARCHAR(255)
) ;

DROP TABLE IF EXISTS ed.pyxis CASCADE;
CREATE TABLE ed.pyxis
(
  subject_id INT NOT NULL,
  stay_id INT NOT NULL,
  charttime TIMESTAMP(0) NOT NULL,
  med_rn INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  gsn_rn INT NOT NULL,
  gsn VARCHAR(6)
) ;


DROP TABLE IF EXISTS ed.triage CASCADE;
CREATE TABLE ed.triage
(
subject_id      INTEGER NOT NULL,
stay_id INTEGER NOT NULL,
temperature     NUMERIC(10, 4),
heartrate       NUMERIC(10, 4),
resprate        NUMERIC(10, 4),
o2sat   NUMERIC(10, 4),
sbp     NUMERIC(10, 4),
dbp     NUMERIC(10, 4),
pain    TEXT,
acuity  NUMERIC(10, 4),
chiefcomplaint  VARCHAR(255)
) ;

DROP TABLE IF EXISTS ed.vitalsign CASCADE;
CREATE TABLE ed.vitalsign
(
-- icustays

DROP INDEX IF EXISTS icustays_idx01;
CREATE INDEX icustays_idx01
  ON icustays (first_careunit, last_careunit);

DROP INDEX IF EXISTS icustays_idx02;
  subject_id INT NOT NULL,
  stay_id INT NOT NULL,
  charttime TIMESTAMP(0) NOT NULL,
  temperature DOUBLE PRECISION,
  heartrate DOUBLE PRECISION,
  resprate DOUBLE PRECISION,
  o2sat DOUBLE PRECISION,
  sbp DOUBLE PRECISION,
  dbp DOUBLE PRECISION,
  rhythm TEXT,
  pain TEXT
);
