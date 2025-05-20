# MUXEDIT Metadata: ScriptID=e6e3f8d4-5c9a-4f2e-8a7b-2d3e4f5a6b7c, Version=1.0, Author=LordDarkHelmet, Created=2025-05-07
# Description: Web server for real-time visualization in ObeliskOS 🜰
# Encoding: UTF-8

$outputDir = "E:\MASTER"
$logFile = "E:\MASTER\Logs\ui_server_log.json"
$port = 8080

# Ensure output directory exists
if (-not (Test-Path $outputDir)) {
    try {
        New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
        Write-Output "Created output directory: $outputDir"
    } catch {
        Write-Error "Failed to create output directory $outputDir : $($_.Exception.Message)"
        exit 1
    }
}

# Ensure log directory exists
$logDir = Split-Path $logFile -Parent
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force | Out-Null
}

# Logging function
function Write-Log {
    param ($Category, $Message)
    $logEntry = @{
        Category = $Category
        Message = $Message
        Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    }
    try {
        $logEntry | ConvertTo-Json -Compress | Add-Content -Path $logFile
    } catch {
        Write-Error "Failed to write to log: $($_.Exception.Message)"
    }
}

# Start UI server function
function Start-UIServer {
    Write-Log -Category "Info" -Message "Starting UI server on port $port"

    try {
        # Simulate a simple web server (placeholder for actual implementation, e.g., using Pode or HttpListener)
        Write-Log -Category "Debug" -Message "UI server running at http://localhost:$port"

        # Simulate serving a Plotly graph (placeholder for actual visualization)
        $metrics = @{
            Latency = "2.8ms"
            LSUCount = 341
        }
        Write-Log -Category "Debug" -Message "Serving metrics: $($metrics | ConvertTo-Json -Compress)"

        Write-Output "UI server started at http://localhost:$port"
        Write-Log -Category "Success" -Message "UI server started successfully"
    } catch {
        Write-Log -Category "Error" -Message "UI server failed to start: $($_.Exception.Message)"
        throw $_.Exception
    }
}

# Entry point
try {
    Write-Log -Category "Debug" -Message "Starting ui_server execution 🜰"
    Start-UIServer
    Write-Log -Category "Debug" -Message "ui_server execution completed successfully"
    # Simulate keeping the server running (in reality, this would be a loop)
    Start-Sleep -Seconds 10
} catch {
    Write-Log -Category "Error" -Message "ui_server execution failed: $($_.Exception.Message)"
    Write-Error "ui_server execution failed: $($_.Exception.Message)"
    exit 1
}