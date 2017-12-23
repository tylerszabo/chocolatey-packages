$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/White-Tiger/WinMTR/releases/download/v1.0/WinMTR-v100-static.zip'
  checksum      = '2DA85A22A319E87705FA846E949E28B9A23726D161816228D49AF402D55EA60E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$StartMenuDir = Get-ItemPropertyValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs"

if ($env:ChocolateyForceX86 -or (-not [Environment]::Is64BitOperatingSystem)) {
  $TargetExe = Join-Path -Path $toolsDir -ChildPath "WinMTR.exe"
} else {
  $TargetExe = Join-Path -Path $toolsDir -ChildPath "WinMTR64.exe"
}

Install-ChocolateyShortcut -ShortcutFilePath (Join-Path -Path $StartMenuDir -ChildPath "WinMTR.lnk") -TargetPath $TargetExe -WorkingDirectory $toolsDir
