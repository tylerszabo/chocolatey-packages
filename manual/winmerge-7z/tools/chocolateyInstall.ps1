$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$registryLocation = Get-Item -Path "HKLM:SOFTWARE\Thingamahoochie\WinMerge" -ErrorAction SilentlyContinue
if (-not $registryLocation) {
  $registryLocation = Get-Item -Path "HKLM:SOFTWARE\WOW6432Node\Thingamahoochie\WinMerge" -ErrorAction SilentlyContinue
}
if (-not $registryLocation) {
  Throw "Unable to location WinMerge in the registry; ensure WinMerge is installed for all users."
}

$winMergeDir = Split-Path -Path $registryLocation.GetValue("Executable")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $winMergeDir
  url           = 'https://downloads.sourceforge.net/winmerge/Merge7z0028-465-920.7z'
  checksum      = '50347322679148378B6975C0A8E398439187D7D710E708E5A216F1753DFC8C6B'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
