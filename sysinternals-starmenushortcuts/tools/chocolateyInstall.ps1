$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$ShortcutDir = Join-Path -Path $StartMenuDir -ChildPath "SysInternals"

$SysInternalsDir = Join-Path -Path (Split-Path -Path $env:ChocolateyPackageFolder -Parent) -ChildPath "sysinternals\tools"

If (-Not (Test-Path -Path $ShortcutDir)) {
  New-Item -Path $ShortcutDir -ItemType "Directory" | Out-Null
}

@(
  @("procexp", "Process Explorer"),
  @("procmon", "Process Monitor"),
  @("disk2vhd", "Disk2VHD")
) | ForEach-Object {
  $TargetExe = Get-Item -Path (Join-Path -Path $SysInternalsDir -ChildPath "$($_[0]).exe") -ErrorAction SilentlyContinue
  If ($TargetExe) {
    $ShortcutFile = Join-Path -Path $ShortcutDir -ChildPath "$($_[1]).lnk"
    Install-ChocolateyShortcut -ShortcutFilePath $ShortcutFile -TargetPath ($TargetExe.FullName) -WorkingDirectory $SysInternalsDir
  }
}
