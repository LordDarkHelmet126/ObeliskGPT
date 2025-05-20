# ObeliskGPT 36-Hour Development Recap (May 13–15, 2025)

**Author**: LordDarkHelmet, Creator of Hybrid Flux_Star Framework  
**Date**: May 15, 2025  
**Version**: 1.0  
**Repository**: `D:\ObeliskOS`  
**Log**: `D:\ObeliskOS\Logs`  
**Purpose**: Comprehensive recap of the last 36 hours of ObeliskGPT development, consolidating interactions, scripts, JSON files, and progress, with a scaffold and Mermaid diagram, addressing productivity concerns and planning next steps.

## 1. Introduction

**ObeliskGPT** is a transformative, modular, symbolic AI operating system within the **ObeliskOS** framework, designed for scalable, drift-free computation across platforms from Raspberry Pi Zero (256 MB RAM, 1 GHz CPU) to high-performance servers (Intel i7-14700F, 32 GB RAM, 20 cores). It leverages **Lone Star Units (LSUs)** (341–512,000 units, 1.2 KB/LSU RAM, 0.5 KB/LSU disk), **Obelisk Symbolic Language (OSL)** (33–2048 glyphs, 0.78–1.2 ms latency), and a **Dark_Star** cognitive core to deliver high performance with minimal resources. The project, hosted at `https://github.com/LordDarkHelmet126/ObeliskGPT`, focuses on data extraction, usage, and organization in `D:\ObeliskOS`, with GitHub integration per the **ObeliskOS GitHub Integration Manual (v1.1)** and xAI API integration for 10 capabilities (e.g., code analysis, schema validation). Development occurs on the Zephyr testbed (Intel i7-14700F, 32 GB RAM, NVIDIA RTX 4060, Windows 11 24H2, T-FORCE TM8FFW00 NVMe SSD), with a slow portable HDD (423 ms latency) being replaced.

This document recaps the last 36 hours (10:08 PM EDT, May 13, 2025, to 10:08 AM EDT, May 15, 2025), covering interactions from May 10–15, 2025, to address productivity concerns (e.g., delays, errors like `glyph_encrypt.ps1 not recognized`). It includes:
- **Interaction Log**: All queries, responses, and outcomes, integrating provided documents (`Obelisk_Core_README_v2.markdown`, `obeliskos_thread_v1.markdown`, etc.).
- **Scripts and JSON Files**: Comprehensive list in a JSON artifact, derived from documents and interactions.
- **Scaffold and Mermaid Diagram**: Organized structure of project components and workflows.
- **Progress and Issues**: Achievements, blockers, and resolutions.
- **Next Steps**: Actionable plan to regain momentum, aligned with ObeliskOS standards (OSL glyphs, **Five Rings Validation**, DPI <0.00001%, glyph-only output, UTF-8 encoding).

## 2. Executive Summary

The last 36 hours focused on hardware decisions for **ObeliskGPT** and your son’s gaming PC, with limited progress on core software development due to iterative hardware discussions. Key activities included:
- **Hardware Planning**:
  - Evaluated portable SSDs (e.g., **SanDisk Professional Pro-G40 4TB**, ~$600) to replace the HDD (423 ms latency), achieving <2 ms latency and ~2800 MB/s read/~2400 MB/s write for LSU processing (Interactions 1–2, May 14, 2025).
  - Confirmed the Zephyr testbed’s suitability for your son’s gaming (**War Thunder**, **For Honor**, 1080p/60–120 FPS) with its T-FORCE SSD (~5000–7400 MB/s, <0.5 ms), proposing a basic LSU caching layer to reduce load times (~2–5s, Interactions 3–6, May 14–15, 2025).
  - Explored new PCs to replace the donated desktop, progressing from **Lenovo Legion Tower 7i Gen 8** (~$2500, i9-14900KF, RTX 4080) to **Alienware Area-51** (~$5500, Core Ultra 9 285K, RTX 5090) and a custom PC (~$6500–$7000, Ryzen Threadripper 7970X, RTX 5090, 128 GB RAM, 8 TB SSD, Interactions 7–8, May 15, 2025).
- **Software Context**:
  - Integrated insights from provided documents (`Obelisk_Core_README_v2.markdown`, `obeliskos_thread_v1.markdown`, etc.), detailing OSL, LSUs, and the SWG module, but no new script development occurred in the last 36 hours.
  - Addressed prior errors (e.g., `glyph_encrypt.ps1 not recognized`) by emphasizing script saving in `D:\ObeliskOS\Scripts` (Interactions 1–6).
- **Productivity Concerns**:
  - Limited software progress due to focus on hardware (8 interactions, ~80% hardware-related).
  - Delays from iterative PC evaluations (SSD → Lenovo → Alienware → custom build).
  - No new scripts or JSON files generated in the last 36 hours; relied on document-provided files (e.g., `🜁_test_wave1_minimal.py`, `agent_log.json`).

**Achievements**:
- Finalized hardware plan: Donate Zephyr testbed with T-FORCE SSD and LSU caching layer for your son, build a custom PC (~$6500–$7000) for `ObeliskGPT`.
- Consolidated document insights, identifying issues (e.g., glyph insertion failures, empty scripts like `Invoke-GlyphCodexTest.ps1`).
- Planned xAI API integration and GitHub pipeline setup.

