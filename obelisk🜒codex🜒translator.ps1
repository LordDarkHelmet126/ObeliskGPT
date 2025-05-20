# MUXEDIT Metadata: ScriptID=a7f9b2e3-c6d5-4e8a-9b3c-2f5d7e9a1b0c, Version=1.1, Author=LordDarkHelmet, Created=2025-05-09, Language=Obelisk🜒, Glyph=🜒
# Description: Translates between glyphs and English/script content using the OSL 1024-glyph codex, supporting compound glyphs
# Encoding: UTF-8

$MasterDir = "F:\MASTER"
$DbPath = "$MasterDir\Support\glyph🜒mappings.sqlite"
$LogFile = "$MasterDir\Logs\codex🜒translator🜒log.json"

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

# Resolve compound glyph
function Resolve-CompoundGlyph {
    param ($TertiaryGlyph)
    if ($TertiaryGlyph.Length -eq 2) {  # Compound glyph
        $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
        $conn.Open()
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = "SELECT Meaning FROM CompoundGlyphs WHERE CompoundID = @CompoundID"
        $cmd.Parameters.AddWithValue("@CompoundID", $TertiaryGlyph) | Out-Null
        $meaning = $cmd.ExecuteScalar()
        $conn.Close()
        return $meaning
    }
    return $TertiaryGlyph  # Single glyph
}

# Translate glyph sequence to English
function Translate-GlyphToEnglish {
    param ($GlyphSequence)
    try {
        $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
        $conn.Open()
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = "SELECT * FROM VisualGlyphMappings WHERE GlyphRepresentation = @GlyphRep"
        $glyphRepLength = if ($GlyphSequence -match "_\d{4}$") { 7 } else { 5 }  # Adjust for compound glyphs
        $cmd.Parameters.AddWithValue("@GlyphRep", $GlyphSequence.Substring(0, $glyphRepLength))  # Base glyph (e.g., 🜒🜤🜆_001)
        $reader = $cmd.ExecuteReader()
        if (-not $reader.Read()) {
            $reader.Close()
            $conn.Close()
            throw "Glyph sequence $GlyphSequence not found in codex"
        }

        $englishMeaning = $reader["EnglishMeaning"]
        $entityType = $reader["EntityType"]
        $tertiaryGlyph = $reader["TertiaryGlyph"]
        $reader.Close()

        # Resolve compound glyph meaning
        $tertiaryMeaning = Resolve-CompoundGlyph -TertiaryGlyph $tertiaryGlyph
        $baseMeaning = if ($tertiaryMeaning -ne $tertiaryGlyph) { "$englishMeaning ($tertiaryMeaning)" } else { $englishMeaning }

        # Parse create action glyphs
        $actionDescription = ""
        $actionGlyphs = $GlyphSequence.Substring($glyphRepLength)
        foreach ($actionGlyph in $actionGlyphs.ToCharArray()) {
            $actionDescription += switch ($actionGlyph) {
                "🝀" { "Repeat 1 time" }
                "🝁" { "Repeat 2 times" }
                "🝂" { "Repeat 3 times" }
                "🝃" { "Repeat 4 times" }
                "🝄" { "Repeat 5 times" }
                "🝠" { "Multiply by 1" }
                "🝡" { "Multiply by 2" }
                "🝢" { "Multiply by 3" }
                "🝣" { "Multiply by 4" }
                "🝤" { "Multiply by 5" }
                "🞀" { "Execute with high priority" }
                "🞁" { "Execute with low priority" }
                "🞂" { "Execute in background" }
                "🞃" { "Synchronize" }
                "🞄" { "Execute asynchronously" }
                "🞰" { "If condition applies: " }
                "🞱" { "Else: " }
                "🞴" { "Stop execution" }
                "🞺" { "Add to result" }
                "🞻" { "Subtract from result" }
                "🞼" { "Logical AND" }
                "🞽" { "Logical OR" }
                "🞾" { "Logical NOT" }
                default { "Unknown action" }
            }
            $actionDescription += " "
        }

        $conn.Close()
        $result = if ($actionDescription) { "$baseMeaning, $actionDescription" } else { $baseMeaning }
        Write-Output "Translated $GlyphSequence to: $result"
        Log-Event -Event "GlyphToEnglish" -Details "Translated $GlyphSequence to $result"
        return $result
    } catch {
        Write-Output "Error translating glyph $GlyphSequence - $($_.Exception.Message)"
        Log-Event -Event "TranslationError" -Details "Failed to translate $GlyphSequence - $($_.Exception.Message)"
        throw
    }
}

