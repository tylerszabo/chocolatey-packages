$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$ShortcutDir = Join-Path -Path $StartMenuDir -ChildPath "SysInternals"

If (Test-Path $ShortcutDir) {
  Remove-Item -Path $ShortcutDir -Recurse
}
