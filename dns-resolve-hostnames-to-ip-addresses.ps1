$servers = get-content "$env:USERPROFILE\Desktop\hostnames.txt"
foreach ($server in $servers) {
  $addresses = [System.Net.Dns]::GetHostAddresses($server)
  foreach($a in $addresses) {
    "{0},{1}" -f $server, $a.IPAddressToString >> "$env:USERPROFILE\Desktop\hostnames-and-ip-addresses.txt"
  }
} 