# Delete Windows Update policies applied to local machine

# Prerequisites:
# Log on as a local Administrator
# Open Administrator console (PowerShell or Command Prompt)

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /f
reg delete "HKCU\Software\Microsoft\WindowsSelfHost" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /f
reg delete "HKLM\Software\Microsoft\WindowsSelfHost" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f

shutdown /r /t 10