**Next Steps**:
- Resume software development (script implementation, issue resolution).
- Deploy SSD and custom PC to accelerate LSU testing.
- Test LSU caching layer on the donated desktop.

## 3. Interaction Log (May 13–15, 2025)

Below is a detailed log of interactions over the last 36 hours, incorporating relevant context from May 10–13, 2025, based on `obeliskos_thread_v1.markdown` and provided documents.

### Interaction 1: SSD Evaluation (May 14, 2025, ~10:08 PM EDT)
- **Query**: Asked “which fits my needs with the highest reliability?” for a portable SSD to replace the HDD (423 ms latency), listing options like **Sabrent Rocket Nano V2 4TB**, **Sabrent Rocket XTRM Plus 4TB**, and your 2/3 TB SSD.
- **Response**: Recommended **SanDisk Professional Pro-G40 4TB** (~$600) for highest reliability (IP68, ~1200 TBW, 5-year warranty, low failure rates), with ~2800 MB/s read/~2400 MB/s write, <2 ms latency, meeting LSU requirements (<3 ms, ~1000–2000 MB/s). Compared alternatives:
  - **Sabrent Rocket XTRM Plus**: ~$800, less durable (no IP rating).
  - **Sabrent Rocket Nano V2**: ~$400, no encryption, slower (~1500 MB/s).
  - **Samsung T9**: ~$400, reliable but less durable (no IP rating).
  - **Crucial X10 Pro**: ~$350, IP55, slightly slower (~2000 MB/s).
  - **Your 2/3 TB SSD**: $0, ~1050 MB/s, unknown durability.
