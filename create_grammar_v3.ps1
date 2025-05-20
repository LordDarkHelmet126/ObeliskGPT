# MUXEDIT Metadata: ScriptID=3b4c5d6e-7f8g-9h0i-1j2k-3l4m5n6o, Version=1.1, Author=LordDarkHelmet, Created=2025-05-08
$grammarPath = "E:\ALL SCRIPTS FOR BOOK\DARK_STAR\docs\obeliskos_grammar_v3.md"
$grammarDir = Split-Path -Path $grammarPath -Parent
if (-not (Test-Path $grammarDir)) {
    New-Item -Path $grammarDir -ItemType Directory -Force | Out-Null
}
$grammarContent = @"
# ObeliskOS Grammar v3
## Glyph Codex
- **Total Glyphs**: 2048
- **Base Glyphs** (~1500): Universal operations, e.g.:
  - 🜰:INIT – Initialize process
  - 🜁:COMPUTE – Process logic
  - 🜃:EVENT – Log event
  - 🜅:DATA – Store data
- **Modifiers** (~200): Alter semantics, e.g.:
  - ^: Priority – High precedence
  - ~: Negation – Disable action
  - +: Aggregation – Add value
- **Custom Glyphs** (~348, SWG Table):
  - **SWG-Specific** (~200): e.g., 🦎:WompRat, 🗡️:Lightsaber, 🏜️:MosEisley, 🛡️:Faction=Rebel, 🦑:Spawn, 📁:DirectoryIterate, 📜:ExecuteFile, 📋:ConfigTable, 🖼️:WidgetDefine, 🎮:UIAction, ⚔️:Attack
  - **General-Purpose** (~148): e.g., 🤖:AI=Aggressive, 🎉:Event=CantinaBrawl, 🌐:ModuleLoad, 🛠️:SafeExecute, 📢:LogMessage, 🔍:PatternMatch, 🔗:Concatenate, 🔎:FindPath, 📚:FindLibrary, 🚀:ExecuteProcess, 🏗️:SpawnElement
## Syntax
<program> ::= <statement>*
<statement> ::= <glyph> [<modifier>] <type> <payload> <metadata>
<glyph> ::= 🜰 | 🜁 | 🜃 | 🜅 | 🦎 | 🗡️ | 🏜️ | ... (2048 total)
<modifier> ::= ^ | ~ | + | ...
<type> ::= Event | Compute | Data | Quest | AI | ModLoad | ConfigTable | WidgetDefine | UIAction | Container | ...
<payload> ::= Kill=5 | Damage=50 | Speech=CantinaBanter | File=mod.lua | Module=lfs | Config={...} | Widget=buttonBid | Action=cycleTargetoutward | Image=biomewars-server | ...
<metadata> ::= Faction=Rebel | Location=MosEisley | Timestamp=2025-05-08 | Path=/swg/Mods/ | Style=/Styles.New.buttons.hud.style | Ports=44453,44462 | ...
## Examples
- Quest: ^🜃:Quest:Kill=5:Target=🦎:Reward=100:Location=🏜️
- NPC AI: 🜁:Compute:AI=Attack:Weapon=🗡️:Condition=PlayerNear
- Mod Load: ^🌐:ModLoad:Module=lfs
- Directory Iterate: ^📁:Event:DirectoryIterate:Path=/swg/Mods/
- Config: ^📋:ConfigTable:Client={TOCTreePath=../,maxSearchPriority=12}
- UI: ^🖼️:WidgetDefine:Type=Button:Name=buttonBid:LocalText=@ui_auc:place_bid
- Macro: ^⚔️:Attack:Target=Enemy
- Spawn: ^🏗️:SpawnElement:Type=PATROL:Coordinates=3214.1,5.0,-4868.8
- Container: ^🚀:RunContainer:Image=biomewars-server:Ports=44453,44462
"@
Set-Content -Path $grammarPath -Value $grammarContent -Encoding UTF8
Write-Output "Created $grammarPath"
if (Test-Path $grammarPath) {
    $grammar = Get-Content -Path $grammarPath
    Write-Output "Grammar Modifiers: $($grammar | Select-String 'modifier' | Measure-Object).Count"
}