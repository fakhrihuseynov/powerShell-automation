# Like saying that ---> "For each something in a group of things, run these commands!!!"
# You can use whatever variable you want
# Does not pass objects down the pipeline
# -----------------------------------------------------------------

function fileBulk {
    $nums = 1..25
    foreach ($item in $nums) {
        $file = "TestFile-$item.txt"
        New-Item $file -ItemType File
        Write-Output "This is my $item" > $file
        # Remove-Item $file -force
    }
}

function removeBulk {
    [string]$local = .\*.txt
    $testPath = Test-Path .\ -Filter $local
    if ($testPath -eq $true) {
        Remove-Item .\ -Filter $local
    }
    else {
        Remove-Item .\odd_numbers\*.txt
    }   
}


$move = $alltext = Get-ChildItem -Filter .\*.txt
foreach ($count in $alltext) {
    Get-Content $count | Select-String -SimpleMatch "1"
    Move-Item $count -Destination .\odd_numbers -Filter "1"
}
$move


$remove_odd = Remove-Item .\odd_numbers\*
$remove_main = Remove-Item .\*.txt
