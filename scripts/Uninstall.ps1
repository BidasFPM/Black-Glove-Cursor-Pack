$ErrorActionPreference = 'Stop'
$SchemeName = 'Black Glove'
$Dest       = Join-Path $env:LOCALAPPDATA 'Cursors\BlackGlove'
$curKey     = 'HKCU:\Control Panel\Cursors'

$names = 'Arrow','Help','AppStarting','Wait','Crosshair','IBeam','NWPen','No','SizeNS','SizeWE','SizeNWSE','SizeNESW','SizeAll','UpArrow','Hand','Pin','Person'
foreach ($n in $names) { Set-ItemProperty -Path $curKey -Name $n -Value '' -Type ExpandString }
Set-ItemProperty -Path $curKey -Name '(Default)' -Value ''
Set-ItemProperty -Path $curKey -Name 'Scheme Source' -Value 0 -Type DWord

Remove-ItemProperty -Path "$curKey\Schemes" -Name $SchemeName -ErrorAction SilentlyContinue

Add-Type -Namespace Win32 -Name Native -MemberDefinition @'
[DllImport("user32.dll", SetLastError = true)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, IntPtr pvParam, uint fWinIni);
'@
[Win32.Native]::SystemParametersInfo(0x0057, 0, [IntPtr]::Zero, 0x03) | Out-Null

if (Test-Path $Dest) { Remove-Item $Dest -Recurse -Force }
Write-Host "Black Glove removed. (Created by Bidas)" -ForegroundColor Green
