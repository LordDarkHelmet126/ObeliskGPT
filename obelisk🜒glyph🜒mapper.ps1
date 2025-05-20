# MUXEDIT Metadata: ScriptID=f7d8e9a0-b1c2-4d3e-9f4a-5b6c7d8e9f0a, Version=1.4, Author=LordDarkHelmet, Created=2025-05-09, Language=Obelisk🜒, Glyph=🜒
# Description: Maps files, functions, intents, and names to visual glyph representations, including compound glyphs
# Encoding: UTF-8

$MasterDir = "F:\MASTER"
$DbPath = "$MasterDir\Support\glyph🜒mappings.sqlite"
$LogFile = "$MasterDir\Logs\glyph🜒mapper🜒log.json"

# Glyph table (subset for demonstration)
$GlyphTable = @{
    "Secondary" = @{
        "Script" = "🜤"
        "Function" = "🜁"
        "Intent" = "🜃"
        "File" = "🜅"
    }
    "Tertiary" = @{
        "Memory" = "🜆"
        "Cleanup" = "🜇"
        "Log" = "🜈"
        "Encode" = "🜉"
        "Initialize" = "🜊"
        "Default" = "🜒"
    }
    "CreateAction" = @{
        "Repeat" = @{
            "1" = "🝀"
            "2" = "🝁"
            "3" = "🝂"
            "4" = "🝃"
            "5" = "🝄"
        }
        "Multiply" = @{
            "1" = "🝠"
            "2" = "🝡"
            "3" = "🝢"
            "4" = "🝣"
            "5" = "🝤"
        }
        "IntentModifier" = @{
            "HighPriority" = "🞀"
            "LowPriority" = "🞁"
            "Background" = "🞂"
            "Synchronize" = "🞃"
            "Async" = "🞄"
        }
        "ControlFlow" = @{
            "If" = "🞰"
            "Else" = "🞱"
            "LoopStart" = "🞲"
            "LoopEnd" = "🞳"
            "Stop" = "🞴"
        }
        "Operator" = @{
            "Add" = "🞺"
            "Subtract" = "🞻"
            "And" = "🞼"
            "Or" = "🞽"
            "Not" = "🞾"
        }
    }
}

# Initialize SQLite database
function Initialize-GlyphMappingsDb {
    $createTablesQuery = @"
CREATE TABLE IF NOT EXISTS VisualGlyphMappings (
    EntityID TEXT PRIMARY KEY,
    EntityType TEXT,
    Name TEXT,
    GlyphRepresentation TEXT,
    SecondaryGlyph TEXT,
    TertiaryGlyph TEXT,
    EnglishMeaning TEXT,
    ScriptContent TEXT,
    GlyphSequence TEXT,
    CreateActionGlyphs TEXT,
    Timestamp INTEGER
);

CREATE TABLE IF NOT EXISTS CompoundGlyphs (
    CompoundID TEXT PRIMARY KEY,
    Glyph1 TEXT,
    Glyph2 TEXT,
    Meaning TEXT,
    Timestamp INTEGER
);
"@
    $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
    $conn.Open()
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $createTablesQuery
    $cmd.ExecuteNonQuery() | Out-Null
    $conn.Close()
}

# Log events
function Log-Event {
    param ($Event, $Details)
    $logEntry = @{
        Timestamp = (Get-Date).ToString("o")
        Event = $Event
        Details = $Details
    }
    $logEntry | ConvertTo-Json | Out-File -FilePath $LogFile -Append -Encoding utf8BOM
}

# Determine tertiary glyph based on entity name
function Get-TertiaryGlyph {
    param ($Name)
    if ($Name -match "memory" -or $Name -match "mem") { return $GlyphTable.Tertiary.Memory }
    if ($Name -match "cleanup") { return $GlyphTable.Tertiary.Cleanup }
    if ($Name -match "log") { return $GlyphTable.Tertiary.Log }
    if ($Name -match "encode") { return $GlyphTable.Tertiary.Encode }
    if ($Name -match "initialize" -or $Name -match "init") { return $GlyphTable.Tertiary.Initialize }
    return $GlyphTable.Tertiary.Default
}

