<#
.SYNOPSIS  (A brief explanation of what the script or function does.)

Retrieves service pack and operating system information from one or more remote computers.


.DESCRIPTION  (A more detailed explanation of what the script or function does.)

The Get-Inventory function uses Windows Management Instrumentation (WMI) toretrieve service pack version, operating system build number, and BIOS serial number from one or more remote computers.

Computer names or IP addresses are expected as pipeline input, or may bepassed to the computerName parameter.

Each computer is contacted sequentially, not in parallel.


.PARAMETER name  (An explanation of a specific parameter. Replace name with the parameter name. You can have one of these sections for each parameter the script or function uses.)


.PARAMETER computerNameAccepts

A single computer name or an array of computer names. You mayalso provide IP addresses.


.PARAMETER path

The path and file name of a text file. Any computers that cannot be reached will be logged to this file.

This is an optional parameter; if it is notincluded, no log file will be generated.


.EXAMPLE  (An example of how to use the script or function. You can have multiple .EXAMPLE sections if you want to provide more than one example.)

Read computer names from Active Directory and retrieve their inventory information.

Get-ADComputer -filter * | Select{Name="computerName";Expression={$_.Name}} | Get-Inventory.


.EXAMPLE

Read computer names from a file (one name per line) and retrieve their inventory information

Get-Content c:\names.txt | Get-Inventory.


.NOTES  (Any miscellaneous notes on using the script or function.)

You need to run this function as a member of the Domain Admins group; doing so is the only way to ensure you have permission to query WMI from the remote computers.


.LINK  (A cross-reference to another help topic; you can have more than one of these. If you include a URL beginning with http:// or https://, the shell will open that URL when the Help command's online parameter is used.)
#>
