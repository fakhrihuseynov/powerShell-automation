# Get processes in pipeline adding specified values to hashtable 
# and search the process on specified Value that you gave with the "startime" and sort it select only first 5 objects

Get-Process | Where-Object StartTime |
Select-Object Name, Id, @{
    Name       = 'Run';
    Expression = { (Get-Date) - $_.StartTime }
} | Sort-Object Run -Descending | Select-Object -First 5

# Or using customobjects via passing values appending to current pipeline
Get-Process | Where-Object StartTime |
ForEach-Object {
    [PSCustomObject]@{
        Name           = $_.Name;
        LalalaRunTime_ = ((Get-Date) - $_.StartTime)
        ID             = $_.Id;
    }
} | Sort-Object LalalaRunTime_ -Descending | Select-Object -First 5 | Format-Table -AutoSize