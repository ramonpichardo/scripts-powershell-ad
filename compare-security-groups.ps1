$Users = "kbudnik","rmous","jpang","mrevel","PGZ"

$Result = Get-ADUser $Users[0] -Properties MemberOf | Select -ExpandProperty MemberOf
ForEach ($Index in (1..($Users.Count - 1)))
{   $Result = Compare-Object -ReferenceObject $Result -DifferenceObject (Get-ADUser $Users[$Index] -Properties MemberOf | Select -ExpandProperty MemberOf) -IncludeEqual | Where SideIndicator -EQ "==" | Select -ExpandProperty InputObject
}

$Result | Select @{Label="Name";Expression={Get-ADGroup $_ | Select -ExpandProperty Name }},@{Label="DN";Expression={$_}}
