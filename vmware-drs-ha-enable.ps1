# Turn on DRS / HA within vSphere

$VIServer = "hiovmvc01.hq.acme.com"

Connect-VIServer $VIServer
Get-Cluster | Set-Cluster -HAEnabled:$true -DrsEnabled:$false -Confirm:$false
exit
