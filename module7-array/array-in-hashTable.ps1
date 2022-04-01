# Creating an empty array
$arr = @()
# Add an item to the array \\ NOTE You can't remove individual items
$arr += 100

# Comma separated items are treated as an array
$arrayName = "jeff", "mike", "adam", "steve"
# To test the type of the current variable. In this case will return true
$arrayName -is [array]