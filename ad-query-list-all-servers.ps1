Get-ADComputer -Filter 'OperatingSystem -like "*server*" -and Enabled -eq "True"' `
-Properties OperatingSystem,CanonicalName | `
Sort-Object CanonicalName | `
Select-Object Name,OperatingSystem,CanonicalName | `
Format-Table Name,OperatingSystem,CanonicalName
