# 🜰 ObeliskGPT ready.

# MUXEDIT Metadata Block
# ───────────────────────────────────────────────
# ScriptID: 2d3e4f5a-6b7c-8d9e-0a1b-2c3d4e5f6a7b
# Version: 1.1
# Author: ObeliskGPT
# Created: 2025-05-06
# operation_id: obeliskos_cleanup_suite
# purpose: Orchestrates cleanup_codex.exe execution with redundancy, validation, and logging, saving to E:\ and copying exe to Desktop
# Codename: LordDarkHelmet
# Layer: Script Author
# Identity Hash: LDH-2025-AXIS
# Signature Glyph: L~o~r~d~D~a~r~k~H~e~[l][m]e~[t]
# sig_hash: HMAC256-LDH-2025:...
# ───────────────────────────────────────────────

# Configuration
$RootDir = "E:\Temp folder for MD and scripts\SCRIPT FOR SCHEDULED FILE MAINTAINENCE"
$LogDir = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs"
$OutputDir = "E:\Temp folder for MD and scripts\output"
$ExePath = "$RootDir\cleanup_codex.exe"
$DesktopExePath = "C:\Users\S\Desktop\cleanup_codex.exe"
$PythonScriptPath = "$RootDir\cleanup_codex.py"
$SpecFilePath = "$RootDir\cleanup_codex.spec"
$LogFile = Join-Path $LogDir "cleanup_suite_log.json"
$SQLiteDB = "$OutputDir\database\obeliskos_data.db"
$WrapperScript = "$RootDir\cleanup_codex_wrapper_v2.ps1"
$CheckLogsScript = "$RootDir\check_cleanup_codex_logs.ps1"
$StandardizerScript = "$RootDir\obeliskos_standardizer.ps1"
$FixPermissionsScript = "$RootDir\obeliskos_fix_permissions.ps1"
$ScheduleSetupScript = "$RootDir\obeliskos_schedule_setup.ps1"
$ValidateScript = "$RootDir\validate_five_rings.ps1"
$DarkStarScript = "$RootDir\dark_star_cognition_core.ps1"
$PyInstallerPath = "pyinstaller" # Ensure PyInstaller is in PATH or provide full path

# Ensure Directories Exist
foreach ($dir in @($RootDir, $LogDir, $OutputDir, "$OutputDir\logs", "$OutputDir\logs_backup", "$OutputDir\archive", "$OutputDir\backups", "$OutputDir\processed", "$OutputDir\registry", "$OutputDir\database")) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force
    }
}

# Function to log events
function Log-Event {
    param ($Event, $Details)
    $logEntry = @{
        Timestamp = (Get-Date).ToString("o")
        Event = $Event
        Details = $Details
    }
    $logEntry | ConvertTo-Json | Add-Content -Path $LogFile
}

# Function to log to SQLite
function Log-ToSQLite {
    param ($Event, $Details)
    try {
        $conn = New-Object System.Data.SQLite.SQLiteConnection("Data Source=$SQLiteDB;Version=3;")
        $conn.Open()
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = "INSERT INTO logs (timestamp, event, details) VALUES (@timestamp, @event, @details)"
        $cmd.Parameters.AddWithValue("@timestamp", (Get-Date -Format "o"))
        $cmd.Parameters.AddWithValue("@event", $Event)
        $cmd.Parameters.AddWithValue("@details", $Details)
        $cmd.ExecuteNonQuery()
        $conn.Close()
        Write-Output "SQLite Log: $Event - $Details"
    } catch {
        Write-Output "SQLite Log Error: $($_.Exception.Message)"
        Log-Event -Event "SQLiteLogFailure" -Details $_.Exception.Message
    }
}

