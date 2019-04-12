dsquery computer "OU=Workstations,OU=Computers,OU=US,DC=amer,DC=acme,DC=com" -inactive 4 -limit 0 | find /c /v ""
