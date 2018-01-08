$packageName = 'openhardwaremonitor'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://openhardwaremonitor.org/files/openhardwaremonitor-v0.8.0.2-alpha.zip'
$checksum = 'f4ecd024aabad21fc03751332710c20f4f08aeeec84a71f329d18ac2534c662d'
$checksumType = 'sha256'
 
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$shortcutFile = Join-Path -Path $StartMenuDir -ChildPath "OpenHardwareMonitor.lnk"
$workingDir = Join-Path -Path $toolsDir -ChildPath "OpenHardwareMonitor"
$targetExe = Join-Path -Path $workingDir -ChildPath "OpenHardwareMonitor.exe"

Install-ChocolateyShortcut -ShortcutFilePath $shortcutFile -TargetPath $targetExe -WorkingDirectory $workingDir
