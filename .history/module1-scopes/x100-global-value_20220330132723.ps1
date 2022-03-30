Write-Host "I am running a script" -ForegroundColor Green
[int32] $global:x = Read-Host "Enter a new value for X"
Write-Host "Setting `$x to $global:x" -ForegroundColor Green

# do something with $x
$global:x + $global:x

# Create additional
$y = "powershell"