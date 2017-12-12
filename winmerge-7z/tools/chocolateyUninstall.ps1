$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  zipFileName   = 'Merge7z0028-465-920.7z'
}

Uninstall-ChocolateyZipPackage @packageArgs
