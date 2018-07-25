$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/tylerszabo/RGB-Fusion-Tool/releases/download/v0.9.2/RGBFusionTool_v0.9.2.7z'
  checksum      = '4d091999ac6ea40a83573de1ab391176629a2d96207a6b28b56ebbacfdfa9e5e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
