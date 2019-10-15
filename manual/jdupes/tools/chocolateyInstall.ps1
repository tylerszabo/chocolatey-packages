$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = "https://github.com/jbruchon/jdupes/releases/download/v1.13.2/jdupes-1.13.2-win32.zip"
  checksum      = '9d7a586f5a59e98b183c608f7fd32951f648c92c5b07b87c0426a0b6391bb881'
  checksumType  = 'sha256'
  url64bit      = "https://github.com/jbruchon/jdupes/releases/download/v1.13.2/jdupes-1.13.2-win64.zip"
  checksum64    = '446d877190747efb6a1240b75c9c3d3e2fdc28916aaa1cf858d91dd0b5e3ea7a'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.13.2-*" } |
  Remove-Item -Recurse
