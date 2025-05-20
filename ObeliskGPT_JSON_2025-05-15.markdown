---
title: ObeliskGPT JSON Data (Version 1.0)
subtitle: Comprehensive Catalog of JSON Files and Logs for ObeliskOS Wave 1
author: LordDarkHelmet (Creator of Hybrid Flux_Star Framework)
date: May 15, 2025
version: 1.0
status: Living Document
repository: D:\ObeliskOS
log: D:\ObeliskOS\Logs
---

# ObeliskGPT JSON Data (Version 1.0)

**Credit**: The **Hybrid Flux_Star** framework and **Obelisk Symbolic Language (OSL)** are the intellectual property of **LordDarkHelmet**, conceptualized in April 2025. All references acknowledge LordDarkHelmet’s contribution.

## 1. Introduction

This document catalogs all JSON data files and logs from the first 3–4 days of the **ObeliskGPT** development thread (May 14–18, 2025), part of **ObeliskOS**, hosted at `https://github.com/LordDarkHelmet126/ObeliskGPT`. It covers files explicitly mentioned, implied, or inferred, supporting **Wave 1** (OSL, LSUs, single AI agent) on the Zephyr testbed. JSONs are organized by category (Core, SWG, Testing, Security, Inferred), with structure, purpose, and status, ensuring a seamless handoff post-memory reset. All files use JSON Lines format for Dark_Star learning (2% accuracy improvement per 1,000 iterations), with glyph errors obfuscated via `Obfuscate-Glyph()`.

### 1.1 Purpose
- **Catalog JSONs**: List all JSON files and logs, including explicit (Interactions 1–4, documents), implied (Wave 1), and inferred (May 15–17/18).
- **Document Structure**: Provide schema and usage details, addressing issues (e.g., `agent_log.json` mixed format).
- **Support Handoff**: Enable new LLM threads or developers to validate and generate JSONs.
- **Ensure Compliance**: Adhere to ObeliskOS standards (DPI <0.00001%, glyph-only output, UTF-8 BOM).

### 1.2 Scope
- **Timeframe**: May 14–18, 2025, covering 4 interactions (May 14) and inferred activities.
- **JSONs**: ~15 files, including logs (`agent_log.json`, `swg_training_archive.json`) and data (`glyph_mappings.json`).
- **Sources**: `obeliskos_thread_v1.markdown`, `Obelisk_Core_README_v2.markdown`, `Obelisk_Core_Data_v1.json`, `glyph_mappings.json`.

## 2. JSON Catalog

### 2.1 Core JSONs
1. **`agent_log.json`**
   - **Path**: `D:\ObeliskOS\Logs\agent_log.json`
   - **Purpose**: Raw `symbol_agent` logs, mixed Python dict/JSON, from Wave 1 tests (May 13, 19:37 PM).
   - **Structure**:
     ```json
     {"timestamp": "2025-05-13T19:37:00Z", "operation": "agent_action", "data": {...}}
     ```
   - **Status**: Generated, requires cleaning (2464 bytes).
   - **Usage**:
     ```bash
     python 🜁_clean_agent_log.py
     ```
   - **Source**: `obeliskos_thread_v1.markdown`
2. **`agent_log_normalized.jsonl`**
   - **Path**: `D:\ObeliskOS\Logs\agent_log_normalized.jsonl`
   - **Purpose**: Normalized `symbol_agent` logs, 14 entries (full), 10 entries (`--max-lines 10`).
   - **Structure**:
     ```json
     {"__header__": {"exported_at": "2025-05-13T19:53:00Z", "schema": "obeliskos_log_v1", "symbolic_signature": "🜰🜁🜃", "entry_count": 14}}
     {"timestamp": "2025-05-13T19:37:00Z", "operation": "agent_action", "data": {...}}
     ```
   - **Status**: Generated, validated (~1200 bytes).
   - **Usage**: Validate with `🜁_test_wave1_minimal.py`.
   - **Source**: `obeliskos_thread_v1.markdown`
3. **`agent_log_clean.jsonl`**
   - **Path**: `D:\ObeliskOS\Logs\agent_log_clean.jsonl`
   - **Purpose**: Pure JSON Lines from `agent_log.json`, pending generation.
   - **Structure**:
     ```json
     {"timestamp": "2025-05-13T19:37:00Z", "operation": "agent_action", "data": {...}}
     ```
   - **Status**: Pending, critical for version 1.12 (~1200 bytes).
   - **Usage**:
     ```bash
     python 🜁_clean_agent_log.py
     ```
   - **Source**: `obeliskos_thread_v1.markdown`
