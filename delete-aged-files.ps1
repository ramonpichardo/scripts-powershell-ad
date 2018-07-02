New-PSDrive -Name "X" -PSProvider FileSystem -Root "\\<hostname>\<sharefolder>"
Get-ChildItem –Path X: -Include *.* –Recurse | Where-Object{$_.LastWriteTime –lt (Get-Date).AddDays(-8)} | Remove-Item -Confirm:$false -WhatIf
