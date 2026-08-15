-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Clinical Data Exchange
-- ============================================================================
USE DATABASE CLINICAL_HIE;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.CLINICAL_HIE_AGENT
  COMMENT = 'Clinical Data Exchange AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'CLINICAL_HIE.APP.CLINICAL_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'CLINICAL_HIE.SEARCH.CLINICAL_GUIDELINE_SEARCH', TOOL_DESCRIPTION => 'Search documents for Healthcare & Medical Tourism information')
  )
  SYSTEM_PROMPT = 'You are the Clinical Health Information Exchange Agent for 20 hospitals in Thailand, enabling governed data sharing, research cohort identification, and clinical insights while respecting PDPA consent.';
