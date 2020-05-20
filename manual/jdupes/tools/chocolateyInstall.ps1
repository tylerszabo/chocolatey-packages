$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = "https://github.com/jbruchon/jdupes/releases/download/v1.15.0/jdupes-1.15.0-win32.zip"
  checksum      = 'ada909f0e3664deba5bd7808f58bc1c7e90e0327fede477970dfc84592ed3ab4'
  checksumType  = 'sha256'
  url64bit      = "https://github.com/jbruchon/jdupes/releases/download/v1.15.0/jdupes-1.15.0-win64.zip"
  checksum64    = 'e314047829e01d3aad84b527791bdb2e8e165011dc9c47eac475b7db81ff4998'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.15.0-*" } |
  Remove-Item -Recurse
