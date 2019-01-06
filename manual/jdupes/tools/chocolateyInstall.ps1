$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jbruchon/jdupes/releases/download/v1.11/jdupes-1.11_win32.zip'
  checksum      = 'c7b2631b617e41eb34d62c4ff9cbddd3bef194126932aca73e841297c1f1ae22'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/jbruchon/jdupes/releases/download/v1.11/jdupes-1.11_win64.zip'
  checksum64    = 'c8f7e6dd54540d44127fc6827eb9cd92e5fc509615f24f9c41ab76c389c4d4d0'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
