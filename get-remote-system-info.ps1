<#
Remote System Information
Shows hardware and OS details from a list of PCs
#>

$ArrComputers =  Get-ADComputer -Filter 'Name -like "ACME*TQA"' | ForEach-Object {$_.Name}

Clear-Host

foreach ($Computer in $ArrComputers) 
{
    $computerSystem = Get-WmiObject Win32_ComputerSystem -Computer $Computer
    $computerBIOS = Get-WmiObject Win32_BIOS -Computer $Computer
    $computerOS = Get-WmiObject Win32_OperatingSystem -Computer $Computer
    $computerCPU = Get-WmiObject Win32_Processor -Computer $Computer
    $computerHDD = Get-WmiObject Win32_LogicalDisk -ComputerName $Computer -Filter drivetype=3
    $computerIP = [System.Net.Dns]::GetHostAddresses("$Computer")[0].IPAddressToString
  
  <#
        write-host "System Information for: " $computerSystem.Name -BackgroundColor DarkCyan
        "-------------------------------------------------------"
        "Manufacturer: " + $computerSystem.Manufacturer
        "Model: " + $computerSystem.Model
        "Serial Number: " + $computerBIOS.SerialNumber
        "CPU: " + $computerCPU.Name
        "HDD Capacity: "  + "{0:N2}" -f ($computerHDD.Size/1GB) + "GB"
        "HDD Space: " + "{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size) + " Free (" + "{0:N2}" -f ($computerHDD.FreeSpace/1GB) + "GB)"
        "RAM: " + "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB) + "GB"
        "Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
        "User logged In: " + $computerSystem.UserName
        "Last Reboot: " + $computerOS.ConvertToDateTime($computerOS.LastBootUpTime)
        "-------------------------------------------------------"
  #>

  #Build the CSV file
$csvObject = New-Object PSObject -property @{
    'PCName' = $computerSystem.Name
    'Manufacturer' = $computerSystem.Manufacturer
    'Model' = $computerSystem.Model
    'SerialNumber' = $computerBIOS.SerialNumber
    'RAM (GB)' = "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB)
    'HDDSize (GB)' = "{0:N2}" -f ($computerHDD.Size/1GB)
    'HDDFree' = "{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size)
    'CPU' = $computerCPU.Name
    'OS' = $computerOS.caption
    'SP' = $computerOS.ServicePackMajorVersion
    'IP' = $computerIP
    'User' = $computerSystem.UserName
    'BootTime' = $computerOS.ConvertToDateTime($computerOS.LastBootUpTime)
    } 

#Export the fields you want from above in the specified order
$csvObject | Select PCName, IP, Model, SerialNumber, CPU, RAM, HDDSize, HDDFree, OS, SP, User, BootTime | Export-Csv 'system-info.csv' -NoTypeInformation -Append

}

# Open CSV file for review (leave this line out when deploying)
notepad system-info.csv
