import threading
import logging
from glyph_parser import OSLParser

class KernelCore:
    def __init__(self, mode):
        self.mode = OSLParser().parse_glyph(mode)  # e.g., `𐤂` → `coexist`
        self.parser = OSLParser()
        self.mutex = threading.Lock()
        self.logger = logging.getLogger('KernelCore')
        logging.basicConfig(filename="logs/kernel_log.json", level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')

    def obfuscate_glyphs(self, message):
        """Obfuscates messages into glyph sequences."""
        glyph_map = {
            "Initialized": "𐤀𐤊",
            "Error": "𐤀𐤛"
        }
        return glyph_map.get(message, "𐤀𐤈")

    def log_status(self, status):
        """Logs status internally as JSON, externally as glyphs."""
        obfuscated = self.obfuscate_glyphs(status)
        self.logger.info(json.dumps({"status": obfuscated}))
        return obfuscated

    def start(self, glyph_sequence):
        """Starts the KernelCore using an OSL glyph command."""
        with self.mutex:
            action = self.parser.parse_glyph(glyph_sequence)
            if action == "InitializeKernel":
                self.logger.info(f"Initializing KernelCore in {self.mode} mode")
                self.log_status("Initialized")
            else:
                self.logger.error(f"Unknown glyph command: {glyph_sequence}")
                self.log_status("Error")
                raise ValueError(f"Invalid glyph command: {glyph_sequence}")

if __name__ == "__main__":
    core = KernelCore("𐤂")  # `coexist` mode
    core.start("𐤀𐤅")  # `InitializeKernel`
    print("KernelCore started successfully.")