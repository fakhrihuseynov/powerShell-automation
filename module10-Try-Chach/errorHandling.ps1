# Try to run this command
# You must force errors to be 'terminating'

$computerName = "foo"
try {
    Get-Service BITS -ComputerName $computerName -ErrorAction Stop
}
catch {
    # <--- Here is catching the errors 
    Write-Warning "Failed to find what are you looking for on host ---->: $computerName.$($_exeception.message)"
}