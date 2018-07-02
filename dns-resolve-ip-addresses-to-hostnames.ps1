Get-Content "$env:USERPROFILE\Desktop\ip-addresses.txt" | ForEach-Object{
$hostname = ([System.Net.Dns]::GetHostByAddress($_)).Hostname
if($? -eq $True) {
  $_ +": "+ $hostname >> "$env:USERPROFILE\Desktop\machinenames.txt"
}
else {
   $_ +": Cannot resolve hostname" >> "$env:USERPROFILE\Desktop\machinenames.txt"
}}