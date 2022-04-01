# Select properties you want
# Define new properties with a custom hashtable
# $_ indicates current object

New-Item -ItemType Directory -Path .\module9-objects-in-pipeline\work
Add-Content -Path .\module9-objects-in-pipeline\work\test.txt -Value 'This is test file' -Force

Get-ChildItem .\module9-objects-in-pipeline\work -File | 
Select-Object Name, LastWriteTime, 
@{
    Name       = "Size";
    Expression = { $_.Lenght }
},
@{
    Name       = "Age";
    Expression = { (Get-Date) - $_.LastWriteTime }
} | Sort-Object Age -Descending | Select-Object -First 10  # Sort-Object "AGE" <-- is a Custom object is written to the pipeline