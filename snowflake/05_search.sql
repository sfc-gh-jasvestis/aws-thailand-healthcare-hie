-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Clinical Data Exchange
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.CLINICAL_GUIDELINE_SEARCH
  ON GUIDELINE_TEXT
  ATTRIBUTES SPECIALTY, CONDITION, EVIDENCE_LEVEL
  WAREHOUSE = HIE_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.CLINICAL_GUIDELINES
);
