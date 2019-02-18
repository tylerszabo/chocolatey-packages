$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$currentVersion = '1.12'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = "https://github.com/jbruchon/jdupes/releases/download/v${currentVersion}/jdupes-${currentVersion}_win32.zip"
  checksum      = '1fb1a1d6070f2bdd1bafea82fae56938ac907fef9c3214f094ff905df714ed65'
  checksumType  = 'sha256'
  url64bit      = "https://github.com/jbruchon/jdupes/releases/download/v${currentVersion}/jdupes-${currentVersion}_win64.zip"
  checksum64    = '607a88d6f8f70a0f3d2e94afe84125d207ff2f50f93375ffe7678189787ef125'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-${currentVersion}*" } |
  Remove-Item -Recurse
