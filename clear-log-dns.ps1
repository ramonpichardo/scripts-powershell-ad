<#

This script will do the following on this server...
1.) Stop the DNS service
2.) If the DNS service is stopped then clear the DNS log
3.) If the DNS log is cleared then start the DNS service

#>

Stop-Service DNS && Clear-Content c:\temp\dns.log && Start-Service DNS
exit