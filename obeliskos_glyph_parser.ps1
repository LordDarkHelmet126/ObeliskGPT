# MUXEDIT Metadata: ScriptID=4t5u6v7w-8x9y-0z1a-2b3c-4d5e6f7g, Version=1.0, Author=LordDarkHelmet, Created=2025-05-08
# Description: Parses Obelisk🜒 glyphs for ObeliskOS (Config F)
# Encoding: UTF-8 with BOM

$GlyphDb = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\obeliskos_glyph_mappings.sqlite"
$LogFile = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs\obeliskos_glyph_log.json"

function Parse-ObeliskStatement {
    param ($Statement)
    $parts = $Statement -split "[:;]"
    $logic = $Statement -match ":" ? "Sequential" : "Conditional"
    $result = foreach ($part in $parts) {
        $semantic = Invoke-SqliteQuery -Database $GlyphDb -Query "SELECT semantic_role FROM module_glyphs WHERE unicode = '$part' UNION SELECT semantic_role FROM main_glyphs WHERE unicode = '$part'"
        $semantic
    }
    Write-Log -LogFile $LogFile -Event "StatementParsed" -Details $result
    return "$logic ($result)"
}