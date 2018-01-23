$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'FIXME'
  checksum      = 'FIXME'
  checksumType  = 'sha256'
  url64bit      = 'FIXME'
  checksum64    = 'FIXME'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

if ($env:ChocolateyForceX86 -or (-not [Environment]::Is64BitOperatingSystem)) {
  $TargetExe = Join-Path -Path $toolsDir -ChildPath "FIXME.exe"
} else {
  $TargetExe = Join-Path -Path $toolsDir -ChildPath "FIXME.exe"
}

Install-ChocolateyShortcut -ShortcutFilePath (Join-Path -Path $StartMenuDir -ChildPath "FIXME.lnk") -TargetPath $TargetExe -WorkingDirectory $toolsDir
