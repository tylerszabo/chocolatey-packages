$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jbruchon/jdupes/releases/download/v1.10.3/jdupes-1.10.3_win32.zip'
  checksum      = 'c0da9cc58e49f17e3467a6bb933bd9da9d096aeb237f14e8263dfddd492ca200'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/jbruchon/jdupes/releases/download/v1.10.3/jdupes-1.10.3_win64.zip'
  checksum64    = 'f98490dc40ef8f38976c7a946da3658f5f07693842defa3d5bc5828ca245b4e0'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
