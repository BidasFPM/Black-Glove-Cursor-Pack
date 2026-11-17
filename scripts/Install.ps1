$ErrorActionPreference = 'Stop'

$SchemeName = 'Black Glove'
$Dest       = Join-Path $env:LOCALAPPDATA 'Cursors\BlackGlove'
$Src        = Join-Path (Split-Path $PSScriptRoot -Parent) 'cursors'

$Map = [ordered]@{
    Arrow       = '01_Normal.cur'
    Help        = '02_Help.ani'
    AppStarting = '03_Working_in_Background.ani'
    Wait        = '04_Busy.ani'
    Crosshair   = '05_Precision.ani'
    IBeam       = '06_Text.ani'
    NWPen       = '07_Handwriting.ani'
    No          = '08_Unavailable.ani'
    SizeNS      = '09_Vertical.ani'
    SizeWE      = '10_Horizontal.ani'
    SizeNWSE    = '11_Diagonal_1.ani'
    SizeNESW    = '12_Diagonal_2.ani'
    SizeAll     = '13_Move.ani'
    UpArrow     = '14_Alternate_Select.cur'
    Hand        = '15_Link.cur'
    Pin         = '16_Location.ani'
    Person      = '17_Person.ani'
}

Write-Host ''
Write-Host "  $SchemeName cursors" -ForegroundColor Cyan
Write-Host '  Created by Bidas'     -ForegroundColor DarkGray
Write-Host ''

foreach ($f in $Map.Values) {
    if (-not (Test-Path (Join-Path $Src $f))) {
        throw "Missing file: $f (keep the 'cursors' folder next to the 'scripts' folder)"
    }
}

New-Item -ItemType Directory -Path $Dest -Force | Out-Null
foreach ($f in $Map.Values) {
    Copy-Item (Join-Path $Src $f) (Join-Path $Dest $f) -Force
}
Write-Host "  [OK] Cursors copied to $Dest"

$paths = $Map.Values | ForEach-Object { Join-Path $Dest $_ }
$schemesKey = 'HKCU:\Control Panel\Cursors\Schemes'
if (-not (Test-Path $schemesKey)) { New-Item $schemesKey -Force | Out-Null }
Set-ItemProperty -Path $schemesKey -Name $SchemeName -Value ($paths -join ',') -Type ExpandString
Write-Host "  [OK] Scheme '$SchemeName' saved"

$curKey = 'HKCU:\Control Panel\Cursors'
Set-ItemProperty -Path $curKey -Name '(Default)' -Value $SchemeName
foreach ($name in $Map.Keys) {
    Set-ItemProperty -Path $curKey -Name $name -Value (Join-Path $Dest $Map[$name]) -Type ExpandString
}
Set-ItemProperty -Path $curKey -Name 'Scheme Source' -Value 1 -Type DWord

Add-Type -Namespace Win32 -Name Native -MemberDefinition @'
[DllImport("user32.dll", SetLastError = true)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, IntPtr pvParam, uint fWinIni);
'@
[Win32.Native]::SystemParametersInfo(0x0057, 0, [IntPtr]::Zero, 0x03) | Out-Null

Write-Host "  [OK] Scheme applied"
Write-Host ''
Write-Host '  Done! Also available in: Mouse settings > Pointers > Scheme.' -ForegroundColor Green
Write-Host ''
