$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/lucasg/Dependencies/releases/download/v1.9/Dependencies_x86_Release_.without_peview.exe.zip'
  checksum      = '40281c388d0d1f894ddb68090009431793e644ec83c527461f5b709bff802c9a'
  checksumType  = 'sha256'
  url64bit      = 'https://github.com/lucasg/Dependencies/releases/download/v1.9/Dependencies_x64_Release_.without_peview.exe.zip'
  checksum64    = 'a48e1b81e173e7c5abb00f9de52f1754f8e7fcbc26425b2a6c104986ac064993'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$TargetExe = Join-Path -Path $toolsDir -ChildPath "DependenciesGui.exe"

Install-ChocolateyShortcut -ShortcutFilePath (Join-Path -Path $StartMenuDir -ChildPath "Dependencies.lnk") -TargetPath $TargetExe -WorkingDirectory $toolsDir