4. **`glyph_mappings.json`**
   - **Path**: `D:\ObeliskOS\glyph_mappings.json`
   - **Purpose**: Stores OSL glyph mappings (33 glyphs), B-tree indexed.
   - **Structure**:
     ```json
     [
       {"glyph_id": 1, "unicode": "\ud83d\udf01", "semantic_role": "Verify Transaction", "vowel_harmony": "Neutral", "type": "ACTION", "payload_size": 10, "binary_id": "00000000001"},
       {"glyph_id": 2, "unicode": "\ud83d\udf03", "semantic_role": "Update Entity", "vowel_harmony": "Active", "type": "ACTION", "payload_size": 8, "binary_id": "00000000010"}
     ]
     ```
   - **Status**: Active, used in Wave 1.
   - **Usage**: Query with `glyph_parser.ps1`.
   - **Source**: Provided document

### 2.2 SWG JSONs
5. **`swg_training_archive.json`**
   - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\swg_training_archive.json`
   - **Purpose**: Logs SWG training, 97% accuracy, 100,000 glyphs.
   - **Structure**:
     ```json
     {"timestamp": "2025-05-08T00:00:00Z", "operation": "training", "accuracy": 0.97, "glyph_count": 100000}
     ```
   - **Status**: Generated, used in SWG tests.
   - **Usage**: Validate with `llm_server.ps1`.
   - **Source**: `Obelisk_Core_README_v2.markdown`
6. **`swg_process_log.json`**
   - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\swg_process_log.json`
   - **Purpose**: Logs SWG glyph processing, 97% accuracy, 149–250 MB.
   - **Structure**:
     ```json
     {"timestamp": "2025-05-08T00:00:00Z", "operation": "glyph_processing", "accuracy": 0.97, "memory": "149–250 MB"}
     ```
   - **Status**: Generated, used in SWG tests.
   - **Usage**: Analyze with `fluxstar_brain.ps1`.
   - **Source**: `Obelisk_Core_README_v2.markdown`
7. **`swg_parse_log.json`**
   - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\swg_parse_log.json`
   - **Purpose**: Logs SWG data load failure (missing `E:\SWG_Data\quest_1.lua`).
   - **Structure**:
     ```json
     {"timestamp": "2025-05-08T00:00:00Z", "operation": "data_load", "status": "failed", "error": "Missing E:\\SWG_Data\\quest_1.lua"}
     ```
   - **Status**: Generated, reflects failure, low priority.
   - **Usage**: Debug with `glyph_executor.ps1`.
   - **Source**: `Obelisk_Core_README_v2.markdown`
8. **`router_log.json`**
   - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\router_log.json`
   - **Purpose**: Logs task routing and inference failures for SWG.
   - **Structure**:
     ```json
     {"timestamp": "2025-05-13T00:00:00Z", "operation": "routing", "status": "failed", "details": "Inference error"}
     ```
   - **Status**: Generated, used in SWG feedback.
   - **Usage**: Analyze with `llm_server.ps1`.
   - **Source**: `Obelisk_Core_Data_v1.json`

### 2.3 Testing JSONs
9. **`test_results_minimal.json`**
   - **Path**: `D:\ObeliskOS\Logs\test_results_minimal.json`
   - **Purpose**: Logs Wave 1 test results (glyph_parser, lsu_manager, symbol_agent), May 13, 19:53–20:10 PM.
   - **Structure**:
     ```json
     {"glyph_parser": true, "lsu_manager": true, "symbol_agent": true}
     ```
   - **Status**: Generated, reflects success (~4000 bytes).
   - **Usage**: Validate with `🜁_test_wave1_minimal.py`.
   - **Source**: `obeliskos_thread_v1.markdown`
10. **`wave1_summary.json`**
    - **Path**: `D:\ObeliskOS\Logs\wave1_summary.json`
    - **Purpose**: Summarizes Wave 1 outcomes, May 13.
    - **Structure**:
      ```json
      {"status": "success", "tests_passed": 3, "timestamp": "2025-05-13T20:00:00Z"}
      ```
    - **Status**: Generated, reflects success (~200 bytes).
    - **Usage**: Review with `validate_outputs.ps1`.
    - **Source**: `obeliskos_thread_v1.markdown`
11. **`internal_sim_results.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\internal_sim_results.json`
    - **Purpose**: Logs test metrics (7,053–18,215 glyphs/sec, 0.0065–0.0192 W).
    - **Structure**:
      ```json
      {"timestamp": "2025-05-12T00:00:00Z", "throughput": "7053–18215 glyphs/sec", "power": "0.0065–0.0192 W"}
      ```
    - **Status**: Generated, used in Wave 1 validation.
    - **Usage**: Analyze with `validate_outputs.ps1`.
    - **Source**: `Obelisk_Core_README_v2.markdown`
12. **`test_toggle_contention.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\test_toggle_contention.json`
    - **Purpose**: Logs ToggleConflict test, 0.0156 conflict rate.
    - **Structure**:
      ```json
      {"timestamp": "2025-05-12T00:00:00Z", "test": "ToggleConflict", "conflict_rate": 0.0156}
      ```
    - **Status**: Generated, used in SWG stability tests.
    - **Usage**: Review with `validate_outputs.ps1`.
    - **Source**: `Obelisk_Core_Data_v1.json`
