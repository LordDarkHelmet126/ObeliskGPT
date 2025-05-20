# MUXEDIT Metadata: ScriptID=7m8n9o0p-1q2r-3s4t-5u6v-7w8x9y0z, Version=1.0, Author=LordDarkHelmet, Created=2025-05-08
# Description: Tracks glyph lineage for ObeliskOS
# Encoding: UTF-8 with BOM

$LogFile = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs\obeliskos_lineage_log.json"

function Track-GlyphLineage {
    param ($Glyph)
    $hash = Compute-SHA256Hash -Data $Glyph
    $record = @{ GlyphId = $Glyph.Id; Hash = $hash; Timestamp = Get-Date }
    Write-Log -LogFile $LogFile -Event "LineageTracked" -Details $record
    return $record
}