# MUXEDIT Metadata: ScriptID=f7b2c8e9-1234-4abc-9def-567890abcdef, Version=1.0, Author=LordDarkHelmet, Created=2025-05-08
# Description: ObeliskOS Task Router for dispatching tasks to handlers
# Encoding: UTF-8 BOM

# Configuration
$TaskRouterFile = Join-Path -Path "E:\ALL SCRIPTS FOR BOOK\DARK_STAR" -ChildPath "task_router.json"
$LogDir = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs"
$LogFile = Join-Path -Path $LogDir -ChildPath "router_log.json"

# Function to write logs in JSON Lines format
function Write-RouterLog {
    param (
        [string]$Event,
        [string]$Status,
        [string]$Details
    )
    $logEntry = @{
        Stream = "router"
        Timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
        Payload = @{
            Operation = $Event
            Status = $Status
            Details = $Details
        }
    }
    if ($Status -eq "Error") {
        $logEntry.Payload.GlyphError = $true
        $errorLogFile = Join-Path -Path $LogDir -ChildPath "glyph_error_$(Get-Date -Format 'yyyyMMddHHmmss').log"
        $logEntry | ConvertTo-Json -Compress | Out-File -FilePath $errorLogFile -Append -Encoding UTF8
        $logEntry.Preserve = $true
    }
    $logEntry | ConvertTo-Json -Compress | Out-File -FilePath $LogFile -Append -Encoding UTF8
    # Feed log to Dark_Star
    Invoke-DarkStarLearning -LogEntry $logEntry
}

# Function to feed logs to Dark_Star
function Invoke-DarkStarLearning {
    param (
        [hashtable]$LogEntry
    )
    try {
        $apiBody = $LogEntry | ConvertTo-Json
        Invoke-RestMethod -Uri "http://localhost:8025/process" -Method Post -Body $apiBody -ContentType "application/json"
    } catch {
        Write-RouterLog -Event "DarkStarLearning" -Status "Error" -Details "Failed to send log to Dark_Star: $($_.Exception.Message)"
    }
}

# Function to initialize task router
function Initialize-TaskRouter {
    try {
        if (-not (Test-Path $TaskRouterFile)) {
            $taskRouter = @{
                "generate" = "ScriptGenerator"
                "deploy" = "DeploymentHandler"
                "encrypt" = "MUXEDIT"
                "ask" = "DialogAgent"
                "compile miff" = "MiffCompiler"
                "build server" = "AntBuilder"
                "generate mission" = "LuaGenerator"
                "generate cpp" = "CppGenerator"
            }
            $utf8Bom = New-Object System.Text.UTF8Encoding($true)
            [System.IO.File]::WriteAllText($TaskRouterFile, ($taskRouter | ConvertTo-Json), $utf8Bom)
            Write-RouterLog -Event "TaskRouterInit" -Status "Success" -Details "Initialized task router at $TaskRouterFile"
        }
        # Validate script
        Invoke-Validation -Script "validate_outputs.ps1" -File $TaskRouterFile
    } catch {
        Write-RouterLog -Event "TaskRouterInit" -Status "Error" -Details "Failed to initialize task router: $($_.Exception.Message)"
        throw
    }
}

# Function to load task router
function Load-TaskRouter {
    try {
        if (Test-Path $TaskRouterFile) {
            $content = Get-Content $TaskRouterFile -Raw
            $taskRouter = $content | ConvertFrom-Json
            Write-RouterLog -Event "TaskRouterLoad" -Status "Success" -Details "Loaded task router from $TaskRouterFile"
            return $taskRouter
        }
        Write-RouterLog -Event "TaskRouterLoad" -Status "Error" -Details "Task router file not found: $TaskRouterFile"
        return @{}
    } catch {
        Write-RouterLog -Event "TaskRouterLoad" -Status "Error" -Details "Failed to load task router: $($_.Exception.Message)"
        throw
    }
}

# Function to route tasks
function Route-Task {
    param (
        [string]$Task,
        [string]$InputFile,
        [string]$OutputFile,
        [hashtable]$Options
    )
    try {
        $taskRouter = Load-TaskRouter
        $handler = $taskRouter.$Task
        if (-not $handler) {
            throw "No handler defined for task: $Task"
        }
        Write-RouterLog -Event "TaskRouting" -Status "Success" -Details "Routing task $Task to handler $handler"
        return $handler
    } catch {
        Write-RouterLog -Event "TaskRouting" -Status "Error" -Details "Failed to route task $Task: $($_.Exception.Message)"
        throw
    }
}

# Encrypt output for external users
function Encrypt-Output {
    param (
        [string]$FilePath
    )
    try {
        $encryptedFile = "$FilePath.glyph"
        & "glyph_encrypt.ps1" -File $FilePath -Output $encryptedFile -Algorithm AES256
        Write-RouterLog -Event "OutputEncryption" -Status "Success" -Details "Encrypted $FilePath to $encryptedFile"
        return $encryptedFile
    } catch {
        Write-RouterLog -Event "OutputEncryption" -Status "Error" -Details "Failed to encrypt $FilePath: $($_.Exception.Message)"
        throw
    }
}