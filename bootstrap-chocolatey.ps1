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
choco install chocolatey-core.extension -y

# Install browsers
choco install firefox googlechrome -y

# Install browser add-ins
choco install adobeshockwaveplayer flashplayerplugin flashplayerppapi jre8 silverlight -y 

# Install utilities 
choco install 7zip adobereader-update notepadplusplus pstools putty.install visioviewer vlc windirstat winscp -y

# Install network analysis tools
choco install advanced-ip-scanner nmap winpcap wireshark -y
