$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = "https://github.com/jbruchon/jdupes/releases/download/v1.16.0/jdupes-1.16.0-win32.zip"
  checksum      = '3e1743189f8d2d3931f3ad7de13fe72e8ac362d23a6e77c66645e1a216581027'
  checksumType  = 'sha256'
  url64bit      = "https://github.com/jbruchon/jdupes/releases/download/v1.16.0/jdupes-1.16.0-win64.zip"
  checksum64    = '32c8862f4a3397141f567a04a159e044890e2d1a8ab8efcf0ac31d9805cb0c52'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.16.0-*" } |
  Remove-Item -Recurse