# Generate compound glyph if needed
function Get-CompoundGlyph {
    param ($Name, $EntityType)
    $baseGlyph = Get-TertiaryGlyph -Name $Name
    $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
    $conn.Open()
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = "SELECT COUNT(*) FROM VisualGlyphMappings WHERE EntityType = @EntityType AND TertiaryGlyph = @TertiaryGlyph"
    $cmd.Parameters.AddWithValue("@EntityType", $EntityType) | Out-Null
    $cmd.Parameters.AddWithValue("@TertiaryGlyph", $baseGlyph) | Out-Null
    $count = $cmd.ExecuteScalar()

    if ($count -lt 999) {
        $conn.Close()
        return $baseGlyph
    }

    # Create a compound glyph
    $secondGlyph = Get-TertiaryGlyph -Name ($Name + "Compound")
    $compoundID = "$baseGlyph$secondGlyph"
    $cmd.CommandText = "INSERT OR IGNORE INTO CompoundGlyphs (CompoundID, Glyph1, Glyph2, Meaning, Timestamp) VALUES (@CompoundID, @Glyph1, @Glyph2, @Meaning, @Timestamp)"
    $cmd.Parameters.Clear()
    $cmd.Parameters.AddWithValue("@CompoundID", $compoundID) | Out-Null
    $cmd.Parameters.AddWithValue("@Glyph1", $baseGlyph) | Out-Null
    $cmd.Parameters.AddWithValue("@Glyph2", $secondGlyph) | Out-Null
    $cmd.Parameters.AddWithValue("@Meaning", "Compound for $Name") | Out-Null
    $cmd.Parameters.AddWithValue("@Timestamp", [int](Get-Date -UFormat %s)) | Out-Null
    $cmd.ExecuteNonQuery() | Out-Null
    $conn.Close()
    return $compoundID
}

# Generate base glyph representation
function Generate-GlyphRepresentation {
    param ($EntityType, $TertiaryGlyph, $Identifier)
    $primaryGlyph = "🜒"
    $secondaryGlyph = $GlyphTable.Secondary[$EntityType]
    return "$primaryGlyph$secondaryGlyph$TertiaryGlyph_$Identifier"
}

# Extract script content for functions
function Extract-FunctionContent {
    param ($FilePath, $FunctionName)
    $content = Get-Content $FilePath -Raw
    $lines = $content -split "`n"
    $functionStart = -1
    $functionEnd = -1
    $braceCount = 0
    for ($i = 0; $i -lt $lines.Length; $i++) {
        $line = $lines[$i].Trim()
        if ($line -match "^function\s+$FunctionName\b") {
            $functionStart = $i
        }
        if ($functionStart -ge 0) {
            if ($line -match "{") { $braceCount++ }
            if ($line -match "}") { $braceCount-- }
            if ($braceCount -eq 0 -and $functionStart -ge 0) {
                $functionEnd = $i
                break
            }
        }
    }
    if ($functionStart -ge 0 -and $functionEnd -ge 0) {
        return ($lines[$functionStart..$functionEnd] -join "`n").Trim()
    }
    return ""
}

# Assign create action glyphs (simplified for demo)
function Assign-CreateActionGlyphs {
    param ($EntityType, $Name)
    $actions = ""
    if ($Name -match "cleanup") {
        $actions += $GlyphTable.CreateAction.Repeat."3"  # Repeat 3 times
        $actions += $GlyphTable.CreateAction.IntentModifier.HighPriority
    }
    if ($Name -match "memory" -or $Name -match "mem") {
        $actions += $GlyphTable.CreateAction.Multiply."2"  # Multiply by 2
    }
    return $actions
}

