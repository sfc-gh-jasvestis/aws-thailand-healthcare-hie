# Thailand Provincial HIE Feed Operations

**Thailand - fictional provincial health information exchange**
Use case: FHIR feed quality and interface incident triage across 5 Thai cities

> A fictional provincial health information exchange receives FHIR bundles from 40 facilities in Bangkok, Chiang Mai, Khon Kaen, Hat Yai and Phuket. The demo shows curated feed KPIs, a holdout-evaluated interface incident classifier, an accepted-bundle forecast and AI answers that cite their SQL and playbooks. Data is synthetic and facility-level; there are no patient records.

## Why Snowflake

- **Dynamic tables** compute feed completeness, bundle rejections, data quality issues, interface incidents and conformance check compliance from the RAW facility data; `run_core.py` recomputes and reconciles them on every build
- **Interface incident classification** ranks facilities by next-7-day incident probability, with an out-of-time holdout
- **Accepted-bundle forecast** projects 14 days of exchange volume with prediction intervals
- **Grounded AI**: the Cortex Agent (Analyst over a semantic view, plus Search over interface playbooks) shows its SQL and playbook citations
- **Live bundle events**: a native simulator (Snowflake only) or S3 PutObject and Snowpipe (AWS build), then an alert and an email

## What is built

| | |
|---|---|
| Dimension table | `RAW.FACILITIES` (40 rows) |
| Fact table | `RAW.FEED_DAILY` (3,600 facility-days, 90 days) |
| Curated layer | `CURATED.KPI_SUMMARY`, `PERFORMANCE_SUMMARY`, `ISSUE_SUMMARY`, `TREND_ANALYSIS` |
| ML | `ML.INCIDENT_RISK_SCORES`, `ML.INCIDENT_RISK_HOLDOUT_METRICS`, `ML.BUNDLE_FORECAST`, `ML.UNMAPPED_CODE_ANOMALIES` |

Cities: Bangkok, Chiang Mai, Khon Kaen, Hat Yai, Phuket.
Source types: Hospital, Primary care, Laboratory, Pharmacy, Imaging.

## KPI cards (live from `CURATED.KPI_SUMMARY`; no fallback values)

| Card | Value from the seeded data |
|---|---|
| Feed Completeness | 91.8% |
| Bundles Accepted | 410,713 |
| Bundle Rejection Rate | 5.9% |
| Issue Escalation Rate | 23.2% |
| Data Quality Issues | 521 |
| Interface Incidents | 121 |
| Tickets Opened | 60 |
| Conformance Check Compliance | 78.7% |
| Facilities Connected | 40 |
| Profile Conformance | 63.6% |
| Profile Reviews Pending | 19 |

Values are synthetic. The data is HASH-seeded, so a rebuild reproduces them; dates are relative to the build day.

## Demo flow (about 6 minutes)

1. Executive Cockpit (Napat Srisuk, Head of Exchange Integration): KPIs, daily data quality issues against interface incidents, issues and incidents by issue type, and the facility table with its city column
2. Predictive (Pimchanok Wongsa, Interface Operations Lead): holdout metrics, risk bands, the 14-day accepted-bundle forecast and unmapped code rate anomalies
3. Conformance: check compliance, FHIR profile conformance and pending reviews, check compliance against interface incidents, then generate the action memo
4. Live Bundles: run `CALL APP.SIMULATE_BUNDLES(20)` (Snowflake only) or `python aws/publish_bundles.py --account <AWS_ACCOUNT_ID> --count 20` (AWS build). Then run `EXECUTE ALERT APP.LIVE_BUNDLE_ALERT` and show the alert log and the email
5. Ask AI: the Cortex Agent answers metric questions through the semantic view and cites playbooks from Cortex Search, with the SQL shown
6. QuickSight (AWS build): the same Snowflake tables through DIRECT_QUERY
7. Architecture: both builds side by side

## Talking points

- The exchange holds 91.8% of its expected 90-day bundle volume; 19 of the 40 facilities are below 90% of their own expected volume.
- About one in four data quality issues are escalated as interface incidents (23.2%). Date sequence error produces the most incidents. The two city-wide network outages (Chiang Mai and Hat Yai) raise an issue at every facility in the city and are never escalated.
- Phuket facilities record the most interface incidents (32 of 121), while Bangkok has the lowest feed completeness of the 5 cities (90.0%)
- The risk model is evaluated on a time-based holdout: precision 0.425 and recall 0.337 at 0.5, against a 0.171 base rate. Present it as a way to order the interface team's calls, not a verdict on any facility.
- City-wide outages are excluded from model training, because the facility did not cause them.
- This is integration operations data only. It makes no clinical or medical claims and contains no patient records.

## Business impact

Use only the sourced reference in `README.md` (Business Impact).
