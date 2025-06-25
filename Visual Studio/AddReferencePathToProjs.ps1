# Define the content of the .csproj.user file
$userFileContent = @"
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <ReferencePath>C:\Program Files\SPIN\Action.NET\an-10\</ReferencePath>
  </PropertyGroup>
</Project>
"@

# Get the solution directory from the script's location
$parentDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get the parent directory of the solution directory
 $solutionDir = Split-Path -Parent $parentDir

# Find all .csproj files in the solution directory
$csprojFiles = Get-ChildItem -Path $solutionDir -Recurse -Filter *.csproj

# Loop through each .csproj file and create the corresponding .csproj.user file if it doesn't exist
foreach ($csprojFile in $csprojFiles) {
    $userFilePath = "$($csprojFile.FullName).user"
    if (-Not (Test-Path -Path $userFilePath)) {
        Set-Content -Path $userFilePath -Value $userFileContent
        Write-Output "Created: $userFilePath"
    } else {
        Set-Content -Path $userFilePath -Value $userFileContent
        Write-Output "Overwrite (already exists): $userFilePath"
    }
}