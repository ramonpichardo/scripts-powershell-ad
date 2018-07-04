$VIServer = "hiovmvc01.hq.acme.com"

Connect-VIServer $VIServer

Get-VM | Get-CDDrive | where {$_.IsoPath -ne $null} | Set-CDDrive -NoMedia -Confirm:$False
