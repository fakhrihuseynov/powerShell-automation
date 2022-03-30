<#
Get a breakdown of error source in the System event log
#>
$Computername = $env:COMPUTERNAME
$data = Get-EventLog System -EntryType Error -Newest 1000 | Group Source -NoElement -Computer
$title = "System Log Analysis"
$css = "./sample.css"
$data | Sort Count, Name -Descending | Select Count, Name | ConvertTo-Html -Title $title -Pre "<H1>$Computername<H1>" -CssUri $css | Out-File c:\work\systemsources.html