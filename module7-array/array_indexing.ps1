# --> The variable N is an array of numbers
# --> Count the number of elemets in the array
# --> Powershell unrolls the array

$n = 1..5
$n.Count
$n

# Access an item by index number
$n[1]
# Create an array of servicess
$serv = Get-Service
$serv[2].Name # Will list the third service name in a list of all services that the os has
$serv[-1].Name # Will get the last service name in existing array, so you can also use an index number starting at the end

help about_Arrays # Read the help