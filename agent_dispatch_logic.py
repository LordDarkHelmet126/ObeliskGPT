# agent_dispatch_logic.py
import sqlite3

def resolve_agent_for_glyph(glyph):
    conn = sqlite3.connect("obeliskos_codex.sqlite")
    cursor = conn.cursor()
    cursor.execute("SELECT agent, role, context FROM glyphs WHERE glyph=?", (glyph,))
    result = cursor.fetchone()
    conn.close()
    if result:
        return {
            "glyph": glyph,
            "agent": result[0],
            "role": result[1],
            "context": result[2].split(',')
        }
    else:
        return None