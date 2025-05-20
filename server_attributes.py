# -*- coding: UTF-8 -*-
"""
Description: Defines server attributes for ObeliskOS 🜰
"""

import json
import os
from datetime import datetime

# Paths
output_dir = r"E:\MASTER"
log_file = os.path.join(output_dir, "Logs", "server_attributes_log.json")

# Ensure output directory exists
if not os.path.exists(output_dir):
    try:
        os.makedirs(output_dir)
        print(f"Created output directory: {output_dir}")
    except Exception as e:
        print(f"Failed to create output directory {output_dir}: {str(e)}")
        exit(1)

# Ensure log directory exists
log_dir = os.path.dirname(log_file)
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# Logging function
def write_log(category, message):
    log_entry = {
        "Category": category,
        "Message": message,
        "Timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    try:
        with open(log_file, "a", encoding="utf-8") as f:
            f.write(json.dumps(log_entry, separators=(",", ":")) + "\n")
    except Exception as e:
        print(f"Failed to write to log: {str(e)}")

# Define server attributes function
def define_server_attributes():
    write_log("Info", "Defining server attributes")

    try:
        attributes = {
            "host": "localhost",
            "port": 8080,
            "log_level": "Debug",
            "metrics_enabled": ["Latency", "LSUCount"]
        }
        write_log("Success", f"Server attributes defined: {json.dumps(attributes, separators=(',', ':'))}")
        return attributes
    except Exception as e:
        write_log("Error", f"Failed to define server attributes: {str(e)}")
        raise

# Main execution
try:
    write_log("Debug", "Starting server_attributes execution 🜰")
    result = define_server_attributes()
    print(f"Server attributes: {result}")
    write_log("Debug", "server_attributes execution completed successfully")
except Exception as e:
    write_log("Error", f"server_attributes execution failed: {str(e)}")
    print(f"server_attributes execution failed: {str(e)}")
    exit(1)