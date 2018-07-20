$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jbruchon/jdupes/releases/download/v1.10.2/jdupes-1.10.2_win32.zip'
  checksum      = 'c13ab12e53988306660cea822048899c3f277751f9d6205a61dd057097e4d666'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/jbruchon/jdupes/releases/download/v1.10.2/jdupes-1.10.2_win64.zip'
  checksum64    = '15cc8540463053f299c10a16058d0789627c91452e4827ae03e532e7b4f18dc8'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
