-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Clinical Data Exchange
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.CLINICAL_ANALYTICS
  COMMENT = 'Clinical data exchange, treatment outcomes, and population health analytics'
AS
  TABLES (
    CURATED.PATIENT_COHORTS AS patient_cohorts,CURATED.TREATMENT_OUTCOMES AS treatment_outcomes,CURATED.NETWORK_UTILIZATION AS network_utilization,CURATED.POPULATION_HEALTH AS population_health
  );
