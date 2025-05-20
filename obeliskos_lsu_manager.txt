# MUXEDIT Metadata: ScriptID=3i4j5k6l-7m8n-9o0p-1q2r-3s4t5u6v, Version=1.0, Author=LordDarkHelmet, Created=2025-05-08
# Description: Manages LSU allocation for ObeliskOS task amplification
# Encoding: UTF-8 with BOM

$LSUCount = 512000
$LSUMemory = 1.2KB
$LSUDisk = 0.5KB
$LogFile = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs\obeliskos_lsu_log.json"

function Allocate-ForceMultiplierTasks {
    param ($GlyphBatch, $LSUs)
    $shards = Split-Batch -GlyphBatch $GlyphBatch -Count $LSUs.Count
    $results = $shards | ForEach-Object -Parallel {
        $lsu = Select-LSU -LSUs $LSUs -Memory $using:LSUMemory -Disk $using:LSUDisk
        Invoke-Glyph -LSU $lsu -Glyph $_
    } -ThrottleLimit $LSUs.Count
    Write-Log -LogFile $using:LogFile -Event "TasksAllocated" -Details $results.Count
    return $results
}