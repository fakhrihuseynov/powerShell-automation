# Methods of Strings and substrings

$string = "powershell is great"
$string | Get-Member
$string.Length
$string.ToUpper()
$string.ToLower()
$string | Get-Member substring

$string.Substring.OverloadDefinitions
$string.Substring(5)
$string.Substring(1, 4)
$string.IndexOf("s") # Position of a last S
$string.Replace("e", "3") # This is case sensitive action

$newstring = $string.Replace("p", "P").Replace(12, "s").Replace("g", "G")
$newstring

$t = 'a,b,c,d,e,f,g'
$t -is [array] # It will false because it is not splitted as array
$split = $t.Split(",")
$split -is [array]

# Now create a random symbole generator for the passwords
