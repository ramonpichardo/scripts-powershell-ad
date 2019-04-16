# Launch this script in an administrative PowerShell session.
#Requires -RunAsAdministrator

# Verify this script is running in an administrator security context.
$IsAdmin=[Security.Principal.WindowsIdentity]::GetCurrent()
If ((New-Object Security.Principal.WindowsPrincipal $IsAdmin).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator) -eq $FALSE)
{
      "`nERROR: This script will only run in an administrator context. Run this script after launching a Run As Administrator PowerShell session."
      pause
      exit
}

# Install Nuget
Install-PackageProvider Nuget –Force

# Install PowerShellGet
Install-Module -Name PowerShellGet -Force

# Set script execution policy to "bypass" and then install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Create and update Chocolatey profile
Write-Host $profile
(
echo # Chocolatey profile
echo $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
echo if (Test-Path($ChocolateyProfile)) {
echo   Import-Module "$ChocolateyProfile"
echo }
)>"$profile"

. $profile

# Install Chocolatey Core Extensions
choco install -y chocolatey-core.extension

# Install browsers
choco install -y firefox googlechrome

# Install browser add-ins
choco install -y adobeshockwaveplayer flashplayerplugin flashplayerppapi jre8 silverlight 

# Install utilities 
choco install -y 7zip adobereader-update notepadplusplus pstools putty.install visioviewer vlc windirstat winscp

# Install network analysis tools
choco install -y advanced-ip-scanner nmap winpcap wireshark