13. **`test_quantum_security.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\test_quantum_security.json`
    - **Purpose**: Logs QuantumSecurityStress test, LII 0.99983, 98% security.
    - **Structure**:
      ```json
      {"timestamp": "2025-05-12T00:00:00Z", "test": "QuantumSecurityStress", "LII": 0.99983, "security": 0.98}
      ```
    - **Status**: Generated, used in security tests.
    - **Usage**: Validate with `obeliskos_glyph_encrypt.ps1`.
    - **Source**: `Obelisk_Core_Data_v1.json`
14. **`test_low_memory.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\test_low_memory.json`
    - **Purpose**: Logs LowMemoryMicroglyph test, 56 MB, 0.0065 W.
    - **Structure**:
      ```json
      {"timestamp": "2025-05-12T00:00:00Z", "test": "LowMemoryMicroglyph", "memory": "56 MB", "power": "0.0065 W"}
      ```
    - **Status**: Generated, used in efficiency tests.
    - **Usage**: Review with `glyph_compressor.py`.
    - **Source**: `Obelisk_Core_Data_v1.json`

### 2.4 Security JSONs
15. **`system_operations.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\system_operations.json`
    - **Purpose**: Logs script consolidation failure (0 scripts, `concatenate_scripts_muxedit.ps1`).
    - **Structure**:
      ```json
      {"timestamp": "2025-05-09T00:00:00Z", "operation": "script_consolidation", "status": "failed", "scripts_processed": 0}
      ```
    - **Status**: Generated, reflects failure.
    - **Usage**: Debug with `concatenate_scripts_muxedit.ps1`.
    - **Source**: `Obelisk_Core_README_v2.markdown`
16. **`dark_star_script_writer_log.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\dark_star_script_writer_log.json`
    - **Purpose**: Logs Dark_Star script writer operations, environment setup failure (`Execute-Command` error).
    - **Structure**:
      ```json
      {"timestamp": "2025-05-08T00:00:00Z", "operation": "script_writer", "status": "failed", "error": "Execute-Command unrecognized"}
      ```
    - **Status**: Generated, reflects failure.
    - **Usage**: Debug with `dark_star_cognition_core.py`.
    - **Source**: `Obelisk_Core_README_v2.markdown`

### 2.5 Inferred JSONs
17. **`grok_log.json`**
    - **Path**: `D:\ObeliskOS\Logs\grok_log.json`
    - **Purpose**: Logs xAI API interactions (`connect_grok.ps1`), capturing latency (~100 ms) and errors (e.g., 429).
    - **Structure**:
      ```json
      {"timestamp": "2025-05-15T00:00:00Z", "operation": "api_call", "latency": 100, "status": "success"}
      ```
    - **Status**: Inferred, pending generation (~1–2 hours).
    - **Usage**:
      ```powershell
      .\connect_grok.ps1
      ```
    - **Source**: Interaction 1
18. **`lsu_cache_log.json`**
    - **Path**: `D:\ObeliskOS\Logs\lsu_cache_log.json`
    - **Purpose**: Logs LSU caching performance (~2–5s load times for **War Thunder**).
    - **Structure**:
      ```json
      {"timestamp": "2025-05-15T00:00:00Z", "operation": "cache", "load_time": 2.5, "status": "success"}
      ```
    - **Status**: Inferred, pending generation (~1–2 hours).
    - **Usage**:
      ```powershell
      .\lsu_cache.ps1
      ```
    - **Source**: Interaction 3
19. **`validation_log.json`**
    - **Path**: `F:\OBELISK-OS\Final Consolidated Folder\Logs\validation_log.json`
    - **Purpose**: Logs Five Rings Validation results (`validate_outputs.ps1`), expected for codex debugging.
    - **Structure**:
      ```json
      {"timestamp": "2025-05-15T00:00:00Z", "operation": "validation", "status": "success", "details": {...}}
      ```
    - **Status**: Inferred, pending generation (~1–2 hours).
    - **Usage**:
      ```powershell
      .\validate_outputs.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`

## 3. Recommendations
- **Generate Pending JSONs**: Run `🜁_clean_agent_log.py` to create `agent_log_clean.jsonl` (~1 hour), test `connect_grok.ps1` for `grok_log.json` (~1–2 hours).
- **Debug Issues**: Address `system_operations.json` failure by fixing `concatenate_scripts_muxedit.ps1` (~2–3 hours).
- **Validate Logs**: Use `validate_outputs.ps1` to generate `validation_log.json` for codex debugging (~1–2 hours).
- **Monitor Size**: Ensure logs remain <10 MB, with `preserve = $true` for critical files (`glyph_error_*.log`).

**—LordDarkHelmet, May 15, 2025**