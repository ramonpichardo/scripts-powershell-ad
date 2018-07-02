# Get list of all group members including those members in nested groups

Get-ADGroupMember -Identity <groupname> -Recursive | Sort | Format-Table Name,DistinguishedName -Wrap -AutoSize