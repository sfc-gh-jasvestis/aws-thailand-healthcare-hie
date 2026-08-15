-- ============================================================================
-- Clinical Data Exchange
-- Secure clinical data exchange across 20 Thai hospitals — Iceberg + Lake Formation governs access, Row Access Policies enforce patient consent, and Cortex Complete generates clinical insights while preserving PDPA compliance.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS CLINICAL_HIE;
CREATE WAREHOUSE IF NOT EXISTS HIE_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE CLINICAL_HIE;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE HIE_WH;
