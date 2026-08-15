-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Clinical Data Exchange
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA CURATED;

-- PATIENT_COHORTS: Pre-built research cohorts by condition and treatment
-- Source: PATIENT_REGISTRY, CLINICAL_ENCOUNTERS
CREATE OR REPLACE DYNAMIC TABLE CURATED.PATIENT_COHORTS
  TARGET_LAG = '5 minutes'
  WAREHOUSE = HIE_WH
AS
SELECT * FROM RAW.PATIENT_REGISTRY;
-- TODO: Replace with actual join/aggregation logic per demo

-- TREATMENT_OUTCOMES: Outcome metrics by hospital, condition, and procedure
-- Source: CLINICAL_ENCOUNTERS, LAB_RESULTS
CREATE OR REPLACE DYNAMIC TABLE CURATED.TREATMENT_OUTCOMES
  TARGET_LAG = '5 minutes'
  WAREHOUSE = HIE_WH
AS
SELECT * FROM RAW.CLINICAL_ENCOUNTERS;
-- TODO: Replace with actual join/aggregation logic per demo

-- NETWORK_UTILIZATION: Data sharing participation and query volume by hospital
-- Source: HOSPITALS, CLINICAL_ENCOUNTERS
CREATE OR REPLACE DYNAMIC TABLE CURATED.NETWORK_UTILIZATION
  TARGET_LAG = '5 minutes'
  WAREHOUSE = HIE_WH
AS
SELECT * FROM RAW.HOSPITALS;
-- TODO: Replace with actual join/aggregation logic per demo

-- POPULATION_HEALTH: Population-level disease prevalence and trends
-- Source: PATIENT_REGISTRY, CLINICAL_ENCOUNTERS
CREATE OR REPLACE DYNAMIC TABLE CURATED.POPULATION_HEALTH
  TARGET_LAG = '5 minutes'
  WAREHOUSE = HIE_WH
AS
SELECT * FROM RAW.PATIENT_REGISTRY;
-- TODO: Replace with actual join/aggregation logic per demo

