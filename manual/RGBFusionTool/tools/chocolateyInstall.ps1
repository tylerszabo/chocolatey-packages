$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/tylerszabo/RGB-Fusion-Tool/releases/download/v0.9.1/RGBFusionTool_0.9.1.7z'
  checksum      = '8c25bd393e0592ad170da79b5f2f9fb6df425985c508bb0b6a7479dcf3aa3ae3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
