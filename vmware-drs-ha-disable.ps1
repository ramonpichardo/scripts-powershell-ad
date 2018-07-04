# Turn off DRS / HA within vSphere
# Warning: Disabling DRS will delete any resource pool on the cluster without warning!

$VIServer = "hiovmvc01.hq.acme.com"

Connect-VIServer $VIServer
Get-Cluster | Set-Cluster -HAEnabled:$false -DrsEnabled:$false -Confirm:$false
exit
