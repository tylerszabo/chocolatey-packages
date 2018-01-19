$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  zipFileName   = 'FIXME'
}

Uninstall-ChocolateyZipPackage @packageArgs

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

Remove-Item -Path (Join-Path -Path $StartMenuDir -ChildPath "FIXME.lnk")
