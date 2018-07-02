<#
.SYNOPSIS
Gets the Active Directory (AD) security groups that are common between AD domain accounts.

.DESCRIPTION
This script compares the AD accounts listed in $Users and displays the resulting list of AD security groups in common in a table format. 

.NOTES
You may need to run this function as a member of the Domain Admins group; doing so may be the only way to ensure you have permissions to query AD.

#>

cls

$Users = "user1","user2","user3","user4","user5"

$Result = Get-ADUser $Users[0] -Properties MemberOf | Select -ExpandProperty MemberOf
ForEach ($Index in (1..($Users.Count - 1)))
{   $Result = Compare-Object -ReferenceObject $Result -DifferenceObject (Get-ADUser $Users[$Index] -Properties MemberOf | Select -ExpandProperty MemberOf) -IncludeEqual | Where SideIndicator -EQ "==" | Select -ExpandProperty InputObject
}

$Result | Select @{Label="Name";Expression={Get-ADGroup $_ | Select -ExpandProperty Name }},@{Label="DN";Expression={$_}}
 

