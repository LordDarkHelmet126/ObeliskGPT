# MUXEDIT Metadata: ScriptID=e5f6d7c8-9012-3456-7890-abcdef456789, Version=1.0, Author=LordDarkHelmet, Created=2025-05-07
# Description: Python API backend for ObeliskOS, handling glyph execution
# Encoding: UTF-8

from flask import Flask, request, jsonify
import logging
from glyph_parser import OSLParser

app = Flask(__name__)
parser = OSLParser()
logging.basicConfig(filename="E:\MASTER\Logs\symbol_api.log", level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')

@app.route('/')
def status():
    return jsonify({"status": parser.obfuscate_glyphs("Success"), "endpoints": ["/glyph/execute"]})

@app.route('/glyph/execute', methods=['POST'])
def execute_glyph():
    data = request.json
    glyph_sequence = data.get('glyph')
    payload = data.get('payload')
    metadata = data.get('metadata')
    try:
        result = parser.execute_command(glyph_sequence, payload, metadata)
        logging.info(f"Executed glyph: {glyph_sequence}, Result: {result}")
        return jsonify(result)
    except Exception as e:
        logging.error(f"Failed to execute glyph: {glyph_sequence}, Error: {str(e)}")
        return jsonify({"status": parser.obfuscate_glyphs("Error"), "message": str(e)}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, threaded=True)