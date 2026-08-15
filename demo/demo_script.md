# Demo Script: Clinical Data Exchange
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake enables secure multi-hospital data sharing with patient-level consent governance via Row Access Policies, AI-powered clinical insights via Cortex Complete, and open Iceberg interoperability — replacing siloed EHRs with governed clinical intelligence"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Dr. Kamol Deerochanawong** | Chief Health Informatics Officer | React App (SPCS) | Data sharing governance, PDPA compliance, clinical data quality, network participation |
| **Dr. Supanee Tangjitgamol** | Clinical Research Director | Amazon QuickSight | Research cohort identification, treatment outcome analysis, clinical pattern discovery, population health |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 8 tables | HOSPITALS (20), PATIENT_REGISTRY (2000000), CLINICAL_ENCOUNTERS (8000000), LAB_RESULTS (15000000), MEDICATIONS (12000000), CONSENT_REGISTRY (2000000), CLINICAL_GUIDELINES (200), THAI_HEALTH_SYSTEM (10) |
| **CURATED** | 4 Dynamic Tables | PATIENT_COHORTS, TREATMENT_OUTCOMES, NETWORK_UTILIZATION, POPULATION_HEALTH |
| **ML** | ML.FORECAST + ML.ANOMALY_DETECTION | Forecasting + anomaly detection |
| **AI** | COMPLETE, AI_CLASSIFY, SUMMARIZE | Classification + extraction |
| **Search** | Cortex Search | 200 documents indexed |
| **Agent** | CLINICAL_HIE_AGENT | Semantic View + Search tools |


---

## The Story

Thailand's 20 leading hospitals hold 2 million patient records in siloed EHRs — preventing research, outcome benchmarking, and population health insights. PDPA (Thailand's privacy law) mandates consent-based sharing. Iceberg tables + Row Access Policies + Cortex Complete enable governed clinical intelligence without compromising patient privacy.

---

## Script

### [0:00–0:45] EXECUTIVE COCKPIT

**Show**: Executive Cockpit tab

> "Twenty hospitals actively sharing data — 2M patient records with PDPA consent."

**Action**: Point at network participation map

### [0:45–1:30] GOVERNANCE & CONSENT

**Show**: Governance & Consent tab

> "Row Access Policies enforce PDPA consent at query time — no consented patient data leaks to unauthorized parties."

**Action**: Show Row Access Policy logic

### [1:30–2:15] CLINICAL INTELLIGENCE

**Show**: Clinical Intelligence tab

> "Research cohort identification: 4,200 diabetic patients on GLP-1 therapy across the network."

**Action**: Show cohort builder interface

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Dr. Kamol asks: 'Which hospitals have outcome variance for cardiac surgery?'"

**Action**: Type: 'Outcome variance by hospital for cardiac surgery'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Seven Snowflake capabilities, six AWS services."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **Row Access Policies for PDPA consent enforcement** — Only demo enforcing patient-level data sharing consent at query time in clinical data
2. **Iceberg tables for clinical data interoperability** — Open format enables data exchange between Snowflake and external research platforms
3. **Cortex Complete for clinical research insights** — AI-generated research summaries from population-level clinical data
4. **Thai PDPA compliance context** — Thailand's data protection law with explicit consent management for health data
5. **Treatment outcome benchmarking via Dynamic Tables** — Real-time outcome comparison across 20 hospitals detecting quality variance
6. **ML.ANOMALY_DETECTION on clinical outcomes** — Statistical detection of outcome variance signaling quality improvement opportunities


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM CLINICAL_HIE.RAW.PATIENT_REGISTRY` → 2000000
- [ ] `SELECT COUNT(*) FROM CLINICAL_HIE.RAW.CLINICAL_ENCOUNTERS` → 8000000
- [ ] `SELECT COUNT(*) FROM CLINICAL_HIE.RAW.CONSENT_REGISTRY WHERE STATUS = 'ACTIVE'` → >1800000

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM CLINICAL_HIE.ML.DISEASE_PREVALENCE_FORECAST_RESULTS` → >0
- [ ] `SELECT SUM(CASE WHEN IS_ANOMALY THEN 1 ELSE 0 END) FROM CLINICAL_HIE.ML.OUTCOME_ANOMALY_RESULTS` → >=3

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM CLINICAL_HIE.AI.ENCOUNTER_CLASSIFICATIONS` → >1000000

