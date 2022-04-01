# Use a type accelerator
# Often easier to read than using Select-Object
# Use whatever enumeration technique works for you
# Define a hashtable of property values 

Get-ChildItem .\module9-objects-in-pipeline\work -File |
ForEach-Object {
    [PSCustomObject]@{
        Name     = $_.Name
        Modified = $_.LastWriteTime
        Size     = $_.Lenght
        Age      = (Get-Date) - $_.LastWriteTime
    }
}