# Create a script to run daily disk report
# ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

Param (
    [string]$Path = ".\work\DiskHistory.csv",
    [string]$reportPath = ".\work"
)

# Import CSV data && verify if the file exists
if (Test-Path -Path $Path) {
    # Everything imported into a CSV is a string so rebuild as an object
    # with properties of the correct type
    $data = Import-Csv -Path $Path | ForEach-Object {
        [PSCustomObject]@{
            Computername = $_.Computername
            DeviceID     = $_.DeviceID
            SizeGB       = ($_.Size / 1GB) -as [int32]
            FreeGB       = ($_.FreeSpace / 1GB)
            PctFree      = $_.PctFree -as [double]
            Date         = $_.Date -as [datetime]
        }
    }
    # Group the history data by computerName
    $grouped = $data | Group-Object -Property Computername
}
else {
    # If Test-Path fails, display a warning and exit the script
    Write-Warning "Could not find $Path. Maybe this path closed by pilfirers :( "
    # bail out (escape) the script
    Return
}
<#
    $header is a here string. This is a great way
    to create a multi-line string. The closing "@
    must be left justified
#>
# ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
$header = @"
Disk History Report $((Get-Date).ToShortDateString())
*****************************************************
Data Source = $Path

*****************************************************
Latest Check
*****************************************************
"@

# Get a timestamp value. -Format value is case-sensitive
$timeStamp = Get-Date -Format dd-MM-yyyy
$outPutFile = ".\$timeStamp-diskReport.txt"
$outPutPath = Join-Path -Path $reportPath -ChildPath $outPutFile

# Define a hashtable of parameters for Out-File
# This will be splatted
$outParams = @{
    FilePath = $outPutPath
    Encoding = "ASCII"
    Append   = $True
    Width    = 120
}
# Now splatting the parameter hashtable
$header | Out-File $outParams

# ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
# Get the last entry for each computer

$latest = foreach ($computer in $grouped) {
    # Need to report for each deviceID on each computer
    $devices = $computer.Group  | Group-Object -Property DeviceID
    $devices | foreach-object {
        $_.Group | Sort-Object Date -Descending |  Select-object -first 1
    }    
}
# As normal you wouldn't use Format cmdlets in a script. This is an exception for the design purposes.
$latest | Sort-Object -Property Computername | 
Format-Table -AutoSize | Out-File $outParams
# ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
# Report on servers with low disk space
$header = @"
*******************
Low Diskpace <=30%
*******************
"@

$header | Out-File @outParams
$latest | Where-Object { $_.PctFree -le 30 } | 
Sort-Object -Property Computername |
Format-Table -AutoSize | 
Out-File @outParams

# Report trending
# Need to report for each deviceID on each computer
# Group the data by a custom property. This may be a little advanced.
$all = $data | Group-object -property { "$($_.Computername) $($_.DeviceID)" }
$header = @"
**************************************
Change Percent between last 2 reports
**************************************
"@
$header | Out-File @outParams

$all | ForEach-Object {
    # Get the 2 most recent entries for each device
    $checks = $_.group | 
    Sort-Object -Property date -Descending |
        Select-Object -first 2
        
    # Calculate a percent change between the two entries
    "$($checks[0].Computername) Drive $($checks[0].DeviceID) had a change of $(($checks[0].PctFree - $checks[1].PctFree) -as [int32])%"
} | Out-File @outParams

$header = @"

*******************************
Percent Free Average Over Time
*******************************
"@
$header | Out-File @outParams

foreach ($computer in $all) {
    $stat = $computer.group | Measure-Object -property pctFree -Average
    "$($computer.name) = $($stat.Average -as [int32])%" | Out-File @outParams
} 

# Write the report file to the pipeline
Get-Item -Path $OutputPath