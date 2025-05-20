# ObeliskOS v6.5 Rulebook

MUXEDIT Metadata: ScriptID=7b9e3f2a-8c4d-4b9e-a2f3-6e7d9c1b2f3a, Version=1.0, Author=LordDarkHelmet, Created=2025-05-20

## 3. Obelisk Symbolic Language (OSL)

### 3.1 Overview
The **Obelisk Symbolic Language (OSL)** is a glyph-based DSL for encoding computational tasks in **ObeliskOS v6.5**. It uses 33 glyphs from Nabataean (`𐤀–𐤕`) and Mongolian (`𐰀–𐰊`) Unicode ranges, supporting sequences of 1–4 glyphs for tasks ranging from simple operations to complex workflows.

### 3.2 Glyph Alphabet
- **Count**: 33 glyphs (22 Nabataean, 11 Mongolian).
- **Encoding**: UTF-8, 8–12 bytes/glyph.
- **Storage**: `D:\ObeliskOS\Sqlite\glyph_mappings.sqlite`.
- **Examples**:
  - `𐤀`: Initialize task.
  - `𐰊`: Terminate task.
  - `𐤏`: Validate signature (crypto).

### 3.3 Glyph Sequences
Sequences range from single glyphs (33¹=33) to four-glyph combinations (33⁴=1,185,921), stored in:
- `Master_Combinations_Part2.xlsx`: Four-glyph sequences (e.g., `𐤏𐰊𐤐𐤀` for drone initialization).
- `ObeliskOS_Full_Glyph_Combinations - Copy.csv`: Single to four-glyph sequences (e.g., `𐤀`, `𐤀𐤀`, `𐤀𐤀𐤀`, `𐰊𐰊𐰊𐰊`).

### 3.4 Task Encoding
- **Process**:
  1. **Select Sequence**: Use DOE (`obeliskos_orchestrator.ps1`) to map goals to sequences.
  2. **Validate**: Run `validate_glyph_sequences.ps1` against Five Rings dimensions (Earth, Water, Fire, Wind, Void).
  3. **Execute**: LSUs process sequences with <3 ms latency.
- **Example**:
  ```powershell
  # Encode a game entity update
  $sequence = "𐤐𐤀𐤀𐤀"
  .\validate_glyph_sequences.ps1 -GlyphFilePath "glyph_input.csv" -CodexPath "D:\ObeliskOS\Sqlite\glyph_mappings.sqlite"
  .\lsu_manager.ps1 -Sequence $sequence -Task "UpdateEntity"
  ```
  Output: `.lua` script for 120+ FPS in SWG modding.

### 3.5 Validation
- **Script**: `validate_outputs.ps1`
- **Metrics**:
  - Coherence (LCI): >0.9999
  - Stability (SSI): ≥0.99996
  - Drift (DPI): <0.000001%
- **Log**: `D:\ObeliskOS\Logs\glyph_validation_log.jsonl`

### 3.6 Security
- **Encryption**: AES-256, Dilithium signatures (`glyph_encrypt.ps1`).
- **Compliance**: GDPR, quantum-ready.

```mermaid
graph TD
    A[Goal: Update Game Entity] --> B[Select Sequence: 𐤐𐤀𐤀𐤀]
    B --> C[Validate: validate_glyph_sequences.ps1]
    C --> D[Execute: lsu_manager.ps1]
    D --> E[Output: .lua Script]
    C --> F[Log: glyph_validation_log.jsonl]
```