# Install PowerShellGet
Install-Module -Name PowerShellGet -Force

# Install VMware PowerCLI
Install-Module -Name VMware.PowerCLI -RequiredVersion 6.5.4.7155375 -AllowClobber
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore

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
