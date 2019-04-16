Get-ADGroupMember APP-GITHUB-USERS |
ForEach-Object {
Get-ADUser -Filter "SamAccountName -eq '$($_.SamAccountName)'" -SearchBase 'OU=Admin Accounts,DC=acme,DC=com'
} |
Sort | Format-Table Name,SamAccountName,Enabled -AutoSize
