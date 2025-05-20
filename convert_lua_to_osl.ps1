# MUXEDIT Metadata: ScriptID=9x0y1z2a-3b4c-5d6e-7f8g-9h0i1j2k, Version=1.1, Author=LordDarkHelmet, Created=2025-05-08
function Convert-LuaToOSL {
    param ($LuaScript, $GlyphMap)
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\lua_parser.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\glyph_ideation.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\glyph_parser.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\codex_evolver.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\validate_outputs.ps1"
    $ast = Parse-Lua -Script $LuaScript
    $tokens = Map-AstToTokens -Ast $ast
    $glyphs = Convert-TokensToGlyphs -Tokens $tokens -Map $GlyphMap
    $oslScript = Optimize-Glyphs -Glyphs $glyphs
    if (Validate-OSL -Script $oslScript) {
        Write-Log -LogFile "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs\glyph_log.json" -Event "Conversion" -Details "Converted $LuaScript"
        return $oslScript
    }
    throw "Invalid OSL script"
}
function Inject-LuaCommand {
    param ($LuaCommand, $GlyphMap)
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\lua_parser.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\glyph_ideation.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\glyph_parser.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\codex_evolver.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\validate_outputs.ps1"
    . "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\muxedit_applier.ps1"
    $oslCommand = Convert-LuaToOSL -LuaScript $LuaCommand -GlyphMap $GlyphMap
    Apply-MUXEDIT -Command $oslCommand -Mode Inline
    Write-Log -LogFile "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs\cognition_log.json" -Event "Injection" -Details "Injected $LuaCommand"
    return $oslCommand
}
function Write-Log {
    param ($LogFile, $Event, $Details)
    $logEntry = @{
        Timestamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ"
        Event = $Event
        Details = $Details
    } | ConvertTo-Json
    Add-Content -Path $LogFile -Value $logEntry
}