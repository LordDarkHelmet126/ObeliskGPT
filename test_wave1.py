# UTF-8 BOM: EF BB BF 🜰 {"type":"Python","schema":"obeliskos_codex_v1","channel":"multiplex_alpha","translator_ready":true}
# MUXEDIT Metadata: ScriptID=2e3f4a5b-6c7d-7e8f-8a9b-0c1d2e3f4g6i, Version=1.0, Author=LordDarkHelmet, Created=2025-05-13, Purpose=Tests Wave 1 components for ObeliskOS JSON/DuckDB build, Dependencies=json;logging;pathlib;argparse, ValidationStatus=Validated
"""Tests Wave 1 components (OSL, LSUs, AI agent) for ObeliskOS JSON/DuckDB build."""
import json
import logging
import argparse
from pathlib import Path

def setup_logging(base_dir):
    """Set up JSON Lines logging."""
    log_dir = Path(base_dir) / "Logs"
    log_dir.mkdir(exist_ok=True)
    log_file = log_dir / "test_results.json"
    logging.basicConfig(filename=log_file, level=logging.INFO, format='%(asctime)s %(message)s')
    return log_file

def test_glyph_parser(base_dir):
    """Test glyph parsing."""
    glyph_file = Path(base_dir) / "JSON" / "glyph_mappings.json"
    try:
        with open(glyph_file, "r", encoding="utf-8") as f:
            glyphs = json.load(f)
        glyph = next((g for g in glyphs if g["glyph_id"] == 1), None)
        if glyph and glyph["semantic_role"] == "Verify Transaction":
            logging.info({"operation": "TestGlyphParser", "status": "Success", "details": {"glyph_id": 1}})
            return True
        else:
            logging.error({"operation": "TestGlyphParser", "status": "Failed", "details": {"glyph_id": 1, "error": "Glyph not found or invalid"}})
            return False
    except Exception as e:
        logging.error({"operation": "TestGlyphParser", "status": "Failed", "details": {"error": str(e)}})
        return False

def test_lsu_manager(base_dir):
    """Test LSU management."""
    config_file = Path(base_dir) / "Configs" / "lsu_config.json"
    try:
        with open(config_file, "r", encoding="utf-8") as f:
            config = json.load(f)
        units = config["units"]
        if units == 341:
            logging.info({"operation": "TestLSUManager", "status": "Success", "details": {"unit_count": units}})
            return True
        else:
            logging.error({"operation": "TestLSUManager", "status": "Failed", "details": {"unit_count": units, "error": "Invalid unit count"}})
            return False
    except Exception as e:
        logging.error({"operation": "TestLSUManager", "status": "Failed", "details": {"error": str(e)}})
        return False

def test_symbol_agent(base_dir):
    """Test AI agent task execution."""
    agent_log = Path(base_dir) / "Logs" / "agent_log.json"
    try:
        with open(agent_log, "r", encoding="utf-8") as f:
            logs = [json.loads(line) for line in f]
        success = any(log["operation"] == "ExecuteAgentTask" and log["status"] == "Success" for log in logs)
        if success:
            logging.info({"operation": "TestSymbolAgent", "status": "Success", "details": {"log_found": True}})
            return True
        else:
            logging.error({"operation": "TestSymbolAgent", "status": "Failed", "details": {"error": "No successful agent task found"}})
            return False
    except Exception as e:
        logging.error({"operation": "TestSymbolAgent", "status": "Failed", "details": {"error": str(e)}})
        return False

def main():
    parser = argparse.ArgumentParser(description="ObeliskOS Wave 1 Test")
    parser.add_argument("--base-dir", default="D:\\ObeliskOS", help="Root directory")
    args = parser.parse_args()

    try:
        base_dir = args.base_dir.replace("/", "\\")
        log_file = setup_logging(base_dir)
        results = {
            "glyph_parser": test_glyph_parser(base_dir),
            "lsu_manager": test_lsu_manager(base_dir),
            "symbol_agent": test_symbol_agent(base_dir)
        }
        overall = all(results.values())
        logging.info({"operation": "TestWave1", "status": "Success" if overall else "Failed", "details": results})
        print(f"Test results: {results}")
        print(f"Overall: {'Success' if overall else 'Failed'}")
        print(f"Log: {log_file}")
    except Exception as e:
        logging.error({"operation": "TestWave1", "status": "Failed", "details": {"error": str(e)}})
        print(f"Error: {e}")
        raise

if __name__ == "__main__":
    main()

# ---CODEX---
# file_id: 2e3f4a5b-6c7d-7e8f-8a9b-0c1d2e3f4g6i
# schema: obeliskos_codex_v1
# lines: 110
# words: 550
# glyphs: 15
# translator_ready: true
# multiplex: true
# dependencies: json;logging;pathlib;argparse
# validation_status: Validated
# ---CODEX---