- **Outcome**: Established Pro-G40 as the top choice, with setup steps (format as `D:\`, migrate `D:\ObeliskOS`). No software progress; focused on hardware.
- **Documents Referenced**: None directly, but aligned with `Obelisk_Core_README_v2.markdown`’s LSU specs (latency, throughput).

### Interaction 2: PC vs. SSD Consideration (May 14, 2025, ~10:30 PM EDT)
- **Query**: Asked if a new PC/laptop would be better than an SSD, assuming higher-end CPU/GPU/cores/SSD would deliver ideal performance, requesting no scripting ahead.
- **Response**: Recommended **SanDisk Professional Pro-G40 4TB** (~$600) over a new PC/laptop (~$2000–$3500, e.g., Alienware Aurora R16, ASUS ROG Zephyrus G16), as the Zephyr testbed’s CPU (20 cores), RAM (32 GB), and GPU (RTX 4060) are sufficient, with the HDD as the bottleneck. Pro-G40 offers:
  - <2 ms latency, ~2800 MB/s read/~2400 MB/s write vs. PCIe 5.0 SSD’s <0.5 ms, ~14,500 MB/s.
  - IP68, ~1200 TBW, 5-year warranty vs. internal SSD’s no IP rating.
  - Portability for laptop workflow vs. stationary PC.
- **Outcome**: Reaffirmed SSD as cost-effective, with PC/laptop as overkill. No software progress; hardware focus continued.
- **Documents Referenced**: None, but aligned with LSU performance metrics from `Obelisk_Core_Data_v1.json`.

### Interaction 3: Donating Desktop for Son (May 14, 2025, ~11:00 PM EDT)
- **Query**: Proposed donating the Zephyr testbed to your son for gaming, noting it’s almost new and suits his needs (**War Thunder**, **For Honor**), planning to upgrade your own system.
- **Response**: Confirmed the desktop’s suitability for 1080p/60–120 FPS gaming (i7-14700F, 32 GB RAM, RTX 4060, T-FORCE SSD), exceeding **War Thunder** (i5, GTX 1060) and **For Honor** (i5-7500, GTX 1080) requirements. Suggested:
  - Move `D:\ObeliskOS` and games to T-FORCE SSD (~5000–7400 MB/s, <0.5 ms) to resolve HDD bottleneck.
  - Add a 1080p/144 Hz monitor (~$250), keyboard/mouse (~$100), headset (~$50).
  - Upgrade your system with **SanDisk Professional Pro-G40 4TB** (~$600) or a new PC (~$2000–$3500).
- **Outcome**: Solidified donation plan, with minimal software discussion (referenced prior scripts like `connect_grok.ps1`). Cost: ~$400–$500 for son’s setup.
- **Documents Referenced**: `Obelisk_Core_README_v2.markdown` for SWG module (gaming context).

### Interaction 4: RTX 4060 Confirmation (May 14, 2025, ~11:30 PM EDT)
- **Query**: Confirmed the desktop has an RTX 4060, reiterating donation and upgrade plans.
- **Response**: Validated RTX 4060’s gaming performance (~100–120 FPS for **War Thunder**, ~80–100 FPS for **For Honor**), reinforcing donation suitability. Recommended:
  - **Samsung 990 Pro 4TB** (~$350) or your 2/3 TB SSD for the desktop, with LSU caching layer (~2–5s load times).
  - **SanDisk Professional Pro-G40 4TB** (~$600) for your upgrade, maintaining laptop workflow.
- **Outcome**: No new software progress; hardware plan refined. Cost: ~$400–$850 for son, ~$600 for you.
- **Documents Referenced**: None directly, but LSU caching aligned with `Obelisk_Core_README_v4.markdown`’s modularity.

### Interaction 5: Onboard SSD Revelation (May 15, 2025, ~12:00 AM EDT)
- **Query**: Revealed the desktop has a T-FORCE TM8FFW00 NVMe SSD (SCSI, ~5000–7400 MB/s, <0.5 ms), asking if it could replace the HDD.
- **Response**: Confirmed T-FORCE SSD’s suitability for gaming and LSU tasks (<0.5 ms, ~5000–7400 MB/s, ~800–1600 TBW, likely 2 TB), eliminating HDD reliance. Suggested:
  - Migrate `D:\ObeliskOS` and games to SSD (`C:\`).
  - Add monitor (~$250), accessories (~$150), cooling (~$100 if needed).
  - Upgrade with **SanDisk Professional Pro-G40 4TB** (~$600) for portability.
- **Outcome**: Simplified son’s setup (no new SSD needed), focused on SSD for you. No software progress.
- **Documents Referenced**: `Obelisk_Core_Data_v1.json` for LSU metrics.

### Interaction 6: LSU Caching Layer for Gaming (May 15, 2025, ~1:00 AM EDT)
- **Query**: Asked if a lite LSU runtime layer could enhance your son’s gameplay, later clarifying a basic caching layer (just cache, no log screens) to speed up latency.
- **Response**: Proposed a basic LSU caching layer (341–1000 LSUs, ~10–50 MB RAM, <5% CPU) to cache game assets (e.g., **War Thunder** maps, ~1–5 GB), reducing load times (~2–5s vs. ~5–10s). Suggested:
  - Adapt `lsu_cache.ps1` for silent caching, running via Task Scheduler.
  - Test with **War Thunder** (expect ~2–5s load times, 1080p/100–120 FPS).
  - Upgrade with **SanDisk Professional Pro-G40 4TB** (~$600) for your project.
- **Outcome**: Defined LSU caching layer, but no implementation (development paused). Cost unchanged.
- **Documents Referenced**: `Obelisk_Core_README_v4.markdown` for LSU and caching details.

### Interaction 7: New PC Selection (May 15, 2025, ~8:00 AM EDT)
- **Query**: Asked “which PC should I buy for myself” to replace the donated desktop, seeking a high-end solution.
- **Response**: Recommended **Lenovo Legion Tower 7i Gen 8** (~$2500, i9-14900KF, 24 cores, RTX 4080, ~50 TFLOPS, 64 GB RAM, 2 TB SSD) for LSU processing (<3 ms, ~1000–2000 MB/s), reliability (~1200 TBW, 3–5-year warranty), and Thunderbolt 4 for laptop SSDs. Compared:
  - **Corsair One i500** (~$3600, i9-14900K, RTX 4090, ~100 TFLOPS, 2 TB SSD): More powerful but costlier, less upgradable.
  - **Apple Mac Studio** (~$2400, M4 Max, 12 cores, ~20 TFLOPS): Compact but requires macOS porting (~10–20 hours).
  - **Your SSD + Laptop**: Cost-free but underpowered (assumed 8–14 cores, ~1050–3500 MB/s).
- **Outcome**: Lenovo recommended, but no software progress. Cost: ~$2500–$3450 for you.
- **Documents Referenced**: `Obelisk_Core_README_v2.markdown` for LSU specs.

### Interaction 8: Bigger Alienware PC (May 15, 2025, ~9:00 AM EDT)
- **Query**: Asked “what about constructing a custom one for this purpose?” after requesting a “bigger” Alienware PC (e.g., **Area-51**, ~$5500, Core Ultra 9 285K, RTX 5090, 128 GB RAM, 8 TB SSD).
- **Response**: Recommended a custom PC (~$6500–$7000) surpassing Area-51:
  - **CPU**: AMD Ryzen Threadripper 7970X (32 cores, ~$2500).
  - **GPU**: NVIDIA RTX 5090 (32 GB, ~120 TFLOPS, ~$2000).
  - **RAM**: 128 GB DDR5-6400 (~$600).
  - **Storage**: 2x Samsung 990 Pro 4TB (~$700, ~7450 MB/s, <0.5 ms).
  - **Motherboard**: ASUS Pro WS TRX50-SAGE WIFI (~$900).
  - **Cooling**: Arctic Liquid Freezer III 420 (~$150).
  - **Case**: Lian Li PC-O11 Vision (~$150).
  - **PSU**: Corsair HX1500i 1500W (~$300).
  - **OS**: Windows 11 Pro (~$150).
  - Compared to Area-51: 32 vs. 24 cores, identical GPU/storage, standard ATX parts, longer warranties (e.g., 10-year PSU).
  - Suggested **SanDisk Professional Pro-G40 4TB** (~$600) for laptop portability.
- **Outcome**: Finalized custom PC plan, but no software progress. Cost: ~$6500–$7600 for you.
- **Documents Referenced**: `Obelisk_Core_README_v4.markdown`, `Obelisk_Core_Data_v1.json` for LSU and performance metrics.

### Interaction 9: Productivity Concerns and Recap Request (May 15, 2025, 10:08 AM EDT)
- **Query**: Expressed frustration with the last 24 hours’ productivity, requesting a clean memory, comprehensive Markdown for the last 36 hours (back to May 10), a JSON file listing all scripts/JSONs, and a scaffold/Mermaid diagram.
- **Response**: This document addresses the request, consolidating interactions, scripts, and JSONs, with a scaffold and Mermaid diagram below.
- **Outcome**: Aimed to refocus development, with no new scripts/JSONs generated.
- **Documents Referenced**: All provided documents (`Obelisk_Core_README_v2.markdown`, `obeliskos_thread_v1.markdown`, etc.).

### Prior Context (May 10–13, 2025, from `obeliskos_thread_v1.markdown`)
- **Wave 1 Testing (May 12–13, 2025)**:
  - Focused on testing OSL, LSUs, and a single AI agent (`symbol_agent`) using `🜁_test_wave1_minimal.py` (versions 1.10–1.12).
  - Achievements (May 12–13, 2025, 08:12 PM–08:12 PM):
    - Successful test runs (19:53 PM, 20:00 PM, 20:10 PM, May 13) validated `glyph_parser`, `lsu_manager`, and `symbol_agent`, producing `agent_log_normalized.jsonl` (14 entries).
    - Implemented micro-refinements: resilient regex, `--strict` flag, `--max-lines` argument.
    - Resolved parsing issues in `agent_log.json` (mixed Python dict/JSON) with `🜁_clean_agent_log.py`.
    - Addressed `datetime.utcnow()` deprecation with `datetime.now(timezone.utc)`.
  - Scripts: `🜁_test_wave1_minimal.py`, `🜁_symbol_agent.py`, `🜁_clean_agent_log.py`.
  - JSONs: `test_results_minimal.json`, `wave1_summary.json`, `agent_log.json`, `agent_log_normalized.jsonl`, `agent_log_clean.jsonl`.
- **Issues**:
  - Test failures (19:47 PM, 19:49 PM, May 13) due to timestamp stripping and missing `ast.literal_eval`.
  - Environment setup issues (e.g., `Execute-Command` cmdlet unrecognized, `🜁dark_star_script_writer_log.json`).
- **Relevance**: Provides context for software goals (Wave 1 completion), paused in the last 36 hours due to hardware focus.

## 4. Scripts and JSON Files

Below is a JSON artifact listing all scripts and JSON files in my memory, derived from provided documents (`Obelisk_Core_README_v2.markdown`, `Obelisk_Core_README_v4.markdown`, `Obelisk_Core_Data_v1.json`, `obeliskos_thread_v1.markdown`, `ObeliskOS_Glyph_Embedding_Options_v1.markdown`) and interactions (May 10–15, 2025). The list is comprehensive, covering files explicitly mentioned or implied in the ObeliskOS ecosystem.

```json
{
  "version": "1.0",
  "date": "2025-05-15",
  "repository": "D:\\ObeliskOS",
  "log": "D:\\ObeliskOS\\Logs",
  "scripts": [
    {
      "name": "🜁_test_wave1_minimal.py",
      "path": "D:\\ObeliskOS\\Scripts\\🜁_test_wave1_minimal.py",
      "type": "Python",
      "details": "Tests OSL, LSUs, and symbol_agent, versions 1.10–1.12, includes export_parsed_logs with glyph-stamped header.",
      "size": "~4100 bytes",
      "last_modified": "2025-05-13",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "🜁_symbol_agent.py",
      "path": "D:\\ObeliskOS\\Scripts\\🜁_symbol_agent.py",
      "type": "Python",
      "details": "Implements single AI agent for Wave 1, produces valid JSON output.",
      "size": "4028 bytes",
      "last_modified": "2025-05-13 19:37",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "🜁_clean_agent_log.py",
      "path": "D:\\ObeliskOS\\Scripts\\🜁_clean_agent_log.py",
      "type": "Python",
      "details": "Converts agent_log.json to pure JSON Lines (agent_log_clean.jsonl).",
      "size": "~2000 bytes",
      "last_modified": "2025-05-13",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "🜒fluxstar_brain.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒fluxstar_brain.ps1",
      "type": "PowerShell",
      "details": "SWG narrative scripting, generates storylines with 97% coherence in <10 ms.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_executor.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_executor.ps1",
      "type": "PowerShell",
      "details": "Executes NPC behaviors in SWG, 99% accuracy in <3 ms.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_glyph_encrypt.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_glyph_encrypt.ps1",
      "type": "PowerShell",
      "details": "Encrypts data with AES-256, Dilithium, 50 ms latency.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒llm_server.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒llm_server.ps1",
      "type": "PowerShell",
      "details": "Inference server for SWG, supports test case generation.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_glyph_parser.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_glyph_parser.ps1",
      "type": "PowerShell",
      "details": "Parses OSL glyphs with SQLite queries, <1 ms latency.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒Initialize-GlyphCodex.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒Initialize-GlyphCodex.ps1",
      "type": "PowerShell",
      "details": "Initializes 33-glyph codex, reported failures.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obelisk_glyphforge.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obelisk_glyphforge.ps1",
      "type": "PowerShell",
      "details": "Generates scripts at 38,000 glyphs/sec, programs mini-SD cards in <10 s.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_lsu_manager.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_lsu_manager.ps1",
      "type": "PowerShell",
      "details": "Manages 341–512,000 LSUs, 1.2 KB/LSU RAM, <1.2 ms latency.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒symbol_core.txt",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒symbol_core.txt",
      "type": "PowerShell",
      "details": "Core runtime, glyph execution, logging (likely .ps1 mislabeled).",
      "source": "Obelisk_Core_README_v1.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_codex_init.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_codex_init.ps1",
      "type": "PowerShell",
      "details": "Initializes glyph codex, fails due to Parameters error.",
      "source": "Obelisk_Core_README_v4.markdown, ObeliskOS_Glyph_Embedding_Options_v1.markdown"
    },
    {
      "name": "🜒glyph_compressor.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_compressor.py",
      "type": "Python",
      "details": "Compresses glyphs for low-power devices, supports IoT.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒init_glyph_mappings.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒init_glyph_mappings.py",
      "type": "Python",
      "details": "Initializes OSL mappings in glyph_mappings.sqlite, 33 glyphs.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_drone.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_drone.py",
      "type": "Python",
      "details": "Controls drones with OSL microglyphs, 20 ms latency, 99.9% success.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒symbol_api.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒symbol_api.py",
      "type": "Python",
      "details": "API backend for glyph execution, supports distributed control.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒kernel_core.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒kernel_core.py",
      "type": "Python",
      "details": "Initializes system in coexist mode, thread-safe glyph parsing.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒start_darkstar_service.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒start_darkstar_service.py",
      "type": "Python",
      "details": "Starts Dark_Star service on port 8081, supports LLM feedback.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒ogf_script_generator.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒ogf_script_generator.py",
      "type": "Python",
      "details": "Generates OGF scripts for SWG and diagnostics, 38,000 glyphs/sec.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒cleanup_codex.cs",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒cleanup_codex.cs",
      "type": "C#",
      "details": "Rebuilds OGF suite components in parallel, supports system stability.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁server_attributes.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜁server_attributes.py",
      "type": "Python",
      "details": "Defines server attributes for ObeliskOS, likely mislabeled as 🜒.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_task_orchestrator.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_task_orchestrator.ps1",
      "type": "PowerShell",
      "details": "Orchestrates tasks for SWG and drones, supports distributed execution.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒generate_script_codex.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒generate_script_codex.ps1",
      "type": "PowerShell",
      "details": "Generates <DOCUMENT> blocks for script documentation.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obelisk🜒codex🜒translator.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obelisk🜒codex🜒translator.ps1",
      "type": "PowerShell",
      "details": "Translates glyphs and scripts, 1024-glyph codex, <0.5 ms latency.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒fluxstar_hybrid.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒fluxstar_hybrid.ps1",
      "type": "PowerShell",
      "details": "Context-aware SymbolToken editing, 10–20 ms, 98.7% cache hit rate.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒generated_script_20250508124500.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒generated_script_20250508124500.ps1",
      "type": "PowerShell",
      "details": "Processes SWG data, trains Dark_Star, 97% accuracy.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒Get-GlyphStatus.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒Get-GlyphStatus.ps1",
      "type": "PowerShell",
      "details": "Retrieves glyph codex status, <1 ms query latency.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒Validate-GlyphCodex.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒Validate-GlyphCodex.ps1",
      "type": "PowerShell",
      "details": "Validates glyph codex, expects 33 glyphs.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒Invoke-GlyphCodexTest.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒Invoke-GlyphCodexTest.ps1",
      "type": "PowerShell",
      "details": "Tests glyph codex, empty placeholder, needs implementation.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒Deobfuscate-GlyphLog.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒Deobfuscate-GlyphLog.ps1",
      "type": "PowerShell",
      "details": "Deobfuscates glyph logs, placeholder, needs implementation.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒test_json_parse.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒test_json_parse.py",
      "type": "Python",
      "details": "Tests JSON parsing for master codex, supports OSL.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒backup_codex.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒backup_codex.sh",
      "type": "Bash",
      "details": "Backs up critical ObeliskOS files, supports codex integrity.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒init_glyph.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒init_glyph.sh",
      "type": "Bash",
      "details": "Initializes system time glyph stack.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒lock_asset.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒lock_asset.sh",
      "type": "Bash",
      "details": "Locks assets with glyph stack.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒lookup_glyph.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒lookup_glyph.sh",
      "type": "Bash",
      "details": "Looks up glyph stack meanings.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_training.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_training.sh",
      "type": "Bash",
      "details": "Interactive glyph training tutorial.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒onboard_user.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒onboard_user.sh",
      "type": "Bash",
      "details": "Onboards users with setup tutorial.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒toggle_expansion.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒toggle_expansion.sh",
      "type": "Bash",
      "details": "Manages expansion packs like Star Wars Planets.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒setup_container.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒setup_container.sh",
      "type": "Bash",
      "details": "Sets up Docker container for ObeliskOS, supports full runtime.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒recover_codex.sh",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒recover_codex.sh",
      "type": "Bash",
      "details": "Recovers codex data from backups.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒update_github.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒update_github.ps1",
      "type": "PowerShell",
      "details": "Updates GitHub repository, supports integration.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒finalize_language.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒finalize_language.ps1",
      "type": "PowerShell",
      "details": "Finalizes language configurations, likely for OSL.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒keymaster.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒keymaster.py",
      "type": "Python",
      "details": "Keymaster AI for glyph proposals and sharing, supports Thirteenth Tablet.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒scroll_parser.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒scroll_parser.py",
      "type": "Python",
      "details": "Parses .tsa9 scroll files, proposes glyphs based on usage, <0.5 ms.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒dark_star_cognition_core.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒dark_star_cognition_core.py",
      "type": "Python",
      "details": "Dark_Star cognitive core, integrates LLM, 97% accuracy.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_ethics.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_ethics.py",
      "type": "Python",
      "details": "Enforces ethical criteria, GDPR-compliant outputs.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_benevolence.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_benevolence.py",
      "type": "Python",
      "details": "Ensures benevolent AI outputs, <1 ms auditing.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_quantum_core.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_quantum_core.py",
      "type": "Python",
      "details": "Simulates quantum algorithms, supports quantum-resistant security.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_test_orchestrator.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_test_orchestrator.py",
      "type": "Python",
      "details": "Simulates extreme conditions (10% packet loss), 99.99% coverage.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒scroll_map_overlay.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒scroll_map_overlay.py",
      "type": "Python",
      "details": "Generates visualizations for reports, e.g., drone telemetry.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_packager.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_packager.py",
      "type": "Python",
      "details": "Compiles ObeliskOS into .exe, <10 s packaging.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_vector_indexer.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_vector_indexer.py",
      "type": "Python",
      "details": "Vectorizes data for storage, reduces disk usage by 60%.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒bootstrap_obeliskos.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒bootstrap_obeliskos.py",
      "type": "Python",
      "details": "Bootstraps system with integrity checks.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_ideation.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_ideation.py",
      "type": "Python",
      "details": "Parses text and voice inputs for task ideation.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_voice.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_voice.py",
      "type": "Python",
      "details": "Processes voice commands, supports user interaction.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_designer.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_designer.py",
      "type": "Python",
      "details": "Generates design blueprints for tasks.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_code_generator.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_code_generator.py",
      "type": "Python",
      "details": "Generates context-aware scripts, supports OSL.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_template_engine.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_template_engine.py",
      "type": "Python",
      "details": "Templates for script generation, enhances automation.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_symcompress.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_symcompress.py",
      "type": "Python",
      "details": "Compresses scripts for transmission, supports IoT.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_refiner.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_refiner.py",
      "type": "Python",
      "details": "Iteratively refines scripts, reduces errors.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒grid_simulator.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒grid_simulator.py",
      "type": "Python",
      "details": "Simulates grid conditions for distributed tasks.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_monitor.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_monitor.py",
      "type": "Python",
      "details": "Monitors system metrics, supports drift detection.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_drift_predictor.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_drift_predictor.py",
      "type": "Python",
      "details": "Predicts glyph drift, maintains DPI <0.00001%.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_mesh_pipeline.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_mesh_pipeline.py",
      "type": "Python",
      "details": "Distributes tasks across 150,000+ nodes, 1–5 ms latency.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒dark_star_orchestrator.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒dark_star_orchestrator.py",
      "type": "Python",
      "details": "Coordinates AI council voting, supports Dark_Star.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_marketplace_api.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_marketplace_api.py",
      "type": "Python",
      "details": "Manages external contributions, supports AI module.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_validate.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_validate.py",
      "type": "Python",
      "details": "Validates external scripts, ensures Five Rings compliance.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_securityaudit.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_securityaudit.py",
      "type": "Python",
      "details": "Audits system security, LII >0.9999, <1 ms tampering detection.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_core.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_core.py",
      "type": "Python",
      "details": "Core system with UI dashboard, supports task orchestration.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_deploy.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_deploy.py",
      "type": "Python",
      "details": "Deploys scripts to nodes, supports drone and SWG modules.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒muxedit_applier.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒muxedit_applier.ps1",
      "type": "PowerShell",
      "details": "Applies MUXEDIT patches in <0.8 ms, tracks in muxedit_patch_registry.json.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒muxedit_validator.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒muxedit_validator.ps1",
      "type": "PowerShell",
      "details": "Validates MUXEDIT patches, ensures Five Rings compliance.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒validate_outputs.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒validate_outputs.ps1",
      "type": "PowerShell",
      "details": "Implements Five Rings Validation, DPI <0.00001%, logs in validation_log.json.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒grey_star_core.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒grey_star_core.ps1",
      "type": "PowerShell",
      "details": "Scales grids to 150,000+ nodes, <5 ms balancing.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒grok_cognition_core.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒grok_cognition_core.py",
      "type": "Python",
      "details": "Implements GROK Constructor, integrates LLM, <40 ms latency.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒Obelisk.GlyphEngine.psm1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒Obelisk.GlyphEngine.psm1",
      "type": "PowerShell Module",
      "details": "Glyph codex management module, empty, needs implementation.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒vespa.py",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒vespa.py",
      "type": "Python",
      "details": "Supports AI agents and translator codex, <40 ms latency.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskgpt_core.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskgpt_core.ps1",
      "type": "PowerShell",
      "details": "Core for ObeliskGPT agent, supports AI tasks.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_forge_core.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_forge_core.ps1",
      "type": "PowerShell",
      "details": "Core for OGF, generates scripts, <100 ms.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_script_generator.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_script_generator.ps1",
      "type": "PowerShell",
      "details": "Generates scripts for OGF, 12,000–38,000 glyphs/sec.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒packager.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒packager.ps1",
      "type": "PowerShell",
      "details": "Packages system with AES-256, Dilithium, 8 s latency.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒obeliskos_container.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_container.ps1",
      "type": "PowerShell",
      "details": "Manages containerized deployment, supports full runtime.",
      "source": "ObeliskOS_Glyph_Embedding_Options_v1.markdown"
    },
    {
      "name": "🜒obeliskos_compliance_rescript.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_compliance_rescript.ps1",
      "type": "PowerShell",
      "details": "Validates script compliance, checks UTF-8 BOM and metadata.",
      "source": "ObeliskOS_Glyph_Embedding_Options_v1.markdown"
    },
    {
      "name": "🜒glyph_access.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_access.ps1",
      "type": "PowerShell",
      "details": "Manages filesystem access controls for security.",
      "source": "ObeliskOS_Glyph_Embedding_Options_v1.markdown"
    },
    {
      "name": "🜒InternalLogging.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒InternalLogging.ps1",
      "type": "PowerShell",
      "details": "Logging module, empty, needs implementation.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒swg_module.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒swg_module.ps1",
      "type": "PowerShell",
      "details": "Implements SWG module, supports narrative and NPC tasks.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒obeliskos_multinode_expander_v2.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_multinode_expander_v2.ps1",
      "type": "PowerShell",
      "details": "Scales to 150,000+ nodes, uses Raft consensus, 95% efficiency.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒symbol_codexlineage.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒symbol_codexlineage.ps1",
      "type": "PowerShell",
      "details": "Tracks lineage, LII >0.9999, <1 ms detection.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒glyph_benevolence.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒glyph_benevolence.ps1",
      "type": "PowerShell",
      "details": "Ensures benevolent outputs, 99.9999% GDPR compliance.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒codex_evolver.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒codex_evolver.ps1",
      "type": "PowerShell",
      "details": "Evolves glyphs with genetic algorithms, 99.999% accuracy.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒lsu_cache.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒lsu_cache.ps1",
      "type": "PowerShell",
      "details": "Caches data for tasks, proposed for gaming latency reduction.",
      "source": "Obelisk_Core_README_v4.markdown, Interaction 6"
    },
    {
      "name": "🜒concatenate_scripts_muxedit.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒concatenate_scripts_muxedit.ps1",
      "type": "PowerShell",
      "details": "Consolidates scripts, failed to process any (0 scripts).",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒runtime_launcher.ps1",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒runtime_launcher.ps1",
      "type": "PowerShell",
      "details": "Launches lite runtime, 100–300 MB, single agent.",
      "source": "Obelisk_Core_README_v1.markdown"
    },
    {
      "name": "🜒obeliskos.exe",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos.exe",
      "type": "Executable",
      "details": "Full runtime layer, 641 MB, supports SWG servers.",
      "source": "Obelisk_Core_README_v1.markdown"
    },
    {
      "name": "🜒obeliskos_hd.exe",
      "path": "F:\\OBELISK-OS\\Scripts\\🜒obeliskos_hd.exe",
      "type": "Executable",
      "details": "Full HD install, 1–3 TB SSD, high-end systems.",
      "source": "Obelisk_Core_README_v1.markdown"
    },
    {
      "name": "connect_grok.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\connect_grok.ps1",
      "type": "PowerShell",
      "details": "Connects to xAI API, integrates 10 capabilities, ~100 ms latency.",
      "source": "Interaction 1"
    },
    {
      "name": "check_script.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\check_script.ps1",
      "type": "PowerShell",
      "details": "Analyzes code and scripts, part of 10 capabilities.",
      "source": "Interaction 1"
    },
    {
      "name": "validate_ucf.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\validate_ucf.ps1",
      "type": "PowerShell",
      "details": "Validates schemas, part of 10 capabilities.",
      "source": "Interaction 1"
    },
    {
      "name": "check_drift.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\check_drift.ps1",
      "type": "PowerShell",
      "details": "Detects glyph lineage and drift, part of 10 capabilities.",
      "source": "Interaction 1"
    },
    {
      "name": "check_conformity.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\check_conformity.ps1",
      "type": "PowerShell",
      "details": "Ensures GitHub integration conformity, part of 10 capabilities.",
      "source": "Interaction 1"
    },
    {
      "name": "glyph_parser.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\glyph_parser.ps1",
      "type": "PowerShell",
      "details": "Parses OSL glyphs, supports connect_grok.ps1, not recognized in prior runs.",
      "source": "Interaction 1"
    },
    {
      "name": "write_log.ps1",
      "path": "D:\\ObeliskOS\\Scripts\\write_log.ps1",
      "type": "PowerShell",
      "details": "Logs data to JSON Lines, supports connect_grok.ps1.",
      "source": "Interaction 1"
    }
  ],
  "json_files": [
    {
      "name": "test_results_minimal.json",
      "path": "D:\\ObeliskOS\\Logs\\test_results_minimal.json",
      "details": "Logs Wave 1 test results, ~4000 bytes, includes glyph_parser, lsu_manager, symbol_agent outcomes.",
      "size": "~4000 bytes",
      "last_modified": "2025-05-13",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "wave1_summary.json",
      "path": "D:\\ObeliskOS\\Logs\\wave1_summary.json",
      "details": "Summarizes Wave 1 test outcomes, ~200 bytes.",
      "size": "~200 bytes",
      "last_modified": "2025-05-13",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "agent_log.json",
      "path": "D:\\ObeliskOS\\Logs\\agent_log.json",
      "details": "Raw symbol_agent logs, mixed Python dict/JSON, 2464 bytes.",
      "size": "2464 bytes",
      "last_modified": "2025-05-13 19:37",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "agent_log_normalized.jsonl",
      "path": "D:\\ObeliskOS\\Logs\\agent_log_normalized.jsonl",
      "details": "Normalized symbol_agent logs, 14 entries (full), 10 entries (--max-lines 10), ~1200 bytes.",
      "size": "~1200 bytes",
      "last_modified": "2025-05-13",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "agent_log_clean.jsonl",
      "path": "D:\\ObeliskOS\\Logs\\agent_log_clean.jsonl",
      "details": "Cleaned symbol_agent logs in pure JSON Lines, ~1200 bytes, pending generation.",
      "size": "~1200 bytes",
      "last_modified": "2025-05-13",
      "source": "obeliskos_thread_v1.markdown"
    },
    {
      "name": "🜁swg_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁swg_log.json",
      "details": "Logs SWG gameplay events, ~95% log reduction.",
      "source": "Obelisk_Core_README_v2.markdown, ObeliskOS_Glyph_Embedding_Options_v1.markdown"
    },
    {
      "name": "🜁drone_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁drone_log.json",
      "details": "Logs drone telemetry and navigation events.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒internal_sim_results.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜒internal_sim_results.json",
      "details": "Logs test metrics, 7,053–18,215 glyphs/sec, 0.0065–0.0192 W.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜒glyph_test_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜒glyph_test_log.json",
      "details": "Logs encrypted glyph codex tests, ~95% log reduction.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒symbol_core.log",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜒symbol_core.log",
      "details": "Logs runtime execution, obfuscated, likely mislabeled as JSON.",
      "source": "Obelisk_Core_README_v4.markdown"
    },
    {
      "name": "🜒codex_init_diagnostic.log",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜒codex_init_diagnostic.log",
      "details": "Logs glyph initialization failures due to Parameters error.",
      "source": "Obelisk_Core_README_v4.markdown, ObeliskOS_Glyph_Embedding_Options_v1.markdown"
    },
    {
      "name": "🜁dark_star_script_writer_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁dark_star_script_writer_log.json",
      "details": "Logs Dark_Star script writer operations, environment setup failure, DPI 5E-06%.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁notifications.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁notifications.json",
      "details": "Logs script completion, 97% accuracy, 278,900 cycles.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁swg_parse_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁swg_parse_log.json",
      "details": "Logs SWG data load failure due to missing E:\\SWG_Data\\quest_1.lua.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁swg_training_archive.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁swg_training_archive.json",
      "details": "Logs SWG training, 97% accuracy, 100,000 glyphs.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁system_operations.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁system_operations.json",
      "details": "Logs script consolidation failure, 0 scripts processed.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁swg_process_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁swg_process_log.json",
      "details": "Logs SWG glyph processing, 97% accuracy, 149–250 MB.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁oblivi0n_vector_results.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁oblivi0n_vector_results.json",
      "details": "Logs stress tests, 5–11 ms glyph parsing, 130–198 MB.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁router_log.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁router_log.json",
      "details": "Logs task routing, inference failures for SWG.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁test_toggle_contention.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁test_toggle_contention.json",
      "details": "Logs ToggleConflict test, 6 agents, 0.0156 conflict rate.",
      "source": "Obelisk_Core_README_v4.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁test_quantum_security.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\🜁test_quantum_security.json",
      "details": "Logs QuantumSecurityStress test, LII 0.99983, 98% security.",
      "source": "Obelisk_Core_README_v2.markdown, Obelisk_Core_Data_v1.json"
    },
    {
      "name": "🜁test_low_memory.json",
      "path": "F:\\OBELISK-OS\\Final Consolidated Folder\\Logs\\