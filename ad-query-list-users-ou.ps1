cls
Get-Content -Path "$env:USERPROFILE\Desktop\usernames.txt" | Get-ADUser -Properties CanonicalName | FT Name,CanonicalName -AutoSize
