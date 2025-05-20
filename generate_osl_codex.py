# File: D:\ObeliskOS\Scripts\generate_osl_codex.py
# Description: Generates OSL glyphs and codex entries for ObeliskOS
# Encoding: UTF-8

import fontforge
import random
import sqlite3
import os

# Step 1: Generate blended glyphs with FontForge
def generate_osl_font(output_path, glyph_count=4096):
    nabataean_font = fontforge.open("D:/ObeliskOS/Fonts/NotoSansNabataean-Regular.ttf")
    hebrew_font = fontforge.open("D:/ObeliskOS/Fonts/NotoSansHebrew-Regular.ttf")
    mongolian_font = fontforge.open("D:/ObeliskOS/Fonts/NotoSansMongolian-Regular.ttf")

    osl_font = fontforge.font()
    osl_font.fontname = "ObeliskOSFont"
    osl_font.encoding = "UnicodeFull"

    unicode_start = 0xE000
    nabataean_glyphs = [g for g in nabataean_font.glyphs() if g.unicode != -1]
    hebrew_glyphs = [g for g in hebrew_font.glyphs() if g.unicode != -1]
    mongolian_glyphs = [g for g in mongolian_font.glyphs() if g.unicode != -1]

    for i in range(glyph_count):
        osl_glyph = osl_font.createChar(unicode_start + i)
        nab_glyph = random.choice(nabataean_glyphs)
        heb_glyph = random.choice(hebrew_glyphs)
        mon_glyph = random.choice(mongolian_glyphs)

        osl_glyph.importOutlines(nabataean_font, nab_glyph.glyphname)
        osl_glyph.transform([1, 0, 0, 0.5, 0, 0])
        osl_glyph.importOutlines(hebrew_font, heb_glyph.glyphname, True)
        osl_glyph.transform([0.5, 0, 0, 1, 100, 0])
        osl_glyph.importOutlines(mongolian_font, mon_glyph.glyphname, True)
        osl_glyph.transform([0.3, 0, 0, 1.5, 0, -50])
        osl_glyph.simplify()
        osl_glyph.round()

    osl_font.generate(output_path)
    print(f"Generated OSL font with {glyph_count} glyphs at {output_path}")

# Step 2: Generate technique entries
def generate_techniques(start_id, end_id, db_path):
    greek_letters = ["Ψ", "Ω", "Φ", "σ", "ζ", "Θ", "Ξ", "η", "β", "ξ"]
    action_glyphs = ["🜄", "🜅", "🜆", "🜇", "🜈"]
    verbs = {"O": "Outputs", "L": "Locks", "E": "Encrypts", "V": "Validates", "B": "Broadcasts", "A": "Aligns"}
    components = {"L": "Lineage", "C": "Codex", "S": "Scroll", "V": "Vector", "G": "Glyph", "A": "Agent", "B": "Buffer"}
    contexts = {"1": "Drift Tag Checksum", "2": "Validation Map", "3": "Execution Ring"}

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS techniques (
            id TEXT PRIMARY KEY,
            glyph TEXT,
            expression TEXT,
            action_sequence TEXT,
            semantic_role TEXT,
            binary_encoding TEXT
        )
    """)

    for id_num in range(start_id, end_id + 1):
        phase = (id_num - 1) // 5000 + 1
        technique_id = f"EV{phase}_{id_num:04d}"
        glyph_unicode = 0xE000 + (id_num - 1) % 4096
        glyph = chr(glyph_unicode)
        
        # Expression (condensed)
        expr_parts = [random.choice(greek_letters)]
        expr_parts.append("=")
        for _ in range(2):
            expr_parts.append(random.choice(greek_letters))
            expr_parts.append("⊕")
        expression = "".join(expr_parts[:-1])
        
        # Action sequence (2 glyphs)
        action_seq = f"{random.choice(action_glyphs)}{random.choice(action_glyphs)}"
        
        # Semantic role (tokenized)
        verb = random.choice(list(verbs.keys()))
        component = random.choice(list(components.keys()))
        context = random.choice(list(contexts.keys()))
        semantic_role = f"{verb}{component}{context}"
        
        # Binary encoding (64-bit)
        binary_encoding = f"0xE{id_num:04x}"
        
        cursor.execute("""
            INSERT OR REPLACE INTO techniques (id, glyph, expression, action_sequence, semantic_role, binary_encoding)
            VALUES (?, ?, ?, ?, ?, ?)
        """, (technique_id, glyph, expression, action_seq, semantic_role, binary_encoding))
    
    conn.commit()
    conn.close()
    print(f"Generated techniques from EV{(start_id-1)//5000+1}_{start_id:04d} to EV{(end_id-1)//5000+1}_{end_id:04d}")

# Step 3: Save semantic tokens lookup
def save_semantic_tokens(output_path):
    tokens = {
        "Verbs": {"O": "Outputs", "L": "Locks", "E": "Encrypts", "V": "Validates", "B": "Broadcasts", "A": "Aligns"},
        "Components": {"L": "Lineage", "C": "Codex", "S": "Scroll", "V": "Vector", "G": "Glyph", "A": "Agent", "B": "Buffer"},
        "Contexts": {"1": "Drift Tag Checksum", "2": "Validation Map", "3": "Execution Ring"}
    }
    with open(output_path, "w", encoding="utf-8") as f:
        import json
        json.dump(tokens, f, ensure_ascii=False, indent=2)
    print(f"Saved semantic tokens to {output_path}")

# Main execution
if __name__ == "__main__":
    # Generate font with 4096 glyphs
    generate_osl_font("D:/ObeliskOS/Fonts/ObeliskOSFont.ttf", 4096)
    
    # Generate techniques (e.g., up to 10,000)
    generate_techniques(1, 10000, "D:/ObeliskOS/JSON/glyph_mappings.sqlite")
    
    # Save semantic tokens
    save_semantic_tokens("D:/ObeliskOS/JSON/semantic_tokens.json")