# Splatting is
# Defining a hashtabel of parameter names and values
# Splatting the hashtable to the commands

$params = @{
    ComputerName = $env:COMPUTERNAME
    Classname    = 'win32_logicaldisk'
    Filter       = "deviceid='c:'"
    Verbose      = $true
    VolumeName   = "Fakhri"
} 
Get-CimInstance @params # For the splatting we using @ sign instead of $ sign

# To get all things done you need to be sure that WinRM service is running if not usethis
Get-Service -Name WinRM
Set-Service -Name WinRM -Status Running -StartupType Automatic