$array = 1..5
$array.Count
# $array | Get-Member
$array
$array | ForEach-Object { $_ * 2 }
$array | ForEach-Object { $_ * 2 } | measure-object -Sum

foreach ($number in $array) { 
    $number * 2 
} # <--- Will output all summarized numbers multiplied to 2

foreach ($number in $array) { 
    $number * 2 
} Measure-Object -Sum # <--- Will output zero sum becasue not incremented with any values

$sum = 0
foreach ($number in $array) { 
    $sum += $number * 2
}
$sum