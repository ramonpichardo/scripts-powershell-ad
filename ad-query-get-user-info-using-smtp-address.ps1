$List = Get-Content $env:USERPROFILE\Desktop\smtp_address_list.txt

$Users = @()

ForEach ($Item in $List)
{
$Users += Get-ADUser -Filter {EmailAddress -eq $Item} -Properties *
}

$Users | Select Name,Title,Department,PhysicalDeliveryOfficeName,EmailAddress,Manager | Export-Csv -NoType "$env:USERPROFILE\Desktop\acme_users.csv"

Echo Done.