# Translate glyph sequence to script content
function Translate-GlyphToScript {
    param ($GlyphSequence)
    try {
        $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
        $conn.Open()
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = "SELECT * FROM VisualGlyphMappings WHERE GlyphRepresentation = @GlyphRep"
        $glyphRepLength = if ($GlyphSequence -match "_\d{4}$") { 7 } else { 5 }
        $cmd.Parameters.AddWithValue("@GlyphRep", $GlyphSequence.Substring(0, $glyphRepLength))
        $reader = $cmd.ExecuteReader()
        if (-not $reader.Read()) {
            $reader.Close()
            $conn.Close()
            throw "Glyph sequence $GlyphSequence not found in codex"
        }

        $scriptContent = $reader["ScriptContent"]
        $entityType = $reader["EntityType"]
        $reader.Close()
        $conn.Close()

        if (-not $scriptContent -or $entityType -eq "Intent" -or $entityType -eq "File") {
            throw "No script content available for $GlyphSequence (EntityType: $entityType)"
        }

        # Apply create action glyphs (simplified for demo)
        $modifiedContent = $scriptContent
        $actionGlyphs = $GlyphSequence.Substring($glyphRepLength)
        foreach ($actionGlyph in $actionGlyphs.ToCharArray()) {
            if ($actionGlyph -eq "🝡") {  # Multiply by 2 (e.g., double the output)
                $modifiedContent = "# Multiplied by 2`n$modifiedContent`n# Multiplied by 2"
            }
        }

        Write-Output "Translated $GlyphSequence to script content"
        Log-Event -Event "GlyphToScript" -Details "Translated $GlyphSequence to script content"
        return $modifiedContent
    } catch {
        Write-Output "Error translating glyph $GlyphSequence to script - $($_.Exception.Message)"
        Log-Event -Event "TranslationError" -Details "Failed to translate $GlyphSequence to script - $($_.Exception.Message)"
        throw
    }
}

# Translate English to glyph sequence
function Translate-EnglishToGlyph {
    param ($EnglishInput)
    try {
        $conn = New-Object -TypeName System.Data.SQLite.SQLiteConnection -ArgumentList "Data Source=$DbPath;Version=3;"
        $conn.Open()
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = "SELECT * FROM VisualGlyphMappings WHERE EnglishMeaning LIKE @Meaning"
        $cmd.Parameters.AddWithValue("@Meaning", "%$EnglishInput%")
        $reader = $cmd.ExecuteReader()
        if (-not $reader.Read()) {
            $reader.Close()
            $conn.Close()
            throw "English meaning '$EnglishInput' not found in codex"
        }

        $glyphRep = $reader["GlyphRepresentation"]
        $glyphSequence = $reader["GlyphSequence"]
        $reader.Close()
        $conn.Close()

        $result = if ($glyphSequence) { $glyphSequence } else { $glyphRep }
        Write-Output "Translated '$EnglishInput' to $result"
        Log-Event -Event "EnglishToGlyph" -Details "Translated '$EnglishInput' to $result"
        return $result
    } catch {
        Write-Output "Error translating English '$EnglishInput' to glyph - $($_.Exception.Message)"
        Log-Event -Event "TranslationError" -Details "Failed to translate '$EnglishInput' to glyph - $($_.Exception.Message)"
        throw
    }
}

# Main execution (example usage)
try {
    Write-Output "Starting codex translation at $(Get-Date)"
    Log-Event -Event "TranslationStarted" -Details "Initiated codex translation"

    # Example translations
    $glyphSeq = "🜒🜤🜆🝡"
    $english = Translate-GlyphToEnglish -GlyphSequence $glyphSeq
    Write-Output "English: $english"

    $script = Translate-GlyphToScript -GlyphSequence $glyphSeq
    Write-Output "Script Content:`n$script"

    $glyph = Translate-EnglishToGlyph -EnglishInput "Memory management script"
    Write-Output "Glyph: $glyph"

    Write-Output "Codex translation completed at $(Get-Date)"
    Log-Event -Event "TranslationCompleted" -Details "All translations executed successfully"
} catch {
    Write-Output "Error: $($_.Exception.Message)"
    Log-Event -Event "TranslationFailed" -Details $_.Exception.Message
    throw
}