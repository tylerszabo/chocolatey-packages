<#
.SYNOPSIS
Pack nuspec files
.DESCRIPTION
Pack nuspec files
.PARAMETER OutputDirectory
Where to create .nupkg files (Default: Script Root)
.PARAMETER Force
Overwrite output, even if input has no changes
.PARAMETER NoOverwrite
Don't overwrite output, even if input has changes
.EXAMPLE
& .\Invoke-ChocoPack
#>
[CmdletBinding(DefaultParameterSetName="None")]
Param (
  [ValidateNotNullOrEmpty()]
  [string]
  $OutputDirectory = $PSScriptRoot,

  [ValidateNotNullOrEmpty()]
  [string]
  $InputDirectory = $PSScriptRoot,

  [switch]
  $Force = $False,

  [switch]
  $NoOverwrite = $False,

  [switch]
  $WhatIf = $False
)

Get-ChildItem -LiteralPath $InputDirectory -Recurse -Filter "*.nuspec" | Where-Object { -not ($_.Directory.Name -eq "template") } | Where-Object {
  if ($Force) { Return $True }

  [xml]$NuSpecXML = $_ | Get-Content
  $PackageId = $NuSpecXML.package.metadata.id
  $PackageVersion = $NuSpecXML.package.metadata.version

  $ComputedOutFile = Get-Item -Path "$OutputDirectory\$PackageId.$PackageVersion.nupkg" -ErrorAction SilentlyContinue

  if ($ComputedOutFile) {
    $InputModTime = ($_.Directory | Get-ChildItem -Recurse | Measure-Object -Maximum -Property LastWriteTime).Maximum

    if ($InputModTime -gt $ComputedOutFile.LastWriteTime) {
      if ($NoOverwrite) {
        Write-Warning "Not overwriting $($ComputedOutFile.FullName), even though input is newer"
        Return $False
      }
    } else {
      Return $False
    }

    Write-Verbose "Overwriting $($ComputedOutFile.FullName) as input is newer"
  }

  Return $True

} | ForEach-Object {
  if ($WhatIf) { Write-Host "WhatIf: Would pack $($_.FullName)" } else {
    & choco pack --outputdirectory "$OutputDirectory" "$($_.FullName)"
  }
}
