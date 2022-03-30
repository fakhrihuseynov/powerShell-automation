Write-Host "I am running a script" -ForegroundColor Blue
if ($x) {
    Write-Host "Found an existing variable with a value of $x" -ForegroundColor Yellow
}
[int32]$x = Read-Host "Enter a new value for X"
Write-Host "Setting `$x to $x" -ForegroundColor Green
# Do some with $x
$x + $x