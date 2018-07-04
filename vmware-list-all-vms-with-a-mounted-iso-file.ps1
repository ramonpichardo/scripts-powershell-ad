$VIServer = "hiovmvc01.hq.acme.com"

Connect-VIServer $VIServer

Get-VM | Get-CDDrive | select @{N="VM";E="Parent"},IsoPath | where {$_.IsoPath -ne $null}
