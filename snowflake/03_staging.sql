-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Clinical Data Exchange
-- Country: THAILAND | Currency: THB
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- HOSPITALS: 20 rows — Network hospitals (BDMS, Bumrungrad, BNH, Siriraj referrals)
-- PATIENT_REGISTRY: 2,000,000 rows — De-identified patient records with consent flags (PDPA)
-- CLINICAL_ENCOUNTERS: 8,000,000 rows — Clinical encounters with diagnosis (ICD-10), procedures, and outcomes
-- LAB_RESULTS: 15,000,000 rows — Laboratory test results across the network
-- MEDICATIONS: 12,000,000 rows — Prescription and dispensing records
-- CONSENT_REGISTRY: 2,000,000 rows — Patient consent records for data sharing (PDPA compliance)
-- CLINICAL_GUIDELINES: 200 rows — Thai Medical Council clinical practice guidelines
-- THAI_HEALTH_SYSTEM: 10 rows — Thailand healthcare system overview
