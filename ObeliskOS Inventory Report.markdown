```markdown
# ObeliskOS Inventory Report

**Date**: April 28, 2025  
**Protocol**: BRIGHT_STAR v1.1-DS  
**Directory**: `E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder`

## Parsed Documents Inventory

### Core Files
1. **self_scripting_guidebook.md** (Originally `ObeliskOS Self-Scripting Feature Guidebook.markdown`)
   - **Purpose**: Blueprint for MSS-CSP, detailing self-scripting, theoretical foundations, and technical specs.
   - **Status**: Revised, stored in `Docs`.

2. **symbol_memory_modules.json** (Originally `thirteenthtablet_memory_modules.json`)
   - **Purpose**: Configures LLM profiles, scripts, vector bundles, datasets, training, and caches for RAG and self-scripting.
   - **Status**: Partially revised (in progress).

3. **symbol_keymaster.py** (Originally `keymaster.py`)
   - **Purpose**: Manages SymbolToken codices, proposes glyphs, and packages tablet artifacts.
   - **Status**: Pending revision.

4. **coexist_manager.py**
   - **Purpose**: Manages scroll and pulse execution modes, routes SymbolTokens via ConceptBus.
   - **Status**: Revised, stored in `Scripts`.

5. **obeliskos_symbol_catalog.json** (Originally `obeliskos_glyph_catalog.json`)
   - **Purpose**: Catalog of SymbolToken operations and node configurations.
   - **Status**: Revised, stored in `codices`.

6. **master_codex_64.json**
   - **Purpose**: Defines SymbolToken operations for runtime and Dark Star features.
   - **Status**: Revised, stored in `codices`.

7. **symbol_event_codex.json** (Originally `glyph_event_codex.json`)
   - **Purpose**: Defines event-driven SymbolToken operations.
   - **Status**: Revised, stored in `codices`.

8. **symbol_usage_codex.json** (Originally `glyph_usage_codex.json`)
   - **Purpose**: Tracks SymbolToken usage for pruning and analytics.
   - **Status**: Revised, stored in `codices`.

9. **symbol_mutation_codex.json** (Originally `glyph_mutation_codex.json`)
   - **Purpose**: Defines rules for SymbolToken mutations.
   - **Status**: Revised, stored in `codices`.

10. **symbol_vector_codex.json** (Originally `glyph_vector_codex.json`)
    - **Purpose**: Stores 256D vector representations for RAG.
    - **Status**: Revised, stored in `codices`.

11. **symbol_encrypt.py** (Originally `encrypt.py`)
    - **Purpose**: Provides quantum-safe encryption/decryption with AES-256/Dilithium.
    - **Status**: Revised, stored in `Scripts`.

12. **symbol_evolver.py** (Originally `cdx_evolver.py`)
    - **Purpose**: Proposes/integrates SymbolToken key mappings, evolves quantum keys.
    - **Status**: Revised, stored in `Scripts`.

13. **symbol_orchestrator.py** (Originally `dark_star_orchestrator_v3_custom.py`)
    - **Purpose**: Orchestrates Dark Star node operations via Flask API.
    - **Status**: Revised, stored in `Scripts`.

14. **Master Text.txt**
    - **Purpose**: Contains multiple scripts for diagnostics, encryption, propagation, drivers, crash pulses, event viewing, system monitoring, codex lineage, DNA simulation, applications, file checks, and Dark Star bridging.
    - **Scripts**:
      - `glyph_diagnostic.py`
      - `glyph_encrypt.py`
      - `glyph_h Duplicated scripts in the document will be addressed in revisions.
    - **Status**: Pending revision.

### Ancillary Files
1. **recover_codex.sh**
   - **Purpose**: Recovers codices and databases from backups.
   - **Status**: Pending revision.

2. **update_github.ps1**
   - **Purpose**: Automates Git commits and pushes to GitHub.
   - **Status**: Pending revision.

### Previously Parsed Core Files (Not Uploaded)
- `vespa.py`
- `symbol_vector_indexer.py`
- `lsu_orchestrator.py`
- `memory_fastpath.py`
- `sanitizer_agent.py`
- `cognitive_brain.py`
- `concept_api.py`
- `log_preprocessor.py`
- `obeliskos_runtime.py` (incorporates `concept_bus.py`)

## Folder Structure
- **E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder**
  - **Artifacts**
  - **codices**
    - `master_codex_64.json`
    - `obeliskos_symbol_catalog.json`
    - `symbol_event_codex.json`
    - `symbol_mutation_codex.json`
    - `symbol_usage_codex.json`
    - `symbol_vector_codex.json`
  - **Documentation**
  - **JSON**
  - **Logs**
  - **Markdown**
  - **Other**
  - **PowerShell**
    - `apply_move_plan.ps1`
    - `enforce_bright_star_compliance.ps1`
    - `generate_manifest.ps1`
    - `generate_move_plan.ps1`
    - `update_manifest.ps1`
    - `validate_sha256_manifest.ps1`
  - **Python**
    - `coexist_manager.py`
    - `cognitive_brain.py`
    - `concept_api.py`
    - `log_preprocessor.py`
    - `lsu_orchestrator.py`
    - `lsu_processor.py`
    - `memory_fastpath.py`
    - `memorysyncagent.py`
    - `obeliskos_runtime.py`
    - `sanitizer_agent.py`
    - `symbol_encrypt.py`
    - `symbol_evolver.py`
    - `symbol_orchestrator.py`
    - `symbol_vector_indexer.py`
    - `vespa.py`
  - **Scripts**
  - **Text**
    - `ObeliskOS_Self_Scripting_Scripts.py`
    - `self_scripting_guidebook.markdown`
    - `sha256_manifest_core.csv`
    - `sha256_manifest_updated.csv`
  - **Utilities**
  - **Zip**
  - `Backup_20250428_100252`

## Current Work Focus
- **Goal**: Operationalize ObeliskOS with LSUs, integrating Dark Star features, RAG, 256D vector embeddings, CognitiveBrain, LLM, logs, API, self-modding, and self-scripting, with Vespa as the Symbolic Cognition Core.
- **Focus**:
  - Developing MSS-CSP for 50-60% self-scripting (DPI < 0.00001%).
  - Integrating core files for runtime, LSU orchestration, RAG, self-modding, and Dark Star features.
  - Ensuring **BRIGHT_STAR v1.1-DS** compliance.
  - Preparing for validation with `validate_system.py`.
- **Progress**:
  - Revised core files: `self_scripting_guidebook.md`, `coexist_manager.py`, `obeliskos_symbol_catalog.json`, `master_codex_64.json`, `symbol_event_codex.json`, `symbol_usage_codex.json`, `symbol_mutation_codex.json`, `symbol_vector_codex.json`, `symbol_encrypt.py`, `symbol_evolver.py`, `symbol_orchestrator.py`, `obeliskos_runtime.py`.
  - Drafted: `log_preprocessor.py`.
  - Pending: `symbol_memory_modules.json`, `symbol_keymaster.py`, scripts in `Master Text.txt`.
  - Next: Draft `script_generator.py`, `validate_system.py`, `system_config.json`, `symbol_rag_vector_store.json`.
```