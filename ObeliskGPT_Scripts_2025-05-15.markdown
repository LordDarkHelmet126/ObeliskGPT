---
title: ObeliskGPT Scripts (Version 1.0)
subtitle: Comprehensive Catalog of Scripts for ObeliskOS Wave 1 Development
author: LordDarkHelmet (Creator of Hybrid Flux_Star Framework)
date: May 15, 2025
version: 1.0
status: Living Document
repository: D:\ObeliskOS
log: D:\ObeliskOS\Logs
---

# ObeliskGPT Scripts (Version 1.0)

**Credit**: The **Hybrid Flux_Star** framework and **Obelisk Symbolic Language (OSL)** are the intellectual property of **LordDarkHelmet**, conceptualized in April 2025. All references acknowledge LordDarkHelmet’s contribution.

## 1. Introduction

This document catalogs all scripts (PowerShell, Python, Bash, C#) from the first 3–4 days of the **ObeliskGPT** development thread (May 14–18, 2025), part of **ObeliskOS**, a symbolic AI operating system hosted at `https://github.com/LordDarkHelmet126/ObeliskGPT`. It details scripts explicitly mentioned, implied, or inferred, supporting **Wave 1** (OSL, LSUs, single AI agent) on the Zephyr testbed (Intel i7-14700F, 32 GB RAM, NVIDIA RTX 4060, Windows 11 24H2, T-FORCE SSD). Scripts are organized by category (Core, Cognitive, Distributed, Security, Visualization, SWG, GlyphEngine, Thirteenth Tablet, Deployment), with purpose, status, and usage instructions, ensuring a seamless handoff post-memory reset.

### 1.1 Purpose
- **Catalog Scripts**: List all scripts, including explicit (Interactions 1–4), implied (Wave 1, documents), and inferred (May 15–17/18).
- **Document Usage**: Provide execution instructions, addressing errors (e.g., `glyph_encrypt.ps1 not recognized`).
- **Support Handoff**: Enable new LLM threads or developers to continue Wave 1 tasks (xAI API testing, LSU caching, issue resolution).
- **Ensure Compliance**: Adhere to ObeliskOS standards (OSL glyphs, **Five Rings Validation**, DPI <0.00001%, UTF-8 BOM).

### 1.2 Scope
- **Timeframe**: May 14–18, 2025, covering 4 interactions (May 14) and inferred activities.
- **Scripts**: ~30 scripts across PowerShell, Python, Bash, C#, supporting Wave 1, xAI API, and gaming.
- **Sources**: `obeliskos_thread_v1.markdown`, `Obelisk_Core_README_v2.markdown`, `Obelisk_Core_Data_v1.json`, `obeliskos_llm_DNA_MARKDOWN TEMPLETE.markdown`.

## 2. Scripts Catalog

### 2.1 Core Scripts
1. **`🜁_test_wave1_minimal.py`**
   - **Path**: `D:\ObeliskOS\Scripts\🜁_test_wave1_minimal.py`
   - **Type**: Python
   - **Purpose**: Tests OSL, LSUs, and `symbol_agent` for Wave 1, versions 1.10–1.12, includes `export_parsed_logs` with glyph-stamped header (🜰🜁🜃).
   - **Status**: Active, version 1.11 deployed, version 1.12 proposed for strict JSON parsing (~4100 bytes).
   - **Usage**:
     ```bash
     cd D:\ObeliskOS\Scripts
     python 🜁_test_wave1_minimal.py --strict --max-lines 14
     ```
   - **Source**: `obeliskos_thread_v1.markdown`
2. **`🜁_symbol_agent.py`**
   - **Path**: `D:\ObeliskOS\Scripts\🜁_symbol_agent.py`
   - **Type**: Python
   - **Purpose**: Implements single AI agent, producing valid JSON (`agent_log.json`, 2464 bytes).
   - **Status**: Active, validated May 13, 19:37 PM (4028 bytes).
   - **Usage**:
     ```bash
     python 🜁_symbol_agent.py
     ```
   - **Source**: `obeliskos_thread_v1.markdown`
3. **`🜁_clean_agent_log.py`**
   - **Path**: `D:\ObeliskOS\Scripts\🜁_clean_agent_log.py`
   - **Type**: Python
   - **Purpose**: Converts `agent_log.json` to pure JSON Lines (`agent_log_clean.jsonl`, ~1200 bytes).
   - **Status**: Created May 13, pending execution (~2000 bytes).
   - **Usage**:
     ```bash
     python 🜁_clean_agent_log.py
     ```
   - **Source**: `obeliskos_thread_v1.markdown`
4. **`runtime_launcher.ps1`**
   - **Path**: `F:\OBELISK-OS\Scripts\runtime_launcher.ps1`
   - **Type**: PowerShell
   - **Purpose**: Initializes lite runtime (100–300 MB) for legacy PCs.
   - **Status**: Functional, used in Wave 1 tests.
   - **Usage**:
     ```powershell
     cd F:\OBELISK-OS\Scripts
     .\runtime_launcher.ps1
     ```
   - **Source**: `Obelisk_Core_README_v2.markdown`
5. **`kernel_core.py`**
   - **Path**: `F:\OBELISK-OS\Scripts\kernel_core.py`
   - **Type**: Python
   - **Purpose**: Initializes system in coexist mode, thread-safe glyph parsing.
   - **Status**: Functional, used in Wave 1.
   - **Usage**:
     ```bash
     python kernel_core.py
     ```
   - **Source**: `Obelisk_Core_Data_v1.json`

### 2.2 Cognitive Scripts
6. **`dark_star_cognition_core.py`**
   - **Path**: `F:\OBELISK-OS\Scripts\dark_star_cognition_core.py`
   - **Type**: Python
   - **Purpose**: Dark_Star core for LLM integration, parses inputs (<40 ms latency).
   - **Status**: Functional, used in SWG feedback.
   - **Usage**:
     ```bash
     python dark_star_cognition_core.py
     ```
   - **Source**: `Obelisk_Core_Data_v1.json`
7. **`glyph_parser.ps1`**
   - **Path**: `D:\ObeliskOS\Scripts\glyph_parser.ps1`
   - **Type**: PowerShell
   - **Purpose**: Parses OSL glyphs, supports `connect_grok.ps1`, not recognized in Interaction 1.
   - **Status**: Provided, untested due to setup issues.
   - **Usage**:
     ```powershell
     .\glyph_parser.ps1
     ```
   - **Source**: Interaction 1
8. **`obeliskos_glyph_parser.ps1`**
   - **Path**: `F:\OBELISK-OS\Scripts\obeliskos_glyph_parser.ps1`
   - **Type**: PowerShell
   - **Purpose**: Parses OSL glyphs with SQLite queries, <1 ms latency.
   - **Status**: Validated in Wave 1 tests.
   - **Usage**:
     ```powershell
     .\obeliskos_glyph_parser.ps1
     ```
   - **Source**: `Obelisk_Core_README_v2.markdown`
9. **`vespa.py`**
   - **Path**: `F:\OBELISK-OS\Scripts\vespa.py`
   - **Type**: Python
   - **Purpose**: Supports AI agents and translator codex, <0.5 ms latency target.
   - **Status**: Functional, used in Wave 1.
   - **Usage**:
     ```bash
     python vespa.py
     ```
   - **Source**: `Obelisk_Core_Data_v1.json`

### 2.3 Distributed Scripts
10. **`obeliskos_multinode_expander_v2.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\obeliskos_multinode_expander_v2.ps1`
    - **Type**: PowerShell
    - **Purpose**: Shards tasks across nodes, 1–5 ms P2P sync latency.
    - **Status**: Functional, planned for scalability tests.
    - **Usage**:
      ```powershell
      .\obeliskos_multinode_expander_v2.ps1
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`
11. **`glyph_mesh_pipeline.py`**
    - **Path**: `F:\OBELISK-OS\Scripts\glyph_mesh_pipeline.py`
    - **Type**: Python
    - **Purpose**: Distributes tasks across mesh nodes, supports 150,000+ nodes.
    - **Status**: Functional, planned for testing.
    - **Usage**:
      ```bash
      python glyph_mesh_pipeline.py
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`

### 2.4 Security Scripts
12. **`glyph_encrypt.ps1`**
    - **Path**: `D:\ObeliskOS\Scripts\glyph_encrypt.ps1`
    - **Type**: PowerShell
    - **Purpose**: Encrypts data with AES-256, Dilithium, Kyber512, 50 ms latency. Not recognized in Interaction 1.
    - **Status**: Provided, untested due to setup issues.
    - **Usage**:
      ```powershell
      .\glyph_encrypt.ps1
      ```
    - **Source**: Interaction 1
13. **`obeliskos_glyph_encrypt.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\obeliskos_glyph_encrypt.ps1`
    - **Type**: PowerShell
    - **Purpose**: Encrypts data, supports glyph-only output, 50 ms latency.
    - **Status**: Functional, used in Wave 1 security tests.
    - **Usage**:
      ```powershell
      .\obeliskos_glyph_encrypt.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
14. **`symbol_codexlineage.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\symbol_codexlineage.ps1`
    - **Type**: PowerShell
    - **Purpose**: Tracks lineage, LII >0.99983.
    - **Status**: Functional, used in Wave 1.
    - **Usage**:
      ```powershell
      .\symbol_codexlineage.ps1
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`
15. **`glyph_access.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\glyph_access.ps1`
    - **Type**: PowerShell
    - **Purpose**: Manages filesystem access for security, supports glyph embedding.
    - **Status**: Functional, planned for IoT enhancements.
    - **Usage**:
      ```powershell
      .\glyph_access.ps1
      ```
    - **Source**: `ObeliskOS_Glyph_Embedding_Options_v1.markdown`

### 2.5 Visualization Scripts
16. **`ui_server.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\ui_server.ps1`
    - **Type**: PowerShell
    - **Purpose**: Web server for real-time metrics, <2.8 ms latency.
    - **Status**: Functional, used in SWG visualization.
    - **Usage**:
      ```powershell
      .\ui_server.ps1
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`
17. **`scroll_map_overlay.py`**
    - **Path**: `F:\OBELISK-OS\Scripts\scroll_map_overlay.py`
    - **Type**: Python
    - **Purpose**: Generates visualizations for reports.
    - **Status**: Functional, used in SWG and drone telemetry.
    - **Usage**:
      ```bash
      python scroll_map_overlay.py
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`

### 2.6 SWG Module Scripts
18. **`fluxstar_brain.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\fluxstar_brain.ps1`
    - **Type**: PowerShell
    - **Purpose**: SWG narrative scripting, 97% coherence, <10 ms latency.
    - **Status**: Functional, used in SWG tests.
    - **Usage**:
      ```powershell
      .\fluxstar_brain.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
19. **`glyph_executor.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\glyph_executor.ps1`
    - **Type**: PowerShell
    - **Purpose**: Executes NPC behaviors, 99% accuracy, <3 ms latency.
    - **Status**: Functional, used in SWG.
    - **Usage**:
      ```powershell
      .\glyph_executor.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
20. **`llm_server.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\llm_server.ps1`
    - **Type**: PowerShell
    - **Purpose**: Inference server for SWG, supports test case generation.
    - **Status**: Functional, used in SWG feedback.
    - **Usage**:
      ```powershell
      .\llm_server.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`

### 2.7 GlyphEngine Suite Scripts
21. **`glyph_codex_init.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\glyph_codex_init.ps1`
    - **Type**: PowerShell
    - **Purpose**: Initializes 33-glyph codex, fails due to `Parameters` error.
    - **Status**: Failing, requires debugging (~2–4 hours).
    - **Usage**:
      ```powershell
      .\glyph_codex_init.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
22. **`Initialize-GlyphCodex.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\Initialize-GlyphCodex.ps1`
    - **Type**: PowerShell
    - **Purpose**: Initializes codex, reported failures.
    - **Status**: Failing, requires debugging (~2–4 hours).
    - **Usage**:
      ```powershell
      .\Initialize-GlyphCodex.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
23. **`Validate-GlyphCodex.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\Validate-GlyphCodex.ps1`
    - **Type**: PowerShell
    - **Purpose**: Validates codex (33 glyphs expected).
    - **Status**: Functional, used in codex validation.
    - **Usage**:
      ```powershell
      .\Validate-GlyphCodex.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
24. **`Get-GlyphStatus.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\Get-GlyphStatus.ps1`
    - **Type**: PowerShell
    - **Purpose**: Retrieves codex status, <1 ms query latency.
    - **Status**: Functional, used in monitoring.
    - **Usage**:
      ```powershell
      .\Get-GlyphStatus.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
25. **`Invoke-GlyphCodexTest.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\Invoke-GlyphCodexTest.ps1`
    - **Type**: PowerShell
    - **Purpose**: Tests codex, empty placeholder.
    - **Status**: Empty, requires implementation (~5–10 hours).
    - **Usage**:
      ```powershell
      .\Invoke-GlyphCodexTest.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
26. **`Deobfuscate-GlyphLog.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\Deobfuscate-GlyphLog.ps1`
    - **Type**: PowerShell
    - **Purpose**: Deobfuscates glyph logs, placeholder.
    - **Status**: Empty, requires implementation (~2–3 hours).
    - **Usage**:
      ```powershell
      .\Deobfuscate-GlyphLog.ps1
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`

### 2.8 Thirteenth Tablet Scripts
27. **`keymaster.py`**
    - **Path**: `F:\OBELISK-OS\Scripts\keymaster.py`
    - **Type**: Python
    - **Purpose**: Proposes glyphs for 64-glyph Thirteenth Tablet, supports humor mappings.
    - **Status**: Functional, partially documented.
    - **Usage**:
      ```bash
      python keymaster.py
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`
28. **`scroll_parser.py`**
    - **Path**: `F:\OBELISK-OS\Scripts\scroll_parser.py`
    - **Type**: Python
    - **Purpose**: Parses scroll files, proposes glyphs.
    - **Status**: Functional, partially documented.
    - **Usage**:
      ```bash
      python scroll_parser.py
      ```
    - **Source**: `Obelisk_Core_README_v2.markdown`

### 2.9 Deployment Scripts
29. **`setup_container.sh`**
    - **Path**: `F:\OBELISK-OS\Scripts\setup_container.sh`
    - **Type**: Bash
    - **Purpose**: Sets up Docker container for full runtime (641 MB).
    - **Status**: Functional, planned for scalability tests.
    - **Usage**:
      ```bash
      ./setup_container.sh
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`
30. **`backup_codex.sh`**
    - **Path**: `F:\OBELISK-OS\Scripts\backup_codex.sh`
    - **Type**: Bash
    - **Purpose**: Backs up critical files, supports Thirteenth Tablet.
    - **Status**: Functional, used in Wave 1.
    - **Usage**:
      ```bash
      ./backup_codex.sh
      ```
    - **Source**: `Obelisk_Core_Data_v1.json`

### 2.10 Inferred Scripts
31. **`lsu_cache.ps1`**
    - **Path**: `F:\OBELISK-OS\Scripts\lsu_cache.ps1`
    - **Type**: PowerShell
    - **Purpose**: Caches game assets (341–1000 LSUs, ~2–5s load times), inferred for gaming on Zephyr testbed.
    - **Status**: In development, not implemented (~2–3 hours).
    - **Usage**:
      ```powershell
      .\lsu_cache.ps1
      ```
    - **Source**: Interaction 3, `Obelisk_Core_README_v2.markdown`

## 3. Recommendations
- **Save Scripts**: Store all scripts in `D:\ObeliskOS\Scripts` using VS Code to resolve recognition errors (~1 hour).
- **Test xAI API**: Run `connect_grok.ps1`, troubleshoot 429 errors at https://console.x.ai (~1–2 hours).
- **Debug Issues**: Fix `glyph_codex_init.ps1` (`Parameters` error, ~2–4 hours), implement `Invoke-GlyphCodexTest.ps1` (~5–10 hours).
- **Develop Caching**: Draft and test `lsu_cache.ps1` with **War Thunder** (~5–10 hours).
- **Validate Environment**: Ensure PowerShell 7.5.1, Python 3.x, Git Bash compatibility (~1–2 hours):
  ```powershell
  Get-Module -ListAvailable
  python --version
  ```

**—LordDarkHelmet, May 15, 2025**