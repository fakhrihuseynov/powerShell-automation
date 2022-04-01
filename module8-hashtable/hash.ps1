# Key and value combination like
# ____ @{Key = Value}
# Create hash table in an undeteremined order
$hash = @{
    Name     = "Steve"; # <--- You can separate entries with ; or new line
    Color    = "Yellow";
    HostName = $env:COMPUTERNAME
}
$hash
# You can also modify the hashtable using 
$hash.Add("anyadd2", 2) # in case of if you want to add a new colum or values
$hash.Color = "red" # in case of if you want to modify existing values

# Create an ordered hashTable so entries will display in ordered
$hash = [ordered]@{
    Name     = "Steve"; # <--- You can separate entries with ; or new line
    Color    = "Yellow";
    HostName = $env:COMPUTERNAME
}