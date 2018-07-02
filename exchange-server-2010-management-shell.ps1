$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://<FQDN>/PowerShell/ -Authentication Kerberos -Credential $UserCredential
Import-PSSession $Session
