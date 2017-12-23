$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$StartMenuDir = Get-ItemPropertyValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs"

Remove-Item -Path (Join-Path -Path $StartMenuDir -ChildPath "WinMTR.lnk")
