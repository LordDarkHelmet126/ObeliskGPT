# MUXEDIT Metadata: ScriptID=6l7m8n9o-0p1q-2r3s-4t5u-6v7w8x9y, Version=1.0, Author=LordDarkHelmet, Created=2025-05-08
# Description: Encrypts glyphs for ObeliskOS
# Encoding: UTF-8 with BOM

$LogFile = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\Final Consolidated Folder\Logs\obeliskos_security_log.json"

function Encrypt-Glyph {
    param ($Glyph)
    $encrypted = Invoke-AES256Encrypt -Data $Glyph -Key (Get-Config quantum_config.json)
    $signed = Add-DilithiumSignature -Data $encrypted
    Write-Log -LogFile $LogFile -Event "GlyphEncrypted" -Details $Glyph
    return $signed
}