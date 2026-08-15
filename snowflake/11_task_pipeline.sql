-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Clinical Data Exchange
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_REFRESH_COHORTS
  WAREHOUSE = HIE_WH
  SCHEDULE = 'USING CRON 0 3 * * * UTC'
  COMMENT = 'Refresh research cohort definitions daily'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_UPDATE_OUTCOMES
  WAREHOUSE = HIE_WH
  AFTER APP.TASK_REFRESH_COHORTS
  COMMENT = 'Update treatment outcome metrics'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_CHECK_CONSENT
  WAREHOUSE = HIE_WH
  SCHEDULE = 'USING CRON 0 6 * * 1 UTC'
  COMMENT = 'Check for expiring patient consents'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_CHECK_CONSENT RESUME;
ALTER TASK APP.TASK_UPDATE_OUTCOMES RESUME;
ALTER TASK APP.TASK_REFRESH_COHORTS RESUME;
