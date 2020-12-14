$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jbruchon/jdupes/releases/download/v1.19.1/jdupes-1.19.1-win32.zip'
  checksum      = 'c99d1dbe136dd455e933e107ce0c9058c3ced541320f301c4a2f66cc5e1f7285'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/jbruchon/jdupes/releases/download/v1.19.1/jdupes-1.19.1-win64.zip'
  checksum64    = 'f45766d59cf50403bd94bfd077c13c2319e1f636d4978eb353c7aa31746585b9'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.19.1-*" } |
  Remove-Item -Recurse