# Map entity to glyph representation
function Map-EntityToGlyph {
    param ($EntityID, $EntityType, $Name, $Meaning, $ScriptContent)
    $tertiaryGlyph = Get-CompoundGlyph -Name $Name -EntityType $EntityType
    $identifier = (Get-Random -Minimum 1 -Maximum 9999).ToString("D4")
    $glyphRep = Generate-GlyphRepresentation -EntityType $EntityType -TertiaryGlyph $tertiaryGlyph -Identifier $identifier
    $createActions = Assign-CreateActionGlyphs -EntityType $EntityType -Name $Name
    $glyphSequence = "$glyphRep$createActions"

    $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
    $conn.Open()
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = @"
INSERT OR REPLACE INTO VisualGlyphMappings (EntityID, EntityType, Name, GlyphRepresentation, SecondaryGlyph, TertiaryGlyph, EnglishMeaning, ScriptContent, GlyphSequence, CreateActionGlyphs, Timestamp)
VALUES (@EntityID, @EntityType, @Name, @GlyphRepresentation, @SecondaryGlyph, @TertiaryGlyph, @EnglishMeaning, @ScriptContent, @GlyphSequence, @CreateActionGlyphs, @Timestamp)
"@
    $cmd.Parameters.AddWithValue("@EntityID", $EntityID) | Out-Null
    $cmd.Parameters.AddWithValue("@EntityType", $EntityType) | Out-Null
    $cmd.Parameters.AddWithValue("@Name", $Name) | Out-Null
    $cmd.Parameters.AddWithValue("@GlyphRepresentation", $glyphRep) | Out-Null
    $cmd.Parameters.AddWithValue("@SecondaryGlyph", $GlyphTable.Secondary[$EntityType]) | Out-Null
    $cmd.Parameters.AddWithValue("@TertiaryGlyph", $tertiaryGlyph) | Out-Null
    $cmd.Parameters.AddWithValue("@EnglishMeaning", $Meaning) | Out-Null
    $cmd.Parameters.AddWithValue("@ScriptContent", $ScriptContent) | Out-Null
    $cmd.Parameters.AddWithValue("@GlyphSequence", $glyphSequence) | Out-Null
    $cmd.Parameters.AddWithValue("@CreateActionGlyphs", $createActions) | Out-Null
    $cmd.Parameters.AddWithValue("@Timestamp", [int](Get-Date -UFormat %s)) | Out-Null
    $cmd.ExecuteNonQuery() | Out-Null
    $conn.Close()

    Write-Output "Mapped $EntityType $Name to $glyphSequence"
    Log-Event -Event "GlyphMapped" -Details "Mapped $EntityType $Name to $glyphSequence"
}

# Main execution
try {
    Write-Output "Starting glyph mapping at $(Get-Date)"
    Log-Event -Event "MappingStarted" -Details "Initiated glyph mapping"

    # Initialize database
    Initialize-GlyphMappingsDb

    # Map scripts and files
    $files = Get-ChildItem -Path $MasterDir -Recurse -File | Where-Object { $_.Extension -in @(".ps1", ".py", ".md", ".json", ".txt") }
    foreach ($file in $files) {
        $entityID = [guid]::NewGuid().ToString()
        $entityType = if ($file.Extension -in @(".ps1", ".py")) { "Script" } else { "File" }
        $name = $file.Name
        $meaning = if ($entityType -eq "Script") { "Script for $($file.BaseName)" } else { "File: $($file.BaseName)" }
        $scriptContent = if ($entityType -eq "Script") { Get-Content $file.FullName -Raw } else { "" }
        Map-EntityToGlyph -EntityID $entityID -EntityType $entityType -Name $name -Meaning $meaning -ScriptContent $scriptContent

        # Map functions in scripts
        if ($entityType -eq "Script") {
            $content = Get-Content $file.FullName -Raw
            $lines = $content -split "`n"
            foreach ($line in $lines) {
                if ($line -match "^function\s+([A-Za-z0-9-]+)") {
                    $functionName = $matches[1]
                    $functionContent = Extract-FunctionContent -FilePath $file.FullName -FunctionName $functionName
                    Map-EntityToGlyph -EntityID $functionName -EntityType "Function" -Name $functionName -Meaning "Function in $name" -ScriptContent $functionContent
                }
            }
        }
    }

    # Map intents
    $intents = @(
        @{ Name = "Cleanup"; Meaning = "Cleans up and reorganizes files" },
        @{ Name = "Encode"; Meaning = "Encodes data into glyph language" },
        @{ Name = "Initialize"; Meaning = "Initializes system components" }
    )
    foreach ($intent in $intents) {
        Map-EntityToGlyph -EntityID "Intent_$($intent.Name)" -EntityType "Intent" -Name $intent.Name -Meaning $intent.Meaning -ScriptContent ""
    }

    Write-Output "Glyph mapping completed at $(Get-Date)"
    Log-Event -Event "MappingCompleted" -Details "All glyph mappings generated successfully"
} catch {
    Write-Output "Error: $($_.Exception.Message)"
    Log-Event -Event "MappingFailed" -Details $_.Exception.Message
    throw
}