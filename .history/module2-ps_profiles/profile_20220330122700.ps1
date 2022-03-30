$profile | select *host* |  Format-List
dir $profile
New-Item $profile -Force
Add-Content -Value 'cd c:\scripts' -Path $profile
Add-Content -Value '$var = 123' -Path $profile
Add-Content -Value '$host.privatedata.errorforegroundcolor="green"' -Path $profile
Add-Content -Value 'Write-Host "Hello Fakhri Huseynov :) Have a nice scripting..!" -foregroundcolor ' 

# Current User All-hosts

New-Item $profile.CurrentUserAllHosts -Force
Add-Content -Value "set-alias np Notepad" -Path $profile.CurrentUserAllHosts

# Write-Host -ForegroundColor  Cyan "PowerhShell of mine"
# Write-Host -ForegroundColor  DarkCyan "PowerhShell of mine"
# Write-Host -ForegroundColor  DarkMagenta "PowerhShell of mine"
# Write-Host -ForegroundColor  Magenta "PowerhShell of mine"
# Write-Host -ForegroundColor  DarkYellow  "PowerhShell of mine 555"
# Write-Host -ForegroundColor  Gray  "PowerhShell of mine"
# Write-Host -ForegroundColor  White  "PowerhShell of mine"
# Write-Host -ForegroundColor  Yellow "PowerhShell of mine"
# Write-Host -ForegroundColor  Blue  "PowerhShell of mine"
# Write-Host -ForegroundColor  DarkBlue  "PowerhShell of mine"
# Write-Host -ForegroundColor  DarkGreen  "PowerhShell of mine"


