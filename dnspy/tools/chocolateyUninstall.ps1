$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

@('dnSpy', 'dnSpy-x86') | ForEach-Object {
  Remove-Item -Path (Join-Path -Path $StartMeuDir -ChildPath "$_.lnk")
}
