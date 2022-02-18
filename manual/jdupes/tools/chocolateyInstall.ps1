$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jbruchon/jdupes/releases/download/v1.20.2/jdupes-1.20.2-win32.zip'
  checksum      = '95801eb97753e6ef1cff2b0298c4f3849a64e2bd10603056dea1ffc36acd061d'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/jbruchon/jdupes/releases/download/v1.20.2/jdupes-1.20.2-win64.zip'
  checksum64    = '7574c599c0c17d68aa54d3b1a6972c7542f3096fddc55e2635321f78b8a7ca65'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Remove old versions
Get-ChildItem -Path (Join-Path -Path $toolsDir -ChildPath "jdupes-*") -Directory |
  Where-Object { $_.Name -INotLike "jdupes-1.20.2-*" } |
  Remove-Item -Recurse
