---
title: ObeliskOS Development Rules and Operational Manual (Version 3.1, Wave 1)
subtitle: A Comprehensive Reference for the Design, Development, and Operation of ObeliskOS
author: LordDarkHelmet (Creator of Hybrid Flux_Star Framework)
date: April 30, 2025
version: 3.1
status: Living Document
repository: E:\ALL SCRIPTS FOR BOOK\DARK_STAR
log: E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs
---

# ObeliskOS Development Rules and Operational Manual (Part 1)

**Credit**: The **Hybrid Flux_Star** framework, a pivotal component of ObeliskOS, is the intellectual property of **LordDarkHelmet**, who conceptualized and developed it in April 2025. All documentation, comments, and references to the framework explicitly acknowledge LordDarkHelmet’s contribution, ensuring proper attribution for this innovative technology.

## [Existing Sections 1–10 Omitted for Brevity]

## 11. Obelisk Symbolic Language (OSL) Codex

### 11.1 Overview
The **Obelisk Symbolic Language (OSL)** codex defines a 1024-glyph table used for symbolic processing, visual representation, and functional instruction within ObeliskOS. This codex ensures consistency across all components (**Dark_Star**, **Obelisk Glyph Forge (OGF)**, **Symbolic Workflow Generator (SWG)**), eliminating symbolic drift (DPI < 0.00001%) by providing a definitive mapping of glyphs to meanings, intents, and actions.

### 11.2 Codex Storage
- **Primary Storage**: The codex is stored in `glyph_mappings.sqlite` in the `VisualGlyphMappings` table, with a backup in `obelisk🜒glyph🜒codex.txt` for reference.
- **Schema**:
  ```
  EntityID TEXT PRIMARY KEY,       -- Unique identifier (e.g., ScriptID, FunctionName, IntentName)
  EntityType TEXT,                -- Type (Script, Function, Intent, File)
  Name TEXT,                      -- Human-readable name (e.g., "obelisk🜒memory.ps1")
  GlyphRepresentation TEXT,       -- Base glyph (e.g., 🜒🜤🜆_001)
  SecondaryGlyph TEXT,            -- Secondary glyph (e.g., 🜤 for scripts)
  TertiaryGlyph TEXT,             -- Tertiary glyph (e.g., 🜆 for "Memory")
  EnglishMeaning TEXT,            -- English description (e.g., "Memory management script")
  ScriptContent TEXT,             -- Associated script content (for scripts/functions)
  GlyphSequence TEXT,             -- Full sequence with create action glyphs (e.g., 🜒🜤🜆🝡)
  CreateActionGlyphs TEXT,        -- List of create action glyphs (e.g., 🝡)
  Timestamp INTEGER               -- Creation timestamp
  ```

### 11.3 Glyph Categories
- **Entity Glyphs (800 glyphs)**: Represent files, functions, intents, and subcategories.
  - **Primary Glyph**: **🜒** (U+1F712) as the prefix for all sequences.
  - **Secondary Glyphs**: Define entity types (e.g., Script: **🜤**, Function: **🜁**).
  - **Tertiary Glyphs**: Define subcategories (e.g., Memory: **🜆**, Cleanup: **🜇**).
- **Create Action Glyphs (224 glyphs)**: Functional modifiers for actions.
  - **Repeaters (32 glyphs)**: E.g., **🝀** (Repeat 1 time), **🝁** (Repeat 2 times).
  - **Multipliers (32 glyphs)**: E.g., **🝠** (Multiply by 1), **🝡** (Multiply by 2).
  - **Intent Modifiers (80 glyphs)**: E.g., **🞀** (High priority), **🞁** (Low priority).
  - **Control Flow (40 glyphs)**: E.g., **🞰** (If condition), **🞴** (Stop execution).
  - **Arithmetic/Logic Operators (40 glyphs)**: E.g., **🞺** (Add), **🞼** (And).

### 11.4 Usage Rules
1. **Glyph Sequences**: All entities must have a base glyph representation (e.g., `🜒🜤🜆_001`) and may include create action glyphs (e.g., `🜒🜤🜆🝡` for "Multiply by 2").
2. **Translation**: Use `obelisk🜒codex🜒translator.ps1` to translate glyph sequences to English or script content, and vice versa.
3. **Training**: **Dark_Star**, OGF, and SWG must be trained on the codex to interpret glyph sequences, achieving >99.99% accuracy after 10,000 iterations (2% improvement per 1,000 iterations).
4. **Drift Prevention**: All components must validate glyph sequences against the codex, logging deviations to `codex🜒translator🜒log.json` for correction by **Dark_Star**.
5. **Encoding**: All files containing glyphs must use UTF-8 with BOM to ensure proper rendering on Windows 11 24H2.

### 11.5 Codex Reference
The full codex is stored in `obelisk🜒glyph🜒codex.txt` (E:\MASTER\Support\obelisk🜒glyph🜒codex.txt), containing all 1024 glyphs, their Unicode points, categories, subcategories, meanings/intents, and associated actions. This file must be referenced by all components to ensure consistency.

### 11.6 Example Usage
- **Glyph Sequence**: `🜒🜤🜆🝡`
  - Translation: "Memory management script, Multiply by 2"
  - Action: Doubles the memory allocation in `obelisk🜒memory.ps1`.
- **Glyph Sequence**: `🜒🜃🜇🝂🞀`
  - Translation: "Cleans up and reorganizes files, Repeat 3 times, Execute with high priority"
  - Action: Executes `obelisk🜒cleanup🜒codex.ps1` three times with high priority.

### 11.7 Drift Prevention Measures
- **Validation**: Use `obeliskos_compliance_rescript.ps1` to validate glyph sequences against the codex, ensuring DPI < 0.00001%.
- **Logging**: Log all glyph-related errors in `codex🜒translator🜒log.json`, feeding them to **Dark_Star** for learning.
- **Continuous Updates**: Update the codex via `obelisk🜒glyph🜒mapper.ps1` as new entities are added, ensuring alignment across all components.

---