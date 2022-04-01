# Get disk usage information and export it to a CSV file for trend reporting
Param (
    [string[]]$Computername = $env:COMPUTERNAME
)

New-Item -ItemType Directory -Path .\work -Force

# Path to CSV file is hard coded in our case
$CSV = ".\work\diskHistory.csv"

# Initialize an empty array
$data = @()

# Define a hashtable of parameters to splat to Get-CimInstance
$cimParams = @{
    ClassName   = "Win32_LogicalDisk"
    Filter      = "drivetype = 3"
    ErrorAction = "Stop"
}
Write-Host "Getting disk information from $Computername" -ForegroundColor Cyan
foreach ($Computer in $Computername) {
    Write-Host "Getting diskos information from $Computer." -ForegroundColor Cyan
    # Update the hashtable on the fly
    $cimParams.Computername = $Computer
    try {
        $disks = Get-CimInstance $cimParams
        $data += $disks |
        Select-Object @{Name = "Computername"; Expression = { $_.SystemName } },
        DeviceID, Size, FreeSpace,
        @{Name = "PctFree"; Expression = { ($_.FreeSpace / $_.Size) * 100 } },
        @{Name = "Date"; Expression = { Get-Date } }
    } # Try
    catch {
        Write-Warning "Failed to get disk data from $($Computer.toUpper()). $($_.Exception.message)"
    } # Catching
} # Foreach ending

# Only export if there is something in $data
if ($data) {
    $data | Export-Csv -Path $CSV -Append -NoTypeInformation
    Write-Host "Disk report has been generated. Find it in $CSV" -ForegroundColor Green
}
else {
    Write-Host "There no disk data found" -ForegroundColor Yellow
}

# To run this script just type (in script directory):
# .\getdiskhistory.ps1 -Computername LENOVO, FOO