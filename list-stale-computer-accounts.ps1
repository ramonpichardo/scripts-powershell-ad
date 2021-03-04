# dsquery computer "OU=Workstations,OU=Computers,OU=US,DC=amer,DC=acme,DC=com" -inactive 4 -limit 0 | find /c /v ""

$daysSinceLastSeen = 90
$dateTime = (Get-Date).AddDays(-($daysSinceLastSeen))
Get-ADComputer -Filter {lastLogonTimestamp -lt $dateTime} -ResultPageSize 10000 -ResultSetSize $Null -Properties Name, OperatingSystem, OperatingSystemVersion, DistinguishedName | Sort -Property Name | Format-Table Name, OperatingSystem, OperatingSystemVersion, DistinguishedName -AutoSize