# Function to compile cleanup_codex.exe and copy to Desktop
function Compile-CleanupCodex {
    if (-not (Test-Path $PythonScriptPath) -or -not (Test-Path $SpecFilePath)) {
        throw "Missing cleanup_codex.py or cleanup_codex.spec"
    }
    if (-not (Test-Path $ExePath)) {
        Write-Output "Compiling cleanup_codex.exe to $ExePath..."
        $result = Start-Process -FilePath $PyInstallerPath -ArgumentList "--specpath `"$SpecFilePath`" `"$PythonScriptPath`" --distpath `"$RootDir`" --workpath `"$OutputDir\build`" --noconfirm" -NoNewWindow -Wait -PassThru
        if ($result.ExitCode -eq 0) {
            Write-Output "Compilation successful: $ExePath"
            Log-Event -Event "CompilationSuccess" -Details "cleanup_codex.exe compiled to $ExePath"
            Log-ToSQLite -Event "CompilationSuccess" -Details "cleanup_codex.exe compiled to $ExePath"
            # Copy to Desktop
            Copy-Item -Path $ExePath -Destination $DesktopExePath -Force
            if (Test-Path $DesktopExePath) {
                Write-Output "Copied cleanup_codex.exe to $DesktopExePath"
                Log-Event -Event "CopySuccess" -Details "cleanup_codex.exe copied to $DesktopExePath"
                Log-ToSQLite -Event "CopySuccess" -Details "cleanup_codex.exe copied to $DesktopExePath"
            } else {
                throw "Failed to copy cleanup_codex.exe to $DesktopExePath"
            }
        } else {
            throw "Compilation failed with exit code $($result.ExitCode)"
        }
    }
}

# Function to update wrapper script with correct path
function Update-WrapperScript {
    $content = Get-Content -Path $WrapperScript -Raw
    $updatedContent = $content -replace '\$ExePath = ".*"', "`$ExePath = `"$ExePath`""
    Set-Content -Path $WrapperScript -Value $updatedContent -Encoding UTF8
    Write-Output "Updated $WrapperScript with ExePath: $ExePath"
    Log-Event -Event "WrapperUpdateSuccess" -Details "Updated ExePath to $ExePath"
    Log-ToSQLite -Event "WrapperUpdateSuccess" -Details "Updated ExePath to $ExePath"
}

# Function to execute wrapper script with retries
function Execute-WrapperScript {
    $retryCount = 0
    $maxRetries = 3
    $success = $false
    while (-not $success -and $retryCount -lt $maxRetries) {
        try {
            $result = & $WrapperScript
            if ($result -match "Cleanup completed successfully") {
                Write-Output "Wrapper script executed successfully"
                Log-Event -Event "WrapperExecutionSuccess" -Details "cleanup_codex.exe executed"
                Log-ToSQLite -Event "WrapperExecutionSuccess" -Details "cleanup_codex.exe executed"
                $success = $true
            } else {
                throw "Wrapper script failed"
            }
        } catch {
            $retryCount++
            Write-Output "Retry $retryCount/$maxRetries failed: $($_.Exception.Message)"
            Log-Event -Event "WrapperExecutionRetry" -Details "Retry $retryCount failed: $($_.Exception.Message)"
            Start-Sleep -Seconds 5
        }
    }
    if (-not $success) {
        throw "Wrapper script execution failed after $maxRetries retries"
    }
}

# Main execution
try {
    Write-Output "Starting ObeliskOS Cleanup Suite..."
    Log-Event -Event "SuiteStarted" -Details "Cleanup suite initiated"

    # Fix permissions
    if (Test-Path $FixPermissionsScript) {
        & $FixPermissionsScript
        Write-Output "Permissions fixed"
        Log-Event -Event "PermissionsFixed" -Details "Ran obeliskos_fix_permissions.ps1"
    }

    # Standardize files
    if (Test-Path $StandardizerScript) {
        & $StandardizerScript
        Write-Output "Files standardized"
        Log-Event -Event "StandardizationComplete" -Details "Ran obeliskos_standardizer.ps1"
    }

    # Compile cleanup_codex.exe and copy to Desktop
    Compile-CleanupCodex

    # Update wrapper script
    Update-WrapperScript

    # Validate wrapper script
    if (Test-Path $ValidateScript) {
        $validationResult = & $ValidateScript -File $WrapperScript
        if (-not $validationResult) {
            throw "Five Rings Validation failed for $WrapperScript"
        }
        Write-Output "Wrapper script validated"
        Log-Event -Event "ValidationSuccess" -Details "Five Rings Validation passed for $WrapperScript"
    }

    # Execute wrapper script
    Execute-WrapperScript

    # Check logs
    if (Test-Path $CheckLogsScript) {
        & $CheckLogsScript
        Write-Output "Logs checked"
        Log-Event -Event "LogCheckComplete" -Details "Ran check_cleanup_codex_logs.ps1"
    }

    # Schedule daily execution
    if (Test-Path $ScheduleSetupScript) {
        & $ScheduleSetupScript
        Write-Output "Scheduled task set up"
        Log-Event -Event "ScheduleSetupComplete" -Details "Ran obeliskos_schedule_setup.ps1"
    }

    # Trigger Dark_Star learning
    if (Test-Path $DarkStarScript) {
        & $DarkStarScript -LogFile "$LogDir\cognition_log.json" -Script "obeliskos_cleanup_suite.ps1"
        Write-Output "Dark_Star learning triggered"
        Log-Event -Event "DarkStarLearningComplete" -Details "Ran dark_star_cognition_core.ps1"
    }

    Write-Output "Cleanup suite completed successfully"
    Log-Event -Event "SuiteCompleted" -Details "All tasks executed successfully"
    Log-ToSQLite -Event "SuiteCompleted" -Details "All tasks executed successfully"
} catch {
    Write-Output "Error: $($_.Exception.Message)"
    Log-Event -Event "SuiteFailed" -Details $_.Exception.Message
    Log-ToSQLite -Event "SuiteFailed" -Details $_.Exception.Message
}

# Codex Footer
# file_id: obeliskos_cleanup_suite.ps1
# schema: obeliskos_codex_v1
# lines: 160
# words: 520
# glyphs: 🜰:INIT, 🜁:COMPUTE, 🜅:SCHEDULE
# translator_ready: true