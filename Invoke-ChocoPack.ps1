<#
.SYNOPSIS
Pack nuspec files
.DESCRIPTION
Pack nuspec files
.PARAMETER OutputDirectory
Where to create .nupkg files (Default: Script Root)
.PARAMETER Force
Overwrite output if set
.EXAMPLE
& .\Invoke-ChocoPack
#>
[CmdletBinding(DefaultParameterSetName="None")]
Param (
  [ValidateNotNullOrEmpty()]
  [string]
  $OutputDirectory = $PSScriptRoot,

  [switch]
  $Force = $False,

  [switch]
  $WhatIf = $False
)

Get-ChildItem -LiteralPath $OutputDirectory -Recurse -Filter "*.nuspec" | ForEach-Object {
  [xml]$NuSpecXML = $_ | Get-Content
  $PackageId = $NuSpecXML.package.metadata.id
  $PackageVersion = $NuSpecXML.package.metadata.version
  $ComputedOutFile = "$OutputDirectory\$PackageId.$PackageVersion.nupkg"

  if (-not $Force -and (Test-Path -LiteralPath $ComputedOutFile)) {
    Write-Warning "Not overwriting $ComputedOutFile"
  } else {
    if ($WhatIf) { Write-Host "WhatIf: Would pack $($_.FullName) into $ComputedOutFile" } else {
      & choco pack --outputdirectory "$OutputDirectory" "$($_.FullName)"
    }
  }
}
