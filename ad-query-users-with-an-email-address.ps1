cls

$List = Get-Content $env:USERPROFILE\Desktop\usernames.txt

$Users = @()

ForEach ($Item in $List)
{
$Users += Get-ADUser -Filter {EmailAddress -eq $Item} -Properties *
}

$Users | Select Name,Title,Department,PhysicalDeliveryOfficeName,EmailAddress,Manager | Export-Csv -NoType $env:USERPROFILE\Desktop\user_listing.csv

Echo Done.