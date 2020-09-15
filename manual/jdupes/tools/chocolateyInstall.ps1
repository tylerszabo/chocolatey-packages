$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = "https://github.com/jbruchon/jdupes/releases/download/v1.18.2/jdupes-1.18.2-win32.zip"
  checksum      = '6eb198043c569caec3005e8b3b6687b37735d1b6cf64d908094b5914b1db50b6'
  checksumType  = 'sha256'
  url64bit      = "https://github.com/jbruchon/jdupes/releases/download/v1.18.2/jdupes-1.18.2-win64.zip"
  checksum64    = '8656713c7d454c35db901f04609710a58e8e1b74308677939fe2e0ce8cb25530'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.18.2-*" } |
  Remove-Item -Recurse
