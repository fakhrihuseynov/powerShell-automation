<#
Get a breakdown of error source in the System event log
#>
Param (
    [string]$Log = "System",
    [string]$Computername = $env:COMPUTERNAME,
    [string]$Newest = 500,
    [string]$ReportTitle = "Event Log Report",
    [Parameter(Mandatory,HelpMessage = "Enter the path for the HTML file.")]
    [string]$Path
)

# Get event log data and group it by newest count number
$data = Get-EventLog -LogName $Log -EntryType Error -Newest $Newest -ComputerName $Computername | Group-Object -Property Source -NoElement

# Create an HTML report
$footer = "<H1><i>Report run <font color=blue>$(Get-Date)</i><H1>"
$css = "http://jdhitsolutions.com/sample.css"
$precontent = "<H1>$Computername</H1><H2>Last $Newest error sources from the $Log</H2>"
$data | Sort-Object -Property Count, Name -Descending | 
Select-Object Count, Name | 
ConvertTo-Html -Title $ReportTitle -PreContent $precontent -PostContent $footer -CssUri $css | Out-File -FilePath $Path