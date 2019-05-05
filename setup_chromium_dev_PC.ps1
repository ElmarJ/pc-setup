# Following instructions at
# https://chromium.googlesource.com/chromium/src/+/master/docs/windows_build_instructions.md

$ChromiumPath =  join-path $env:systemdrive 'src\chromium'
$DepotToolsPath = join-path $env:systemdrive 'src\depot_tools'


# Function to add a path for windows defender to bypass
# Taken from https://gist.github.com/zloeber/9c2d659a2a8f063af26c9ba0285c7e78
function Add-DefenderBypassPath {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline = $true)]
        [string[]]$Path
    )
    begin {
        $Paths = @()
    }
    process {
        $Paths += $Path
    }
    end {
        $Paths | Foreach-Object {
            if (-not [string]::isnullorempty($_)) {
                Add-MpPreference -ExclusionPath $_ -Force
            }
        }
    }
}

# Install Visual Studio with necessary workloads
cinst visualstudio2017community --params "--add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.VC.ATLMFC --includeRecommended"

# Install Depot Tools and add to %PATH%
Install-ChocolateyZipPackage -PackageName 'depot_tools' -Url 'https://storage.googleapis.com/chrome-infra/depot_tools.zip' -UnzipLocation $DepotToolsPath
Install-ChocolateyPath -PathToInstall $DepotToolsPath
refreshenv

git config --global user.name "Elmar Jansen"
git config --global user.email "elmar@elmarjansen.nl"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global branch.autosetuprebase always

# Fetch source
mkdir $ChromiumPath | cd
fetch chromium
DefenderBypassPath $ChromiumPath

# Generate build folder
cd src
gn gen --ide=vs out\Default
devenv out\Default\all.sln
