-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Clinical Data Exchange
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_thailand_healthcare_hie_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('<YOUR_EMAIL>');

-- Alert: CONSENT_EXPIRY_ALERT
CREATE OR REPLACE ALERT APP.CONSENT_EXPIRY_ALERT
  WAREHOUSE = HIE_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Patient consent renewal needed — data access at risk'
IF (EXISTS (
  SELECT 1 FROM CURATED.PATIENT_COHORTS
  WHERE 1=1 -- Condition: CONSENT_EXPIRY_DATE within 30 days for >1000 patients
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_thailand_healthcare_hie_EMAIL_INT',
    '<YOUR_EMAIL>',
    '[ALERT] Clinical Data Exchange: Patient consent renewal needed — data access at risk',
    'Patient consent renewal needed — data access at risk'
  );

ALTER ALERT APP.CONSENT_EXPIRY_ALERT RESUME;

-- Alert: OUTCOME_VARIANCE_ALERT
CREATE OR REPLACE ALERT APP.OUTCOME_VARIANCE_ALERT
  WAREHOUSE = HIE_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Treatment outcome variance detected — quality review recommended'
IF (EXISTS (
  SELECT 1 FROM CURATED.PATIENT_COHORTS
  WHERE 1=1 -- Condition: OUTCOME_VARIANCE > 2σ for any hospital-procedure pair
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_thailand_healthcare_hie_EMAIL_INT',
    '<YOUR_EMAIL>',
    '[ALERT] Clinical Data Exchange: Treatment outcome variance detected — quality review recommended',
    'Treatment outcome variance detected — quality review recommended'
  );

ALTER ALERT APP.OUTCOME_VARIANCE_ALERT RESUME;

