Write-Host "I am running a script" -ForegroundColor Blue
if ($x) {
    Write-Host "Found an existing variable with a value of $x" -ForegroundColor Yellow
}
# Do some with $x
$x + $x