$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/0xd4d/dnSpy/releases/download/v4.5.2/dnSpy.zip'
  checksum      = '697841f762c50b0d2dcd39ef5981055cd06640786dd25cb81047180345c487ea'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

@('dnSpy', 'dnSpy-x86') | ForEach-Object {
  $TargetExe = Join-Path -Path $toolsDir -ChildPath "$_.exe"
  Install-ChocolateyShortcut -ShortcutFilePath (Join-Path -Path $StartMenuDir -ChildPath "$_.lnk") -TargetPath $TargetExe -WorkingDirectory $toolsDir
}
