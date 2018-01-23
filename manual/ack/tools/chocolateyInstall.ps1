$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$AckCmd = Join-Path -Path $toolsDir -ChildPath "ack.cmd"
$AckPl = Join-Path -Path $toolsDir -ChildPath "ack.pl"

@"
@echo off
perl.exe $AckPl %*
"@ | Out-File -FilePath $AckCmd -Encoding "ASCII"

Install-BinFile -Name "ack" -Path $AckCmd

$OldAckBinfile = Join-Path -Path $env:ChocolateyInstall -ChildPath "bin\ack.cmd"
$OldAckBinfileRegex = "^perl\.exe .*ack\.pl %\*$"

if ((Get-Content -Path $OldAckBinfile -ErrorAction SilentlyContinue | Select-Object -Last 1) -match $OldAckBinfileRegex) {
  Write-Host "Removing pre-2.18 launcher: $OldAckBinfile"
  Remove-Item -Path "$OldAckBinfile"
}
