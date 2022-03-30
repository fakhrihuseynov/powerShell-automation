# Has an alias of 'ForEach'
# Use when you want to process pipelined objects one at a time
# Use when parameter binding won't work
# -----------------------------------------------------------------

# first $_ sign will be as hostnames in computers.txt file, the second $_ sign will transform to SmbShare content and will get all SmbShare properties

Get-Content .\computers.txt | ForEach-Object {
    Get-SmbShare -CimSession $_ | Where-Object { -Not $_.Special }
} | Select-Object PSComutername, Name, Path, Description