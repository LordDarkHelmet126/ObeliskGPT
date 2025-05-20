
# 🜁 ObeliskOS Codex Primer

## Obelisk Codex Prime (Table F – Final)

- **Core Layer (Layer 0):** 256 Action + ~256 Combo Glyphs = 512 Core Glyphs
- **Main Layer (Layer 1):** 2048 Glyphs (Core + 1536 General Purpose)
- **Module Layer (Layer 2):** +1024 Special Glyphs/Module (e.g., SWG, Drones)
- **Combo Layer (Layer 3):** +~512 Combo Glyphs/Module

### Encoding Specs
- Glyph Encoding: 6–12 bytes/glyph (avg. 8), 128-bit tokens
- Obfuscation: AES-256/Dilithium (glyph_encrypt.ps1)
- Parsing Accuracy: 99.999% (glyph_parser.py)
- Storage: obeliskos_glyph_mappings.sqlite (O(1) access)

### Linguistic Roots
- **Nabataean**: Anchor glyph compression (16 bytes/glyph, 60% data reduction)
- **Early Hebrew**: Aleph (א) as sequence anchor (8-bit root)
- **Ancient Mongolian**: Vowel harmony – angular (Masculine), curved (Feminine), symmetric (Neutral)

---
