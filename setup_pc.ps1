# Description: Boxstarter Script
# Author: Elmar
# All my favorite apps

#--- Basics ---
choco install -y googledrive
choco install -y steam
choco install -y spotify 
# choco install -y f.lux 
choco install -y r.studio
choco install -y office365homepremium 

#--- Tools ---
choco install -y vscode
choco install -y git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"'
choco install -y 7zip.install

#--- Statistics ---
choco install anaconda3 
choco install r.project
choco install r.studio 

#--- Music ---
choco install audacity 

#--- Windows Subsystems/Features ---
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#--- Browsers ---
choco install -y Firefox
choco install -y Googlechrome

#--- Fonts ---
choco install -y inconsolata
choco install -y firacode 
# choco install -y ubuntu.font

#--- Tools ---
choco install -y nodejs-lts # Node.js LTS, Recommended for most users
# choco install -y nodejs # Node.js Current, Latest features
choco install -y visualstudio2017buildtools
choco install -y visualstudio2017-workload-vctools
choco install -y sysinternals
choco install -y docker-for-windows
choco install -y python2 # Node.js requires Python 2 to build native modules

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
