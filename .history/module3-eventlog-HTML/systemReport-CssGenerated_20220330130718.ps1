<#
Get a breakdown of error source in the System event log
#>
$Computername = $env:COMPUTERNAME
$data = Get-EventLog System -EntryType Error -Newest 1000 -ComputerName $Computername | Group-Object Source -NoElement
# Create an HTML report
$title = "System Log Analysis"
$footer = "<H1>Report run <font color=blue>$(Get-Date)<H1>"
$css = "http://jdhitsolutions.com/sample.css"
$data | Sort-Object -Property Count, Name -Descending | Select-Object Count, Name | 
    ConvertTo-Html -Title $title -PreContent "<H1>$Computername<H1>" -PostContent $footer -CssUri $css | Out-File c:\work\systemsources.html