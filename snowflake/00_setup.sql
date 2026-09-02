-- Generated from generator/demo_specs/aws-thailand-healthcare-hie.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-thailand-healthcare-hie
-- This is the schema that is actually deployed for THAILAND_HEALTHCARE_HIE.

-- THAILAND_HEALTHCARE_HIE  (Clinical Data Exchange)
-- generated from generator/demo_specs/aws-thailand-healthcare-hie.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS THAILAND_HEALTHCARE_HIE;
CREATE SCHEMA IF NOT EXISTS THAILAND_HEALTHCARE_HIE.RAW;
CREATE SCHEMA IF NOT EXISTS THAILAND_HEALTHCARE_HIE.CURATED;
CREATE SCHEMA IF NOT EXISTS THAILAND_HEALTHCARE_HIE.APP;
USE DATABASE THAILAND_HEALTHCARE_HIE;

-- 5 real regions; entity names carry their region so the two always agree
