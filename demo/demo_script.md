# Clinical Data Exchange

**Thailand - Healthcare & Medical Tourism**
Use case: Health Information Exchange & Governance

> Secure clinical data exchange across 20 Thai hospitals — Iceberg + Lake Formation governs access, Row Access Policies enforce patient consent, and Cortex Complete generates clinical insights while preserving PDPA compliance.

## Why Snowflake

Snowflake enables secure multi-hospital data sharing with patient-level consent governance via Row Access Policies, AI-powered clinical insights via Cortex Complete, and open Iceberg interoperability — replacing siloed EHRs with governed clinical intelligence

- **Row Access Policies for PDPA consent enforcement** - Only demo enforcing patient-level data sharing consent at query time in clinical data
- **Iceberg tables for clinical data interoperability** - Open format enables data exchange between Snowflake and external research platforms
- **Cortex Complete for clinical research insights** - AI-generated research summaries from population-level clinical data
- **Thai PDPA compliance context** - Thailand's data protection law with explicit consent management for health data
- **Treatment outcome benchmarking via Dynamic Tables** - Real-time outcome comparison across 20 hospitals detecting quality variance
- **ML.ANOMALY_DETECTION on clinical outcomes** - Statistical detection of outcome variance signaling quality improvement opportunities

## What is deployed

| | |
|---|---|
| Database | `THAILAND_HEALTHCARE_HIE` |
| Service | `THAILAND_HEALTHCARE_HIE_APP` |
| Compute pool | `SEA_DEMOS_THAILAND_POOL` |
| Dimension table | `RAW.THAI_HEALTH_SYSTEM` (20 rows) |
| Fact table | `RAW.LAB_RESULTS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | THB (฿) |

Regions in play: Bangkok, Chonburi, Rayong, Chiang Mai, Songkhla
Segments: Referral, Lab Result, Imaging Report, Discharge Summary

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh THAILAND_HEALTHCARE_HIE
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| Records Exchanged (MTD) | `2.4M` | total across Thai Health System |
| Consent Coverage | `89%` | average per event |
| Integration Errors | `0.02%` | average per event |
| Connected Facilities | `347` | total across Thai Health System |
| Record Completeness | `94.7%` | average per event |
| Duplicate Rate | `1.2%` | average per event |
| Avg Response Time | `340ms` | average per event |


## Demo flow

1. Executive Cockpit
2. Governance & Consent
3. Clinical Intelligence
4. Ask AI
5. Architecture & Data

## Talking points

- **20 hospitals** - actively sharing clinical data in the network
- **2M patients** - registered with PDPA consent for data sharing
- **94% consent** - coverage rate (6% partial or expired)
- **8M encounters** - clinical encounters available for research
- **50K queries/month** - research and clinical queries against the HIE
- **2σ variance** - detected at Hospital C cardiac surgery outcomes

## Business impact

- Thailand's PDPA (Personal Data Protection Act) became fully effective in June 2022 with health data as sensitive category (Thailand PDPC)
- Health information exchange reduces duplicate testing by 30% and improves care coordination outcomes by 20% (HIMSS)
- Bangkok Dusit Medical Services (BDMS) network connects 50 hospitals with shared clinical systems (BDMS)
- AI-powered clinical decision support reduces adverse events by 15-25% in multi-hospital networks (Nature Medicine)

---
Generated from `generator/demo_specs/aws-thailand-healthcare-hie.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-thailand-healthcare-hie` instead.
