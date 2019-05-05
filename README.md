# pc-setup
Scripts for installing all my favorite apps on a brand new PC.
# usage (Powershell)

```
{ iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/ElmarJ/pc-setup/master/setup_pc.ps1 -DisableReboots
