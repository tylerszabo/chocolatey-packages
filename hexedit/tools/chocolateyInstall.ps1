$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = Join-Path -Path $toolsDir -ChildPath "HexEdit5build1349.zip"
  checksum      = 'ada50ce79ae617996c284bec33fba1c55aa3ec21630a0a9bab091bf958b1cecc'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$TargetExe = Join-Path -Path $toolsDir -ChildPath "HexEdit.exe"

Install-ChocolateyShortcut -ShortcutFilePath (Join-Path -Path $StartMenuDir -ChildPath "HexEdit.lnk") -TargetPath $TargetExe -WorkingDirectory $toolsDir
