# -*- coding: UTF-8 -*-
"""
Description: Starts a Dark_Star service in ObeliskOS 🜰
"""

import json
import os
from datetime import datetime

# Paths
output_dir = r"E:\MASTER"
log_file = os.path.join(output_dir, "Logs", "darkstar_service_log.json")

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

# Start Dark_Star service function
def start_darkstar_service():
    write_log("Info", "Starting Dark_Star service")

    try:
        # Simulate starting the Dark_Star service (placeholder for actual implementation)
        service_status = {
            "service": "Dark_Star",
            "status": "Running",
            "port": 8081
        }
        write_log("Success", f"Dark_Star service started: {json.dumps(service_status, separators=(',', ':'))}")
        return service_status
    except Exception as e:
        write_log("Error", f"Failed to start Dark_Star service: {str(e)}")
        raise

# Main execution
try:
    write_log("Debug", "Starting start_darkstar_service execution 🜰")
    result = start_darkstar_service()
    print(f"Dark_Star service status: {result}")
    write_log("Debug", "start_darkstar_service execution completed successfully")
except Exception as e:
    write_log("Error", f"start_darkstar_service execution failed: {str(e)}")
    print(f"start_darkstar_service execution failed: {str(e)}")
    exit(1)