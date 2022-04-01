# Use whatever enumeration technique works for you
# Define a hashtable of property values 

$createFile = New-Item -ItemType Directory -Path .\module9-objects-in-pipeline\work -Force
# Add-Content -Path .\module9-objects-in-pipeline\work\test.txt -Value 'This is test file' -Force
$createDate = Get-Date

foreach ($file in $createFile) {
    $hash = @{
        Name     = $file.Name
        Modified = $file.LastWriteTime
        Size     = $file.Lenght
        Age      = $createDate - $file.LastWriteTime
    }
    New-Object psobject -Property $hash # Write a custom objetc to the pipeline
}
