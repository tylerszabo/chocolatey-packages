$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = "https://github.com/jbruchon/jdupes/releases/download/v1.18.1/jdupes-1.18.1-win32.zip"
  checksum      = '05e5a7ee40ee6975fdc010fb93c218157d07abff2e2ab8dedbc6086346123079'
  checksumType  = 'sha256'
  url64bit      = "https://github.com/jbruchon/jdupes/releases/download/v1.18.1/jdupes-1.18.1-win64.zip"
  checksum64    = 'de8d61112bbe0a0f99fd376ff56b891f4505c68f1d3fe6af07dc9f92cda9b831'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.18.1-*" } |
  Remove-Item -Recurse
