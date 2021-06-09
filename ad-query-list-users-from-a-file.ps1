$userNames = Get-Content -Path "C:\temp\users.txt"
$outputPath = "C:\temp\userOutput.csv"
 
forEach ($name in $userNames) {
    Get-ADUser $name -Properties * | Sort-Object Surname | Select-Object GivenName, Surname, Title, EmailAddress, SamAccountName, Enabled | Export-CSV $outputPath -Append -NoTypeInformation
}
