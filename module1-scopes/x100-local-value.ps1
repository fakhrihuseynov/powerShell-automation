# $x = 100
Write-Host "I am running a script" -ForegroundColor Green
[int32] $x = Read-Host "Enter a new value for X"
Write-Host "Setting `$x to $x" -ForegroundColor Green

# do something with $x
$x + $x