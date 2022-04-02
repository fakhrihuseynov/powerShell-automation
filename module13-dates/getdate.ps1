$now = Get-Date
$now | Select-Object *
$now.DayOfWeek
$now.ToShortDateString()
Get-Date -Format dd-MM-yyyy
$now.AddDays(43)

# Time manupulations 
# Find files modified 10 days ago
$arxiv =(Get-Date).AddDays(-30).Date
Get-ChildItem F:\Users\faxri\Desktop | Where-Object {$_.LastWriteTime -le $arxiv}