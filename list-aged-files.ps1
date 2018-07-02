# LIST FILES WRITTEN OVER 90 DAYS AGO:
Get-ChildItem -Path X: -Include *.* -Recurse | Where-Object LastWriteTime -lt (Get-Date).AddDays(-90) | Sort | FT -AutoSize