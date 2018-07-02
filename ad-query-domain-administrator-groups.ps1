cls
Get-ADGroupMember -Identity "Domain Admins" -Recursive | Sort | Format-Table Name,DistinguishedName -Wrap -AutoSize