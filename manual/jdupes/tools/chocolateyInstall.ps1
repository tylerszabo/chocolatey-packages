$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jbruchon/jdupes/releases/download/v1.20.0/jdupes-1.20.0-win32.zip'
  checksum      = '81a8f4f4d30807c07f86572a74b5ebe3f5ed55fac14d8bb4282e0ac866304133'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/jbruchon/jdupes/releases/download/v1.20.0/jdupes-1.20.0-win64.zip'
  checksum64    = '304ecf7b21b5d2c6d053baaad54ccf51951b06855863317e1f9f4c5caf8b7dad'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.20.0-*" } |
  Remove-Item -Recurse
