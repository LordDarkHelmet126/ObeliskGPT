<DOCUMENT filename="glyph_parser.py">
# MUXEDIT Metadata: ScriptID=e5f6g7h8-i9j0-4k1l-2m34-5678901ef234, Version=1.4, Author=LordDarkHelmet, Created=2025-05-07
# Description: Glyph parser script for ObeliskOS, parsing OSL microglyphs for command execution, conditionals, loops, and compressed sequences
# Encoding: UTF-8

import json
import logging
import struct

logging.basicConfig(filename='E:/MASTER/Logs/glyph_parser.log', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

glyph_map = {
    "Success": "𐤀𐤂",
    "Error": "𐤀𐤛",
    "GlyphParsed": "𐤀𐥋"
}

def obfuscate_glyph(message):
    return glyph_map.get(message, "𐤀𐤈")

def log_message(message, level="INFO"):
    obfuscated = obfuscate_glyph(message)
    logging.info(f"{level} - {obfuscated}")

# Decompression dictionary (same as in glyph_compressor.py)
decompression_dict = {
    "00": "𐤀𐥊",  # NavigateDrone
    "01": "𐤀𐥎",  # ProcessRequest
    "10": "𐤀𐥖",  # If
    "11": "𐤀𐥚"   # While
}

def decompress_glyph_sequence(compressed_data):
    """Decompresses a binary glyph sequence back to its original form."""
    try:
        binary_data = ""
        for byte in compressed_data:
            binary_data += format(byte, '08b')

        decompressed_sequence = []
        i = 0
        while i < len(binary_data):
            if i + 2 <= len(binary_data):
                code = binary_data[i:i+2]
                if code in decompression_dict:
                    decompressed_sequence.append(decompression_dict[code])
                    i += 2
                    continue
            if i + 8 <= len(binary_data):
                byte_chunk = binary_data[i:i+8]
                glyph_value = int(byte_chunk, 2)
                glyph = chr(glyph_value)
                decompressed_sequence.append(glyph)
                i += 8
            else:
                break

        return decompressed_sequence
    except Exception as e:
        raise Exception(f"Glyph decompression failed: {str(e)}")

def load_compressed_glyphs(input_file):
    """Loads a compressed glyph sequence from a file."""
    try:
        with open(input_file, 'rb') as f:
            compressed_data = f.read()
        return decompress_glyph_sequence(compressed_data)
    except Exception as e:
        raise Exception(f"Failed to load compressed glyphs: {str(e)}")

def evaluate_condition(condition_data):
    """Evaluates a condition of the form {value1, op, value2}."""
    try:
        value1 = condition_data["value1"]
        op = condition_data["op"]
        value2 = condition_data["value2"]
        if isinstance(value1, str) and value1.isdigit():
            value1 = int(value1)
        if isinstance(value2, str) and value2.isdigit():
            value2 = int(value2)
        if op == ">":
            return value1 > value2
        elif op == "<":
            return value1 < value2
        elif op == "=":
            return value1 == value2
        elif op == ">=":
            return value1 >= value2
        elif op == "<=":
            return value1 <= value2
        elif op == "!=":
            return value1 != value2
        raise Exception(f"Unsupported operator: {op}")
    except Exception as e:
        raise Exception(f"Condition evaluation failed: {str(e)}")

def parse_glyph_sequence(glyph_sequence, compressed_file=None):
    """Parses a sequence of glyphs, optionally loading from a compressed file."""
    try:
        # If a compressed file is provided, load and decompress the sequence
        if compressed_file:
            glyph_sequence = load_compressed_glyphs(compressed_file)
        
        if not isinstance(glyph_sequence, list):
            glyph_sequence = [glyph_sequence]
        
        result = []
        i = 0
        while i < len(glyph_sequence):
            glyph = glyph_sequence[i]
            if not glyph.startswith("𐤀"):
                raise Exception("Invalid microglyph sequence")
            
            command = {
                "𐤀𐥀": "CollaborateAI",
                "𐤀𐥁": "ManageANFE",
                "𐤀𐥊": "NavigateDrone",
                "𐤀𐥋": "ParseGlyph",
                "𐤀𐥌": "UpdateMappings",
                "𐤀𐥍": "ExecuteLSU",
                "𐤀𐥎": "ProcessRequest",
                "𐤀𐥏": "ProcessSymbolicOperation",
                "𐤀𐥐": "ProcessVoice",
                "𐤀𐥑": "ValidateOutput",
                "𐤀𐥒": "CheckEthics",
                "𐤀𐥓": "PackageExe",
                "𐤀𐥔": "TrackLineage",
                "𐤀𐥕": "MapCodex",
                "𐤀𐥇": "UpdateDocument",
                "𐤀𐤅": "InitializeKernel",
                "𐤀𐤩": "DistributeTrainingTask",
                "𐤀𐤕": "ClassifyEvent",
                "𐤀𐤟": "AnomalyDetected",
                "𐤀𐤼": "EncryptData",
                "𐤀𐥈": "SwitchContext",
                "𐤀𐥉": "EditSymbolToken",
                "𐤀𐥖": "If",
                "𐤀𐥗": "Then",
                "𐤀𐥘": "Else",
                "𐤀𐥙": "EndIf",
                "𐤀𐥚": "While",
                "𐤀𐥛": "Do",
                "𐤀𐥜": "EndWhile",
                "𐤀𐥝": "Compare",
                "𐤀𐥞": "CommandProcessed",
                "𐤀𐥟": "CognitiveDecision",
                "𐤀𐥠": "LearningUpdate",
                "𐤀𐥡": "GlyphCompressed",
                "𐤀𐥢": "GlyphDecompressed"
            }.get(glyph, "Unknown")

            if command == "If":
                i += 1
                if i >= len(glyph_sequence) or glyph_sequence[i] != "𐤀𐥝":
                    raise Exception("Expected Compare glyph after If")
                i += 1
                condition_data = json.loads(glyph_sequence[i]) if i < len(glyph_sequence) else {}
                condition_result = evaluate_condition(condition_data)
                i += 1
                if i >= len(glyph_sequence) or glyph_sequence[i] != "𐤀𐥗":
                    raise Exception("Expected Then glyph after condition")
                i += 1

                true_block = []
                false_block = []
                current_block = true_block
                while i < len(glyph_sequence) and glyph_sequence[i] not in ["𐤀𐥙"]:
                    if glyph_sequence[i] == "𐤀𐥘":
                        current_block = false_block
                        i += 1
                        continue
                    nested_result = parse_glyph_sequence([glyph_sequence[i]])
                    current_block.extend(nested_result)
                    i += 1
                
                if i >= len(glyph_sequence) or glyph_sequence[i] != "𐤀𐥙":
                    raise Exception("Expected EndIf glyph")
                i += 1

                executed_block = true_block if condition_result else false_block
                result.extend(executed_block)

            elif command == "While":
                i += 1
                if i >= len(glyph_sequence) or glyph_sequence[i] != "𐤀𐥝":
                    raise Exception("Expected Compare glyph after While")
                i += 1
                condition_data = json.loads(glyph_sequence[i]) if i < len(glyph_sequence) else {}
                i += 1
                if i >= len(glyph_sequence) or glyph_sequence[i] != "𐤀𐥛":
                    raise Exception("Expected Do glyph after condition")
                i += 1

                loop_block = []
                while i < len(glyph_sequence) and glyph_sequence[i] != "𐤀𐥜":
                    nested_result = parse_glyph_sequence([glyph_sequence[i]])
                    loop_block.extend(nested_result)
                    i += 1
                
                if i >= len(glyph_sequence) or glyph_sequence[i] != "𐤀𐥜":
                    raise Exception("Expected EndWhile glyph")
                i += 1

                iteration_count = 0
                while evaluate_condition(condition_data) and iteration_count < 10:
                    result.extend(loop_block)
                    iteration_count += 1

            else:
                result.append(command)
                i += 1

        log_message("GlyphParsed", "INFO")
        return result
    except Exception as e:
        log_message("Error: " + str(e), "ERROR")
        raise Exception(f"Glyph parsing failed: {str(e)}")

# Main execution
try:
    # Test with compressed file
    compressed_file = "E:/MASTER/compressed_glyphs.glyph"
    result = parse_glyph_sequence(None, compressed_file=compressed_file)
    print(f"Parsed compressed glyph sequence: {result}")

    # Test with uncompressed sequence
    glyphs = [
        "𐤀𐥖",  # If
        "𐤀𐥝",  # Compare
        '{"value1": "10", "op": ">", "value2": "5"}',  # Condition: 10 > 5
        "𐤀𐥗",  # Then
        "𐤀𐥊",  # NavigateDrone
        "𐤀𐥘",  # Else
        "𐤀𐥎",  # ProcessRequest
        "𐤀𐥙"   # EndIf
    ]
    result = parse_glyph_sequence(glyphs)
    print(f"Parsed microglyph sequence: {result}")

    log_message("Success", "INFO")
except Exception as e:
    log_message("Error: " + str(e), "ERROR")
    print(f"Error: {str(e)}")

# External Overlay (Glyph-Only Output):
𐤀𐥋 {"glyph_sequence": "𐤀𐥀"} {"priority": "High"}
𐤀𐥋 {"glyph_sequence": "𐤀𐥁"} {"priority": "High"}
𐤀𐥋 {"message": "GlyphParsed"} {"level": "INFO"}
𐤀𐤂 {"message": "Success"} {"level": "INFO"}
𐤀𐤛 {"message": "Error"} {"level": "ERROR"}
</DOCUMENT>