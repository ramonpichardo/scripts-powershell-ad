<#
.SYNOPSIS

.DESCRIPTION

.NOTES

#>

cls

Get-Content -Path "$env:USERPROFILE\Desktop\user-homedir-userlist.txt" | Get-ADUser -properties samaccountname, homedrive, homedirectory | ft Name, SamAccountName, HomeDrive, HomeDirectory | Tee-Object -file "$env:USERPROFILE\Desktop\home-directories.txt"
